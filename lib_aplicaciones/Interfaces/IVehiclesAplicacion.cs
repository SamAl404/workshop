

using lib_dominio.Entidades;

namespace lib_aplicaciones.Interfaces
{
    public interface IVehiclesAplicacion
    {
        List<Vehicles> PorPlate(Vehicles? entidad);
        List<Vehicles> Listar();
        Vehicles? Guardar(Vehicles? entidad);
        Vehicles? Modificar(Vehicles? entidad);
        Vehicles? Borrar(Vehicles? entidad);


    }
}
