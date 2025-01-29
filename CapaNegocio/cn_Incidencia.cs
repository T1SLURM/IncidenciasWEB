using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_Incidencia
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();

        public class incidencia_vista
        {
            public int inc_id { get; set; }

            public string inc_titulo { get; set; }

            public string inc_descripcion { get; set; }

            public decimal inc_calificacion { get; set; }

            public DateTime inc_fecha_creacion { get; set; }

            public DateTime inc_fecha_asignacion { get; set; }

            public DateTime inc_fecha_cierre { get; set; }

            public int esi_id { get; set; }

            public string estado_nombre { get; set; }

            public int cat_id { get; set; }

            public string categoria_nombre { get; set; }

            public int equ_id { get; set; }

            public string equipo_nombre { get; set; }

            public int tip_id { get; set; }

            public string tipo_nombre { get; set; }

            public int usu_id { get; set; }

            public string usuario_nombre { get; set; }

            public string inc_respuesta { get; set; }

            public int tec_id { get; set; }

            public string tecnico_nombre { get; set; }
        }

        public List<incidencia_vista> cargar_incidencias()
        {
            var query = dc.sp_cargar_incidencias();
            var incdencias = query.Select(r => new incidencia_vista
            {
                inc_id = r.inc_id,
                inc_titulo = r.inc_titulo,
                inc_descripcion = r.inc_descripcion,
                inc_calificacion = Convert.ToDecimal(r.inc_calificacion),
                inc_fecha_creacion = Convert.ToDateTime(r.inc_fecha_creacion),
                inc_fecha_asignacion = Convert.ToDateTime(r.inc_feha_asignacion),
                inc_fecha_cierre = Convert.ToDateTime(r.inc_fecha_cierre),
                esi_id = Convert.ToInt32(r.esi_id),
                cat_id = Convert.ToInt32(r.cat_id),
                equ_id = Convert.ToInt32(r.equ_id),
                tip_id = Convert.ToInt32(r.equ_id),
                usu_id = Convert.ToInt32(r.usu_id),
                estado_nombre = r.esi_nombre,
                categoria_nombre = r.cat_nombre,
                equipo_nombre = r.equ_nombre,
                tipo_nombre = r.tip_nombre,
                usuario_nombre = (r.usu_nombre + " " + r.usu_apellido),
                inc_respuesta = r.inc_respuesta
            }).ToList();

            return incdencias;
        }

        public int con_incidecnias_registradas()
        {
            try
            {
                int num = 0;

                // Acceder al primer (y único) resultado del procedimiento almacenado
                var result = dc.sp_contar_inc_registradas().SingleOrDefault();

                if (result != null)
                {
                    num = Convert.ToInt32( result.total); // Asegúrate de que 'Total' sea la columna devuelta por el procedimiento
                }

                return num;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int con_incidecnias_asignadas()
        {
            try
            {
                int num = 0;

                var result = dc.sp_contar_inc_asignadas().SingleOrDefault();

                if (result != null)
                {
                    num = Convert.ToInt32(result.total); // Asegúrate de que 'Total' sea la columna devuelta por el procedimiento
                }

                return num;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int con_incidecnias_proceso()
        {
            try
            {
                int num = 0;

                var result  = dc.sp_contar_inc_proceso().SingleOrDefault();

                if (result != null)
                {
                    num = Convert.ToInt32(result.total); // Asegúrate de que 'Total' sea la columna devuelta por el procedimiento
                }

                return num;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int con_incidecnias_finalizadas()
        {
            try
            {
                int num = 0;

                var result = dc.sp_contar_inc_finalizadas().SingleOrDefault();

                if (result != null)
                {
                    num = Convert.ToInt32(result.total); // Asegúrate de que 'Total' sea la columna devuelta por el procedimiento
                }

                return num;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public List<incidencia_vista> buscar_incidencia_admin(int id)
        {
            var query = dc.sp_buscar_incidencia_admin(id).ToList();
            var incidencias = query.Select(r => new incidencia_vista
            {
                inc_id = r.inc_id,
                inc_titulo = r.inc_titulo,
                inc_descripcion = r.inc_descripcion,
                inc_calificacion = Convert.ToDecimal(r.inc_calificacion),
                inc_fecha_creacion = Convert.ToDateTime(r.inc_fecha_creacion),
                inc_fecha_asignacion = Convert.ToDateTime(r.inc_feha_asignacion),
                inc_fecha_cierre = Convert.ToDateTime(r.inc_fecha_cierre),
                esi_id = Convert.ToInt32(r.esi_id),
                cat_id = Convert.ToInt32(r.cat_id),
                equ_id = Convert.ToInt32(r.equ_id),
                tip_id = Convert.ToInt32(r.equ_id),
                usu_id = Convert.ToInt32(r.usu_id),
                tec_id = Convert.ToInt32(r.tec_id),
                estado_nombre = r.esi_nombre,
                categoria_nombre = r.cat_nombre,
                equipo_nombre = r.equ_nombre,
                tipo_nombre = r.tip_nombre,
                usuario_nombre = (r.usu_nombre + " " + r.usu_apellido),
                inc_respuesta = r.inc_respuesta
            }).ToList();

            return incidencias;
        }

        public void asignar_tecnico_incidencias(int id_inc, int id_tec)
        {
            dc.sp_asignar_tecnico_incidencia_admin(id_inc, id_tec);
        }

        public List<incidencia_vista> cargar_incidencias_asignadas_admin()
        {
            var query = dc.sp_cargar_incidencias_asignadas_admin();
            var incdenciasasi = query.Select(r => new incidencia_vista
            {
                inc_id = r.inc_id,
                inc_titulo = r.inc_titulo,
                inc_descripcion = r.inc_descripcion,
                inc_calificacion = Convert.ToDecimal(r.inc_calificacion),
                inc_fecha_creacion = Convert.ToDateTime(r.inc_fecha_creacion),
                inc_fecha_asignacion = Convert.ToDateTime(r.inc_feha_asignacion),
                inc_fecha_cierre = Convert.ToDateTime(r.inc_fecha_cierre),
                esi_id = Convert.ToInt32(r.esi_id),
                cat_id = Convert.ToInt32(r.cat_id),
                equ_id = Convert.ToInt32(r.equ_id),
                tip_id = Convert.ToInt32(r.equ_id),
                usu_id = Convert.ToInt32(r.usu_id),
                tec_id = Convert.ToInt32(r.tec_id),
                estado_nombre = r.esi_nombre,
                categoria_nombre = r.cat_nombre,
                equipo_nombre = r.equ_nombre,
                tipo_nombre = r.tip_nombre,
                usuario_nombre = (r.usu_nombre + " " + r.usu_apellido),
                inc_respuesta = r.inc_respuesta
            }).ToList();

            return incdenciasasi;
        }

        public List<incidencia_vista> cargar_incidencias_resueltas_admin()
        {
            var query = dc.sp_cargar_incidencias_resueltas_admin();
            var incdenciasasi = query.Select(r => new incidencia_vista
            {
                inc_id = r.inc_id,
                inc_titulo = r.inc_titulo,
                inc_descripcion = r.inc_descripcion,
                inc_calificacion = Convert.ToDecimal(r.inc_calificacion),
                inc_fecha_creacion = Convert.ToDateTime(r.inc_fecha_creacion),
                inc_fecha_asignacion = Convert.ToDateTime(r.inc_feha_asignacion),
                inc_fecha_cierre = Convert.ToDateTime(r.inc_fecha_cierre),
                esi_id = Convert.ToInt32(r.esi_id),
                cat_id = Convert.ToInt32(r.cat_id),
                equ_id = Convert.ToInt32(r.equ_id),
                tip_id = Convert.ToInt32(r.equ_id),
                usu_id = Convert.ToInt32(r.usu_id),
                tec_id = Convert.ToInt32(r.tec_id),
                estado_nombre = r.esi_nombre,
                categoria_nombre = r.cat_nombre,
                equipo_nombre = r.equ_nombre,
                tipo_nombre = r.tip_nombre,
                usuario_nombre = (r.usu_nombre + " " + r.usu_apellido),
                inc_respuesta = r.inc_respuesta
            }).ToList();

            return incdenciasasi;
        }

        public void agregar_incidencia_admin(string titulo, string descripcion, int usu, int cat, int equ, int tip)
        {
            dc.sp_agregar_incidencia_admin(titulo, descripcion, usu, cat, equ, tip);
        }

        public void resolver_incidencia_admin(string res, int usu)
        {
            dc.resolver_incidencia_admin(usu, res);
        }
    }
}
