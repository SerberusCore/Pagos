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
    
    public partial class Facturas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Facturas()
        {
            this.FacturasDetalles = new HashSet<FacturasDetalles>();
            this.FacturasEstados = new HashSet<FacturasEstados>();
            this.FacturasGuiasRemision = new HashSet<FacturasGuiasRemision>();
            this.FacturasOrdenes = new HashSet<FacturasOrdenes>();
            this.FacturasPagos = new HashSet<FacturasPagos>();
            this.Proveedores = new HashSet<Proveedores>();
        }
    
        public System.Guid FacturaId { get; set; }
        public Nullable<System.Guid> FacturaProyecto { get; set; }
        public Nullable<System.Guid> FacturaTipo { get; set; }
        public string FacturaSerie { get; set; }
        public string FacturaNumero { get; set; }
        public Nullable<System.DateTime> FacturaFechaEmision { get; set; }
        public Nullable<System.DateTime> FacturaFechaVencimiento { get; set; }
        public Nullable<System.Guid> FacturaMoneda { get; set; }
        public string FacturaEstado { get; set; }
        public Nullable<decimal> FacturaSubtotal { get; set; }
        public Nullable<decimal> FacturaIgv { get; set; }
        public Nullable<decimal> FacturaImporteTotal { get; set; }
        public Nullable<decimal> FacturaFondoGarantia { get; set; }
        public Nullable<decimal> FacturaPorcentajeDetraccion { get; set; }
        public Nullable<decimal> FacturaMontoDetraccion { get; set; }
        public Nullable<decimal> FacturaImportePagar { get; set; }
        public string FacturaUrl { get; set; }
        public Nullable<System.DateTime> FacturaFechaPagoProgramada { get; set; }
    
        public virtual TiposFacturas TiposFacturas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturasDetalles> FacturasDetalles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturasEstados> FacturasEstados { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturasGuiasRemision> FacturasGuiasRemision { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturasOrdenes> FacturasOrdenes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturasPagos> FacturasPagos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Proveedores> Proveedores { get; set; }
    }
}
