using Microsoft.VisualStudio.TestTools.UnitTesting;
using CustomerWrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentAssertions;

namespace CustomerWrapper.Tests
{
    [TestClass()]
    public class CustomerDataObjectTests
    {
        [TestMethod()]
        public void ListTest()
        {
            var dataObject = new CustomerWrapper.CustomerDataObject();
            var customers = dataObject.List();
            Assert.IsTrue(customers.Contains("CustomerA"));
        }
    }
}