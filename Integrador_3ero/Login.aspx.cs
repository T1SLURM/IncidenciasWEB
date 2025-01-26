using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaDatos;

namespace Integrador_3ero
{
    public partial class Login : System.Web.UI.Page
    {
        cn_auditoria cn_Auditoria = new cn_auditoria();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id"] = 0;
            Session["nombre"] = "";
            Session["id_recuperar"] = 0;
            Session["correo_recuperar"] = "";

        }

        public List<tbl_mantenimiento> ver_estado_mantenimiento()
        {
            cn_mantenimiento cn_Mantenimiento = new cn_mantenimiento();
            var mantenimiento = cn_Mantenimiento.ver_estado_mantenimiento();
            return mantenimiento;
        }



        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registro.aspx");
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            cn_usuario cn_Usuarios = new cn_usuario();
            string correo = txtCorreo.Text;
            string pass = txtContrasenia.Text;

            List<tbl_mantenimiento> mantenimiento = ver_estado_mantenimiento();
            tbl_mantenimiento est_mantenimiento = mantenimiento[0];

            if (correo == null || correo == "")
            {
                lbl_mensaje.Text = "El correo esta vacio.";
                return;
            }
            else if (pass == null || pass == "")
            {
                lbl_mensaje.Text = "La contraseña esta vacia";
                return;
            }

            if (cn_Usuarios.verificar_usuario(correo))
            {
                lbl_intentos.Text = "";
                if (cn_Usuarios.verificar_contrasenia(correo, pass))
                {
                    lbl_intentos.Text = "";
                    if (cn_Usuarios.verificar_estado(correo))
                    {
                        lbl_intentos.Text = "";
                        List<tbl_usuario> usuarios = cn_Usuarios.cargar_usuario(correo, pass);
                        tbl_usuario usuario = usuarios[0];
                        if (cn_Usuarios.verificar_perfil(correo) == 1)
                        {
                            Session["id"] = Convert.ToInt32(usuario.usu_id);
                            Session["nombre"] = usuario.usu_nombre;
                            int id = Convert.ToInt32(Session["id"]);
                            cn_Auditoria.registrar_accion_auditoria("Inicio de Sesión", id);
                            limpiar();
                            Response.Redirect("~/paginaAdministrador.aspx");
                        }
                        else if (cn_Usuarios.verificar_perfil(correo) == 2)
                        {
                            if (est_mantenimiento.man_tipo.ToString() == "A")
                            {
                                lbl_mensaje.Text = "El sistema esta en mantenimiento, reintentelo";
                                return;
                            }
                            else
                            {
                                Session["id"] = Convert.ToInt32(usuario.usu_id);
                                Session["nombre"] = usuario.usu_nombre;
                                int id = Convert.ToInt32(Session["id"]);
                                cn_Auditoria.registrar_accion_auditoria("Inicio de Sesión", id);
                                limpiar();
                                Response.Redirect("~/paginaUsuario.aspx");
                            }
                        }
                        else if (cn_Usuarios.verificar_perfil(correo) == 3)
                        {
                            if (est_mantenimiento.man_tipo.ToString() == "A")
                            {
                                lbl_mensaje.Text = "El sistema esta en mantenimiento, reintentelo";
                                return;
                            }
                            else
                            {
                                Session["id"] = Convert.ToInt32(usuario.usu_id);
                                Session["nombre"] = usuario.usu_nombre;
                                int id = Convert.ToInt32(Session["id"]);
                                cn_Auditoria.registrar_accion_auditoria("Inicio de Sesión", id);
                                limpiar();
                                Response.Redirect("~/paginaTecnico.aspx");
                            }
                        }
                    }
                    else
                    {
                        lbl_mensaje.Text = "El usuario esta inactivo o bloqueado";
                    }
                }
                else
                {
                    List<tbl_usuario> usuarios = cn_Usuarios.ver_usuario(correo);
                    tbl_usuario usuario = usuarios[0];
                    if (!cn_Usuarios.verificar_estado(correo))
                    {
                        lbl_mensaje.Text = "El usuario se encuentra bloqueado o inactivo";
                    }
                    else
                    {
                        lbl_intentos.Text = usuario.usu_intento.ToString();
                        lbl_mensaje.Text = "La contraseña es incorrecta. Se le restara un intento.";

                    }
                }
            }
            else
            {
                lbl_intentos.Text = "";
                lbl_mensaje.Text = "El usuario no existe";
            }
        }

        private void limpiar()
        {
            txtCorreo.Text = txtContrasenia.Text = "";
        }
    }
}