using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Infatlan_STEI_CableadoEstructurado.clases;
using System.Data.Sql;
using System.IO;


namespace Infatlan_STEI_CableadoEstructurado.paginas
{
    public partial class estudioEstructurado : System.Web.UI.Page
    {
        db vConexion = new db();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                EliminarSesiones();
                CargarDatos();
            }

        }

        public void EliminarSesiones()
        {
            Session["CE_MATERIALES"] = null;
            Session["CE_CABLEADO"] = null;
            Session["CE_ROLES"] = null;
            Session["CE_IDRESPONSABLE"] = null;
            Session["CE_IDAGENCIA"] = null;
            Session["CE_IDEPARTAMENTO"] = null;
            Session["CE_IDMATERIAL"] = null;
        }

        public void Mensaje(string vMensaje, WarningType type)
        {
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", "infatlan.showNotification('top','center','" + vMensaje + "','" + type.ToString().ToLower() + "')", true);
        }

        public void CerrarModal(String vModal)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#" + vModal + "').modal('hide');", true);
        }

        public void Limpiar()
        {
            ddlResponsable.SelectedIndex = -1;
            txtIdentidad.Text = "";
            txtZona.Text = "";
            udpResposable.Update();

            ddlAgencia.SelectedIndex = 0;
            txtDireccion.Text = "";
            udpAgencia.Update();

            txtFechaEstudio.Text = "";
            txtFechaEnvio.Text = "";
            udpFechasEstudio.Update();

            //imgCuartoTelecomunicaciones.Src = string.Empty;
            fuCuartoTelecomunicaciones.Attributes.Clear();
            udpCuartoTelecomunicaciones.Update();
            //udpTodoCuartoTelecomunicaciones.Update();

            rblReubicar.ClearSelection();
            udpReubicar.Update();

            udpEtiquetado.Update();
            rblEtiquetado.ClearSelection();

            //udpImgReubicar.Update();

            udpDesordenado.Update();
            rblDesordenado.ClearSelection();
                       
            rblExpuestoHumedo.ClearSelection();
            udpExpuestpHumedo.Update();

            rblExpuestoRobo.ClearSelection();
            udpExpuestoRobo.Update();

            rblElementoAjenos.ClearSelection();
            udpElemetoAjeno.Update();

            udpUps.Update();
            rblUps.ClearSelection();

            udpAire.Update();
            rblAire.ClearSelection();

            udpCategoria.Update();
            rblCategoria.ClearSelection();

            udpRotulacion.Update();
            rblRotulacion.ClearSelection();
           
            ddlMateriales.SelectedIndex = -1;
            udpMetariales.Update();

            udpCantidad.Update();
            txtCantidad.Text = "";

            ddlMedidas.SelectedIndex = -1;
            udpUnidades.Update();

            GVMateriales.DataBind();
            GVMateriales.DataSource = null;
            UpdateDivMateriales.Update();

            txtHorasTrabajo.Text = "";
            udpDuracion.Update();

            txtParticipantes.Text = "";
            udpParticipantes.Update();

            rblTransporte.ClearSelection();
            udpTransporte.Update();

            updAlimentacion.Update();
            rblALimentación.ClearSelection();

            udpObservaciones.Update();
            txtObservaciones.Text = "";

           
        }

        void CargarDatos()
        {
            if (HttpContext.Current.Session["CE_CABLEADO"] == null)
            {
                //Obtener Materiales
                try
                {
                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 6, " + ddlMateriales.SelectedValue;
                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);
                    DataTable vData = (DataTable)Session["CE_CABLEADO"];

                    if (vData == null)
                        vData = vDatos.Clone();

                    if (vDatos != null)
                        vData.Rows.Add(vDatos.Rows[0]["idStock"].ToString(), vDatos.Rows[0]["nombre"].ToString(), vDatos.Rows[0]["cantidad"].ToString(), vDatos.Rows[0]["medidas"].ToString() + " " + vDatos.Rows[0]["unidades"].ToString());


                    GVMateriales.DataSource = vData;
                    GVMateriales.DataBind();
                    Session["CE_CABLEADO"] = vData;

                }
                catch (Exception Ex)
                {
                    Mensaje(Ex.Message, WarningType.Danger);
                }


                //Obtener todos las Agencias.
                try
                {
                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 1";
                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);

                    ddlAgencia.Items.Clear();
                    ddlAgencia.Items.Add(new ListItem { Value = "0", Text = "Seleccione una opción" });
                    foreach (DataRow item in vDatos.Rows)
                    {
                        ddlAgencia.Items.Add(new ListItem { Value = item["idAgencia"].ToString(), Text = item["nombre"].ToString() });
                    }

                }
                catch (Exception Ex)
                {
                    Mensaje(Ex.Message, WarningType.Danger);
                }

                //Obtener todos los Responsables.
                try
                {
                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 2";

                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);

                    //ddlResponsable.Items.Clear();
                    ddlResponsable.Items.Add(new ListItem { Value = "0", Text = "Seleccione una opción" });
                    foreach (DataRow item in vDatos.Rows)
                    {
                        ddlResponsable.Items.Add(new ListItem { Value = item["idUsuario"].ToString(), Text = item["nombre"].ToString() + " " + item["apellidos"].ToString() });
                    }

                }
                catch (Exception Ex)
                {
                    Mensaje(Ex.Message, WarningType.Danger);
                }


                //Obtener Unidades
                try
                {
                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 8";

                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);

                    //ddlResponsable.Items.Clear();
                    ddlMedidas.Items.Add(new ListItem { Value = "0", Text = "Seleccione una opción" });
                    foreach (DataRow item in vDatos.Rows)
                    {
                        ddlMedidas.Items.Add(new ListItem { Value = item["idMedida"].ToString(), Text = item["medida"].ToString() });
                    }

                }
                catch (Exception Ex)
                {
                    Mensaje(Ex.Message, WarningType.Danger);
                }


                //Obtener materiales
                try
                {
                    String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 7";

                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);

                    //ddlResponsable.Items.Clear();
                    ddlMateriales.Items.Add(new ListItem { Value = "0", Text = "Seleccione una opción" });
                    foreach (DataRow item in vDatos.Rows)
                    {
                        ddlMateriales.Items.Add(new ListItem { Value = item["idstock"].ToString(), Text = item["nombre"].ToString() });
                    }

                }
                catch (Exception Ex)
                {
                    Mensaje(Ex.Message, WarningType.Danger);
                }

                Session["CE_CABLEADO"] = "1";
            }
        }

        //DROPDOWNLIST
        protected void ddlResponsable_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 3, '" + ddlResponsable.SelectedValue + "'";

                DataTable vDatos = vConexion.obtenerDataTable(vQuery);
                Session["CE_IDRESPONSABLE"] = vDatos.Rows[0]["idUsuario"].ToString();
                txtIdentidad.Text = vDatos.Rows[0]["identidad"].ToString();
                txtZona.Text = vDatos.Rows[0]["nombre"].ToString();
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }

        protected void ddlAgencia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 1, '" + ddlAgencia.SelectedValue + "'";

                DataTable vDatos = vConexion.obtenerDataTable(vQuery);
                Session["CE_IDAGENCIA"] = vDatos.Rows[0]["idAgencia"].ToString();
                Session["CE_IDEPARTAMENTO"] = vDatos.Rows[0]["idDepartamento"].ToString();
                txtDireccion.Text = vDatos.Rows[0]["direccion"].ToString();
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }

        protected void ddlMateriales_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 4, '" + ddlMateriales.SelectedValue + "'";

                DataTable vDatos = vConexion.obtenerDataTable(vQuery);
                Session["CE_IDMATERIAL"] = vDatos.Rows[0]["idMaterial"].ToString();
  
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }

        protected void ddlMedidas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String vQuery = "STEISP_CABLESTRUCTURADO_ConsultaDatosEstudio 9, '" + ddlMedidas.SelectedValue + "'";

                DataTable vDatos = vConexion.obtenerDataTable(vQuery);
                Session["CE_IDMEDIDA"] = vDatos.Rows[0]["idMedida"].ToString();

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }


        //GRIDVIEW 
        protected void GVMateriales_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {

                GVMateriales.DataSource = (DataTable)Session["CE_MATERIAL"];
                GVMateriales.PageIndex = e.NewPageIndex;
                GVMateriales.DataBind();
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }

        protected void GVMateriales_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                DataTable vDatos = (DataTable)Session["CE_MATERIALES"];
                if (e.CommandName == "Eliminar")
                {
                    String vMaterial = e.CommandArgument.ToString();

                    if (Session["CE_MATERIALES"] != null)
                    {
                        DataRow[] result = vDatos.Select("numero = '" + vMaterial + "'");

                        foreach (DataRow row in result)
                        {
                            if (row["numero"].ToString().Contains(vMaterial))
                                vDatos.Rows.Remove(row);
                        }
                    }
                }
                GVMateriales.DataSource = vDatos;
                GVMateriales.DataBind();
                Session["CE_MATERIALES"] = vDatos;

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }
        }


        //RADIOBUTTONLIST
        protected void rblDesordenado_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    if (rblDesordenado.SelectedValue == "si")
            //    {
            //        fuDesordenado.Visible = false;
            //    }
            //    else
            //    {
            //        fuDesordenado.Visible = true;
            //    }
            //}
            //catch (Exception Ex)
            //{
            //    Mensaje(Ex.Message, WarningType.Danger);
            //}
        }

        protected void rblExpuestoHumedad_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    if (rblHumedo.SelectedValue == "si")
            //    {
            //        imgExpuestoHumedad.Disabled = false;
                    
            //    }
            //    else
            //    {
            //        imgExpuestoHumedad.Disabled= true;
            //    }
            //}
            //catch (Exception Ex)
            //{
            //    Mensaje(Ex.Message, WarningType.Danger);
            //}

        }

        protected void rblExpuestoRobo_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    if (rblExpuestoRobo.SelectedValue == "si")
            //    {
            //        imgExpuestoRobo.Disabled = false;
            //    }
            //    else
            //    {
            //        imgExpuestoRobo.Disabled = true;
            //    }
            //}
            //catch (Exception Ex)
            //{
            //    Mensaje(Ex.Message, WarningType.Danger);
            //}


        }

        protected void rblElementosAjenos_TextChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    if (rblElementosAjenos.SelectedValue == "si")
            //    {
            //        imgElementosAjenos.Disabled = false;
            //    }
            //    else
            //    {
            //        imgElementosAjenos.Disabled = true;
            //    }
            //}
            //catch (Exception Ex)
            //{
            //    Mensaje(Ex.Message, WarningType.Danger);
            //}
        }

        protected void rblReubicar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (rblReubicar.SelectedValue == "si")
                {
                    //table1Estudio.Visible = true;
                    
                }
                else
                {
                    //table1Estudio.Visible = false;
                 
                }
               
            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Danger);
            }

        }


        //VALIDACIONES
        void ValidarFormDatosGenerales()
        {

            if (ddlResponsable.SelectedIndex == 0)
            {
                throw new Exception("Seleccione el Responsable");
            }

            if (ddlAgencia.SelectedIndex == 0)
            {
                throw new Exception("Seleccione la Agencia");
            }

            if (txtFechaEstudio.Text == "" || txtFechaEnvio.Text == string.Empty)
            {
                throw new Exception("Ingrese la Fecha de Envío");
            }
            if (txtFechaEstudio.Text == "" || txtFechaEstudio.Text == string.Empty)
            {
                throw new Exception("Ingrese la Fecha de Estudio");
            }

        }

        void ValidarFormMateriales()
        {

            //if (ddlMateriales.SelectedIndex == 0)
            //{
            //    throw new Exception("Seleccione un Material");
            //}
            //if (txtCantidad.Text == "" || txtCantidad.Text == string.Empty)
            //{
            //    throw new Exception("Ingrese una cantidad");
            //}

        }
        
        void ValidarFormAprobacion()
        {
        //    if (rblAprobada.SelectedValue == "")
        //    {
        //        throw new Exception("Seleccione si es aprobado el estudio");
        //    }
        }
        void ValidarFormEstimacionRecursos()
        {
            if (txtHorasTrabajo.Text == "" || txtHorasTrabajo.Text == string.Empty)
            {
                throw new Exception("Ingrese las Horas Trabajadas");
            }
            if (txtParticipantes.Text == "" || txtParticipantes.Text == string.Empty)
            {
                throw new Exception("Ingrese los Participantes");
            }
            if (rblTransporte.SelectedValue == "")
            {
                throw new Exception("Seleccione si utilizó transporte");
            }
            if (rblALimentación.SelectedValue == "")
            {
                throw new Exception("Seleccione si utilizó Alimentación");
            }
        }


        //BUTTON
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable vData = new DataTable();
                DataTable vDatos = (DataTable)Session["CE_MATERIALES"];
                string vMaterial = ddlMateriales.SelectedValue;
                string vNombreMaterial = ddlMateriales.SelectedItem.Text;

                vData.Columns.Add("numero");
                vData.Columns.Add("nombre");
                vData.Columns.Add("cantidad");
                vData.Columns.Add("medida");

                if (vDatos == null)
                    vDatos = vData.Clone();

                if (vDatos != null)
                {
                    if (vDatos.Rows.Count < 1)
                        vDatos.Rows.Add(ddlMateriales.SelectedValue, ddlMateriales.SelectedItem.Text, txtCantidad.Text, ddlMedidas.SelectedItem.Text);
                    else
                    {
                        Boolean vRegistered = false;
                        for (int i = 0; i < vDatos.Rows.Count; i++)
                        {
                            if (vNombreMaterial == vDatos.Rows[i]["nombre"].ToString())
                            {
                                vDatos.Rows[i]["cantidad"] = Convert.ToDecimal(vDatos.Rows[i]["cantidad"].ToString()) + Convert.ToDecimal(txtCantidad.Text);
                                vRegistered = true;
                            }
                        }

                        if (!vRegistered)
                            vDatos.Rows.Add(ddlMateriales.SelectedValue, ddlMateriales.SelectedItem.Text, txtCantidad.Text, ddlMedidas.SelectedItem.Text);
                    }
                }

                GVMateriales.DataSource = vDatos;
                GVMateriales.DataBind();
                Session["CE_MATERIALES"] = vDatos;
                UpdateDivMateriales.Update();

                ddlMateriales.SelectedIndex = -1;
                txtCantidad.Text = "";
                ddlMedidas.SelectedIndex = -1;

            }
            catch (Exception Ex)
            {
                Mensaje(Ex.Message, WarningType.Success);
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            //Guardar los datos que ingressa el Tecnico
            try
            {
                //ValidarFormDatosGenerales();
                //ValidarFormMateriales();
                //ValidarFormEstudioPrevio();
                //ValidarFormEstimacionRecursos();
                ValidarFormAprobacion();




                    //String vQuery = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 1," + Session["CE_IDESTUDIO"] + "," +
                     String vQuery = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 2,"+1+ "," +
                                                                               "'" + rblAprobada.SelectedValue + "'," +
                                                                               "'" + txtObservacionesAprobacion.Text + "'," +
                                                                               "'Aprobado'";

                Int32 vInformacion = vConexion.ejecutarSql(vQuery);

                if (vInformacion == 1)
                {
                    rblAprobada.ClearSelection();
                    udpAprobado.Update();
                    txtObservacionesAprobacion.Text = "";
                    udpObservacionesAprobacion.Update();
                    Mensaje("Actualizado con Exito!", WarningType.Success);
                   
                }
                else
                {
                    Mensaje("No se pudo actualizar!", WarningType.Success);
                }
            }
            catch (Exception Ex) { Mensaje(Ex.Message, WarningType.Danger); }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Guardar los datos que ingresa el Tecnico
            try
            {
                

                ValidarFormDatosGenerales();
                ValidarFormMateriales();
                //ValidarFormEstudioPrevio();
                ValidarFormEstimacionRecursos();
                //ValidarFormAprobacion();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

                //Convertir imagenes

            }
            catch (Exception Ex) { Mensaje(Ex.Message, WarningType.Danger); }
        }

        protected void BtnModGuardar_Click(object sender, EventArgs e)
        {


            //IMAGENES1
            String vNombreDepot = String.Empty;
            HttpPostedFile bufferDepositoT = fuCuartoTelecomunicaciones.PostedFile;
            byte[] vFileDeposito = null;
            string vExtension = string.Empty;

            if (bufferDepositoT != null)
            {
                vNombreDepot = fuCuartoTelecomunicaciones.FileName;
                Stream vStream = bufferDepositoT.InputStream;
                BinaryReader vReader = new BinaryReader(vStream);
                vFileDeposito = vReader.ReadBytes((int)vStream.Length);
                vExtension = System.IO.Path.GetExtension(fuCuartoTelecomunicaciones.FileName);
            }
            String vArchivo = String.Empty;
            if (vFileDeposito != null)
                vArchivo = Convert.ToBase64String(vFileDeposito);

            //IMAGENES2
            String vNombreDepot1 = String.Empty;
            HttpPostedFile bufferDepositoT1 = fuReubicar.PostedFile;
            byte[] vFileDeposito1 = null;
            string vExtension1 = string.Empty;

            if (bufferDepositoT1 != null)
            {
                vNombreDepot1 = fuReubicar.FileName;
                Stream vStream1 = bufferDepositoT1.InputStream;
                BinaryReader vReader1 = new BinaryReader(vStream1);
                vFileDeposito1 = vReader1.ReadBytes((int)vStream1.Length);
                vExtension1 = System.IO.Path.GetExtension(fuReubicar.FileName);
            }
            String vArchivo1 = String.Empty;
            if (vFileDeposito1 != null)
                vArchivo1 = Convert.ToBase64String(vFileDeposito1);

            //IMAGENES3
            String vNombreDepot2 = String.Empty;
            HttpPostedFile bufferDepositoT2 = fuDesordenado.PostedFile;
            byte[] vFileDeposito2 = null;
            string vExtension2 = string.Empty;

            if (bufferDepositoT2 != null)
            {
                vNombreDepot2 = fuDesordenado.FileName;
                Stream vStream2 = bufferDepositoT2.InputStream;
                BinaryReader vReader2 = new BinaryReader(vStream2);
                vFileDeposito2 = vReader2.ReadBytes((int)vStream2.Length);
                vExtension2 = System.IO.Path.GetExtension(fuDesordenado.FileName);
            }
            String vArchivo2 = String.Empty;
            if (vFileDeposito2 != null)
                vArchivo2 = Convert.ToBase64String(vFileDeposito2);

            //IMAGENES4
            String vNombreDepot3 = String.Empty;
            HttpPostedFile bufferDepositoT3 = fuExpuestoHumedo.PostedFile;
            byte[] vFileDeposito3 = null;
            string vExtension3 = string.Empty;

            if (bufferDepositoT3 != null)
            {
                vNombreDepot3 = fuExpuestoHumedo.FileName;
                Stream vStream3 = bufferDepositoT3.InputStream;
                BinaryReader vReader3 = new BinaryReader(vStream3);
                vFileDeposito3 = vReader3.ReadBytes((int)vStream3.Length);
                vExtension3 = System.IO.Path.GetExtension(fuExpuestoHumedo.FileName);
            }
            String vArchivo3 = String.Empty;
            if (vFileDeposito2 != null)
                vArchivo3 = Convert.ToBase64String(vFileDeposito3);

            //IMAGENES5
            String vNombreDepot4 = String.Empty;
            HttpPostedFile bufferDepositoT4 = fuExpuestoRobo.PostedFile;
            byte[] vFileDeposito4 = null;
            string vExtension4 = string.Empty;

            if (bufferDepositoT4 != null)
            {
                vNombreDepot4 = fuExpuestoRobo.FileName;
                Stream vStream4 = bufferDepositoT4.InputStream;
                BinaryReader vReader4 = new BinaryReader(vStream4);
                vFileDeposito4 = vReader4.ReadBytes((int)vStream4.Length);
                vExtension4 = System.IO.Path.GetExtension(fuExpuestoRobo.FileName);
            }
            String vArchivo4 = String.Empty;
            if (vFileDeposito4 != null)
                vArchivo4 = Convert.ToBase64String(vFileDeposito4);

            //IMAGENES6
            String vNombreDepot5 = String.Empty;
            HttpPostedFile bufferDepositoT5 = fuElemetoAjenos.PostedFile;
            byte[] vFileDeposito5 = null;
            string vExtension5 = string.Empty;

            if (bufferDepositoT5 != null)
            {
                vNombreDepot5 = fuElemetoAjenos.FileName;
                Stream vStream5 = bufferDepositoT5.InputStream;
                BinaryReader vReader5 = new BinaryReader(vStream5);
                vFileDeposito5 = vReader5.ReadBytes((int)vStream5.Length);
                vExtension5 = System.IO.Path.GetExtension(fuElemetoAjenos.FileName);
            }
            String vArchivo5 = String.Empty;
            if (vFileDeposito5 != null)
                vArchivo5 = Convert.ToBase64String(vFileDeposito5);

            //IMAGENES7
            String vNombreDepot6 = String.Empty;
            HttpPostedFile bufferDepositoT6 =  fuPlano.PostedFile;
            byte[] vFileDeposito6 = null;
            string vExtension6 = string.Empty;

            if (bufferDepositoT6 != null)
            {
                vNombreDepot6 = fuPlano.FileName;
                Stream vStream6 = bufferDepositoT6.InputStream;
                BinaryReader vReader6 = new BinaryReader(vStream6);
                vFileDeposito6 = vReader6.ReadBytes((int)vStream6.Length);
                vExtension6 = System.IO.Path.GetExtension(fuPlano.FileName);
            }
            String vArchivo6 = String.Empty;
            if (vFileDeposito6 != null)
                vArchivo6 = Convert.ToBase64String(vFileDeposito6);

            //FIN

            //Ingresa los datos generales

            String vQuery = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 1," + Session["CE_IDEPARTAMENTO"] + "," +
                                                                           "'" + Session["CE_IDAGENCIA"] + "'," +
                                                                           "'" + Session["CE_IDRESPONSABLE"] + "'," +
                                                                           "'" + txtFechaEstudio.Text + "'," +
                                                                           "'" + txtFechaEnvio.Text + "'," +
                                                                           "'" + txtHorasTrabajo.Text + "'," +
                                                                           "'" + txtParticipantes.Text + "'," +
                                                                           "'" + rblALimentación.SelectedValue + "'," +
                                                                           "'" + rblTransporte.SelectedValue + "'," +
                                                                           "'" + txtObservaciones.Text + "'," +
                                                                           "'IngresoTecnico'";

            DataTable vDatos = vConexion.obtenerDataTable(vQuery);

            //Obtiene IdEstudio

            String vQuery1 = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 3";

            DataTable vDatos1 = vConexion.obtenerDataTable(vQuery1);
            Session["CE_IDESTUDIO"] = (vDatos1.Rows[0]["Id"].ToString());


            //Ingresa los datos del material 
            DataTable vDatosMaterial = (DataTable)Session["CE_MATERIALES"];

            for (int i = 0; i < vDatosMaterial.Rows.Count; i++)
            {
                string vMaterial;
                string vMedidas;
                string vCantidad;
                string vIdMaterial;

                vIdMaterial = (vDatosMaterial.Rows[i]["numero"].ToString());

                vMaterial = (vDatosMaterial.Rows[i]["nombre"].ToString());

                vCantidad = (vDatosMaterial.Rows[i]["cantidad"].ToString());

                vMedidas = (vDatosMaterial.Rows[i]["medida"].ToString());

                String vQuery2 = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 5," + Session["CE_IDESTUDIO"] + "," +
                                                                                 "'" + vIdMaterial + "'," +
                                                                                 "'" + vMaterial + "'," +
                                                                                 "'" + vMedidas + "'," +
                                                                                 "'" + vCantidad + "'";

                DataTable vDatos2 = vConexion.obtenerDataTable(vQuery2);
            }

            //Ingreso de Preguntaas
            String vQuery3 = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 4," + Session["CE_IDESTUDIO"] + "," +
                                                                             "'" + vArchivo + "'," +
                                                                            "'" + rblEtiquetado.SelectedValue + "'," +
                                                                            "'" + rblReubicar.SelectedValue + "'," +
                                                                            "'" + vArchivo1 + "'," +
                                                                            "'" + rblDesordenado.SelectedValue + "'," +
                                                                            "'" + vArchivo2 + "'," +
                                                                            "'" + rblExpuestoHumedo.SelectedValue + "'," +
                                                                            "'" + vArchivo3 + "'," +
                                                                            "'" + rblExpuestoRobo.SelectedValue + "'," +
                                                                            "'" + vArchivo4 + "'," +
                                                                            "'" + rblElementoAjenos.SelectedValue + "'," +
                                                                            "'" + vArchivo5 + "'," +
                                                                            "'" + rblUps.SelectedValue + "'," +
                                                                            "'" + rblAire.SelectedValue + "'," +
                                                                            "'" + rblCategoria.SelectedValue + "'," +
                                                                            "'" + rblRotulacion.SelectedValue + "'," +
                                                                           "'Disponible'";
            DataTable vDatos3 = vConexion.obtenerDataTable(vQuery3);

            String vQuery4 = "STEISP_CABLESTRUCTURADO_IngresarDatosEstudio 7," + Session["CE_IDESTUDIO"] + "," +
                                                                             "'" + Session["CE_IDRESPONSABLE"] + "'";

            DataTable vDatos4 = vConexion.obtenerDataTable(vQuery4);

            //Int32 vGeneral = vConexion.ejecutarSql(vQuery);
            //Int32 vEstudio = vConexion.ejecutarSql(vQuery3);

            //if (vEstudio ==1)
            //{ 


            Limpiar();
            Mensaje("Actualizado con Exito!", WarningType.Success);
            CerrarModal("MensajeAceptacionModal");
            Session["CE_MATERIALES"] = null;
            //}
            //else
            //{
            //    Mensaje("No se pudo actualizar!", WarningType.Success);
            //}

        }
    }
}
    
