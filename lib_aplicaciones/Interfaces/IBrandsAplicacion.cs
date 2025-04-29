

using lib_dominio.Entidades;

namespace lib_aplicaciones.Interfaces
{
    public interface IBrandsAplicacion
    {
        List<Brands> PorPais(Brands? entidad);
        List<Brands> Listar();
        Brands? Guardar(Notas? entidad);
        Brands? Modificar(Notas? entidad);
        Brands? Borrar(Notas? entidad);


    }
}
