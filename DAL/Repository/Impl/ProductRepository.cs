using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.DTO;
using SPAExample.DAL.Extensions;
using SPAExample.DAL.Services;

namespace SPAExample.DAL.Repository.Impl
{
    public class ProductRepository : Repository<ProductDTO>, IProductRepository
    {
        public ProductRepository(IDBConnectionFactory connectionFactory, ILogger<Repository<ProductDTO>> logger) : base(connectionFactory, logger)
        {
        }

        public async Task<List<(ProductDTO product, int purchases)>> GetProductsByQuery(string queryType)
        {
            var result = new List<(ProductDTO product, int purchases)>();
            try
            {
                await connection.OpenAsync();
                var parameters = new List<KeyValuePair<string, object>>
                {
                    new KeyValuePair<string, object>("@type",  queryType)
                };

                using var command = connection.CreateStoredProcedureCommand("dbo.QUERY_PRODUCTS", parameters);
                var reader = await command.ExecuteReaderAsync();
                try
                {
                    while (await reader.ReadAsync())
                    {
                        result.Add((new ProductDTO
                        {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Cost = reader.GetDecimal(2)
                        }, reader.GetInt32(3)));
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
    }
}
