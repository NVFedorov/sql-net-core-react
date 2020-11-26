using System;
using SPAExample.DAL.Attributes;

namespace SPAExample.DAL.DTO
{
    [Table("Pages")]
    public class PageDTO
    {
        [Id]
        public Guid Id { get; set; }
        public string Text { get; set; }
        public string Url { get; set; }
    }
}
