using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_estado_incidencia
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();

        public List<tbl_estado_incidencia> cargar_estados_incidencias()
        {
            var query = dc.sp_cargar_estado_incidencia().ToList();
            var estInci = query.Select(r => new tbl_estado_incidencia
            {
                esi_id = r.esi_id,
                esi_nombre = r.esi_nombre

            }).ToList();

            return estInci;
        }

        public void agregar_estado_incidencia(string nombre)
        {
            dc.sp_agregar_estado_incidencia(nombre);
        }
    }
}
