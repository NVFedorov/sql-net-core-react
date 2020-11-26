using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.DTO;
using SPAExample.DAL.Extensions;
using SPAExample.DAL.Services;

namespace SPAExample.DAL.Repository.Impl
{
    public class PageRepository : Repository<PageDTO>, IPageRepository
    {
        public PageRepository(IDBConnectionFactory connectionFactory, ILogger<Repository<PageDTO>> logger) : base(connectionFactory, logger)
        {
        }

        public async Task<List<PageDTO>> GetByRoles(string roles)
        {
            var result = new List<PageDTO>();
            try
            {
                await connection.OpenAsync();
                var parameters = new List<KeyValuePair<string, object>>
                {
                    new KeyValuePair<string, object>("@roleNames",  roles)
                };

                using var command = connection.CreateStoredProcedureCommand("dbo.GET_PAGES_BY_ROLE_NAME", parameters);
                var reader = await command.ExecuteReaderAsync();
                try
                {
                    while (await reader.ReadAsync())
                    {
                        result.Add(new PageDTO
                        {
                            Id = reader.GetGuid(0),
                            Text = reader.GetString(1),
                            Url = reader.GetString(2)
                        });
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
