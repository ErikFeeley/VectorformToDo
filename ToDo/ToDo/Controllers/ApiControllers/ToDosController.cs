using System;
using System.Linq;
using System.Web.Http;
using ToDo.Models;

namespace ToDo.Controllers.ApiControllers
{
    public class ToDosController : ApiController
    {
        private readonly ApplicationDbContext _context;

        public ToDosController()
        {
            _context = new ApplicationDbContext();
        }

        // This controller if for injecting the mock context during unit tests.
        public ToDosController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public IHttpActionResult CreateToDo(Todo newToDo)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            _context.Todos.Add(newToDo);
            _context.SaveChanges();

            return Created(new Uri(Request.RequestUri + "/" + newToDo.Id), newToDo);
        }

        [HttpPut]
        public IHttpActionResult UpdateToDo(int id, Todo toDo)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var toDoInDb = _context.Todos.SingleOrDefault(t => t.Id == id);

            if (toDoInDb == null)
                return NotFound();

            toDoInDb.IsComplete = toDo.IsComplete;
            _context.SaveChanges();

            return Ok();
        }

        [HttpDelete]
        public IHttpActionResult DeleteToDo(int id)
        {
            var toDoInDb = _context.Todos.SingleOrDefault(t => t.Id == id);

            if (toDoInDb == null)
                return NotFound();

            _context.Todos.Remove(toDoInDb);
            _context.SaveChanges();

            return Ok();
        }

        [HttpDelete]
        public IHttpActionResult DeleteToDos([FromUri] int[] ids)
        {
            var toDosInDb = _context.Todos.Where(t => ids.Contains(t.Id));

            _context.Todos.RemoveRange(toDosInDb);
            _context.SaveChanges();

            return Ok();
        }
    }
}
