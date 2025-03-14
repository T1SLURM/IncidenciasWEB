using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Integrador_3ero
{
    public partial class paginaUsuario : System.Web.UI.Page
    {
        cn_auditoria cn_Auditoria = new cn_auditoria();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            cn_Auditoria.registrar_accion_auditoria("Cerrar Sesión", id);
            Response.Redirect("~/Home.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }

        protected void btnActualizar_Click1(object sender, EventArgs e)
        {

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {

        }

       

        protected void btnActualizar12_Click(object sender, EventArgs e)
        {

        }
    }
}