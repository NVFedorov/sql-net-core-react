using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.Repository;

namespace SPAExample.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PagesController : ControllerBase
    {
        private readonly IPageRepository _pageRepository;
        private readonly ILogger<PagesController> _logger;

        public PagesController(
            IPageRepository pageRepository,
            ILogger<PagesController> logger)
        {
            _pageRepository = pageRepository;
            _logger = logger;
        }

        // there is no role validation as it's out scope of the assignment
        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> GetByRole([FromQuery] string roleNames)
        {
            if (string.IsNullOrEmpty(roleNames))
            {
                ModelState.AddModelError(nameof(roleNames), "The parameter must not be empty");
                return BadRequest(ModelState.ToDictionary(x => x.Key, x => x.Value));
            }

            try
            {
                var result = await _pageRepository.GetByRoles(roleNames);
                return Ok(result);
            }
            catch (Exception exc)
            {
                _logger.LogError(exc, exc.Message);

                // normally I would return custom error message.
                return BadRequest(exc.Message);
            }
        }
    }
}