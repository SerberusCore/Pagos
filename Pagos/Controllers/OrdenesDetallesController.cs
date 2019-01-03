using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pagos.Controllers
{
    public class OrdenesDetallesController : Controller
    {
        public List<Models.OrdenesDetalles> Detalles
        {
            get
            {
                if (Session["OrdenesDetalles"] == null)
                {
                    Session.Add("OrdenesDetalles", new List<Models.OrdenesDetalles>());
                }
                return Session["OrdenesDetalles"] as List<Models.OrdenesDetalles>;
            }
            set
            {
                Session.Add("OrdenesDetalles", value);
            }
        }
        // GET: OrdenesDetalles
        public ActionResult Index()
        {
            return View();
        }

        // GET: OrdenesDetalles/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: OrdenesDetalles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrdenesDetalles/Create
        [HttpPost]
        public ActionResult Create(Models.OrdenesDetalles detalle)
        {
            try
            {
                if (detalle.OrdenDetalleId == Guid.Empty)
                {
                    detalle.OrdenDetalleId = Guid.NewGuid();
                    Detalles.Add(detalle);
                }
                else
                {
                    var old = Detalles.FirstOrDefault(x => x.OrdenDetalleId == detalle.OrdenDetalleId);
                    var index = Detalles.IndexOf(old);
                    Detalles.RemoveAt(index);
                    Detalles.Insert(index, detalle);
                }
                return PartialView("_Lista", Detalles);
            }
            catch
            {
                return View();
            }
        }

        // GET: OrdenesDetalles/Edit/5
        public ActionResult Edit(Guid id)
        {
            var detalle = Detalles.FirstOrDefault(x => x.OrdenDetalleId == id);
            return PartialView("_CrearDetalle", detalle);
        }

        // POST: OrdenesDetalles/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: OrdenesDetalles/Delete/5
        public ActionResult Delete(Guid identificador)
        {
            var old = Detalles.FirstOrDefault(x => x.OrdenDetalleId == identificador);
            if (old != null)
                Detalles.Remove(old);
            return PartialView("_Lista", Detalles);
        }

        // POST: OrdenesDetalles/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
