using System.Data.Common;

namespace SPAExample.DAL.Services
{
    public interface IDBConnectionFactory
    {
        public DbConnection GetDbConnection();
    }
}
