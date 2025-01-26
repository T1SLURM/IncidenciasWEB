using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_auditoria
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();

        public void registrar_accion_auditoria(string accion, int usuario)
        {
            dc.sp_registrar_accion_auditoria(accion, usuario);
        }



    }
}
