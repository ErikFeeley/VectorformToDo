using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ToDo.Models;

namespace ToDo.Controllers.ApiControllers
{
    public class ToDosController : ApiController
    {
        private ApplicationDbContext _context;

        public ToDosController()
        {
            _context = new ApplicationDbContext();
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

        // how to do a restful delete of a range... hmm
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
