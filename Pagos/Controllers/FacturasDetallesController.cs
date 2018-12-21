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
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FacturaDetalleId,FacturaId,FacturaDetalleDescripcion,FacturaDetalleCantidad,FacturaDetallePrecioUnitario,FacturaDetalleImporteTotal,FechaCreacion,UsuarioCreacion,FechaActualizacion,UsuarioActualizacion")] FacturasDetalles facturasDetalles)
        {
            if (ModelState.IsValid)
            {
                facturasDetalles.FacturaDetalleId = Guid.NewGuid();
                db.FacturasDetalles.Add(facturasDetalles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FacturaId = new SelectList(db.Facturas, "FacturaId", "FacturaSerie", facturasDetalles.FacturaId);
            return View(facturasDetalles);
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
