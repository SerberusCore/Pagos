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
    
    public partial class Proyectos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Proyectos()
        {
            this.Facturas = new HashSet<Facturas>();
            this.Ordenes = new HashSet<Ordenes>();
            this.ProyectosPresupuestos = new HashSet<ProyectosPresupuestos>();
            this.ProyectosResponsables = new HashSet<ProyectosResponsables>();
        }
    
        public System.Guid ProyectoId { get; set; }
        public string ProyectoCodigo { get; set; }
        public string ProyectoNombre { get; set; }
        public Nullable<System.Guid> ProyectoMoneda { get; set; }
        public Nullable<decimal> ProyectoUtilidadPorcentaje { get; set; }
        public Nullable<decimal> ProyectoUtilidad { get; set; }
        public Nullable<decimal> ProyectoGastosGenerales { get; set; }
        public Nullable<decimal> ProyectoIgv { get; set; }
        public Nullable<decimal> ProyectoMontoTotal { get; set; }
        public string ProyectoEstado { get; set; }
        public Nullable<System.DateTime> ProyectoFechaInicio { get; set; }
        public Nullable<System.DateTime> ProyectoFechaFin { get; set; }
        public Nullable<System.Guid> ProyectoEmpresa { get; set; }
        public string ProyectoLugarEntrega { get; set; }
        public Nullable<System.Guid> UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public Nullable<System.DateTime> FechaActualizacion { get; set; }
        public Nullable<System.Guid> UsuarioActualizacion { get; set; }
    
        public virtual Empresas Empresas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Facturas> Facturas { get; set; }
        public virtual Monedas Monedas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ordenes> Ordenes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProyectosPresupuestos> ProyectosPresupuestos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProyectosResponsables> ProyectosResponsables { get; set; }
    }
}
