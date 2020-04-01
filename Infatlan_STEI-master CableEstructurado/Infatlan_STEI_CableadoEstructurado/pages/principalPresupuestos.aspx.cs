using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Infatlan_STEI_CableadoEstructurado.clases;
using System.Data.Sql;
using System.Text;

namespace Infatlan_STEI_CableadoEstructurado.paginas
{
    public partial class principalPresupuestos : System.Web.UI.Page
    {
        db vConexion = new db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarProceso();
            }

        }
        public void Mensaje(string vMensaje, WarningType type)
        {
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", "infatlan.showNotification('top','center','" + vMensaje + "','" + type.ToString().ToLower() + "')", true);
        }

        void CargarProceso()
        {
            try
            {
                DataTable vDatos = new DataTable();
                vDatos = vConexion.obtenerDataTable("STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 15 ");

                GVPrincipal.DataSource = vDatos;
                GVPrincipal.DataBind();
                Session["CE_PRESUPUESTO"] = vDatos;

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }

        protected void GVPrincipal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            try
            {
                GVPrincipal.DataSource = (DataTable)Session["CE_DATOSESTUDIO"];
                GVPrincipal.PageIndex = e.NewPageIndex;
                GVPrincipal.DataBind();
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }

        protected void GVPrincipal_RowCommand(object sender, GridViewCommandEventArgs e)
        {

             try
            {


                DataTable vDatos = (DataTable)Session["CE_DATOSESTUDIO"];
                if (e.CommandName == "Entrar")
                {
                    String vMaterial = e.CommandArgument.ToString();


                     Response.Redirect("/paginas/aprobacionContabilidad.aspx?idEstudio=" + vMaterial); 
                }

                    string vDatoPrincipal = e.CommandArgument.ToString();
                //string vDatoPrincipal = Convert.ToString(1);
                //Response.Redirect("/paginas/aprobacionContabilidad.aspx");
               

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }
    }
}