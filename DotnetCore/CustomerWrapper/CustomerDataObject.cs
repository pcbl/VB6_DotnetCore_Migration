using Microsoft.VisualBasic;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Net.Http;
using System.Runtime.InteropServices;

namespace CustomerWrapper
{

    [Guid(CustomerDataObject.ClassId)]
    [ClassInterface(ClassInterfaceType.None)]
    [ProgId("CustomerWrapper.CustomerDataObject")]
    public class CustomerDataObject : ICustomerDataObject
    {
        public const string ClassId = "3D853E7B-01DA-4944-8E65-5E36B501E889";
        public const string InterfaceId = "CB344AD3-88B2-47D8-86F1-20EEFAF6BAE8";

        private const string ServiceUrl = @"https://apimanagementpoc.azure-api.net";        
        public string List()
        {
            try
            {
                //https://stackoverflow.com/questions/57669060/unable-to-read-data-from-the-transport-connection-vb6-calling-com-visible-c-shar
                //Interop Issue. we need to set this to get it working
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                var client = new HttpClient();                
                client.BaseAddress = new Uri(ServiceUrl);
                var getCall = client.GetAsync("/customerApi/Customer/List");
                getCall.Wait();
                var contents = getCall.Result.Content.ReadAsStringAsync().Result;
                var customers = JsonConvert.DeserializeObject<string[]>(contents);
                var toReturn = string.Empty;
                foreach (var customer in customers)
                {
                    toReturn = toReturn + $"{customer}\n\r";
                }
                return toReturn;
            }
            catch(Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}
