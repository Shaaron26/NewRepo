<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="principalPresupuestos.aspx.cs" Inherits="Infatlan_STEI_CableadoEstructurado.paginas.principalPresupuestos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                        <div class="container-fluid">
                                    <h2 class="text-themecolor">Cotización de Estudios</h2>
                               <br />
                             <br />
                            <div class="card-group">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="d-flex no-block align-items-center">
                                                    <div>
                                                        <h3><i class="icon-screen-desktop"></i></h3>
                                                        <p class="text-muted">Estudios Realizados</p>
                                                    </div>
                                                    <div class="ml-auto">
                                                        <h2 class="counter text-primary">23</h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="progress">
                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="d-flex no-block align-items-center">
                                                    <div>
                                                        <h3><i class="icon-note"></i></h3>
                                                        <p class="text-muted">Cotizaciones Pendientes</p>
                                                    </div>
                                                    <div class="ml-auto">
                                                        <h2 class="counter text-cyan">20</h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="progress">
                                                    <div class="progress-bar bg-cyan" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-12">
                                    <asp:UpdatePanel ID="udpContabilidad" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-12 grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h3 class="card-title">Materiales Agregados por el Técnico</h3>
                                                        <p>Ordenados por fecha de ingreso</p>
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <asp:GridView ID="GVPrincipal" runat="server"
                                                                    CssClass="table table-bordered"
                                                                    AutoPostBack="true"
                                                                    PagerStyle-CssClass="pgr"
                                                                    HeaderStyle-CssClass="table"
                                                                    RowStyle-CssClass="rows"
                                                                    AutoGenerateColumns="false"
                                                                    AllowPaging="true"
                                                                    GridLines="None"
                                                                    PageSize="10" 
                                                                    OnPageIndexChanging="GVPrincipal_PageIndexChanging" 
                                                                    OnRowCommand="GVPrincipal_RowCommand">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Width="60px" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="BtnEntrar" runat="server" Text="Entrar" class="btn btn-inverse-primary  mr-2" CommandArgument='<%#Eval("idEstudio")%>' CommandName="Entrar"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="agencia" HeaderText="Agencia" />
                                                                        <asp:BoundField DataField="responsable" HeaderText="Técnico Responsable" />
                                                                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
