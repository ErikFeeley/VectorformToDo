using System.Collections.Generic;
using System.Linq;
using ToDo.Interfaces;
using ToDo.Models;

namespace ToDo.Repository
{
    public class ToDoRepository : IToDoRepository
    {
        private readonly ApplicationDbContext _context;

        public ToDoRepository()
        {
            _context = new ApplicationDbContext();
        }

        public IEnumerable<Todo> Get()
        {
            return _context.Todos.ToList();
        }
    }
}