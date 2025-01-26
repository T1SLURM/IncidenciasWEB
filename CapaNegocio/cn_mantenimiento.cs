using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_mantenimiento
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();

        public List <tbl_mantenimiento> ver_estado_mantenimiento()
        {
            var query = dc.sp_ver_estado_mantemiento().ToList();
            var mantenimiento = query.Select(r => new tbl_mantenimiento
            {
                man_tipo = r.man_tipo
            }).ToList();

            return mantenimiento;
        }

        public void activar_mantenimiento()
        {
            dc.sp_activar_mant();
        }

        public void desactivar_mantenimiento()
        {
            dc.sp_desactivar_mant();
        }
    }
}
