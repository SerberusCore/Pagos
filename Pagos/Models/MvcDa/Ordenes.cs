using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(OrdenesMD))]
    public partial class Ordenes
    {
        public partial class OrdenesMD
        {
            [Display(Name = "Código")]
            [Required]
            public string OrdenCodigo { get; set; }
            [Display(Name = "Tipo")]
            [Required]
            public string OrdenTipo { get; set; }
            [Display(Name = "Fecha")]
            [Required]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            public Nullable<System.DateTime> OrdenFecha { get; set; }
            [Display(Name = "Proveedor")]
            [Required]
            public Nullable<System.Guid> OrdenProveedor { get; set; }
            [Display(Name = "Sub Total")]
            [Required]
            public Nullable<decimal> OrdenSubtotal { get; set; }
            [Display(Name = "I.G.V.")]
            [Required]
            public Nullable<decimal> OrdenIgv { get; set; }
            [Display(Name = "Total")]
            [Required]
            public Nullable<decimal> OrdenTotal { get; set; }
            [Display(Name = "Plazo Entrega")]
            [Required]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            public Nullable<System.DateTime> OrdenPlazoEntrega { get; set; }
            [Display(Name = "Forma Pago")]
            [Required]
            public string OrdenFormaPago { get; set; }
            [Display(Name = "Contacto")]
            [Required]
            public Nullable<System.Guid> OrdenContactoInterno { get; set; }
            [Display(Name = "Estado")]
            public string OrdenEstado { get; set; }
            [Display(Name = "Observacion")]
            public string OrdenObservacion { get; set; }
            [Display(Name = "Motivo de Rechazo")]
            public string OrdenMotivoRechazo { get; set; }
        }
    }
}