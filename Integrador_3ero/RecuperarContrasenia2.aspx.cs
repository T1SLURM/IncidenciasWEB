using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Integrador_3ero
{
    public partial class RecuperarContrasenia2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_iniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registro.aspx");
        }

        protected void btn_cambiar_pass_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id_recu"]);
            cn_usuario cn_Usuario = new cn_usuario();

            if (txtCodigo.Text != Session["codigo_recu"].ToString())
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "el código es incorrecto";
                txtCodigo.Text = "";
            }
            else if (txtContrasenia.Text == "" || txtContrasenia.Text == null)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "La contraseña esta vacia";
            }
            else if (txtContraseniaV.Text == "" || txtContraseniaV.Text == null)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "La verificación de la contraseña esta vacia";
            }
            else if (txtContrasenia.Text != txtContraseniaV.Text)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "Las contraseñas no coinciden";
            }
            else
            {
                cn_Usuario.cambiar_pass_recu(txtContraseniaV.Text, id);
                lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                lbl_mensaje.Text = "Se cambio su contraseña con exito.";
                Timer1.Enabled = true;
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
        }
    }
}