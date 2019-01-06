using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(OrdenesDetallesMD))]
    public partial class OrdenesDetalles
    {
        public partial class OrdenesDetallesMD
        {
            [Display(Name = "Item")]
            [Required]
            public Nullable<int> OrdenDetalleItem { get; set; }
            [Display(Name = "Descripción")]
            [Required]
            public string OrdenDetalleDescripcion { get; set; }
        
            [Display(Name = "Unidad")]
            [Required]
            public string OrdenDetalleUnidad { get; set; }
            [Display(Name = "Precio Unitario")]
            [Required]
            public Nullable<decimal> OrdenDetallePrecioUnitario { get; set; }
            [Display(Name = "Precio Total")]
            [Required]
            public Nullable<decimal> OrdenDetallePrecioTotal { get; set; }
        }
    }
}