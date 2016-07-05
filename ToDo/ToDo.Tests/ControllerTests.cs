using Moq;
using NUnit.Framework;
using System.Data.Entity;
using System.Net.Http;
using ToDo.Controllers.ApiControllers;
using ToDo.Models;

namespace ToDo.Tests
{
    [TestFixture]
    public class ControllerTests
    {
        [Test]
        public void CanSaveNewToDo()
        {
            var mockSet = new Mock<DbSet<Todo>>();
            var mockContext = new Mock<ApplicationDbContext>();
            mockContext.Setup(m => m.Todos).Returns(mockSet.Object);

            var controller = new ToDosController(mockContext.Object)
            {
                Request = new HttpRequestMessage(HttpMethod.Post, "http://localhost/")
            };

            controller.CreateToDo(new Todo { Description = "test" });

            mockSet.Verify(m => m.Add(It.IsAny<Todo>()), Times.Once());
            mockContext.Verify(m => m.SaveChanges(), Times.Once());
        }
    }
}
