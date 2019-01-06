using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pagos.Models;
using Pagos.Recursos;

namespace Pagos.Controllers
{
    public class ProyectosController : Controller
    {
        private nortonEntities db = new nortonEntities();

        // GET: Proyectos
        public ActionResult Index()
        {
            var proyectos = db.Proyectos.Include(p => p.Empresas).Include(p=>p.Monedas);
            return View(proyectos.ToList());
        }

        // GET: Proyectos/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyectos proyectos = db.Proyectos.Find(id);
            if (proyectos == null)
            {
                return HttpNotFound();
            }
            return View(proyectos);
        }

        // GET: Proyectos/Create
        public ActionResult Create()
        {
            var monedas = db.Monedas.ToList();
            monedas.AgregarSeleccione("MonedaId", "MonedaDescripcion");

            ViewBag.ProyectoMoneda = new SelectList(monedas, "MonedaId", "MonedaDescripcion");
            ViewBag.ProyectoEmpresa = new SelectList(db.Empresas, "EmpresaId", "EmpresaDescripcion");
            return View();
        }

        // POST: Proyectos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProyectoId,ProyectoCodigo,ProyectoNombre,ProyectoMoneda,ProyectoUtilidadPorcentaje,ProyectoUtilidad,ProyectoGastosGenerales,ProyectoIgv,ProyectoMontoTotal,ProyectoEstado,ProyectoFechaInicio,ProyectoFechaFin,ProyectoEmpresa,ProyectoLugarEntrega,UsuarioCreacion,FechaCreacion,FechaActualizacion,UsuarioActualizacion")] Proyectos proyectos)
        {
            proyectos.ProyectoEstado = RConstantes.ProyectoEstadoActivo;
            proyectos.ProyectoId = Guid.NewGuid();
            db.Proyectos.Add(proyectos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Proyectos/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyectos proyectos = db.Proyectos.Find(id);
            if (proyectos == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProyectoEmpresa = new SelectList(db.Empresas, "EmpresaId", "EmpresaCodigo", proyectos.ProyectoEmpresa);
            return View(proyectos);
        }

        // POST: Proyectos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProyectoId,ProyectoCodigo,ProyectoNombre,ProyectoMoneda,ProyectoUtilidadPorcentaje,ProyectoUtilidad,ProyectoGastosGenerales,ProyectoIgv,ProyectoMontoTotal,ProyectoEstado,ProyectoFechaInicio,ProyectoFechaFin,ProyectoEmpresa,ProyectoLugarEntrega,UsuarioCreacion,FechaCreacion,FechaActualizacion,UsuarioActualizacion")] Proyectos proyectos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proyectos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProyectoEmpresa = new SelectList(db.Empresas, "EmpresaId", "EmpresaCodigo", proyectos.ProyectoEmpresa);
            return View(proyectos);
        }

        // GET: Proyectos/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyectos proyectos = db.Proyectos.Find(id);
            if (proyectos == null)
            {
                return HttpNotFound();
            }
            return View(proyectos);
        }

        // POST: Proyectos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Proyectos proyectos = db.Proyectos.Find(id);
            db.Proyectos.Remove(proyectos);
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
