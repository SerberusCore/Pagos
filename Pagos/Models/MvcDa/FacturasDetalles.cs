using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(FacturasDetallesMD))]
    public partial  class FacturasDetalles
    {
        public partial class FacturasDetallesMD
        {
            public System.Guid FacturaDetalleId { get; set; }
            public Guid? FacturaId { get; set; }
            [Display(Name = "Descripción")]
            [Required]
            public string FacturaDetalleDescripcion { get; set; }
            [Display(Name = "Cantidad")]
            [Required]
            public Nullable<decimal> FacturaDetalleCantidad { get; set; }
            [Display(Name = "Precio Unitario")]
            [Required]
            public Nullable<decimal> FacturaDetallePrecioUnitario { get; set; }
            [Display(Name = "Importe Total")]
            [Required]
            public Nullable<decimal> FacturaDetalleImporteTotal { get; set; }
        }
    }
}