using System.Collections.Generic;
using ToDo.Models;

namespace ToDo.Interfaces
{
    public interface IToDoRepository
    {
        IEnumerable<Todo> Get();
    }
}