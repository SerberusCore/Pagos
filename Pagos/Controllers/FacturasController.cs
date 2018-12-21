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
    public class FacturasController : Controller
    {
        private nortonEntities db = new nortonEntities();

        // GET: Facturas
        public ActionResult Index()
        {
            //var facturas = db.Facturas.Include(f => f.TiposFacturas);
            var facturas = (from f in db.Facturas
                            join m in db.Monedas on f.FacturaMoneda equals m.MonedaId
                            select new { f, f.TiposFacturas, f.Proyectos, Moneda=m }).
                           Select(x => new Dtos.DtoFactura
                           {
                               Moneda=x.Moneda,
                               Factura=x.f
                           }).ToList();
            return View(facturas.ToList());
        }

        // GET: Facturas/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturas facturas = db.Facturas.Find(id);
            if (facturas == null)
            {
                return HttpNotFound();
            }
            return View(facturas);
        }

        // GET: Facturas/Create
        public ActionResult Create()
        {
            ViewBag.FacturaTipo = new SelectList(db.TiposFacturas, "TipoFacturaId", "TipoFacturaDescripcion");
            ViewBag.FacturaMoneda = new SelectList(db.Monedas, "MonedaId", "MonedaDescripcion");
            ViewBag.FacturaProyecto = new SelectList(db.Proyectos, "ProyectoId", "ProyectoNombre");
            return View();
        }

        // POST: Facturas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FacturaId,FacturaProyecto,FacturaTipo,FacturaSerie,FacturaNumero,FacturaFechaEmision,FacturaFechaVencimiento,FacturaMoneda,FacturaEstado,FacturaSubtotal,FacturaIgv,FacturaImporteTotal,FacturaFondoGarantia,FacturaPorcentajeDetraccion,FacturaMontoDetraccion,FacturaImportePagar,FacturaUrl,FacturaFechaPagoProgramada")] Facturas facturas)
        {
            if (ModelState.IsValid)
            {
                facturas.FacturaId = Guid.NewGuid();
                facturas.FacturaEstado = "A";
                db.Facturas.Add(facturas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FacturaTipo = new SelectList(db.TiposFacturas, "TipoFacturaId", "TipoFacturaDescripcion", facturas.FacturaTipo);
            ViewBag.FacturaMoneda = new SelectList(db.Monedas, "MonedaId", "MonedaDescripcion", facturas.FacturaMoneda);
            ViewBag.FacturaProyecto = new SelectList(db.Proyectos, "ProyectoId", "ProyectoNombre", facturas.FacturaProyecto);
            return View(facturas);
        }

        // GET: Facturas/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturas facturas = db.Facturas.Find(id);
            if (facturas == null)
            {
                return HttpNotFound();
            }
            ViewBag.FacturaTipo = new SelectList(db.TiposFacturas, "TipoFacturaId", "TipoFacturaCodigo", facturas.FacturaTipo);
            ViewBag.FacturaMoneda = new SelectList(db.Monedas, "MonedaId", "MonedaDescripcion", facturas.FacturaMoneda);
            ViewBag.FacturaProyecto = new SelectList(db.Proyectos, "ProyectoId", "ProyectoNombre", facturas.FacturaProyecto);
            return View(facturas);
        }

        // POST: Facturas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FacturaId,FacturaProyecto,FacturaTipo,FacturaSerie,FacturaNumero,FacturaFechaEmision,FacturaFechaVencimiento,FacturaMoneda,FacturaEstado,FacturaSubtotal,FacturaIgv,FacturaImporteTotal,FacturaFondoGarantia,FacturaPorcentajeDetraccion,FacturaMontoDetraccion,FacturaImportePagar,FacturaUrl,FacturaFechaPagoProgramada")] Facturas facturas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(facturas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FacturaTipo = new SelectList(db.TiposFacturas, "TipoFacturaId", "TipoFacturaCodigo", facturas.FacturaTipo);
            ViewBag.FacturaMoneda = new SelectList(db.Monedas, "MonedaId", "MonedaDescripcion", facturas.FacturaMoneda);
            ViewBag.FacturaProyecto = new SelectList(db.Proyectos, "ProyectoId", "ProyectoNombre", facturas.FacturaProyecto);
            return View(facturas);
        }

        // GET: Facturas/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturas facturas = db.Facturas.Find(id);
            if (facturas == null)
            {
                return HttpNotFound();
            }
            return View(facturas);
        }

        // POST: Facturas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Facturas facturas = db.Facturas.Find(id);
            db.Facturas.Remove(facturas);
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
