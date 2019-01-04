using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(TiposFacturasMD))]
    public partial class TiposFacturas
    {

        public partial class TiposFacturasMD
        {
            [Display(Name = "Tipo")]
            public string TipoFacturaCodigo { get; set; }
            public string TipoFacturaDescripcion { get; set; }
        }

    }
}