using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_equipo
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();

        public List<tbl_equipo> cargar_equipos()
        {
            var query = dc.sp_cargar_equipos().ToList();
            var equipo = query.Select(r => new tbl_equipo
            {
                equ_id = r.equ_id,
                equ_nombre = r.equ_nombre
            }).ToList();

            return equipo;
        }

        public void agregar_equipo(string nombre)
        {
            dc.sp_agregar_equipo(nombre);
        }
    }
}
