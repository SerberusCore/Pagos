using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Pagos.Models
{
    [MetadataType(typeof(MonedasMD))]
    public partial class Monedas
    {
        public partial class MonedasMD
        {
            [Display(Name = "Código")]
            public string MonedaCodigo { get; set; }
            [Display(Name = "Nombre Moneda")]
            public string MonedaDescripcion { get; set; }
            public Nullable<bool> MonedaBase { get; set; }
        }
    }
}