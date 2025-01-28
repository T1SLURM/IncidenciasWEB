using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_tipo_incidencia
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();

        public List<tbl_tipo_incidencia> cargar_tipos_incdencias()
        {
            var query = dc.sp_cargar_tipos_incidencias().ToList();
            var tipIncidencia = query.Select(r => new tbl_tipo_incidencia
            {
                tip_id = r.tip_id,
                tip_nombre = r.tip_nombre
            }).ToList();

            return tipIncidencia;
        }

        public void agregar_tipo_incidencia(string nombre)
        {
            dc.sp_agregar_tipo_incidencia(nombre);
        }

        public List<tbl_tipo_incidencia> buscar_tipo_incidencia(int id)
        {
            var query = dc.sp_buscar_tipos_incidencia_admin(id).ToList();
            var tipIncidencia = query.Select(r => new tbl_tipo_incidencia
            {
                tip_id = r.tip_id,
                tip_nombre = r.tip_nombre
            }).ToList();

            return tipIncidencia;
        }

        public void editar_tipo_incidencia(string nombre, int id)
        {
            dc.sp_editar_tipos_incidencia_admin(nombre, id);
        }
    }
}
