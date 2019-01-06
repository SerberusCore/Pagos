using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pagos.Dtos;
using Pagos.Models;
using Pagos.Recursos;

namespace Pagos.Controllers
{
    public class OrdenesController : Controller
    {
        private nortonEntities db = new nortonEntities();

        public JsonResult ObtenerContactos(Guid proveedorId)
        {
            var proveedor = db.Proveedores.FirstOrDefault();
            if (proveedor != null)
            {
                return
                    new JsonResult
                    {
                        Data = Json(proveedor.ProveedoresContactos.Select(x => new
                        {
                            x.ProveedorContactoId,
                            //x.ProveedorContactoNombres,
                            //x.ProveedorContactoApellidos
                        })),
                        JsonRequestBehavior = JsonRequestBehavior.AllowGet,
                        MaxJsonLength = int.MaxValue
                    };

            }
            return Json(null);
        }

        // GET: Ordenes
        public ActionResult Index()
        {
            var ordenes = (from o in db.Ordenes
                           join to in db.ParametrosDetalle on o.OrdenTipo equals to.ParametroDetalleCodigo
                           join fp in db.ParametrosDetalle on o.OrdenFormaPago equals fp.ParametroDetalleCodigo
                           join c in db.ProveedoresContactos on o.OrdenContactoInterno equals c.ProveedorContactoId
                           select new
                           {
                               Ordenes = o,
                               TipoOrden = to.ParametroDetalleDescripcion,
                               Proveedor = o.Proveedores.ProveedorRazonSocial,
                               FormaPago = fp.ParametroDetalleDescripcion,
                               //Contacto = c.ProveedorContactoNombres + " " + c.ProveedorContactoApellidos
                           }).Select(x => new OrdenesDto
                           {
                               Ordenes = x.Ordenes,
                               TipoOrden = x.TipoOrden,
                               FormaPago = x.FormaPago,
                               //Contacto = x.Contacto,
                               Proveedor = x.Proveedor
                           });
            return View(ordenes.ToList());
        }

        // GET: Ordenes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ordenes ordenes = db.Ordenes.Find(id);
            if (ordenes == null)
            {
                return HttpNotFound();
            }
            return View(ordenes);
        }

        // GET: Ordenes/Create
        public ActionResult Create()
        {
            var proveedores = db.Proveedores.ToList();
            proveedores.AgregarSeleccione("ProveedorId", "ProveedorRazonSocial");

            var tipo = db.Parametros
                .Where(x => x.ParametroCodigo == RParametros.TipoOrden)
                .First()
                .ParametrosDetalle
                .ToList();
            tipo.AgregarSeleccione();

            var formaPago = db.Parametros
                .Where(x => x.ParametroCodigo == RParametros.FormaPago)
                .First()
                .ParametrosDetalle
                .ToList();
            formaPago.AgregarSeleccione();

            var contactos = new List<ProveedoresContactos>();
            contactos.AgregarSeleccione("ProveedorContactoId", "ProveedorContactoNombres");

            ViewBag.OrdenProveedor = new SelectList(proveedores, "ProveedorId", "ProveedorRazonSocial");
            ViewBag.OrdenTipo = new SelectList(tipo, "ParametroDetalleId", "ParametroDetalleDescripcion");
            ViewBag.OrdenFormaPago = new SelectList(formaPago, "ParametroDetalleId", "ParametroDetalleDescripcion");
            ViewBag.OrdenContactoInterno = new SelectList(contactos, "ProveedorContactoId", "ProveedorContactoNombres");
            return View();
        }

        // POST: Ordenes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrdenId,OrdenCodigo,OrdenTipo,OrdenFecha,OrdenProveedor,OrdenSubtotal,OrdenIgv,OrdenTotal,OrdenPlazoEntrega,OrdenFormaPago,OrdenContactoInterno,OrdenLugarEntrega,OrdenEstado,OrdenObservacion,OrdenMotivoRechazo")] Ordenes ordenes)
        {
            if (ModelState.IsValid)
            {
                ordenes.OrdenId = Guid.NewGuid();
                var detalles = Session["OrdenesDetalles"] as List<OrdenesDetalles>;
                ordenes.OrdenesDetalles = detalles;
                db.Ordenes.Add(ordenes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OrdenProveedor = new SelectList(db.Proveedores, "ProveedorId", "ProveedorRazonSocial", ordenes.OrdenProveedor);
            return View(ordenes);
        }

        // GET: Ordenes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ordenes ordenes = db.Ordenes.Find(id);
            if (ordenes == null)
            {
                return HttpNotFound();
            }
            ViewBag.OrdenProveedor = new SelectList(db.Proveedores, "ProveedorId", "ProveedorRuc", ordenes.OrdenProveedor);
            return View(ordenes);
        }

        // POST: Ordenes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrdenId,OrdenCodigo,OrdenTipo,OrdenFecha,OrdenProveedor,OrdenSubtotal,OrdenIgv,OrdenTotal,OrdenPlazoEntrega,OrdenFormaPago,OrdenContactoInterno,OrdenLugarEntrega,OrdenEstado,OrdenObservacion,OrdenMotivoRechazo")] Ordenes ordenes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ordenes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OrdenProveedor = new SelectList(db.Proveedores, "ProveedorId", "ProveedorRuc", ordenes.OrdenProveedor);
            return View(ordenes);
        }

        // GET: Ordenes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ordenes ordenes = db.Ordenes.Find(id);
            if (ordenes == null)
            {
                return HttpNotFound();
            }
            return View(ordenes);
        }

        // POST: Ordenes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Ordenes ordenes = db.Ordenes.Find(id);
            db.Ordenes.Remove(ordenes);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ViewResult Evaluar(Guid id)
        {
            var orden = db.Ordenes.Include(o => o.Proveedores).FirstOrDefault(x => x.OrdenId == id);
            var proveedores = db.Proveedores.ToList();
            proveedores.AgregarSeleccione("ProveedorId", "ProveedorRazonSocial");

            var tipo = db.Parametros
             .Where(x => x.ParametroCodigo == RParametros.TipoOrden)
             .First()
             .ParametrosDetalle
             .ToList();
            tipo.AgregarSeleccione();

            var estados = db.Parametros.Where(x => x.ParametroCodigo == RParametros.EstadoOrden)
                .First()
                .ParametrosDetalle
                .ToList();
            estados.AgregarSeleccione();

            ViewBag.OrdenEstado=new SelectList(estados,"ParametroDetalleId", "ParametroDetalleDescripcion", orden.OrdenEstado);
            ViewBag.OrdenProveedor = new SelectList(proveedores, "ProveedorId", "ProveedorRazonSocial", orden.OrdenProveedor);
            ViewBag.OrdenTipo = new SelectList(tipo, "ParametroDetalleId", "ParametroDetalleDescripcion",orden.OrdenTipo);
            return View("_Aprobar", orden);
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
