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
    
    public partial class Usuarios
    {
        public System.Guid UsuarioId { get; set; }
        public string UsuarioCodigo { get; set; }
        public string UsuarioNombres { get; set; }
        public string UsuarioApellidos { get; set; }
        public string UsuarioEmail { get; set; }
        public string UsuarioUsername { get; set; }
        public string UsuarioPassword { get; set; }
        public Nullable<System.Guid> RolId { get; set; }
        public Nullable<System.Guid> EmpresaId { get; set; }
    
        public virtual Empresas Empresas { get; set; }
        public virtual Roles Roles { get; set; }
    }
}
