using System;
using System.ComponentModel.DataAnnotations;

namespace Pagos.Models
{
    [MetadataType(typeof(ProyectosMD))]
    public partial class Proyectos
    {
        public partial class ProyectosMD
        {
            [Display(Name = "Centro de Costo")]
            [Required]
            public string ProyectoCodigo { get; set; }
            [Display(Name = "Nombre")]
            [Required]
            public string ProyectoNombre { get; set; }
            [Display(Name = "Moneda")]
            [Required]
            public Nullable<System.Guid> ProyectoMoneda { get; set; }
            [Display(Name = "% Utilidad")]
            [Required]
            public Nullable<decimal> ProyectoUtilidadPorcentaje { get; set; }
            [Display(Name = "Utilidad")]
            [Required]
            public Nullable<decimal> ProyectoUtilidad { get; set; }
            [Display(Name = "Monto Gastos Generales")]
            [Required]
            public Nullable<decimal> ProyectoGastosGenerales { get; set; }
            [Display(Name = "I.G.V.")]
            [Required]
            public Nullable<decimal> ProyectoIgv { get; set; }
            [Display(Name = "Monto Total Proyecto")]
            [Required]
            public Nullable<decimal> ProyectoMontoTotal { get; set; }
            [Display(Name = "Estado")]
            [Required]
            public string ProyectoEstado { get; set; }
            [Display(Name = "Fecha de Inicio")]
            [Required]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            public Nullable<System.DateTime> ProyectoFechaInicio { get; set; }
            [Display(Name = "Fecha de Fin")]
            [Required]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            public Nullable<System.DateTime> ProyectoFechaFin { get; set; }
            [Display(Name = "Empresa")]
            [Required]
            public Nullable<System.Guid> ProyectoEmpresa { get; set; }
            [Display(Name = "Lugar de Entrega")]
            [Required]
            public string ProyectoLugarEntrega { get; set; }
        }
    }
}