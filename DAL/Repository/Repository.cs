using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.Attributes;
using SPAExample.DAL.Extensions;
using SPAExample.DAL.Services;

namespace SPAExample.DAL.Repository
{
    public class Repository<T> : IRepository<T>, IDisposable, IAsyncDisposable
    {
        protected readonly DbConnection connection;
        protected readonly ILogger<Repository<T>> logger;

        protected readonly string idColumnName;
        protected readonly ConstructorInfo ctor;

        public Repository(IDBConnectionFactory connectionFactory, ILogger<Repository<T>> logger)
        {
            Type TypeT = typeof(T);
            ctor = TypeT.GetConstructor(Type.EmptyTypes);
            if (ctor == null)
                throw new InvalidOperationException($"Type {TypeT.Name} does not have a default constructor.");

            var tableName = TypeT.GetTableName();
            if (string.IsNullOrEmpty(tableName))
                throw new InvalidOperationException($"{nameof(TableAttribute)} is missing from type {TypeT.Name}.");

            idColumnName = TypeT.GetIdColumnName();
            if (string.IsNullOrEmpty(idColumnName))
                throw new InvalidOperationException($"{nameof(IdAttribute)} is missing from type {TypeT.Name}.");

            connection = connectionFactory.GetDbConnection();
            this.logger = logger;
        }

        public async Task<List<T>> Get()
        {
            var result = new List<T>();
            try
            {
                await connection.OpenAsync();
                using (var command = connection.CreateCommand())
                {
                    var TypeT = typeof(T);
                    command.CommandType = CommandType.Text;
                    command.CommandText = $"SELECT * FROM [{TypeT.GetTableName()}]";

                    var reader = await command.ExecuteReaderAsync();
                    try
                    {
                        while (await reader.ReadAsync())
                        {
                            // I realize that it's an overhead and reinventing a wheel
                            // Normally these low level operations should be abstracted away into an ORM like Entity Framework
                            // I just want to show here generic repository pattern realization.
                            T newInst = (T)ctor.Invoke(null);
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                var propName = reader.GetName(i);
                                var propInfo = TypeT.GetProperty(propName);
                                if (propInfo != null)
                                {
                                    object value = reader.GetValue(i);
                                    if (value == DBNull.Value)
                                    {
                                        propInfo.SetValue(newInst, null);
                                    }
                                    else
                                    {
                                        propInfo.SetValue(newInst, value);
                                    }
                                }
                            }

                            result.Add(newInst);
                        }
                    }
                    catch (Exception exc)
                    {
                        logger.LogError(exc, exc.Message);
                        throw;
                    }
                    finally
                    {
                        await reader.CloseAsync();
                    }
                }
            }
            catch (Exception exc)
            {
                logger.LogError(exc, exc.Message);
                throw;
            }
            finally
            {
                await connection.CloseAsync();
            }

            return result;
        }

        public void Dispose()
        {
            if (connection != null)
            {
                if (connection.State == ConnectionState.Open)
                    connection.Close();

                connection.Dispose();
            }

            GC.SuppressFinalize(this);
        }

        public async ValueTask DisposeAsync()
        {
            if (connection != null)
            {
                if (connection.State == ConnectionState.Open)
                    await connection.CloseAsync();

                await connection.DisposeAsync();
            }

            GC.SuppressFinalize(this);
        }
    }
}
