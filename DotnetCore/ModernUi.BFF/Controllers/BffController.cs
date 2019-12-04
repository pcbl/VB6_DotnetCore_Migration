using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace ModernUi.BFF.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BffController : ControllerBase
    {
        [HttpGet]
        [Route("Customers")]
        public async Task<ActionResult<IEnumerable<string>>> ListCustomers()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("https://apimanagementpoc.azure-api.net");
            var getCall = await client.GetAsync("/customerApi/Customer/List");
            var contents = getCall.Content.ReadAsStringAsync().Result;
            var customers = JsonConvert.DeserializeObject<string[]>(contents);
            return customers;
        }
    }
}
