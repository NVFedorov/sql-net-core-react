using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Extensions.Options;
using SPAExample.Settings;

namespace SPAExample.DAL.Services.Impl
{
    public class DBConnectionFactory : IDBConnectionFactory
    {
        private readonly string _connectionString;

        public DBConnectionFactory(IOptions<DatabaseSettings> options)
        {
            _connectionString = options.Value.ConnectionString;
        }

        public DbConnection GetDbConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
