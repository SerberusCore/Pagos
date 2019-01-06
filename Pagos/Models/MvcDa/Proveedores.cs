using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(ProveedoresMD))]
    public partial class Proveedores
    {
        public partial class ProveedoresMD
        {
            public System.Guid ProveedorId { get; set; }
            [Display(Name = "RUC")]
            public string ProveedorRuc { get; set; }
            [Display(Name = "Email")]
            public string ProveedorEmail { get; set; }
            [Display(Name = "Razón Social")]
            [Required]
            public string ProveedorRazonSocial { get; set; }
            [Display(Name = "Password")]
            public string ProveedorPassword { get; set; }
            [Display(Name = "Tipo Proveedor")]
            public Nullable<System.Guid> ProveedorTipo { get; set; }
            [Display(Name = "Dirección Fiscal")]
            [Required]
            public string ProveedorDireccionFiscal { get; set; }
            [Display(Name = "Plazo de Pago")]
            [Required]
            public Nullable<int> ProveedorPlazoPago { get; set; }
            [Display(Name = "Estado")]
            public string ProveedorEstado { get; set; }
            public Nullable<System.DateTime> FechaCreacion { get; set; }
            public Nullable<System.Guid> UsuarioCreacion { get; set; }
            public Nullable<System.DateTime> FechaActualizacion { get; set; }
            public Nullable<System.Guid> UsuarioValidacion { get; set; }
            public Nullable<System.Guid> TipoProveedorId { get; set; }
        }
    }
}