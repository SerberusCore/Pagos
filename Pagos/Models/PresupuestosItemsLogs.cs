//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pagos.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PresupuestosItemsLogs
    {
        public System.Guid PresupuestoItemLogId { get; set; }
        public Nullable<System.Guid> PresupuestoItemId { get; set; }
        public Nullable<System.DateTime> PresupuestoItemLogFecha { get; set; }
        public string PresupuestoItemLogAccion { get; set; }
        public string PresupuestoItemCodigo { get; set; }
        public string PresupuestoItemNaturaleza { get; set; }
        public string PresupuestoItemUnidad { get; set; }
        public string PresupuestoItemResumen { get; set; }
        public Nullable<decimal> PresupuestoItemCantidad { get; set; }
        public Nullable<decimal> PresupuestoItemPrecio { get; set; }
        public Nullable<decimal> PresupuestoItemImporte { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public Nullable<System.Guid> UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaActualizacion { get; set; }
        public Nullable<System.Guid> UsuarioActualizacion { get; set; }
    
        public virtual PresupuestosItems PresupuestosItems { get; set; }
    }
}
