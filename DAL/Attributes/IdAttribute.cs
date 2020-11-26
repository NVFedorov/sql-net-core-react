using System;
using System.Runtime.CompilerServices;

namespace SPAExample.DAL.Attributes
{
    [AttributeUsage(AttributeTargets.Property, Inherited = false)]
    public class IdAttribute : Attribute
    {
        public string ColumnName { get; }

        public IdAttribute([CallerMemberName] string columnName = null)
        {
            ColumnName = columnName;
        }
    }
}
