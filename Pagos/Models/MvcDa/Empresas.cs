using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Pagos.Models
{
    [MetadataType(typeof(EmpresasMD))]
    public partial class Empresas
    {
        public partial class EmpresasMD
        {
            public string EmpresaCodigo { get; set; }
            [Display(Name="Nombre Empresa")]
            public string EmpresaDescripcion { get; set; }
            public string EmpresaEstado { get; set; }
        }
    }
}