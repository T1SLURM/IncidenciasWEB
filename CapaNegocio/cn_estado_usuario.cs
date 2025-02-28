﻿using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cn_estado_usuario
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();

        public List<tbl_estado> cargar_estados()
        {
            var query = dc.sp_cargar_estados().ToList();
            var estados = query.Select(r => new tbl_estado
            {
                est_id= r.est_id,
                est_nombre = r.est_nombre
            }).ToList();

            return estados;
        }

        public void agregar_estado_usuario( string nombre)
        {
            dc.sp_agregar_estado_usuario(nombre);
        }

        public List<tbl_estado> buscar_estado_usuario(int id)
        {
            var query = dc.sp_buscar_estado_usuario_admin(id).ToList();
            var estados = query.Select(r => new tbl_estado
            {
                est_id = r.est_id,
                est_nombre = r.est_nombre
            }).ToList();

            return estados;
        }

        public void editar_estado_usuario(string nombre, int id)
        {
            dc.sp_editar_estado_usuario_admin(nombre, id);
        }
    }
}
