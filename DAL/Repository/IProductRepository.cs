using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SPAExample.DAL.DTO;

namespace SPAExample.DAL.Repository
{
    public interface IProductRepository
    {
        Task<List<(ProductDTO product, int purchases)>> GetProductsByQuery(string queryType);
    }
}
