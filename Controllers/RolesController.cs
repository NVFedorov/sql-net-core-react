using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SPAExample.DAL.DTO;
using SPAExample.DAL.Repository;

namespace SPAExample.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly IRepository<RoleDTO> _repository;
        private readonly ILogger<RolesController> _logger;

        public RolesController(IRepository<RoleDTO> repository, ILogger<RolesController> logger)
        {
            _repository = repository;
            _logger = logger;
        }

        [HttpGet]
        [Route("")]
        public async Task<IActionResult> Get()
        {
            try
            {
                var roles = await _repository.Get();
                return Ok(roles);
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