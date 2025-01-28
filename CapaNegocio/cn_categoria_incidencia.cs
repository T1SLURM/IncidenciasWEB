using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_categoria_incidencia
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        public List<tbl_categoria_incidencia> cargar_categorias()
        {
            var query = dc.sp_cargar_categorias_incidencias();
            var categorias = query.Select(r => new tbl_categoria_incidencia
            {
                cat_id = r.cat_id,
                cat_nombre = r.cat_nombre
            }).ToList();

            return categorias;
        }

        public void agregar_categoria_incidencia(string nombre)
        {
            dc.sp_agregar_categoria_incidencia(nombre);
        }

        public List<tbl_categoria_incidencia> buscar_categoria_incidencia(int id)
        {
            var query = dc.sp_buscar_categoria_incidencias_admin(id);
            var categorias = query.Select(r => new tbl_categoria_incidencia
            {
                cat_id = r.cat_id,
                cat_nombre = r.cat_nombre
            }).ToList();

            return categorias;
        }

        public void editar_categoria_incidencia(string nombre, int id)
        {
            dc.sp_editar_categoria_incidencias_admin(nombre, id);
        }
    }
}
