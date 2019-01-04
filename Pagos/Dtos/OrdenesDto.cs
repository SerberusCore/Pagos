using Pagos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pagos.Dtos
{
    public class OrdenesDto
    {
        public Ordenes Ordenes { get; set; }
        public string  TipoOrden { get; set; }
        public string Proveedor { get; set; }
        public string FormaPago { get; internal set; }
        public string Contacto { get; internal set; }
    }
}