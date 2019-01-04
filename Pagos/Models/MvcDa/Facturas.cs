using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(FacturasMD))]
    public partial class Facturas
    {

        public partial class FacturasMD
        {
            public System.Guid FacturaId { get; set; }
            [Display(Name = "Proyecto")]
            [Required]
            public Nullable<System.Guid> FacturaProyecto { get; set; }
            [Display(Name = "Tipo Proyecto")]
            [Required]
            public Nullable<System.Guid> FacturaTipo { get; set; }
            [Display(Name = "Serie y Número de Factura")]
            [Required]
            public string FacturaSerie { get; set; }
            [Display(Name = "Número de Orden")]
            [Required]
            public string FacturaNumero { get; set; }
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
            [DataType(DataType.Date)]
            [Display(Name = "Fecha Emisión")]
            [Required]
            public Nullable<System.DateTime> FacturaFechaEmision { get; set; }
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
            [DataType(DataType.Date)]
            [Display(Name = "Fecha Vencimiento")]
            [Required]
            public Nullable<System.DateTime> FacturaFechaVencimiento { get; set; }
            [Display(Name = "Moneda")]
            [Required]
            public Nullable<System.Guid> FacturaMoneda { get; set; }
            [Display(Name = "Estado")]
            public string FacturaEstado { get; set; }
            [Display(Name = "Sub Total")]
            public Nullable<decimal> FacturaSubtotal { get; set; }
            [Display(Name = "IGV")]
            public Nullable<decimal> FacturaIgv { get; set; }
            [Display(Name = "Importe Total")]
            public Nullable<decimal> FacturaImporteTotal { get; set; }
            [Display(Name = "Fondo Garantía")]
            public Nullable<decimal> FacturaFondoGarantia { get; set; }
            [Display(Name = "Porcentaje Detracción")]
            public Nullable<decimal> FacturaPorcentajeDetraccion { get; set; }
            [Display(Name = "Monto Detracción")]
            public Nullable<decimal> FacturaMontoDetraccion { get; set; }
            [Display(Name = "Importe Pagar")]
            public Nullable<decimal> FacturaImportePagar { get; set; }
            [Display(Name = "URL")]
            public string FacturaUrl { get; set; }
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
            [DataType(DataType.Date)]
            [Display(Name = "Fecha Pago")]
            public Nullable<System.DateTime> FacturaFechaPagoProgramada { get; set; }
        }

    }
}