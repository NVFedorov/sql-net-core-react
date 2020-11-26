using System.Collections.Generic;
using System.Data.Common;

namespace SPAExample.DAL.Extensions
{
    public static class RepositoryExtensions
    {
        public static DbCommand CreateStoredProcedureCommand(this DbConnection connection, 
            string spName, List<KeyValuePair<string, object>> parameters)
        {
            var command = connection.CreateCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = spName;

            foreach (var p in parameters)
            {
                var param = command.CreateParameter();
                param.ParameterName = p.Key;
                param.Value = p.Value;
                command.Parameters.Add(param);
            }

            return command;
        }
    }
}
