using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using System.Text.RegularExpressions;

namespace Integrador_3ero
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_iniciar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            Response.Redirect("~/login.aspx");
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCedula.Text == null || txtCedula.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "la Cedula esta Vacia";
                }
                else if (txtCedula.Text.Length > 10)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "la Cedula tiene mas de 10 digitos";
                    txtCedula.Text = "";
                }
                else if (validar_cedula(txtCedula.Text.Trim()) == false)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "la Cedula esta incorrecta";
                }
                else if (txtNombre.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre esta vacio";
                }
                else if (txtNombre.Text.Length > 50)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El nombre es demasiado largo, 50 caracateres max.";
                }
                else if (txtApellido.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El apellido esta vacio";
                }
                else if (txtApellido.Text.Length > 50)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El apellido es demasiado largo, 50 caracateres max.";
                }
                else if (EsCorreoValido(txtCorreo.Text.Trim()) == false)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "el correo es incorrecto.";
                }
                else if (txtCorreo.Text.Length > 50)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "El correo es demasiado largo.";
                }
                else if (txtContrasenia.Text == "")
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    lbl_mensaje.Text = "La contraseña esta vacia.";
                }
                else if (txtContrasenia.Text != txtContraseniaV.Text)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    txtContraseniaV.Text = txtContrasenia.Text = "";
                    lbl_mensaje.Text = "Las contraseñas no coinciden";
                }
                else if (cedula_disponible(txtCedula.Text.Trim()) == false)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    txtCedula.Text = "";
                    lbl_mensaje.Text = "La cedula no esta disponible. Pertenece a otro usuario";
                }
                else if (correo_disponible(txtCorreo.Text.Trim()) == false)
                {
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    txtCorreo.Text = "";
                    lbl_mensaje.Text = "El corre no esta disponible. Pertenece a otro usuario";
                }
                else
                {
                    try
                    {
                        DateTime fecha;
                        if (DateTime.TryParse(txtFecha.Text, out fecha))
                        {
                            // La conversión fue exitosa
                            Console.WriteLine($"Fecha válida: {fecha.ToShortDateString()}");
                        }
                        else
                        {
                            // La conversión falló
                            Console.WriteLine("Por favor, ingrese una fecha válida.");
                        }
                        cn_usuario cn_Usuarios = new cn_usuario();
                        cn_Usuarios.registrar_usuario(txtNombre.Text, txtApellido.Text, txtCorreo.Text, txtContraseniaV.Text, fecha, txtCedula.Text);
                        lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                        lbl_mensaje.Text = "Se registro correctamente";
                        limpiar();
                        Timer1.Enabled = true;
                    }
                    catch (Exception)
                    {

                        lbl_mensaje.ForeColor = System.Drawing.Color.Green;
                        lbl_mensaje.Text = "No se pudo Registrar";
                    }

                }
            }
            catch (Exception)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "no se registro correctamente";
            }
        }

        protected void cvFecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fechaIngresada;
            if (DateTime.TryParse(args.Value, out fechaIngresada))
            {
                DateTime fechaActual = DateTime.Now.Date;

                if (fechaIngresada >= fechaActual)
                {
                    // Fecha no válida: futura o actual
                    args.IsValid = false;
                }
                else
                {
                    // Fecha válida
                    args.IsValid = true;
                }
            }
            else
            {
                // Formato inválido
                args.IsValid = false;
            }
        }


        public bool EsCorreoValido(string correo)
        {
            string patronCorreo = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            Regex regex = new Regex(patronCorreo);
            return regex.IsMatch(correo);
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

        private void limpiar()
        {
            txtApellido.Text = txtNombre.Text = txtCedula.Text = txtContrasenia.Text = txtCorreo.Text = txtContraseniaV.Text = "";
        }
    }
}