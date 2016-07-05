using System;
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
        private ToDosController _controller;
        private Mock<ApplicationDbContext> _mockContext;
        private Mock<DbSet<Todo>> _mockSet;

        [SetUp]
        public void TestInitialize()
        {
            _mockContext = new Mock<ApplicationDbContext>();
            _mockSet = new Mock<DbSet<Todo>>();
            _controller = new ToDosController(_mockContext.Object);

            _mockContext.Setup(m => m.Todos).Returns(_mockSet.Object);
        }

        [Test]
        public void CanSaveNewToDo()
        {
            _controller.Request = new HttpRequestMessage(HttpMethod.Post, "http://localhost/");
            _controller.CreateToDo(new Todo { Description = "test" });

            _mockSet.Verify(m => m.Add(It.IsAny<Todo>()), Times.Once());
            _mockContext.Verify(m => m.SaveChanges(), Times.Once());
        }
    }
}
