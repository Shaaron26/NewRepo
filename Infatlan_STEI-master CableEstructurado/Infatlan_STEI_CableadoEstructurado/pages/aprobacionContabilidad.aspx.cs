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
    public partial class aprobacionContabilidad : System.Web.UI.Page
    {
        db vConexion = new db();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarProceso();
        }


        public void Mensaje(string vMensaje, WarningType type)
        {
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", "infatlan.showNotification('top','center','" + vMensaje + "','" + type.ToString().ToLower() + "')", true);
        }

        void CargarProceso()
        {
            try
            { 
                string vIdEstudioPrincipal;
                vIdEstudioPrincipal = Request.QueryString["idEstudio"].ToString();

                DataTable vDatos = new DataTable();
                vDatos = vConexion.obtenerDataTable("STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 5, '" + vIdEstudioPrincipal + "'") ;

                GVContabilidad.DataSource = vDatos;
                GVContabilidad.DataBind();
                Session["CE_PRESUPUESTO"] = vDatos;

                for (int i = 0; i < vDatos.Rows.Count; i++)
                {
                    txtCostoTotalMateriales.Text = Convert.ToString(Convert.ToDecimal(vDatos.Rows[i]["costoTotal"].ToString()) + Convert.ToDecimal(vDatos.Rows[i]["costoTotal"].ToString()));

                }

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }
        protected void GVContabilidad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            try
            {

                GVContabilidad.DataSource = (DataTable)Session["CE_PRESUPUESTO"];
                GVContabilidad.PageIndex = e.NewPageIndex;
                GVContabilidad.DataBind();
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }
        protected void GVContabilidad_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                //string vPresupuesto = e.CommandArgument.ToString();
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');
                Session["CE_IDESTUDIOPRESUPUESTO"] = arg[0];
                Session["CE_IDSTOCKPRESUPUESTO"] = arg[1];

                if (e.CommandName == "Modificar")
                {
                    //txtModProveedor.Text = vContabilidad;

                    DataTable vDatos = new DataTable();
                    vDatos = vConexion.obtenerDataTable("STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 6," + Session["CE_IDESTUDIOPRESUPUESTO"] + "," +
                                                                                                        "'" + Session["CE_IDSTOCKPRESUPUESTO"] + "'");

                    foreach (DataRow item in vDatos.Rows)
                    {
                        txtModCantidad.Text = item["cantidad"].ToString();
                        txtModCostoUnitario.Text = item["precio"].ToString();
                        txtModMaterial.Text = item["material"].ToString();
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

                }

                //txtModIdInventario.Text = vContabilidad;
                //txtModProveedor.Text = Session["PRUEBA"].ToString();


                //if (e.CommandName == "Modificar")
                //{
                //    txtModProveedor.Text = vContabilidad;
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
                //}


            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }

        // protected void txtBuscarProceso_TextChanged(object sender, EventArgs e)

        //{
        //     try
        //     {

        //         CargarProceso();

        //         String vBusqueda = txtBuscarProceso.Text;
        //         DataTable vDatos = (DataTable)Session["CE_CONTABILIDAD"];

        //         if (vBusqueda.Equals(""))
        //         {
        //             GVContabilidad.DataSource = vDatos;
        //             GVContabilidad.DataBind();
        //             udpContabilidad.Update();
        //         }
        //         else
        //         {
        //             EnumerableRowCollection<DataRow> filtered = vDatos.AsEnumerable()
        //                 .Where(r => r.Field<String>("marca").Contains(vBusqueda.ToUpper()));

        //             Boolean isNumeric = int.TryParse(vBusqueda, out int n);

        //             if (isNumeric)
        //             {
        //                 if (filtered.Count() == 0)
        //                 {
        //                     filtered = vDatos.AsEnumerable().Where(r =>
        //                         Convert.ToInt32(r["idInventario"]) == Convert.ToInt32(vBusqueda));
        //                 }
        //             }


        //             DataTable vDatosFiltrados = new DataTable();
        //             vDatosFiltrados.Columns.Add("idInventario");
        //             vDatosFiltrados.Columns.Add("proveedor");
        //             vDatosFiltrados.Columns.Add("marca");
        //             vDatosFiltrados.Columns.Add("precio");
        //             foreach (DataRow item in filtered)
        //             {
        //                 vDatosFiltrados.Rows.Add(
        //                     item["idInventario"].ToString(),
        //                     item["proveedor"].ToString(),
        //                     item["marca"].ToString(),
        //                     item["precio"].ToString()
        //                     );
        //             }

        //             GVContabilidad.DataSource = vDatosFiltrados;
        //             GVContabilidad.DataBind();
        //             Session["CE_CONTABILIDAD"] = vDatosFiltrados;
        //             udpContabilidad.Update();
        //         }
        //     }
        //     catch (Exception Ex)
        //     {
        //         Mensaje(Ex.Message, WarningType.Danger);
        //     }

        // }

        public void Limpiar()
        {
            txtHorasExtras.Text = "";
            udpHorasExtras.Update();

            txtGastoViaje.Text = "";
            udpGastoViaje.Update();

            txtManoObraContra.Text = "";
            udpManoObraContra.Update();

            txtTransporte.Text = "";
            udpTranspote.Update();

            txtAlimentacion.Text = "";
            udpALimentacion.Update();

            txtHospedaje.Text = "";
            udpHospedaje.Update();

            txtImprevistos.Text = "";
            udpImprevistos.Update();

             txtTotalNodos.Text = "";
            udpTotalNodos.Update();
            
            txtCostoTotal.Text = "";
            udpCostoTotal.Update();

            txtGanancia.Text = "";
            udpGanancia.Update();

            txtPropuesta.Text = "";
            udpPropuesta.Update();

            txtisvCostoTotal.Text = "";
            udpIsvCostos.Update();

            txtTotalCot.Text = "";
            udpTotalCot.Update();

            txtCostoNodoLps.Text = "";
            udpCostoNodoLps.Update();

            txtCostoNodoUsd.Text = "";
            udpCostoNodoUsd.Update();

            txtTotalMateriales.Text = "";
            udpTotalMateriales.Update();

            txtCostosManoObra.Text = "";
            udpCostosManoObra.Update();

            txtCostoTotalProyecto.Text = "";
            udpCostoTotalProyecto.Update();

            txtIsvCotizacion.Text = "";
            udpIsvCotizacion.Update();

            txtCostoTotalCotizacion.Text = "";
            udpCostoTotalCotizacion.Update();

            txtCostoTotalMateriales.Text = "";
            udpCostoTotalMateriales.Update();

            GVContabilidad.DataBind();
            udpGVContabilidad.Update();
            GVContabilidad.DataSource = null;


        }

            public void CerrarModal(String vModal)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#" + vModal + "').modal('hide');", true);
        }

        protected void BtnModModificarMaterial_Click(object sender, EventArgs e)
        {
            try
            {
                string vMensaje = "";

                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 13," + Session["CE_IDESTUDIOPRESUPUESTO"] + "," +
                                                                                    "'" + Session["CE_IDSTOCKPRESUPUESTO"] + "'," +
                                                                                    "'" + txtModCantidad.Text + "'";

                    Int32 vInformacion = vConexion.ejecutarSql(vQuery);

                    vMensaje = "Actualizado con Exito!";

                    if (vInformacion == 1)
                    {

                         //lbUsuarioMensaje.Text= "Actualizado con Exito!";
                        CerrarModal("ModificarMaterialModal");
                    Mensaje("Actualizado con Exito!", WarningType.Success);
                }
                    else
                    {
                        vMensaje = "No se pudo actualizar!";
                        CerrarModal("ModificarMaterialModal");
                    }

               
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }

        protected void txtTotalNodos_TextChanged(object sender, EventArgs e)
        {

            string vGanancia;
            String vIsv;
            string vCosto;

            //Calcular valores totales
            vCosto = Convert.ToString(Convert.ToDecimal(txtCostoTotalMateriales.Text) + Convert.ToDecimal(txtHorasExtras.Text) + Convert.ToDecimal(txtGastoViaje.Text) + Convert.ToDecimal(txtManoObraContra.Text) + Convert.ToDecimal(txtTransporte.Text) + Convert.ToDecimal(txtAlimentacion.Text) + Convert.ToDecimal(txtHospedaje.Text) + Convert.ToDecimal(txtImprevistos.Text));

            txtCostoTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vCosto)), 2));

            vGanancia = Convert.ToString(Convert.ToDecimal(txtHorasExtras.Text) + Convert.ToDecimal(txtGastoViaje.Text) + Convert.ToDecimal(txtManoObraContra.Text) + Convert.ToDecimal(txtTransporte.Text) + Convert.ToDecimal(txtAlimentacion.Text) + Convert.ToDecimal(txtHospedaje.Text) + Convert.ToDecimal(txtImprevistos.Text));

            txtGanancia.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vGanancia) * Convert.ToDecimal(0.15)), 2));

            txtPropuesta.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotal.Text) + Convert.ToDecimal(txtGanancia.Text)), 2));

            txtisvCostoTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPropuesta.Text) * Convert.ToDecimal(0.15)), 2));

            txtTotalCot.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPropuesta.Text) + Convert.ToDecimal(txtisvCostoTotal.Text)), 2));
            //Calculo Total Cotización

            txtTotalMateriales.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalMateriales.Text)), 2));
            //txtTotalMateriales.Text = Convert.ToString(Convert.ToDecimal(98099));

            txtCostosManoObra.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vGanancia) + Convert.ToDecimal(txtGanancia.Text)), 2));

            txtCostoTotalProyecto.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostosManoObra.Text) + Convert.ToDecimal(txtTotalMateriales.Text)), 2));

            txtIsvCotizacion.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalProyecto.Text) * Convert.ToDecimal(0.15)), 2));

            txtCostoTotalCotizacion.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalProyecto.Text) + Convert.ToDecimal(txtIsvCotizacion.Text)), 2));

        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {

            string vGanancia;
            String vIsv;
            string vCosto;

            //Calcular Costos Totales
            vCosto = Convert.ToString(Convert.ToDecimal(txtCostoTotalMateriales.Text) + Convert.ToDecimal(txtHorasExtras.Text) + Convert.ToDecimal(txtGastoViaje.Text) + Convert.ToDecimal(txtManoObraContra.Text) + Convert.ToDecimal(txtTransporte.Text) + Convert.ToDecimal(txtAlimentacion.Text) + Convert.ToDecimal(txtHospedaje.Text) + Convert.ToDecimal(txtImprevistos.Text));

            txtCostoTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vCosto)), 2));

            vGanancia = Convert.ToString(Convert.ToDecimal(txtHorasExtras.Text) + Convert.ToDecimal(txtGastoViaje.Text) + Convert.ToDecimal(txtManoObraContra.Text) + Convert.ToDecimal(txtTransporte.Text) + Convert.ToDecimal(txtAlimentacion.Text) + Convert.ToDecimal(txtHospedaje.Text) + Convert.ToDecimal(txtImprevistos.Text));

            txtGanancia.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vGanancia) * Convert.ToDecimal(0.15)), 2));

            txtPropuesta.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotal.Text) + Convert.ToDecimal(txtGanancia.Text)), 2));

            txtisvCostoTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPropuesta.Text) * Convert.ToDecimal(0.15)), 2));

            txtTotalCot.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPropuesta.Text) + Convert.ToDecimal(txtisvCostoTotal.Text)), 2));

            //Costo Nodos

            txtCostoNodoLps.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtTotalCot.Text) / Convert.ToDecimal(txtTotalNodos.Text)), 2));
            txtCostoNodoUsd.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoNodoLps.Text) / Convert.ToDecimal(24.5)), 2));

            //Calculo Total Cotización

            txtTotalMateriales.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalMateriales.Text)), 2));
            //txtTotalMateriales.Text = Convert.ToString(Convert.ToDecimal(98099));

            txtCostosManoObra.Text = Convert.ToString(Math.Round((Convert.ToDecimal(vGanancia) + Convert.ToDecimal(txtGanancia.Text)), 2));

            txtCostoTotalProyecto.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostosManoObra.Text) + Convert.ToDecimal(txtTotalMateriales.Text)), 2));

            txtIsvCotizacion.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalProyecto.Text) * Convert.ToDecimal(0.15)), 2));

            txtCostoTotalCotizacion.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtCostoTotalProyecto.Text) + Convert.ToDecimal(txtIsvCotizacion.Text)), 2));
        }

        protected void btnGuardarCotizacion_Click(object sender, EventArgs e)
        {

            try
            {

                String vQuery = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 6," + txtHorasExtras.Text + "," +
                                                                          "'" + txtGastoViaje.Text + "'," +
                                                                          "'" + txtManoObraContra.Text + "'," +
                                                                          "'" + txtTransporte.Text + "'," +
                                                                          "'" + txtAlimentacion.Text + "'," +
                                                                          "'" + txtHospedaje.Text + "'," +
                                                                          "'" + txtImprevistos.Text + "'," +
                                                                          "'" + txtTotalNodos.Text + "'," +
                                                                          "'" + txtCostoTotal.Text + "'," +
                                                                          "'" + txtGanancia.Text + "'," +
                                                                          "'" + txtPropuesta.Text + "'," +
                                                                          "'" + txtisvCostoTotal.Text + "'," +
                                                                          "'" + txtTotalCot.Text + "'," +
                                                                          "'" + txtCostoNodoLps.Text + "'," +
                                                                          "'" + txtCostoNodoUsd.Text + "'," +
                                                                          "'" + txtCostoTotalMateriales.Text + "'," +
                                                                          "'" + txtCostosManoObra.Text + "'," +
                                                                          "'" + txtCostoTotalProyecto.Text + "'," +
                                                                          "'" + txtIsvCotizacion.Text + "'," +
                                                                          "'" + txtCostoTotalCotizacion.Text + "'," +
                                                                          "'Activo'";

                Int32 vInformacion = vConexion.ejecutarSql(vQuery);

                if (vInformacion == 1)
                {
                    Mensaje("Actualizado con Exito!", WarningType.Success);
                    Limpiar();

                }
                else
                {
                    Mensaje("No se pudo actualizar!", WarningType.Success);
                }
            }
            catch (Exception Ex) { Mensaje(Ex.Message, WarningType.Danger); }

        }
    } 
}