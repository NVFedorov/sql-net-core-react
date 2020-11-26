using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.Repository;
using SPAExample.Models;

namespace SPAExample.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly IProductRepository _productRepository;
        private readonly ILogger<ProductsController> _logger;

        public ProductsController(
            IProductRepository productRepository,
            ILogger<ProductsController> logger)
        {
            _productRepository = productRepository;
            _logger = logger;
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> GetByQueryType([FromQuery]string type)
        {
            try
            {
                var result = await _productRepository.GetProductsByQuery(type);

                return Ok(result.Select(x => ProductStatisticModel.FromDTO(x.product, x.purchases)));
            }
            catch(Exception exc)
            {
                _logger.LogError(exc, exc.Message);

                // normally I would return custom error message.
                return BadRequest(exc.Message);
            }
        }
    }
}
