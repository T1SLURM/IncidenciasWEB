using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using CapaNegocio;
using System.Net;

namespace Integrador_3ero
{
    public partial class RecuperarContrasenia : System.Web.UI.Page
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

        protected void btn_enviar_codigo_Click(object sender, EventArgs e)
        {
            cn_usuario cn_Usuario = new cn_usuario();
            string cedula = txtCedula.Text;
            string correo = txtCorreo.Text;
            var usuario = cn_Usuario.buscar_usuario_recup(correo, cedula);
            if (validar_cedula(cedula.Trim()) == false)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "la Cedula esta incorrecta";
            }
            else if (EsCorreoValido(correo.Trim()) == false)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "el correo es incorrecto.";
            }
            else if (correo_disponible(correo.Trim()) == true)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                txtCorreo.Text = "";
                lbl_mensaje.Text = "El correo no existe";
            }
            else if (VerificarCedulaConCorreo(correo, cedula) == true)
            {
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                txtCorreo.Text = "";
                txtCedula.Text = "";
                lbl_mensaje.Text = "La cedula no pertenece al usuario";
            }
            else
            {
                if (usuario.Count() > 0)
                {
                    mandar_codigo_recup(correo, cedula);
                    lbl_mensaje.Text = "El código de recuperacion se ha enviado a su correo electrónico";
                    Timer1.Enabled = true;
                    Response.Redirect("~/RecuperarContrasenia2.aspx");
                }
                else
                {
                    lbl_mensaje.Text = "Ocurrio un error en enviar el codigo al usuario";
                }

            }
        }

        public void mandar_codigo_recup(string correo, string cedula)
        {
            try
            {
                cn_usuario cn_Usuario = new cn_usuario();
                MailMessage mail = new MailMessage();
                var usuarios = cn_Usuario.buscar_usuario_recup(correo, cedula).ToList();
                tbl_usuario usuario = usuarios[0];
                string nombre = usuario.usu_nombre;
                string codigo = generar_codigo();
                mail.From = new MailAddress("fix.management.inc@gmail.com");
                mail.To.Add(correo);
                mail.Subject = "Recuperacion de Contraseña";
                mail.Body = $"Hola {nombre}\n\nTu código de recuperacion de contraseña es: \n\n{codigo}\n\nEste código no lo compartas con nadie.\n\n\nEquipo de FixManagement.";
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("fix.management.inc@gmail.com", "gjgg pkbc tyel ytrl"),
                    EnableSsl = true
                };
                smtp.Send(mail);
                lbl_mensaje.Text = "El código de recuperacion se ha enviado a su correo electrónico";
                cn_Usuario.enviar_codigo_recup(usuario.usu_correo, codigo, usuario.usu_cedula);
                Session["id_recu"] = usuario.usu_id;
                Session["codigo_recu"] = codigo ;

            }
            catch (Exception)
            {

                lbl_mensaje.Text = "Ocurrio un error en enviar el codigo al usuario";
            }
        }

        public string generar_codigo()
        {
            int longitud = 5;
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            char[] codigo = new char[longitud];

            for (int i = 0; i < longitud; i++)
            {
                codigo[i] = caracteres[random.Next(caracteres.Length)];
            }

            return new string(codigo);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
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

        public bool EsCorreoValido(string correo)
        {
            string patronCorreo = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            Regex regex = new Regex(patronCorreo);
            return regex.IsMatch(correo);
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

        public bool VerificarCedulaConCorreo(string correo, string cedula)
        {
            cn_usuario cnUsuarios = new cn_usuario();
            List<tbl_usuario> usuarios = cnUsuarios.cargar_usuario_por_correo(correo);

            foreach (tbl_usuario usuario in usuarios)
            {
                // Comparamos la cédula existente con la cédula proporcionada
                if (usuario.usu_cedula.Equals(cedula, StringComparison.OrdinalIgnoreCase))
                {
                    return false; // La cédula ya está asociada al correo
                }
            }

            return true; // La cédula no está asociada al correo
        }



    }
}