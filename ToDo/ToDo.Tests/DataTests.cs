using System.Linq;
using NUnit.Framework;
using ToDo.Models;

namespace ToDo.Tests
{
    [TestFixture]
    public class DataTests
    {
        private ApplicationDbContext _context;

        [SetUp]
        public void Init()
        {
            _context = new ApplicationDbContext();
        }

        [Test]
        public void CanGetData()
        {
            var data = _context.Todos.ToList();

            Assert.IsNotNull(data);
        }

        [TearDown]
        public void Destroy()
        {
            _context.Dispose();
        }
    }
}
