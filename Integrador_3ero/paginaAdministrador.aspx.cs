using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;

namespace Integrador_3ero
{
    public partial class paginaAdministrador : System.Web.UI.Page
    {
        cn_auditoria cn_Auditoria = new cn_auditoria();
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
                mantenimiento();
                cargar_tecnicos();
                cargar_incidencias_asignadas();
                cargar_incidencias_resueltas();
                cargar_usuarios_incidencias_ddl();
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

        public void cargar_incidencias_asignadas()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            var incidencias_asignadas = cn_Incidencia.cargar_incidencias_asignadas_admin();
            rptIncidenciasAsignadas.DataSource = incidencias_asignadas;
            rptIncidenciasAsignadas.DataBind();
        }

        public void cargar_incidencias_resueltas()
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            var incidencias_asignadas = cn_Incidencia.cargar_incidencias_resueltas_admin();
            rptIncidenciasResueltas.DataSource = incidencias_asignadas;
            rptIncidenciasResueltas.DataBind();
        }


        public List<tbl_mantenimiento> ver_estado_mantenimiento()
        {
            cn_mantenimiento cn_Mantenimiento = new cn_mantenimiento();
            var mantenimiento = cn_Mantenimiento.ver_estado_mantenimiento();
            return mantenimiento;
        }

        public void mantenimiento()
        {
            var mantenimientoList = ver_estado_mantenimiento();
            string man = mantenimientoList[0].man_tipo.ToString();
            if (man == "I")
            {
                btn_mantenimiento.CssClass = "mi-boton";
                btn_mantenimiento.Text = "Activar Mantenimiento";

            }
            else if (man == "A")
            {
                btn_mantenimiento.CssClass = "mi-boton-exito";
                btn_mantenimiento.Text = "Desactivar Mantenimiento";

            }
        }

        protected void btn_mantenimiento_Click(object sender, EventArgs e)
        {
            cn_mantenimiento cn_Mantenimiento = new cn_mantenimiento();
            if (btn_mantenimiento.Text == "Activar Mantenimiento")
            {
                int id = Convert.ToInt32(Session["id"]);
                cn_Mantenimiento.activar_mantenimiento();
                cn_Auditoria.registrar_accion_auditoria("Activación de Mantenimiento", id);
                mantenimiento();
            }
            else if (btn_mantenimiento.Text == "Desactivar Mantenimiento")
            {
                int id = Convert.ToInt32(Session["id"]);
                cn_Mantenimiento.desactivar_mantenimiento();
                cn_Auditoria.registrar_accion_auditoria("Desactivación de Mantenimiento", id);
                mantenimiento();
            }
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

            ddlCategoriaIncidencia.DataSource = cn_Categoria_Incidencia.cargar_categorias();
            ddlCategoriaIncidencia.DataTextField = "cat_nombre";
            ddlCategoriaIncidencia.DataValueField = "cat_id";
            ddlCategoriaIncidencia.DataBind();
            ddlCategoriaIncidencia.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        public void cargar_equipos()
        {
            cn_equipo cn_Equipo = new cn_equipo();
            var equipos = cn_Equipo.cargar_equipos();
            grvEquipos.DataSource = equipos;
            grvEquipos.DataBind();

            ddlEquipoIncidencia.DataSource = cn_Equipo.cargar_equipos();
            ddlEquipoIncidencia.DataTextField = "equ_nombre";
            ddlEquipoIncidencia.DataValueField = "equ_id";
            ddlEquipoIncidencia.DataBind();
            ddlEquipoIncidencia.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        public void cargar_tipos_incidencia()
        {
            cn_tipo_incidencia cn_Tipo_Incidencia = new cn_tipo_incidencia();
            var tipos_inc = cn_Tipo_Incidencia.cargar_tipos_incdencias();
            grvTipoIncidencia.DataSource = tipos_inc;
            grvTipoIncidencia.DataBind();

            ddlTipoIncidencia.DataSource = cn_Tipo_Incidencia.cargar_tipos_incdencias();
            ddlTipoIncidencia.DataTextField = "tip_nombre";
            ddlTipoIncidencia.DataValueField = "tip_id";
            ddlTipoIncidencia.DataBind();
            ddlTipoIncidencia.Items.Insert(0, new ListItem("Seleccione", "0"));
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

        public void cargar_usuarios_incidencias_ddl()
        {

            cn_usuario cn_Usuario = new cn_usuario();
            ddlUsuarioIncidencia.DataSource = cn_Usuario.cargar_usuarios_incidencias();
            ddlUsuarioIncidencia.DataTextField = "usu_nombre";
            ddlUsuarioIncidencia.DataValueField = "usu_id";
            ddlUsuarioIncidencia.DataBind();
            ddlUsuarioIncidencia.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        public void cargar_tecnicos()
        {
            cn_usuario cn_Usuario = new cn_usuario();
            var tecnicos = cn_Usuario.cargar_tecnicos();
            ddlTecnicos.DataSource = tecnicos;
            ddlTecnicos.DataTextField = "usu_nombre";
            ddlTecnicos.DataValueField = "usu_id";
            ddlTecnicos.DataBind();
            ddlTecnicos.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_UsuarioClick(object sender, EventArgs e)
        {
            cn_usuario cn_Usuario = new cn_usuario();

            if (btnEnviar.Text == "Editar")
            {
                int id = Convert.ToInt32(id_usuario.Text);
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                string correo = txtCorreo.Text;
                DateTime fecha = Convert.ToDateTime(txtFecha.Text.Trim());
                int perfil = Convert.ToInt32(ddlPerfil.SelectedValue);

                if (id <= 0)
                {
                    lbl_mensaje_usuario.Text = "No se ha seleccionado ningun usuario";
                    return;
                }
                else if (nombre == "" || nombre == null)
                {
                    lbl_mensaje_usuario.Text = "El nombre esta vacio";
                    return;
                }
                else if (nombre.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El nombre es muy largo, debe ser de máximo 50 caracteres.";
                    return;

                }
                else if (apellido == "" || apellido == null)
                {
                    lbl_mensaje_usuario.Text = "El apellido esta vacio.";
                    return;
                }
                else if (apellido.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El apellido es muy largo, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (correo == "" || correo == null)
                {
                    lbl_mensaje_usuario.Text = "El correo esta vacio.";
                    return;
                }
                else if (correo.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El correo es muy largo, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (string.IsNullOrEmpty(txtFecha.Text))
                {
                    lbl_mensaje_usuario.Text = "La fecha esta vacia";
                    return;
                }
                else if (perfil <= 0)
                {
                    lbl_mensaje_usuario.Text = "El perfil esta vacio esta vacia";
                    return;
                }
                else
                {
                    cn_Usuario.editar_usuario(id, nombre, apellido, correo, fecha, perfil);
                    lbl_mensaje.Text = "Se agrego el usuario correctamente";
                    cargar_usuarios();
                    id_usuario.Text = null;
                    limpiar_usuarios();
                }

            }
            else if (btnEnviar.Text == "Agregar")
            {
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                string correo = txtCorreo.Text;
                DateTime fecha = Convert.ToDateTime(txtFecha.Text.Trim());
                string pass = txtContrasenia.Text;
                string passV = txtContraseniaV.Text;
                string cedula = txtCedula.Text;
                int perfil = Convert.ToInt32(ddlPerfil.SelectedValue);


                if (nombre == "" || nombre == null)
                {
                    lbl_mensaje_usuario.Text = "El nombre esta vacio";
                    return;
                }
                else if (nombre.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El nombre es muy largo, debe ser de máximo 50 caracteres.";
                    return;

                }
                else if (apellido == "" || apellido == null)
                {
                    lbl_mensaje_usuario.Text = "El apellido esta vacio.";
                    return;
                }
                else if (apellido.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El apellido es muy largo, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (correo == "" || correo == null)
                {
                    lbl_mensaje_usuario.Text = "El correo esta vacio.";
                    return;
                }
                else if (correo.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El correo es muy largo, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (string.IsNullOrEmpty(txtFecha.Text))
                {
                    lbl_mensaje_usuario.Text = "La fecha esta vacia";
                    return;
                }
                else if (perfil <= 0)
                {
                    lbl_mensaje_usuario.Text = "El perfil esta vacio.";
                    return;
                }
                else if (correo == "" || correo == null)
                {
                    lbl_mensaje_usuario.Text = "El correo no esta vacio.";
                    return;
                }
                else if (correo_disponible(correo) == false)
                {
                    lbl_mensaje_usuario.Text = "El correo no esta disponible.";
                    return;
                }
                else if (correo.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "El correo es muy largo, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (pass.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "La contraseña es muy larga, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (txtContrasenia.Text == "" || txtContrasenia == null)
                {
                    lbl_mensaje_usuario.Text = "La contraseña esta vacia.";
                    return;
                }
                else if (passV.Length > 50)
                {
                    lbl_mensaje_usuario.Text = "La verificacion de la contraseña es muy larga, debe ser de máximo 50 caracteres.";
                    return;
                }
                else if (txtContraseniaV.Text == "" || txtContraseniaV.Text == null)
                {
                    lbl_mensaje_usuario.Text = "La verificacion de la contraseña esta vacia.";
                    return;
                }
                else if (pass != passV)
                {
                    lbl_mensaje_usuario.Text = "Las contraseñas no coinciden";
                    return;
                }
                else if (cedula.Length > 10)
                {
                    lbl_mensaje_usuario.Text = "La cédula esta erronea debe tener 10 digitos.";
                    return;
                }
                else if (cedula_disponible(cedula) == false)
                {
                    lbl_mensaje_usuario.Text = "La cédula no está disponible";
                    return;
                }
                else if (validar_cedula(cedula) == false)
                {
                    lbl_mensaje_usuario.Text = "La cédula esta erronea.";
                    return;
                }
                else
                {
                    cn_Usuario.agregar_usuario_admin(nombre, apellido, correo, fecha, cedula, passV, perfil);
                    lbl_mensaje_usuario.Text = "Se agrego correctamente el usuario";
                    cargar_usuarios();
                    limpiar_usuarios();
                }
            }
        }

        public bool validar_cedula(string cedula)
        {
            // Validar longitud de 10 dígitos
            if (cedula.Length != 10 || !long.TryParse(cedula, out _))
                return false;

            // Obtener los dígitos de la cédula
            int provincia = int.Parse(cedula.Substring(0, 2));
            int digitoVerificador = int.Parse(cedula.Substring(9, 1));
            int suma = 0;

            // Verificar provincia válida (primer dígito 0-2 y segundo 0-4)
            if (provincia < 0 || provincia > 24)
                return false;

            for (int i = 0; i < 9; i++)
            {
                int digito = int.Parse(cedula[i].ToString());

                // Multiplicar por 2 o por 1 dependiendo de la posición
                int resultado = (i % 2 == 0) ? digito * 2 : digito;

                // Si el resultado es mayor que 9, restarle 9
                if (resultado > 9)
                    resultado -= 9;

                // Acumular la suma
                suma += resultado;
            }

            // Calcular el dígito verificador esperado
            int digitoEsperado = (suma % 10 == 0) ? 0 : 10 - (suma % 10);

            // Validar el dígito verificador
            return digitoVerificador == digitoEsperado;
        }

        public bool correo_disponible(String correo)
        {
            cn_usuario cn_Usuarios = new cn_usuario();
            List<string> correos = cn_Usuarios.cargar_correos();

            foreach (string correoExistente in correos)
            {
                // Comprobamos si el correo existe en la lista
                if (correoExistente.Equals(correo, StringComparison.OrdinalIgnoreCase))
                {
                    return false; // El correo ya está en la lista
                }
            }
            return true;
        }

        public bool cedula_disponible(string cedula)
        {
            cn_usuario cn_Usuarios = new cn_usuario();
            List<string> cedulas = cn_Usuarios.cargar_cedulas();
            foreach (string cedulaExistente in cedulas)
            {
                // Comprobamos si la cedula existe en la lista
                if (cedulaExistente.Equals(cedula, StringComparison.OrdinalIgnoreCase))
                {
                    return false; // la cedula ya está en la lista
                }
            }
            return true;
        }

        protected void btn_Agregar_Tipo_Incidencia_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Agregar_Perfil_Click(object sender, EventArgs e)
        {
            cn_perfil cn_Perfil = new cn_perfil();
            lbl_mensajePerfil.Text = "";
            if (btn_Agregar_Perfil.Text == "Agregar")
            {
                if (txtNombrePerfil.Text.Length > 50)
                {
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajePerfil.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombrePerfil.Text == null || txtNombrePerfil.Text == "")
                {
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajePerfil.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Perfil.agregar_perfil(txtNombrePerfil.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Registro de Nuevo Perfil de Usuario", id);
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajePerfil.Text = "Se registro correctamente el perfil para el usuario";
                    txtNombrePerfil.Text = "";
                    cargar_perfiles();
                }
            }
            else if (btn_Agregar_Perfil.Text == "Editar")
            {
                if (txtNombrePerfil.Text.Length > 50)
                {
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajePerfil.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombrePerfil.Text == null || txtNombrePerfil.Text == "")
                {
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajePerfil.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de Perfil de Usuario", id);


                    int per_id = Convert.ToInt32(id_perfil.Text);

                    cn_Perfil.editar_perfil(txtNombrePerfil.Text, per_id);
                    lbl_mensajePerfil.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajePerfil.Text = "Se editó correctamente el perfil para el usuario";
                    txtNombrePerfil.Text = null;
                    id_perfil.Text = null;
                    btnLimpiarPerfil.Enabled = false;
                    cargar_perfiles();
                }
            }
        }

        protected void btn_agregar_estado_usuario_Click(object sender, EventArgs e)
        {
            cn_estado_usuario cn_Estado_Usuario = new cn_estado_usuario();
            lbl_mensaje.Text = "";
            if (btn_agregar_estado_usuario.Text == "Agregar")
            {
                if (txtNombreEstado.Text.Length > 50)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEstado.Text == null || txtNombreEstado.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Estado_Usuario.agregar_estado_usuario(txtNombreEstado.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Registro de Nuevo Estado de Usuario", id);
                    lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                    lbl_mensaje.Text = "Se registro correctamente el estado para el usuario";
                    txtNombreEstado.Text = "";
                    cargar_estados();
                }
            }
            else if (btn_agregar_estado_usuario.Text == "Editar")
            {
                if (txtNombreEstado.Text.Length > 50)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEstado.Text == null || txtNombreEstado.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de Estado de Usuario", id);

                    int est_id = Convert.ToInt32(id_estado.Text);
                    string nombre = txtNombreEstado.Text;

                    cn_Estado_Usuario.editar_estado_usuario(nombre, est_id);
                    cargar_estados();
                    lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                    lbl_mensaje.Text = "Se editó correctamente el estado para el usuario";
                    txtNombreEstado.Text = null;
                    id_estado.Text = null;
                    btn_limpiarEstado.Enabled = false;
                    btn_agregar_estado_usuario.Text = "Agregar";
                }
            }
        }

        protected void btn_agregar_tipo_incidencia_Click1(object sender, EventArgs e)
        {
            cn_tipo_incidencia cn_Tipo_Incidencia = new cn_tipo_incidencia();
            lbl_mensajeTI.Text = "";
            if (btn_agregar_tipo_incidencia.Text == "Agregar")
            {
                if (txtTipodeIncidencia.Text.Length > 50)
                {
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeTI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtTipodeIncidencia.Text == null || txtTipodeIncidencia.Text == "")
                {
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeTI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Tipo_Incidencia.agregar_tipo_incidencia(txtTipodeIncidencia.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Registro de Nueva Incidencia", id);
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeTI.Text = "Se registro correctamente el tipo de incidente";
                    txtTipodeIncidencia.Text = "";
                    cargar_tipos_incidencia();
                }
            }
            else if (btn_agregar_tipo_incidencia.Text == "Editar")
            {
                if (txtTipodeIncidencia.Text.Length > 50)
                {
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeTI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtTipodeIncidencia.Text == null || txtTipodeIncidencia.Text == "")
                {
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeTI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de una Incidencia", id);

                    int tip_id = Convert.ToInt32(id_tipo_incidencia.Text);
                    string nombre = txtTipodeIncidencia.Text;
                    cn_Tipo_Incidencia.editar_tipo_incidencia(nombre, tip_id);
                    cargar_tipos_incidencia();
                    lbl_mensajeTI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeTI.Text = "Se editó correctamente el tipo de incidente";
                    txtTipodeIncidencia.Text = null;
                    id_tipo_incidencia.Text = null;
                    btnLimpiar_tipos_incidencias.Enabled = false;
                    btn_agregar_tipo_incidencia.Text = "Agregar";

                }
            }
        }

        protected void btn_agregar_equipo_Click(object sender, EventArgs e)
        {
            cn_equipo cn_Equipo = new cn_equipo();
            lbl_mensajeE.Text = "";

            if (btn_agregar_equipo.Text == "Agregar")
            {
                if (txtNombreEquipo.Text.Length > 50)
                {
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeE.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEquipo.Text == null || txtNombreEquipo.Text == "")
                {
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeE.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Equipo.agregar_equipo(txtNombreEquipo.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Se agregó un nuevo equipo", id);
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeE.Text = "Se registro correctamente el equipo";
                    txtNombreEquipo.Text = "";
                    cargar_equipos();
                }
            }
            else if (btn_agregar_equipo.Text == "Editar")
            {
                if (txtNombreEquipo.Text.Length > 50)
                {
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeE.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEquipo.Text == null || txtNombreEquipo.Text == "")
                {
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeE.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de un equipo", id);
                    int equ_id = Convert.ToInt32(id_equipo.Text);
                    string nombre = txtNombreEquipo.Text;
                    cn_Equipo.editar_equipo(nombre, equ_id);
                    cargar_equipos();
                    lbl_mensajeE.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeE.Text = "Se editó correctamente el equipo";
                    txtNombreEquipo.Text = null;
                    id_equipo.Text = null;
                    btn_limpiar_equipo.Enabled = false;
                    btn_agregar_equipo.Text = "Agregar";
                }
            }

        }

        protected void btn_agregar_catInci_Click(object sender, EventArgs e)
        {
            cn_categoria_incidencia cn_Categoria_Incidencia = new cn_categoria_incidencia();
            lbl_mensajeCI.Text = "";
            if (btn_agregar_catInci.Text == "Agregar")
            {
                if (txtNombreCatInci.Text.Length > 50)
                {
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeCI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreCatInci.Text == null || txtNombreCatInci.Text == "")
                {
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeCI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Categoria_Incidencia.agregar_categoria_incidencia(txtNombreCatInci.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Registro de Nueva Categoria de Incidentes", id);
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeCI.Text = "Se registro correctamente la categoria de la incidencia";
                    txtNombreCatInci.Text = "";
                    cargar_categorias_incidencias();
                }
            }
            else if (btn_agregar_catInci.Text == "Editar")
            {
                if (txtNombreCatInci.Text.Length > 50)
                {
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeCI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreCatInci.Text == null || txtNombreCatInci.Text == "")
                {
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeCI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de Categoria de Incidentes", id);

                    int cat_id = Convert.ToInt32(id_categoria_inci.Text);
                    string nombre = txtNombreCatInci.Text;
                    cn_Categoria_Incidencia.editar_categoria_incidencia(nombre, cat_id);
                    cargar_categorias_incidencias();
                    lbl_mensajeCI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeCI.Text = "Se editó correctamente la categoria de la incidencia";
                    txtNombreCatInci.Text = null;
                    id_categoria_inci.Text = null;
                    btnLimpiar_categoria_incidencia.Enabled = false;
                    btn_agregar_catInci.Text = "Agregar";


                }
            }
        }

        protected void btn_agregar_estadoInci_Click(object sender, EventArgs e)
        {
            cn_estado_incidencia cn_Estado_Incidencia = new cn_estado_incidencia();
            lbl_mensajeEI.Text = "";
            if (btn_agregar_estadoInci.Text == "Agregar")
            {
                if (txtNombreEstInci.Text.Length > 50)
                {
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeEI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEstInci.Text == null || txtNombreEstInci.Text == "")
                {
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeEI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    cn_Estado_Incidencia.agregar_estado_incidencia(txtNombreEstInci.Text);
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Registro de Nuevo Estado de Incidencias", id);
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeEI.Text = "Se registro correctamente el estado de la incidencia";
                    txtNombreEstInci.Text = "";
                    cargar_estados_incidencia();
                }
            }
            else if (btn_agregar_estadoInci.Text == "Editar")
            {
                if (txtNombreEstInci.Text.Length > 50)
                {
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeEI.Text = "El nombre es muy largo";
                    return;
                }
                else if (txtNombreEstInci.Text == null || txtNombreEstInci.Text == "")
                {
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Red;
                    lbl_mensajeEI.Text = "El nombre esta vacio";
                    return;
                }
                else
                {
                    int id = Convert.ToInt32(Session["id"]);
                    cn_Auditoria.registrar_accion_auditoria("Edición de Estado de Incidencias", id);
                    int id_estado_incidencia = Convert.ToInt32(id_est_inci.Text);
                    string nombre = txtNombreEstInci.Text;
                    cn_Estado_Incidencia.editar_estado_incidencia(nombre, id_estado_incidencia);
                    cargar_estados_incidencia();
                    lbl_mensajeEI.ForeColor = System.Drawing.Color.Green;
                    lbl_mensajeEI.Text = "Se editó correctamente el estado de la incidencia";
                    txtNombreEstInci.Text = null;
                    id_est_inci.Text = null;
                    btnLimpiar_estados_inci.Enabled = false;
                    btn_agregar_estadoInci.Text = "Agregar";


                }
            }
        }

        protected void btn_agregar_incidencia_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            cn_Auditoria.registrar_accion_auditoria("Cerrar Sesión", id);
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
                Button btnEditar = (Button)e.Row.FindControl("btnSeleccionar_usuario");
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
                cn_Auditoria.registrar_accion_auditoria("Eliminación de Usuario", id);
                cargar_usuarios();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAgregarInci_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#ModalAgregar').modal('show');", true);
        }

        protected void btnActivar_usuario_Click(object sender, EventArgs e)
        {
            cn_usuario cn_Usuario = new cn_usuario();
            Button btn = (Button)sender;
            string usu_id = btn.CommandArgument;
            int id = Convert.ToInt32(usu_id);

            try
            {
                cn_Auditoria.registrar_accion_auditoria("Activación de Usuario", id);
                cn_Usuario.desbloquear_usuario(id);
                cargar_usuarios();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnSeleccionar_usuario_Click(object sender, EventArgs e)
        {

            txtNombre.Text = null;
            txtApellido.Text = null;
            txtCorreo.Text = null;
            txtFecha.Text = null;
            txtCedula.Text = null;
            txtContrasenia.Text = null;
            txtContraseniaV.Text = null;
            ddlPerfil.SelectedValue = "0";
            cn_usuario cn_Usuario = new cn_usuario();
            Button btn = (Button)sender;
            string usu_id = btn.CommandArgument;
            int id = Convert.ToInt32(usu_id);
            var usuarios = cn_Usuario.buscar_usuario_admin(id);
            List<tbl_usuario> usu = new List<tbl_usuario>();
            usu = usuarios;

            id_usuario.Text = usu[0].usu_id.ToString();
            txtNombre.Text = usu[0].usu_nombre.ToString();
            txtApellido.Text = usu[0].usu_apellido.ToString();
            txtCorreo.Text = usu[0].usu_correo.ToString();
            txtFecha.Text = usu[0].usu_fecha_nacimiento.ToString();
            if (usu[0].usu_fecha_nacimiento.HasValue)
            {
                // Asigna la fecha en el formato correcto (yyyy-MM-dd)
                txtFecha.Text = usu[0].usu_fecha_nacimiento.Value.ToString("yyyy-MM-dd");
            }
            else
            {
                // Si la fecha es nula, puedes dejar el campo vacío o asignar un valor por defecto
                txtFecha.Text = string.Empty;  // O asigna una fecha predeterminada si lo prefieres
            }
            ddlPerfil.SelectedValue = usu[0].per_id.ToString();
            btnEnviar.Text = "Editar";
            txtContrasenia.Enabled = false;
            txtContraseniaV.Enabled = false;
            txtCedula.Enabled = false;
            btnLimpiar_usuario.Enabled = true;
        }

        protected void btnLimpiar_usuario_Click(object sender, EventArgs e)
        {
            txtNombre.Text = null;
            txtNombre.Enabled = true;

            txtApellido.Text = null;
            txtApellido.Enabled = true;

            txtCorreo.Text = null;
            txtCorreo.Enabled = true;

            txtFecha.Text = null;
            txtFecha.Enabled = true;

            txtCedula.Text = null;
            txtCedula.Enabled = true;

            txtContrasenia.Text = null;
            txtContrasenia.Enabled = true;

            txtContraseniaV.Text = null;
            txtContraseniaV.Enabled = true;

            id_usuario.Text = null;

            ddlPerfil.SelectedValue = "0";
            btnEnviar.Text = "Agregar";
            btnLimpiar_usuario.Enabled = false;
        }

        public void limpiar_usuarios()
        {
            txtNombre.Text = txtApellido.Text = txtCedula.Text = txtCorreo.Text = txtFecha.Text = txtContrasenia.Text = txtContraseniaV.Text = null;
        }

        protected void btnEditarPerfil_Click(object sender, EventArgs e)
        {
            cn_perfil cn_Perfil = new cn_perfil();
            txtNombrePerfil.Text = null;
            btn_Agregar_Perfil.Text = "Editar";
            Button btn = (Button)sender;
            string usu_id = btn.CommandArgument;
            int id = Convert.ToInt32(usu_id);
            var perfiles = cn_Perfil.buscar_perfil_admin(id);
            List<tbl_perfil> per = new List<tbl_perfil>();
            per = perfiles;
            id_perfil.Text = per[0].per_id.ToString();
            txtNombrePerfil.Text = per[0].per_nombre.ToString();
            btnLimpiarPerfil.Enabled = true;
        }

        protected void btnLimpiarPerfil_Click(object sender, EventArgs e)
        {
            txtNombrePerfil.Text = null;
            btn_Agregar_Perfil.Text = "Agregar";
            id_perfil.Text = null;
            btnLimpiarPerfil.Enabled = false;
        }

        protected void btn_limpiarEstado_Click(object sender, EventArgs e)
        {
            txtNombreEstado.Text = null;
            btn_agregar_estado_usuario.Text = "Agregar";
            id_estado.Text = null;
            btn_limpiarEstado.Enabled = false;
        }

        protected void btnEditarEstado_Click(object sender, EventArgs e)
        {
            cn_estado_usuario cn_Estado_Usuario = new cn_estado_usuario();
            txtNombreEstado.Text = null;
            btn_agregar_estado_usuario.Text = "Editar";
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int est_id = Convert.ToInt32(id);
            var estados = cn_Estado_Usuario.buscar_estado_usuario(est_id);
            List<tbl_estado> est = new List<tbl_estado>();
            est = estados;
            id_estado.Text = est[0].est_id.ToString();
            txtNombreEstado.Text = est[0].est_nombre.ToString();
            btn_limpiarEstado.Enabled = true;


        }

        protected void btnLimpiar_tipos_incidencias_Click(object sender, EventArgs e)
        {
            txtTipodeIncidencia.Text = null;
            btn_agregar_tipo_incidencia.Text = "Aagregar";
            id_tipo_incidencia.Text = null;
            btnLimpiar_tipos_incidencias.Enabled = false;
        }

        protected void btnEditarTipoIncidencia_Click(object sender, EventArgs e)
        {
            cn_tipo_incidencia cn_Tipo_Incidencia = new cn_tipo_incidencia();
            txtTipodeIncidencia.Text = null;
            btn_agregar_tipo_incidencia.Text = "Editar";
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int tip_id = Convert.ToInt32(id);
            var tipos = cn_Tipo_Incidencia.buscar_tipo_incidencia(tip_id);
            List<tbl_tipo_incidencia> tip = new List<tbl_tipo_incidencia>();
            tip = tipos;
            id_tipo_incidencia.Text = tip[0].tip_id.ToString();
            txtTipodeIncidencia.Text = tip[0].tip_nombre.ToString();
            btnLimpiar_tipos_incidencias.Enabled = true;

        }

        protected void btn_limpiar_equipo_Click(object sender, EventArgs e)
        {
            txtNombreEquipo.Text = null;
            btn_agregar_equipo.Text = "Agregar";
            id_equipo.Text = null;
            btn_limpiar_equipo.Enabled = false;
        }

        protected void btnEditarEquipo_Click(object sender, EventArgs e)
        {
            cn_equipo cn_Equipo = new cn_equipo();
            txtNombreEquipo.Text = null;
            btn_agregar_equipo.Text = "Editar";
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int equ_id = Convert.ToInt32(id);
            var equipos = cn_Equipo.buscar_equipo(equ_id);
            List<tbl_equipo> equ = new List<tbl_equipo>();
            equ = equipos;
            id_equipo.Text = equ[0].equ_id.ToString();
            txtNombreEquipo.Text = equ[0].equ_nombre.ToString();
            btn_limpiar_equipo.Enabled = true;

        }

        protected void btnEditarCatInci_Click(object sender, EventArgs e)
        {
            cn_categoria_incidencia cn_Categoria_Incidencia = new cn_categoria_incidencia();
            txtNombreCatInci.Text = null;
            btn_agregar_catInci.Text = "Editar";
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int cat_id = Convert.ToInt32(id);
            var categorias = cn_Categoria_Incidencia.buscar_categoria_incidencia(cat_id);
            List<tbl_categoria_incidencia> cat = new List<tbl_categoria_incidencia>();
            cat = categorias;
            id_categoria_inci.Text = cat[0].cat_id.ToString();
            txtNombreCatInci.Text = cat[0].cat_nombre.ToString();
            btnLimpiar_categoria_incidencia.Enabled = true;
        }

        protected void btnLimpiar_categoria_incidencia_Click(object sender, EventArgs e)
        {
            txtNombreCatInci.Text = null;
            btn_agregar_catInci.Text = "Agregar";
            id_categoria_inci.Text = null;
            btnLimpiar_categoria_incidencia.Enabled = false;
        }

        protected void btnLimpiar_estados_inci_Click(object sender, EventArgs e)
        {
            txtNombreEstInci.Text = null;
            btn_agregar_estadoInci.Text = "Agregar";
            id_est_inci.Text = null;
            btnLimpiar_estados_inci.Enabled = false;
        }

        protected void btnEditarEstInci_Click(object sender, EventArgs e)
        {
            cn_estado_incidencia cn_Estado_Incidencia = new cn_estado_incidencia();
            txtNombreEstInci.Text = null;
            btn_agregar_estadoInci.Text = "Editar";
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int est_id = Convert.ToInt32(id);
            var estados = cn_Estado_Incidencia.buscar_estado_incidencia(est_id);
            List<tbl_estado_incidencia> est = new List<tbl_estado_incidencia>();
            est = estados;
            id_est_inci.Text = est[0].esi_id.ToString();
            txtNombreEstInci.Text = est[0].esi_nombre.ToString();
            btnLimpiar_estados_inci.Enabled = true;
        }

        protected void btnAsignarInci_Click(object sender, EventArgs e)
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            id_asignar_inci.Text = null;
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int inc_id = Convert.ToInt32(id);
            var incidencia = cn_Incidencia.buscar_incidencia_admin(inc_id);
            List<cn_Incidencia.incidencia_vista> inci = new List<cn_Incidencia.incidencia_vista>();
            inci = incidencia;
            id_asignar_inci.Text = inci[0].inc_id.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#ModalAsignar').modal('show');", true);
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            cargar_usuarios();
        }

        protected void btnAsignarTecnicoIncidencia_Click(object sender, EventArgs e)
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();

            int id_inci = Convert.ToInt32(id_asignar_inci.Text);
            int id_tec = Convert.ToInt32(ddlTecnicos.SelectedValue);
            if (id_inci <= 0)
            {
                lbl_mensaje_incidencia_asignar.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje_incidencia_asignar.Text = "Incidencia Vacia";
                return;

            }
            else if (id_tec <= 0)
            {
                lbl_mensaje_incidencia_asignar.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje_incidencia_asignar.Text = "Técnico Vacio";
                return;
            }
            else
            {
                cn_Incidencia.asignar_tecnico_incidencias(id_inci, id_tec);
                ddlTecnicos.SelectedValue = "0";
                id_asignar_inci.Text = null;
                cargar_incidencias();
                cargar_incidencias_asignadas();

                string mensaje = "Se agregó correctamente la incidencia.";
                lbl_toast_mensaje.Text = mensaje;

                // Asegúrate de pasar el mensaje a la función JavaScript
                string mensajeScript = mensaje.Replace("'", "\\'");  // Escapar comillas simples en el mensaje

                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast",
                    $"showToast('success', '{mensajeScript}');", true);
            }
        }

        protected void btnAgregarIncidencia_Click(object sender, EventArgs e)
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            string mensaje = "";
            string titulo = txtTituloIncidencia.Text;
            string descripcion = txtDescripcionIncidencia.Text;
            int categoria = Convert.ToInt32(ddlCategoriaIncidencia.SelectedValue);
            int equipo = Convert.ToInt32(ddlEquipoIncidencia.SelectedValue);
            int tipo = Convert.ToInt32(ddlTipoIncidencia.SelectedValue);
            int usuario = Convert.ToInt32(ddlUsuarioIncidencia.SelectedValue);

            if (titulo == null || titulo == "")
            {
                mensaje = "El titulo esta vacio";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (titulo.Length > 100)
            {
                mensaje = "El titulo es muy largo, máximo 100 caracteres";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (descripcion == null || descripcion == "")
            {
                mensaje = "La descripción esta vacio";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (descripcion.Length > 300)
            {
                mensaje = "La descripción es muy larga, máximo 100 caracteres";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (categoria <= 0)
            {
                mensaje = "La categoria no ha sido seleccionada";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (equipo <= 0)
            {
                mensaje = "El equipo no ha sido seleccionada";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (tipo <= 0)
            {
                mensaje = "El tipo no ha sido seleccionada";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (usuario <= 0)
            {
                mensaje = "El usuario no ha sido seleccionada";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else
            {
                cn_Incidencia.agregar_incidencia_admin(titulo, descripcion, usuario, categoria, equipo, tipo);
                mensaje = "Se agregó correctamente la incidencia.";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('success');", true);
                cargar_incidencias();
                cargar_incidencias_asignadas();
                cargar_incidencias_resueltas();

            }
        }

        protected void btnResolver_Click(object sender, EventArgs e)
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();
            id_asignar_inci.Text = null;
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            int inc_id = Convert.ToInt32(id);
            id_inci_res.Text = inc_id.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#ModalResolver').modal('show');", true);
        }

        protected void btnResolverIncidencia_Click(object sender, EventArgs e)
        {
            cn_Incidencia cn_Incidencia = new cn_Incidencia();

            int id = Convert.ToInt32(id_inci_res.Text);
            string mensaje = "";
            string respuest = respuesta_incidencia.Text.ToString();
            string dsdsds = txt1.Text.ToString();

            if (id <= 0)
            {
                mensaje = "No se selecciono la incidencia adecuadamente.";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (respuest == null || respuest == "")
            {
                mensaje = "La respuesta esta vacia";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else if (respuest.Length > 300)
            {
                mensaje = "La respuesta es muy larga, máximo 300 caracteres";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('danger');", true);
                return;
            }
            else
            {
                cn_Incidencia.resolver_incidencia_admin(respuest, id);
                mensaje = "Se agregó correctamente la respuestsa a la incidencia.";
                lbl_toast_mensaje.Text = mensaje;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToast", "showToast('success');", true);
                cargar_incidencias();
                cargar_incidencias_asignadas();
                cargar_incidencias_resueltas();
            }
        }
    }
}