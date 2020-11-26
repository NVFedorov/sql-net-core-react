using System;
using SPAExample.DAL.Attributes;

namespace SPAExample.DAL.DTO
{
    [Table("Product")]
    public class ProductDTO
    {
        [Id]
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Cost { get; set; }
    }
}
