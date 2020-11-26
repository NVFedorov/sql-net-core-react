using System;
using System.Linq;
using System.Reflection;
using SPAExample.DAL.Attributes;

namespace SPAExample.DAL.Extensions
{
    public static class TypeExtensions
    {
        public static string GetTableName(this Type type)
        {
            return ((TableAttribute)type.GetCustomAttributes(
                    typeof(TableAttribute),
                    true)
                .FirstOrDefault())?.TableName;
        }

        public static string GetIdColumnName(this Type type)
        {
            var prop = type.GetProperties(BindingFlags.Public | BindingFlags.Instance)
                   .FirstOrDefault(p => p.GetCustomAttributes(typeof(IdAttribute), false).Count() == 1);

            return ((IdAttribute)prop.GetCustomAttributes(
                    typeof(IdAttribute),
                    true)
                .FirstOrDefault())?.ColumnName;
        }
    }
}
