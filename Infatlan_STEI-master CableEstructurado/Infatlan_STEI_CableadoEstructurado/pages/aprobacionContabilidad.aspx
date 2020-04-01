<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="aprobacionContabilidad.aspx.cs" Inherits="Infatlan_STEI_CableadoEstructurado.paginas.aprobacionContabilidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script type="text/javascript">
        //Abrir modal
        function openModal() {
            $('#ModificarMaterialModal').modal('show');
        }

        // Cerrar modal
        function closeModal() {
            $('#ModificarMaterialModal').modal('hide');
        }

    </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#nav_Contabilidad" role="tab"><span class="hidden-sm-up"><i class="ti-money"></i></span><span class="hidden-xs-down">Presupuesto</span></a> </li>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nav_Costos" role="tab"><span class="hidden-sm-up"><i class="ti-bar-chart-alt"></i></span><span class="hidden-xs-down">Costos</span></a> </li>
                    </ul>


                    <div class="tab-content tabcontent-border">

                        <%-- Sección 1 --%>
                        <div class="tab-pane active" id="nav_Contabilidad" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Presupuesto de Trabajo</h4>
                                                <br />

                                                <%--                                                <asp:UpdatePanel runat="server" ID="UpdatePanel7" AutoPostBack="true">
                                                    <ContentTemplate>--%>

                                                <div class="row">

                                                    <div class="col-md-12">
                                                        <asp:UpdatePanel ID="udpContabilidad" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="col-12 grid-margin stretch-card">
                                                                    <div class="card">
                                                                        <div class="card-body">
                                                                            <h3 class="card-title">Materiales Agregados por el Técnico</h3>
                                                                            <p>Ordenados por fecha de ingreso</p>
                                                                            <asp:UpdatePanel ID="udpGVContabilidad" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                                                                    <div class="row">
                                                                                        <div class="table-responsive">
                                                                                            <asp:GridView ID="GVContabilidad" runat="server"
                                                                                                CssClass="table table-bordered"
                                                                                                AutoPostBack="true"
                                                                                                PagerStyle-CssClass="pgr"
                                                                                                HeaderStyle-CssClass="table"
                                                                                                RowStyle-CssClass="rows"
                                                                                                AutoGenerateColumns="false"
                                                                                                AllowPaging="true"
                                                                                                GridLines="None"
                                                                                                PageSize="10"
                                                                                                OnPageIndexChanging="GVContabilidad_PageIndexChanging" OnRowCommand="GVContabilidad_RowCommand">
                                                                                                <Columns>
                                                                                                    <asp:TemplateField HeaderStyle-Width="60px" Visible="true">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:LinkButton ID="BtnModificar" runat="server" Text="Modificar" class="btn btn-inverse-primary  mr-2" CommandArgument='<%#Eval("idEstudio") + ";" +Eval("idStock")%>' CommandName="Modificar"></asp:LinkButton>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:BoundField DataField="idStock" HeaderText="Id" Visible="false" />
                                                                                                    <asp:BoundField DataField="proveedor" HeaderText="Proveedor" />
                                                                                                    <asp:BoundField DataField="codigo" HeaderText="Codigo" />
                                                                                                    <asp:BoundField DataField="material" HeaderText="Material" />
                                                                                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                                                                                                    <asp:BoundField DataField="precio" HeaderText="Costo Unitario" />
                                                                                                    <asp:BoundField DataField="costoTotal" HeaderText="Costo Total" />

                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="form-group row ">
                                                            <label class="col-sm-6 col-form-label" style="text-align: right"><b>Costo Total Materiales</b></label>
                                                            <div class="col-sm-6 ">
                                                                <asp:UpdatePanel ID="udpCostoTotalMateriales" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:TextBox runat="server" ID="txtCostoTotalMateriales" class="form-control col-3 text-center"></asp:TextBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                                <%--  </ContentTemplate>
                                                </asp:UpdatePanel>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- Sección 2 --%>
                        <div class="tab-pane p-20" id="nav_Costos" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <h4 class="card-title">Costos del Estudio</h4>
                                            <br />

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Horas Extras</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpHorasExtras" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtHorasExtras" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Gastos de viaje Estudio</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpGastoViaje" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtGastoViaje" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Mano de Obra Contra</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpManoObraContra" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtManoObraContra" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Transporte</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpTranspote" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtTransporte" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Alimentación</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpALimentacion" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtAlimentacion" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Hospedaje</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpHospedaje" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtHospedaje" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Imprevistos</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpImprevistos" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtImprevistos" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group row ">
                                                        <label class="col-sm-4 col-form-label">Total Nodos</label>
                                                        <div class="col-sm-6 ">
                                                            <asp:UpdatePanel ID="udpTotalNodos" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox runat="server" ID="txtTotalNodos" class="form-control"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: 40%;">
                                                        <asp:Button runat="server" ID="btnCalcular" Text="Calcular" OnClick="btnCalcular_Click" class="btn  btn-block btn-success" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnCalcular"/>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                    <%-- TABLA 1 --%>

                                    <%--<asp:UpdatePanel runat="server" ID="UpdatePanel14" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                    <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                        <thead>
                                            <tr>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Descripción
                                                </th>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="2" class="border text-xl-center">Costos
                                                </th>

                                            </tr>
                                        </thead>

                                        <tbody>

                                            <tr>

                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label1">Costo Total</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="udpCostoTotal" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtCostoTotal" class="form-control" ></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label2">15% Ganancia</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="udpGanancia" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtGanancia" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label3">Propuesta</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpPropuesta" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtPropuesta" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label4">15 % isv</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpIsvCostos" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtisvCostoTotal" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label5">Total Cotización</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpTotalCot" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtTotalCot" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <%--   </ContentTemplate>
                                            </asp:UpdatePanel>--%>

                                    <%-- TABLA 2 --%>

                                    <%--   <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                    <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                        <thead>
                                            <tr>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Descripción
                                                </th>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="2" class="border text-xl-center">Costos
                                                </th>

                                            </tr>
                                        </thead>

                                        <tbody>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label6">Costo Nodo en Lps.</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpCostoNodoLps" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtCostoNodoLps" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="Label7">Costo Nodo en USD</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpCostoNodoUsd" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtCostoNodoUsd" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <%--     </ContentTemplate>
                                            </asp:UpdatePanel>--%>



                                    <%-- TABAL 2 --%>
                                    <%-- <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                    <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                        <thead>
                                            <tr>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Descripción
                                                </th>
                                                <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="2" class="border text-xl-center">Costos
                                                </th>

                                            </tr>
                                        </thead>

                                        <tbody>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="lbTotalMateriales">Total Materiales</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpTotalMateriales" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtTotalMateriales" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="lbManoObra">Mano de obra</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpCostosManoObra" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtCostosManoObra" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="lbTotalProyecto">Costo Total Proyecto</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpCostoTotalProyecto" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtCostoTotalProyecto" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="lbIsvCotizacion">15 % isv</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpIsvCotizacion" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtIsvCotizacion" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" class="control-label" ID="lbTotalCotizacion">Total Cotización</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="udpCostoTotalCotizacion" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtCostoTotalCotizacion" runat="server" class="form-control"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <%--    </ContentTemplate>
                                            </asp:UpdatePanel>--%>


                                    <div class="col-md-12 align-self-center" style="margin-left: auto; margin-right: auto">
                                        <div class="row col-12">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional">
                                                <ContentTemplate>

                                                    <asp:Button runat="server" ID="btnGuardarCotizacion" Text="Guardar" class="btn  btn-block btn-success" OnClick="btnGuardarCotizacion_Click" />

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>




                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
   



    <%--MODAL DE MODIFICACION DE MATERIAL--%>
    <div class="modal fade" id="ModificarMaterialModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 600px; top: 320px; left: 50%; transform: translate(-50%, -50%);">
                <div class="modal-header">
                    <h4 class="modal-title" id="ModalLabelQA">
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                Modificar Material
                                <asp:Label ID="LbModificarMaterial" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="card">
                            <div class="card-body">
                                <asp:UpdatePanel ID="UpdateModalContabilidad" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtModIdInventario" placeholder="" class="form-control" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
                                        </div>

                                        <div class="row">

                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Material</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox runat="server" ID="txtModMaterial" CssClass="form-control text-center" ReadOnly="true"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Costo Unitario</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtModCostoUnitario" placeholder="" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Cantidad</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox runat="server" ID="txtModCantidad" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:UpdatePanel ID="UpdateUsuarioMensaje" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="form-group row">
                                        <asp:Label ID="lbUsuarioMensaje" runat="server" Text="" Class="col-sm-12" Style="color: indianred; text-align: center;"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <asp:Button ID="BtnModModificarMaterial" runat="server" Text="Modificar" class="btn btn-primary" OnClick="BtnModModificarMaterial_Click" AutoPostBack="true" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
