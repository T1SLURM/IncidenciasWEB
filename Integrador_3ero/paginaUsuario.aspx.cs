using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
            if (!IsPostBack)
            {
                LoadIncidencias();
                LoadSampleData();
            }
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

        private void LoadIncidencias()
        {
            // In a real application, this would be loaded from a database
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(string));
            dt.Columns.Add("Nombre", typeof(string));
            dt.Columns.Add("Categoria", typeof(string));
            dt.Columns.Add("Estado", typeof(string));
            dt.Columns.Add("Prioridad", typeof(string));
            dt.Columns.Add("Asignado", typeof(string));

            dt.Rows.Add("001", "Actualizar software", "Hardware", "En Progreso", "Critico", "Juan perez");
            dt.Rows.Add("002", "Error en BIOS", "Software", "Completo", "Baja", "Marta Guaman");
            dt.Rows.Add("003", "Actualizar software", "Hardware", "Abierto", "Medio", "Elizabeth Roman");

            gvIncidencias.DataSource = dt;
            gvIncidencias.DataBind();
        }

        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "En Progreso":
                    return "status-progress";
                case "Completo":
                    return "status-completed";
                case "Abierto":
                    return "status-open";
                default:
                    return "";
            }
        }

        protected string GetPriorityClass(string priority)
        {
            switch (priority)
            {
                case "Critico":
                    return "priority-critical";
                case "Baja":
                    return "priority-low";
                case "Medio":
                    return "priority-medium";
                default:
                    return "";
            }
        }

        protected void gvIncidencias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "Ver")
            {
                // Redirect to view incident details
                Response.Redirect($"DetalleIncidencia.aspx?id={id}");
            }
            else if (e.CommandName == "Editar")
            {
                // Redirect to edit incident
                Response.Redirect($"EditarIncidencia.aspx?id={id}");
            }
            else if (e.CommandName == "Eliminar")
            {
                // In a real application, you would delete from database
                // For now, let's just show a JavaScript confirmation and handle it
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteConfirm",
                    $"if(confirm('¿Está seguro que desea eliminar la incidencia {id}?')) {{ __doPostBack('DeleteIncident', '{id}'); }}", true);
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            string eventTarget = Request["__EVENTTARGET"];
            string eventArgument = Request["__EVENTARGUMENT"];

            if (eventTarget == "DeleteIncident" && !string.IsNullOrEmpty(eventArgument))
            {
                // Delete the incident
                DeleteIncident(eventArgument);
            }
        }

        private void DeleteIncident(string id)
        {
            // In a real application, you would delete from database
            // For demo, we'll reload the data and show a success message
            LoadIncidencias();
            ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess",
                $"alert('Incidencia {id} eliminada con éxito.');", true);
        }
        private void LoadSampleData()
        {
            List<IncidenciaItem> incidencias = new List<IncidenciaItem>
            {
                new IncidenciaItem
                {
                    ID = "Id-001",
                    Nombre = "Juan Perez",
                    Descripcion = "Al iniciar sesión se presento la Bios",
                    Estado = "Completo",
                    EstadoCSS = "status-completed"
                },
                new IncidenciaItem
                {
                    ID = "Id-001",
                    Nombre = "Juan Perez",
                    Descripcion = "Al iniciar sesión se presento la Bios",
                    Estado = "Abierto",
                    EstadoCSS = "status-open"
                }
            };

            rptIncidencias.DataSource = incidencias;
            rptIncidencias.DataBind();
        }

        // Event handler for search button click
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Implement search functionality here
            // This would typically involve querying a database

            // For demo purposes, we'll just reload the sample data
            LoadSampleData();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Get form values
                    //string titulo = txtTitulo.Text;
                    //string categoria = ddlCategoria.SelectedValue;
                    //string descripcion = txtDescripcion.Text;

                    // Process file upload if files were selected
                    if (fileUpload.HasFiles)
                    {
                        // Create directory if it doesn't exist
                        string uploadFolderPath = Server.MapPath("~/Uploads/");
                        if (!Directory.Exists(uploadFolderPath))
                        {
                            Directory.CreateDirectory(uploadFolderPath);
                        }

                        foreach (HttpPostedFile uploadedFile in fileUpload.PostedFiles)
                        {
                            // Generate a unique filename to prevent overwriting
                            string fileName = Path.GetFileName(uploadedFile.FileName);
                            string uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName;
                            string filePath = Path.Combine(uploadFolderPath, uniqueFileName);

                            // Save the file
                            uploadedFile.SaveAs(filePath);

                            // Here you would typically save the file path to a database
                            // along with the incident details
                        }
                    }

                    // Here you would save the incident to your database
                    // For example:
                    // var incidencia = new Incidencia
                    // {
                    //     Titulo = titulo,
                    //     Categoria = categoria,
                    //     Descripcion = descripcion,
                    //     FechaCreacion = DateTime.Now,
                    //     EstadoId = 1, // New/Open
                    //     UsuarioId = currentUserId
                    // };
                    // incidenciaRepository.Insert(incidencia);

                    // After saving, redirect to a confirmation page or back to the incident list
                    Response.Redirect("ConfirmacionIncidencia.aspx");
                }
                catch (Exception ex)
                {
                    // Log the error and display a user-friendly message
                    // Logger.LogError(ex);
                    // Display error message to user
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // Redirect back to the incidents list or dashboard
            Response.Redirect("Incidencias.aspx");
        }
    }

    public class IncidenciaItem
    {
        public string ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        public string EstadoCSS { get; set; }
    }
}
