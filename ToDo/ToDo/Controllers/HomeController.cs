using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Web.Mvc;
using ToDo.Repository;

namespace ToDo.Controllers
{
    public class HomeController : Controller
    {
        private readonly ToDoRepository _toDoRepository;

        public HomeController()
        {
            _toDoRepository = new ToDoRepository();
        }

        public ActionResult Index()
        {
            var settings = new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() };
            var toDos = _toDoRepository.Get();

            return View("Index", "", JsonConvert.SerializeObject(toDos, Formatting.None, settings));
        }
    }
}