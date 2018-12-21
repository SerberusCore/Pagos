using Pagos.Models;
using System;
using System.Collections.Generic;

namespace Pagos
{
    public static class Extensiones
    {
        static Guid guid;
        public static void AgregarSeleccione(this List<ParametrosDetalle> lista)
        {
            lista.Insert(
                0,
                new ParametrosDetalle
                {
                    ParametroDetalleId = guid,
                    ParametroDetalleDescripcion = Recursos.RConstantes.Seleccione
                });
        }
        public static void AgregarSeleccione<T>(this List<T> lista, string id, string value) where T : new()
        {
            var newT = new T();
            var tipo = typeof(T);
            var propiedades = tipo.GetProperties();
            foreach (var propiedad in propiedades)
            {
                if (propiedad.Name == id)
                {
                    propiedad.SetValue(newT, guid);
                    break;
                }
            }
            foreach (var propiedad in propiedades)
            {
                if (propiedad.Name == value)
                {
                    propiedad.SetValue(newT, Recursos.RConstantes.Seleccione);
                    break;
                }
            }
            lista.Insert(
                0,
                newT);
        }
    }
}