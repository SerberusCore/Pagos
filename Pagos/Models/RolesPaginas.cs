//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pagos.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RolesPaginas
    {
        public System.Guid RolId { get; set; }
        public System.Guid PaginaId { get; set; }
        public string Accion { get; set; }
    
        public virtual Paginas Paginas { get; set; }
        public virtual Roles Roles { get; set; }
    }
}