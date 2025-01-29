using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CapaNegocio
{
    public class cn_usuario
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();

        public class usuario_vista
        {
            public int usu_id { get; set; }
            public string usu_nombre { get; set; }
            public string usu_apellido { get; set; }
            public string usu_correo { get; set; }
            public DateTime usu_fecha_nacimiento { get; set; }
            public string usu_cedula { get; set; }
            public string estado { get; set; }
            public string rol { get; set; }
        }


        public List<usuario_vista> cargar_usuarios()
        {
            // Obtiene los datos desde el procedimiento almacenado
            var query = dc.sp_cargar_usuarios().ToList();

            // Mapea los resultados a la clase usuario_vista
            var usuarios = query.Select(r => new usuario_vista
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_fecha_nacimiento = Convert.ToDateTime(r.usu_fecha_nacimiento),
                usu_cedula = r.usu_cedula,
                estado = r.est_nombre,
                rol = r.per_nombre
            }).ToList();

            return usuarios;
        }

        public void desbloquear_usuario(int usu_id)
        {
            // Busca el usuario con el ID especificado
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_id == usu_id
                           select usu).FirstOrDefault();

            if (usuario != null)
            {
                // Modificar las propiedades del usuario
                usuario.usu_intento = 3;
                usuario.est_id = 1;

                // Guardar los cambios en la base de datos
                dc.SubmitChanges();
            }
            else
            {
                // Manejo en caso de que no se encuentre el usuario
                throw new Exception("Usuario no encontrado");
            }
        }

        public void eliminar_usuario(int usu_id)
        {
            // Busca el usuario con el ID especificado
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_id == usu_id
                           select usu).FirstOrDefault();

            if (usuario != null)
            {
                // Modificar las propiedades del usuario
                usuario.est_id = 2;

                // Guardar los cambios en la base de datos
                dc.SubmitChanges();
            }
            else
            {
                // Manejo en caso de que no se encuentre el usuario
                throw new Exception("Usuario no encontrado");
            }
        }

        public bool verificar_usuario(string correo)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_correo == correo
                           select usu).FirstOrDefault();
            if (usuario != null && usuario.usu_correo == correo)
            {
                return true; // el usuario existe
            }
            return false; // El usuario no existe

        }

        public bool verificar_contrasenia(string correo, string contrasenia)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_correo == correo
                           select usu).FirstOrDefault(); // Usamos FirstOrDefault ya que esperamos solo un usuario

            var pass = dc.hash_pass(contrasenia);

            // Verificamos si el usuario existe y si la contraseña es correcta
            if (usuario != null && usuario.usu_contrasenia == pass)
            {
                return true; // La contraseña es correcta
            }
            restar_intento(correo);
            return false; // la contraseña es incorrecta
        }

        public void restar_intento(string correo)
        {
            // Busca el usuario con el ID especificado
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_correo == correo
                           select usu).FirstOrDefault(); // Usamos FirstOrDefault ya que esperamos solo un usuario
            int intento = Convert.ToInt32(usuario.usu_intento);
            if (usuario != null)
            {
                if (intento > 1)
                {
                    intento--;
                    usuario.usu_intento = intento;
                    dc.SubmitChanges();
                }
                else
                {
                    usuario.est_id = 3;
                    usuario.usu_intento = 0;
                    dc.SubmitChanges();
                }

                // Guardar los cambios en la base de datos
                dc.SubmitChanges();
            }
            else
            {
                // Manejo en caso de que no se encuentre el usuario
                throw new Exception("Usuario no encontrado");
            }
        }

        public List<tbl_usuario> ver_usuario(string correo)
        {
            var resultado = dc.sp_correo_usuario(correo).ToList();

            // Convertir manualmente los resultados al tipo tbl_usuario si no son directamente compatibles
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id

            }).ToList();

            return usuarios;
        }

        public int verificar_perfil(string correo)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_correo == correo
                           select usu).FirstOrDefault(); // Usamos FirstOrDefault ya que esperamos solo un usuario

            int perfil = Convert.ToInt32(usuario.per_id);
            return perfil;
        }

        public bool verificar_estado(string correo)
        {
            var usuario = (from usu in dc.tbl_usuario
                           where usu.usu_correo == correo
                           select usu).FirstOrDefault(); // Usamos FirstOrDefault ya que esperamos solo un usuario
            if (usuario != null && usuario.est_id == 1)
            {
                return true; // estado activo
            }
            return false; // estado bloqueado o inactivo
        }

        public List<tbl_usuario> cargar_usuario(string correo, string contrasenia)
        {
            var resultado = dc.sp_credenciales_usuario(correo, contrasenia).ToList();

            // Convertir manualmente los resultados al tipo tbl_usuario si no son directamente compatibles
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

        public List<string> cargar_cedulas()
        {
            // Ejecutar el procedimiento almacenado y obtener las cédulas
            var resultado = dc.sp_cargar_cedula().ToList();

            // Crear una lista vacía de cadenas
            List<string> cedulas = new List<string>();

            // Recorrer el resultado y agregar cada cédula a la lista
            foreach (var item in resultado)
            {
                cedulas.Add(item.usu_cedula);
            }

            return cedulas;
        }

        public List<string> cargar_correos()
        {
            // Ejecutar el procedimiento almacenado y obtener las cédulas
            var resultado = dc.sp_cargar_correo().ToList();

            // Crear una lista vacía de cadenas
            List<string> correos = new List<string>();

            // Recorrer el resultado y agregar cada cédula a la lista
            foreach (var item in resultado)
            {
                correos.Add(item.usu_correo);
            }

            return correos;
        }

        public void registrar_usuario(string nombre, string apellido, string correo, string contrasenia, DateTime fecha, string cedula)
        {
            dc.sp_registrar_usuario(nombre, apellido, correo, contrasenia, fecha, cedula);
        }

        public List<tbl_usuario> cargar_usuario_por_correo(string correo)
        {
            var resultado = dc.cargar_usuario_por_correo(correo).ToList();

            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

        public List<tbl_usuario> buscar_usuario_recup(string correo, string cedula)
        {
            var resultado = dc.sp_buscar_usuario_recup(correo, cedula).ToList();
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

        public void enviar_codigo_recup(string correo, string codigo, string cedula)
        {
            dc.sp_enviar_codigo_recup(correo, codigo, cedula);
        }

        public void cambiar_pass_recu(string pass, int id)
        {
            dc.sp_cambiar_pass_recup(pass, id);
        }

        public void eliminar_logico_usuario(int id)
        {
            dc.sp_eliminar_usuario(id);
        }

        public void editar_usuario(int id, string nombre, string apellido, string correo, DateTime fecha, int perfil)
        {
            dc.sp_editar_usuario_admin(id, nombre, apellido, correo, fecha, perfil);
        }

        public List<tbl_usuario> buscar_usuario_admin(int id)
        {
            var resultado = dc.sp_buscar_usuario(id).ToList();
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

        public void agregar_usuario_admin(string nombre, string apellido, string correo, DateTime fecha, string cedula, string pass, int perfil)
        {
            dc.sp_agregar_usuario_admin(nombre, apellido, correo, fecha, cedula, pass, perfil);
        }

        public List<tbl_usuario> cargar_tecnicos()
        {
            var resultado = dc.sp_cargar_tecnicos_admin().ToList();
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

        public List<tbl_usuario> cargar_usuarios_incidencias()
        {
            var resultado = dc.sp_cargar_usuarios_incidencia_admin().ToList();
            var usuarios = resultado.Select(r => new tbl_usuario
            {
                usu_id = r.usu_id,
                usu_nombre = r.usu_nombre,
                usu_apellido = r.usu_apellido,
                usu_correo = r.usu_correo,
                usu_contrasenia = r.usu_contrasenia,
                usu_fecha_nacimiento = r.usu_fecha_nacimiento,
                usu_cedula = r.usu_cedula,
                usu_intento = r.usu_intento,
                usu_codigo = r.usu_codigo,
                est_id = r.est_id,
                per_id = r.per_id
            }).ToList();

            return usuarios;
        }

    }
}
