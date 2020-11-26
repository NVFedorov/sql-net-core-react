using System;
using SPAExample.DAL.Attributes;

namespace SPAExample.DAL.DTO
{
    [Table("Roles")]
    public class RoleDTO
    {
        [Id]
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}
