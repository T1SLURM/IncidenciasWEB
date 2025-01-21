using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_perfil
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();

        public List<tbl_perfil> cargar_perfil_ddl()
        {
            var query = dc.sp_cargar_perfiles_ddl().ToList();
            var perfiles = query.Select(r => new tbl_perfil
            {
                per_id = r.per_id,
                per_nombre = r.per_nombre
            }).ToList();

            return perfiles;
        }

        public List<tbl_perfil> cargar_perfil()
        {
            var query = dc.sp_cargar_perfiles_ddl().ToList();
            var perfiles = query.Select(r => new tbl_perfil
            {
                per_id = r.per_id,
                per_nombre = r.per_nombre
            }).ToList();

            return perfiles;
        }

        public void agregar_perfil(string nombre)
        {
            dc.sp_agregar_perfil_usuario(nombre);

        }
    }
}
