using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Pagos.Dtos;
using Pagos.Models;
using Pagos.Recursos;

namespace Pagos.Controllers
{
    public class OrdenesController : Controller
    {
        private nortonEntities db = new nortonEntities();
        public Usuarios Usuario
        {
            get
            {
                return Session["Usuario"] as Usuarios;
            }
        }

        public JsonResult ObtenerContactos(Guid proveedorId)
        {
            var proveedor = db.Proveedores.FirstOrDefault();
            if (proveedor != null)
            {
                return
                    new JsonResult
                    {
                        Data = Json((from pc in db.ProveedoresContactos.Where(x => x.Proveedores.ProveedorId == proveedorId)
                                     join u in db.Usuarios on pc.UsuarioId equals u.UsuarioId
                                     select new { pc.ProveedorContactoId, Nombres = u.UsuarioNombres + " " + u.UsuarioApellidos }).ToList()),
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
                           join to in db.ParametrosDetalle on new { cod = o.OrdenTipo, par = RParametros.TipoOrden } equals new { cod = to.ParametroDetalleCodigo, par = to.Parametros.ParametroCodigo }
                           join fp in db.ParametrosDetalle on new { cod = o.OrdenFormaPago, par = RParametros.FormaPago } equals new { cod = fp.ParametroDetalleCodigo, par = fp.Parametros.ParametroCodigo }
                           join c in db.ProveedoresContactos on o.OrdenContactoInterno equals c.ProveedorContactoId
                           join u in db.Usuarios on c.UsuarioId equals u.UsuarioId
                           select new
                           {
                               Ordenes = o,
                               TipoOrden = to.ParametroDetalleDescripcion,
                               Proveedor = o.Proveedores.ProveedorRazonSocial,
                               FormaPago = fp.ParametroDetalleDescripcion,
                               Contacto = u.UsuarioNombres + " " + u.UsuarioApellidos
                           }).Select(x => new OrdenesDto
                           {
                               Ordenes = x.Ordenes,
                               TipoOrden = x.TipoOrden,
                               FormaPago = x.FormaPago,
                               Contacto = x.Contacto,
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
            var proyectos = db.Proyectos.Where(x => x.ProyectoEstado == RConstantes.ProyectoEstadoActivo).ToList();
            proyectos.AgregarSeleccione("ProyectoId", "ProyectoNombre");

            var proveedores = db.Proveedores.ToList();
            proveedores.AgregarSeleccione("ProveedorId", "ProveedorRazonSocial");

            var tipo = db.ParametrosDetalle
                .Where(x => x.Parametros.ParametroCodigo == RParametros.TipoOrden).ToList();
            tipo.AgregarSeleccione();

            var formaPago = db.ParametrosDetalle
                .Where(x => x.Parametros.ParametroCodigo == RParametros.FormaPago).ToList();
            formaPago.AgregarSeleccione();

            var contactos = (from pc in db.ProveedoresContactos.Where(x => x.Proveedores.ProveedorId == Guid.Empty)
                             join u in db.Usuarios on pc.UsuarioId equals u.UsuarioId
                             select new { pc.ProveedorContactoId, Nombres = u.UsuarioNombres + " " + u.UsuarioApellidos }).ToList();

            ViewBag.ProyectoId = new SelectList(proyectos, "ProyectoId", "ProyectoNombre");
            ViewBag.OrdenProveedor = new SelectList(proveedores, "ProveedorId", "ProveedorRazonSocial");
            ViewBag.OrdenTipo = new SelectList(tipo, "ParametroDetalleCodigo", "ParametroDetalleDescripcion");
            ViewBag.OrdenFormaPago = new SelectList(formaPago, "ParametroDetalleCodigo", "ParametroDetalleDescripcion");
            ViewBag.OrdenContactoInterno = new SelectList(contactos, "ProveedorContactoId", "Nombres");
            return View();
        }

        // POST: Ordenes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProyectoId,OrdenId,OrdenCodigo,OrdenTipo,OrdenFecha,OrdenProveedor,OrdenSubtotal,OrdenIgv,OrdenTotal,OrdenPlazoEntrega,OrdenFormaPago,OrdenContactoInterno,OrdenLugarEntrega,OrdenEstado,OrdenObservacion,OrdenMotivoRechazo")] Ordenes ordenes)
        {
            if (ModelState.IsValid)
            {
                var proyecto = db.Proyectos.First(x => x.ProyectoId == ordenes.ProyectoId);
                var cantidadOrdenes = db.Ordenes.Count(x => x.Proyectos.ProyectoId == ordenes.ProyectoId &&
                x.OrdenFecha.Value.Year == DateTime.Now.Year);
                var secuencial = $"000{cantidadOrdenes + 1}";
                secuencial = secuencial.Substring(secuencial.Length - 3);

                ordenes.OrdenEstado = RConstantes.OrdenEstadoPendiente;
                ordenes.OrdenCodigo = $"{proyecto.ProyectoCodigo}{secuencial}{DateTime.Now.Year}";
                ordenes.OrdenId = Guid.NewGuid();
                var detalles = Session["OrdenesDetalles"] as List<OrdenesDetalles>;
                ordenes.OrdenesDetalles = detalles;
                ordenes.OrdenesEstados = new List<OrdenesEstados>
                {
                    new OrdenesEstados
                    {
                        OrdenEstadoEstado=RConstantes.OrdenEstadoPendiente,
                        OrdenEstadoFecha=DateTime.Now,
                        OrdenEstadoId=Guid.NewGuid(),
                        OrdenEstadoUsuario=Usuario.UsuarioId
                    }
                };
                db.Ordenes.Add(ordenes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OrdenProveedor = new SelectList(db.Proveedores, "ProveedorId", "ProveedorRazonSocial", ordenes.OrdenProveedor);
            return View(ordenes);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Rechazar([Bind(Include = "OrdenId,OrdenObservacion,OrdenMotivoRechazo")] Ordenes ordenes)
        {
            var result = db.Ordenes.SingleOrDefault(x => x.OrdenId == ordenes.OrdenId);
            if (result != null)
            {
                result.OrdenEstado = RConstantes.OrdenEstadoRechazado;
                result.OrdenMotivoRechazo = ordenes.OrdenMotivoRechazo;
                result.OrdenObservacion = ordenes.OrdenObservacion;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
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

            var tipo = db.ParametrosDetalle.Where(x => x.Parametros.ParametroCodigo == RParametros.TipoOrden).ToList();
            tipo.AgregarSeleccione();

            var estados = db.ParametrosDetalle.Where(x => x.Parametros.ParametroCodigo == RParametros.EstadoOrden).ToList();
            estados.AgregarSeleccione();

            var motivosRechazo = db.ParametrosDetalle.Where(x => x.Parametros.ParametroCodigo == RParametros.MotivoRechazo).ToList();
            motivosRechazo.AgregarSeleccione();

            ViewBag.OrdenMotivoRechazo = new SelectList(motivosRechazo, "ParametroDetalleId", "ParametroDetalleDescripcion");
            ViewBag.OrdenEstado = new SelectList(estados, "ParametroDetalleCodigo", "ParametroDetalleDescripcion", orden.OrdenEstado);
            ViewBag.OrdenProveedor = new SelectList(proveedores, "ProveedorId", "ProveedorRazonSocial", orden.OrdenProveedor);
            ViewBag.OrdenTipo = new SelectList(tipo, "ParametroDetalleCodigo", "ParametroDetalleDescripcion", orden.OrdenTipo);
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
