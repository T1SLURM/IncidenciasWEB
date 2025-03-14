using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Integrador_3ero
{
    public partial class paginaTecnico : System.Web.UI.Page
    {
        cn_auditoria cn_Auditoria = new cn_auditoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind data to the page
                BindTaskData();
                LoadClientReviews();
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["id"]);
            cn_Auditoria.registrar_accion_auditoria("Cerrar Sesión", id);
            Response.Redirect("~/Home.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private void BindTaskData()
        {
            // In a real-world scenario, you would fetch this data from a database
            // For demonstration purposes, we are using hardcoded data that matches the HTML table

            // This could be replaced with a database call
            // Example: var tasks = GetTasksFromDatabase();
        }

        protected void lnkDeleteTask_Click(object sender, EventArgs e)
        {
            string taskId = hdnDeleteTaskId.Value;
            if (!string.IsNullOrEmpty(taskId))
            {
                // Delete the task from database
                // DeleteTaskFromDatabase(taskId);

                // Refresh the task list
                BindTaskData();

                // Show confirmation message
                ScriptManager.RegisterStartupScript(this, GetType(), "DeleteConfirm",
                    "alert('Tarea #" + taskId + " eliminada correctamente.');", true);
            }
        }

        // This method would be called from the aspx to determine the CSS class for status
        public string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "resuelto":
                    return "resolved";
                case "en progreso":
                    return "in-progress";
                case "abierto":
                    return "open";
                default:
                    return "";
            }
        }

        // This method would be called from the aspx to determine the CSS class for priority
        public string GetPriorityClass(string priority)
        {
            switch (priority.ToLower())
            {
                case "alta":
                    return "high";
                case "media":
                    return "medium";
                case "baja":
                    return "low";
                default:
                    return "";
            }
        }

        private void LoadClientReviews()
        {
            // In a real application, this data would come from a database
            List<ClientReview> reviews = new List<ClientReview>
            {
                new ClientReview
                {
                    ClientName = "Juan Pérez",
                    ClientPhoto = "images/client-avatar.jpg",
                    GeneralRating = 4,
                    PunctualityRating = 4,
                    ProfessionalismRating = 4,
                    QualityRating = 4,
                    Comments = "Ecelente servicio, muy profesional y puntual. El trabajo quedó muy bien realizado, aunque hubo algunos detalles menores que podrían mejorarse.",
                    ServiceDate = "15 Febrero, 2025",
                    ServiceType = "Mantenimíneto Eléctrico"
                },
                new ClientReview
                {
                    ClientName = "Juan Pérez",
                    ClientPhoto = "images/client-avatar.jpg",
                    GeneralRating = 4,
                    PunctualityRating = 4,
                    ProfessionalismRating = 4,
                    QualityRating = 4,
                    Comments = "Ecelente servicio, muy profesional y puntual. El trabajo quedó muy bien realizado, aunque hubo algunos detalles menores que podrían mejorarse.",
                    ServiceDate = "15 Febrero, 2025",
                    ServiceType = "Mantenimíneto Eléctrico"
                }
            };

            rptClientReviews.DataSource = reviews;
            rptClientReviews.DataBind();
        }

        // Helper method to generate star rating HTML
        protected string GetStarsHtml(int rating)
        {
            string stars = "";
            for (int i = 1; i <= 5; i++)
            {
                if (i <= rating)
                {
                    stars += "<i class=\"fas fa-star\"></i>";
                }
                else
                {
                    stars += "<i class=\"far fa-star\"></i>";
                }
            }
            return stars;
        }
    }

    // Class to represent a client review
    public class ClientReview
    {
        public string ClientName { get; set; }
        public string ClientPhoto { get; set; }
        public int GeneralRating { get; set; }
        public int PunctualityRating { get; set; }
        public int ProfessionalismRating { get; set; }
        public int QualityRating { get; set; }
        public string Comments { get; set; }
        public string ServiceDate { get; set; }
        public string ServiceType { get; set; }
    }
}
