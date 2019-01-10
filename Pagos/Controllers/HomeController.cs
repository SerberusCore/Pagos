using Pagos.Models;
using System;
using System.Web.Mvc;

namespace Pagos.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Session.Add("Usuario", new Usuarios {
                UsuarioId = new Guid("AE5B8987-3884-4B48-8C80-10AB2888B7F9")
            });
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Principal()
        {
            return View();
        }
    }
}