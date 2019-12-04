using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace CustomerService.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CustomerController : ControllerBase
    {

        [HttpGet]
        [Route("List")]
        public ActionResult<IEnumerable<string>> List()
        {
            List<string> toReturn = new List<string>();
            using (var sqlConnection = new System.Data.SqlClient.SqlConnection("<DB Connection>"))
            {
                sqlConnection.Open();
                using(var sqlCmd = sqlConnection.CreateCommand())
                {
                    sqlCmd.CommandText = "select CustomerName from Customers";
                    using (var reader = sqlCmd.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            toReturn.Add(reader.GetString(0));
                        }
                    }
                }
            }
            return toReturn;
        }


    }
}
