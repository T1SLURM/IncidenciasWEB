using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Integrador_3ero
{
    public partial class paginaAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblBienvenido.Text = $"Bienvenido {Session["nombre"]}";
            if (!IsPostBack)
            {
                cargar_usuarios();
                cargar_perfiles_ddl();
                cargar_perfiles();
                cargar_estados();
                cargar_tipos_incidencia();
                cargar_equipos();
                cargar_categorias_incidencias();
                cargar_incidencias();
                cargar_estados_incidencia();
            }
            cargar_con_inc_registradas();
            cargar_con_inc_asignada();
            cargar_con_inc_proceso();
            cargar_con_inc_finalizada();
        }

        public void cargar_incidencias()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            var incidencias = cn_Incidencia.cargar_incidencias();
            rptIncidencias.DataSource = incidencias; // Cambia a rptIncidencias
            rptIncidencias.DataBind(); // Enlaza los datos al Repeater
        }

        public void cargar_estados_incidencia()
        {
            cn_estado_incidencia cn_Estado_Incidencia = new cn_estado_incidencia();
            var estInci = cn_Estado_Incidencia.cargar_estados_incidencias();
            grvEstInci.DataSource = estInci;
            grvEstInci.DataBind();
        }

        public void cargar_categorias_incidencias()
        {
            cn_categoria_incidencia cn_Categoria_Incidencia = new cn_categoria_incidencia();
            var catInci = cn_Categoria_Incidencia.cargar_categorias();
            grvCatInci.DataSource = catInci;
            grvCatInci.DataBind();
        }

        public void cargar_equipos()
        {
            cn_equipo cn_Equipo = new cn_equipo();
            var equipos = cn_Equipo.cargar_equipos();
            grvEquipos.DataSource = equipos;
            grvEquipos.DataBind();
        }

        public void cargar_tipos_incidencia()
        {
            cn_tipo_incidencia cn_Tipo_Incidencia = new cn_tipo_incidencia();
            var tipos_inc = cn_Tipo_Incidencia.cargar_tipos_incdencias();
            grvTipoIncidencia.DataSource = tipos_inc;
            grvTipoIncidencia.DataBind();
        }

        public void cargar_estados()
        {
            cn_estado_usuario cn_Estado_Usuario = new cn_estado_usuario();
            var estados = cn_Estado_Usuario.cargar_estados();
            grvEstadosUsuarios.DataSource = estados;
            grvEstadosUsuarios.DataBind();

        }

        public void cargar_perfiles()
        {
            cn_perfil cn_Perfil = new cn_perfil();
            var pefiles = cn_Perfil.cargar_perfil();
            grvPerfiles.DataSource = pefiles;
            grvPerfiles.DataBind();
        }

        public void cargar_perfiles_ddl()
        {
            cn_perfil cn_Perfil = new cn_perfil();
            ddlPerfil.DataSource = cn_Perfil.cargar_perfil_ddl();
            ddlPerfil.DataTextField = "per_nombre";
            ddlPerfil.DataValueField = "per_id";
            ddlPerfil.DataBind();
            ddlPerfil.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
        public void cargar_usuarios()
        {
            cn_usuario cn_Usuario = new cn_usuario();
            var usuarios = cn_Usuario.cargar_usuarios();

            gvUsuarios.DataSource = usuarios;
            gvUsuarios.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Agregar_Tipo_Incidencia_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Agregar_Perfil_Click(object sender, EventArgs e)
        {
            cn_perfil cn_Perfil = new cn_perfil();
            lbl_mensajeP.Text = "";
            if (txtNombrePerfil.Text.Length > 50)
            {
                lbl_mensajeP.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeP.Text = "El nombre es muy largo";
            }
            else if (txtNombrePerfil.Text == null || txtNombrePerfil.Text == "")
            {
                lbl_mensajeP.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeP.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Perfil.agregar_perfil(txtNombrePerfil.Text);
                lbl_mensajeP.ForeColor = System.Drawing.Color.Green;
                lbl_mensajeP.Text = "Se registro correctamente el perfil para el usuario";
                txtNombrePerfil.Text = "";
                cargar_perfiles();
            }
        }

        protected void btn_agregar_estado_usuario_Click(object sender, EventArgs e)
        {
            cn_estado_usuario cn_Estado_Usuario = new cn_estado_usuario();
            lbl_mensaje.Text = "";
            if (txtNombreEstado.Text.Length > 50)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "El nombre es muy largo";
            }
            else if (txtNombreEstado.Text == null || txtNombreEstado.Text == "")
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Estado_Usuario.agregar_estado_usuario(txtNombreEstado.Text);
                lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                lbl_mensaje.Text = "Se registro correctamente el estado para el usuario";
                txtNombreEstado.Text = "";
                cargar_estados();
            }
        }

        protected void btn_agregar_tipo_incidencia_Click1(object sender, EventArgs e)
        {
            cn_tipo_incidencia cn_Tipo_Incidencia = new cn_tipo_incidencia();
            lbl_mensajeTI.Text = "";
            if (txtTipodeIncidencia.Text.Length > 50)
            {
                lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeTI.Text = "El nombre es muy largo";
            }
            else if (txtTipodeIncidencia.Text == null || txtTipodeIncidencia.Text == "")
            {
                lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeTI.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Tipo_Incidencia.agregar_tipo_incidencia(txtTipodeIncidencia.Text);
                lbl_mensajeTI.ForeColor = System.Drawing.Color.Green;
                lbl_mensajeTI.Text = "Se registro correctamente el tipo de incidente";
                txtTipodeIncidencia.Text = "";
                cargar_tipos_incidencia();
            }
        }

        protected void btn_agregar_equipo_Click(object sender, EventArgs e)
        {
            cn_equipo cn_Equipo = new cn_equipo();
            lbl_mensajeE.Text = "";

            if (txtNombreEquipo.Text.Length > 50)
            {
                lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeE.Text = "El nombre es muy largo";
            }
            else if (txtNombreEquipo.Text == null || txtNombreEquipo.Text == "")
            {
                lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeE.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Equipo.agregar_equipo(txtNombreEquipo.Text);
                lbl_mensajeE.ForeColor = System.Drawing.Color.Green;
                lbl_mensajeE.Text = "Se registro correctamente el equipo";
                txtNombreEquipo.Text = "";
                cargar_equipos();
            }

        }

        protected void btn_agregar_catInci_Click(object sender, EventArgs e)
        {
            cn_categoria_incidencia cn_Categoria_Incidencia = new cn_categoria_incidencia();
            lbl_mensajeCI.Text = "";
            if (txtNombreCatInci.Text.Length > 50)
            {
                lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeCI.Text = "El nombre es muy largo";
            }
            else if (txtNombreCatInci.Text == null || txtNombreCatInci.Text == "")
            {
                lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeCI.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Categoria_Incidencia.agregar_categoria_incidencia(txtNombreCatInci.Text);
                lbl_mensajeCI.ForeColor = System.Drawing.Color.Green;
                lbl_mensajeCI.Text = "Se registro correctamente la categoria de la incidencia";
                txtNombreCatInci.Text = "";
                cargar_categorias_incidencias();
            }
        }

        protected void btn_agregar_estadoInci_Click(object sender, EventArgs e)
        {
            cn_estado_incidencia cn_Estado_Incidencia = new cn_estado_incidencia();
            lbl_mensajeEI.Text = "";
            if (txtNombreEstInci.Text.Length > 50)
            {
                lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeEI.Text = "El nombre es muy largo";
            }
            else if (txtNombreEstInci.Text == null || txtNombreEstInci.Text == "")
            {
                lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                lbl_mensajeEI.Text = "El nombre esta vacio";
            }
            else
            {
                cn_Estado_Incidencia.agregar_estado_incidencia(txtNombreEstInci.Text);
                lbl_mensajeEI.ForeColor = System.Drawing.Color.Green;
                lbl_mensajeEI.Text = "Se registro correctamente el estado de la incidencia";
                txtNombreEstInci.Text = "";
                cargar_estados_incidencia();
            }
        }

        protected void btn_agregar_incidencia_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");

        }

        public void cargar_con_inc_registradas()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            string num = cn_Incidencia.con_incidecnias_registradas().ToString();
            lbl_inc_registradas.Text = num;
        }

        public void cargar_con_inc_asignada()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            string num = cn_Incidencia.con_incidecnias_asignadas().ToString();
            lbl_inc_asignadas.Text = num;
        }

        public void cargar_con_inc_proceso()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            string num = cn_Incidencia.con_incidecnias_proceso().ToString();
            lbl_inc_proceso.Text = num;
        }

        public void cargar_con_inc_finalizada()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            string num = cn_Incidencia.con_incidecnias_finalizadas().ToString();
            lbl_inc_finalizadas.Text = num;
        }

        //tablas elementos
        protected void gvUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Obtén el valor del estado del usuario
                string estado = DataBinder.Eval(e.Row.DataItem, "estado").ToString();

                // Encuentra los botones en la fila actual
                Button btnEditar = (Button)e.Row.FindControl("btnEditar_usuario");
                Button btnEliminar = (Button)e.Row.FindControl("btnEliminar_usuario");
                Button btnActivar = (Button)e.Row.FindControl("btnActivar_usuario");

                // Habilitar o deshabilitar los botones según el estado
                if (estado == "Inactivo")
                {
                    btnEditar.Enabled = true;
                    btnEliminar.Enabled = false;
                    btnActivar.Enabled = true;
                }
                else if (estado == "Activo")
                {
                    btnEditar.Enabled = true;
                    btnEliminar.Enabled = true;
                    btnActivar.Enabled = false;
                }
            }
        }

        protected void btnEliminar_usuario_Click1(object sender, EventArgs e)
        {
            cn_usuario cn_Usuario = new cn_usuario();

            Button btn = (Button)sender;
            string usu_id = btn.CommandArgument;
            int id = Convert.ToInt32(usu_id);

            try
            {
                cn_Usuario.eliminar_logico_usuario(id);
                cargar_usuarios();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAgregarInci_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);
        }
    }
}