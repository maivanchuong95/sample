using Microsoft.AspNetCore.Mvc;

namespace sample.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StatusController : ControllerBase
    {
        public StatusController()
        {

        }

        [HttpGet(Name = "status")]
        public ActionResult Status()
        {
            return Ok(true);
        }
    }
}
