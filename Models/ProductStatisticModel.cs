using SPAExample.DAL.DTO;

namespace SPAExample.Models
{
    public class ProductStatisticModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Cost { get; set; }
        public int Purchases { get; set; }

        public static ProductStatisticModel FromDTO(ProductDTO productDTO, int purchases)
        {
            // normally I would do it with AutoMapper
            return new ProductStatisticModel
            {
                Id = productDTO.Id,
                Name = productDTO.Name,
                Cost = productDTO.Cost,
                Purchases = purchases
            };
        }
    }
}
