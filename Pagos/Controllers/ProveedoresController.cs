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
    public class ProveedoresController : Controller
    {
        private nortonEntities db = new nortonEntities();

        // GET: Proveedores
        public ActionResult Index()
        {
            var proveedores = db.Proveedores;//.Include(p => p.TiposDetracciones).Include(p => p.TiposProveedores);
            return View(proveedores.ToList());
        }

        // GET: Proveedores/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            return View(proveedores);
        }

        // GET: Proveedores/Create
        public ActionResult Create()
        {
            ViewBag.ProveedorTipoDetraccion = new SelectList(db.TiposDetracciones, "TipoDetraccionId", "TipoDetraccionDescripcion");
            ViewBag.ProveedorTipo = new SelectList(db.TiposProveedores, "TipoProveedorId", "TipoProveedorDescripcion");
            return View();
        }

        // POST: Proveedores/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProveedorId,ProveedorRuc,ProveedorEmail,ProveedorRazonSocial,ProveedorPassword,ProveedorTipo,ProveedorDireccionFiscal,ProveedorPlazoPago,ProveedorEstado,ProveedorTipoDetraccion,ProveedorPorcentajeDetraccion,ProveedorCuentaDetraccion,FechaCreacion,UsuarioCreacion,FechaActualizacion,UsuarioValidacion,TipoProveedorId")] Proveedores proveedores)
        {
            if (ModelState.IsValid)
            {
                proveedores.ProveedorId = Guid.NewGuid();
                proveedores.ProveedorEstado = "A";
                db.Proveedores.Add(proveedores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.ProveedorTipoDetraccion = new SelectList(db.TiposDetracciones, "TipoDetraccionId", "TipoDetraccionDescripcion", proveedores.ProveedorTipoDetraccion);
            ViewBag.ProveedorTipo = new SelectList(db.TiposProveedores, "TipoProveedorId", "TipoProveedorDescripcion", proveedores.ProveedorTipo);
            return View(proveedores);
        }

        // GET: Proveedores/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            //ViewBag.ProveedorTipoDetraccion = new SelectList(db.TiposDetracciones, "TipoDetraccionId", "TipoDetraccionDescripcion", proveedores.ProveedorTipoDetraccion);
            ViewBag.ProveedorTipo = new SelectList(db.TiposProveedores, "TipoProveedorId", "TipoProveedorDescripcion", proveedores.ProveedorTipo);
            return View(proveedores);
        }

        // POST: Proveedores/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProveedorId,ProveedorRuc,ProveedorEmail,ProveedorRazonSocial,ProveedorPassword,ProveedorTipo,ProveedorDireccionFiscal,ProveedorPlazoPago,ProveedorEstado,ProveedorTipoDetraccion,ProveedorPorcentajeDetraccion,ProveedorCuentaDetraccion,FechaCreacion,UsuarioCreacion,FechaActualizacion,UsuarioValidacion,TipoProveedorId")] Proveedores proveedores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proveedores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.ProveedorTipoDetraccion = new SelectList(db.TiposDetracciones, "TipoDetraccionId", "TipoDetraccionDescripcion", proveedores.ProveedorTipoDetraccion);
            ViewBag.ProveedorTipo = new SelectList(db.TiposProveedores, "TipoProveedorId", "TipoProveedorDescripcion", proveedores.ProveedorTipo);
            return View(proveedores);
        }

        // GET: Proveedores/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            return View(proveedores);
        }

        // POST: Proveedores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Proveedores proveedores = db.Proveedores.Find(id);
            db.Proveedores.Remove(proveedores);
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
