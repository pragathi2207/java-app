using Microsoft.AspNetCore.Mvc;

namespace HelloDotnetApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("Hello from HomeController!");
        }
    }
}