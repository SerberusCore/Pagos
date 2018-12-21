using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pagos.Models;

namespace Pagos.Controllers
{
    public class FacturasDetallesController : Controller
    {
        private nortonEntities db = new nortonEntities();

        public List<Models.FacturasDetalles> Detalles
        {
            get
            {
                if (Session["FacturasDetalles"] == null)
                {
                    Session.Add("FacturasDetalles", new List<Models.FacturasDetalles>());
                }
                return Session["FacturasDetalles"] as List<Models.FacturasDetalles>;
            }
            set
            {
                Session.Add("FacturasDetalles", value);
            }
        }

        // GET: FacturasDetalles
        public ActionResult Index()
        {
            var facturasDetalles = db.FacturasDetalles.Include(f => f.Facturas);
            return View(facturasDetalles.ToList());
        }

        // GET: FacturasDetalles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FacturasDetalles facturasDetalles = db.FacturasDetalles.Find(id);
            if (facturasDetalles == null)
            {
                return HttpNotFound();
            }
            return View(facturasDetalles);
        }

        // GET: FacturasDetalles/Create
        public ActionResult Create()
        {
            ViewBag.FacturaId = new SelectList(db.Facturas, "FacturaId", "FacturaSerie");
            return View();
        }

        // POST: FacturasDetalles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(Models.FacturasDetalles detalle)
        {
            try
            {
                if (detalle.FacturaDetalleId == Guid.Empty)
                {
                    detalle.FacturaDetalleId = Guid.NewGuid();
                    Detalles.Add(detalle);
                }
                else
                {
                    var old = Detalles.FirstOrDefault(x => x.FacturaDetalleId == detalle.FacturaDetalleId);
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

        // GET: FacturasDetalles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FacturasDetalles facturasDetalles = db.FacturasDetalles.Find(id);
            if (facturasDetalles == null)
            {
                return HttpNotFound();
            }
            ViewBag.FacturaId = new SelectList(db.Facturas, "FacturaId", "FacturaSerie", facturasDetalles.FacturaId);
            return View(facturasDetalles);
        }

        // POST: FacturasDetalles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FacturaDetalleId,FacturaId,FacturaDetalleDescripcion,FacturaDetalleCantidad,FacturaDetallePrecioUnitario,FacturaDetalleImporteTotal,FechaCreacion,UsuarioCreacion,FechaActualizacion,UsuarioActualizacion")] FacturasDetalles facturasDetalles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(facturasDetalles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FacturaId = new SelectList(db.Facturas, "FacturaId", "FacturaSerie", facturasDetalles.FacturaId);
            return View(facturasDetalles);
        }

        // GET: FacturasDetalles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FacturasDetalles facturasDetalles = db.FacturasDetalles.Find(id);
            if (facturasDetalles == null)
            {
                return HttpNotFound();
            }
            return View(facturasDetalles);
        }

        // POST: FacturasDetalles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            FacturasDetalles facturasDetalles = db.FacturasDetalles.Find(id);
            db.FacturasDetalles.Remove(facturasDetalles);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
