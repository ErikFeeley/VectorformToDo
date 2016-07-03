using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ToDo.Models;

namespace ToDo.Controllers
{
    public class HomeController : Controller
    {
        private ApplicationDbContext _context;

        public HomeController()
        {
            _context = new ApplicationDbContext();
        }

        public ActionResult Index()
        {
            var settings = new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() };
            var toDos = _context.Todos.ToList();

            return View("Index", "", JsonConvert.SerializeObject(toDos, Formatting.None, settings));
        }
    }
}