<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="visitaTecnica.aspx.cs" Inherits="Infatlan_STEI_CableadoEstructurado.paginas.estudioEstructurado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        //Imagen 1
        function img1(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgCuartoTelecomunicaciones').css('visibility', 'visible');
                    $('#imgCuartoTelecomunicaciones').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 2
        function img2(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgReubicar').css('visibility', 'visible');
                    $('#imgReubicar').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 3
        function img3(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgDesordenado').css('visibility', 'visible');
                    $('#imgDesordenado').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 4
        function img4(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgExpuestoHumedo').css('visibility', 'visible');
                    $('#imgExpuestoHumedo').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 5
        function img5(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgExpuestoRobo').css('visibility', 'visible');
                    $('#imgExpuestoRobo').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 6
        function img6(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgElementoAjeno').css('visibility', 'visible');
                    $('#imgElementoAjeno').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //Imagen 7
        function img7(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgPlano').css('visibility', 'visible');
                    $('#imgPlano').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }


    </script>

     <script type="text/javascript">
         //Abrir modal
         function openModal() {
             $('#MensajeAceptacionModal').modal('show');
         }

         // Cerrar modal
         function closeModal() {
             $('#MensajeAceptacionlModal').modal('hide');
         }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%-- Inicio Secciones--%>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#nav-Compensatorio" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span><span class="hidden-xs-down">Datos Generales</span></a> </li>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nav_EstudioPrevio" role="tab"><span class="hidden-sm-up"><i class="ti-pencil-alt"></i></span><span class="hidden-xs-down">Estudio Previo</span></a> </li>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nav_Materiales" role="tab"><span class="hidden-sm-up"><i class="ti-settings"></i></span><span class="hidden-xs-down">Materiales</span></a> </li>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nav_Estimacion" role="tab"><span class="hidden-sm-up"><i class="ti-money"></i></span><span class="hidden-xs-down">Estimación de Recursos</span></a> </li>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#nav_Aprobacion" role="tab"><span class="hidden-sm-up"><i class="ti-check-box"></i></span><span class="hidden-xs-down">Aprobaciones</span></a> </li>

                    </ul>

                    <div class="tab-content tabcontent-border">
                        <%-- Sección 1 --%>
                        <div class="tab-pane active" id="nav-Compensatorio" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Registro de Datos Generales</h4>
                                                <br />

                                                <asp:UpdatePanel runat="server" ID="udpResposable" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="form-group">
                                                            <label class="control-label"><b>Técnico Responsable</b></label>
                                                            <div class="col-sm-12">
                                                                <asp:DropDownList ID="ddlResponsable" runat="server" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlResponsable_SelectedIndexChanged"></asp:DropDownList>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label"><b>Identidad</b></label>
                                                                    <asp:TextBox ID="txtIdentidad" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label"><b>Zona</b></label>
                                                                    <asp:TextBox ID="txtZona" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <asp:UpdatePanel runat="server" ID="udpAgencia" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group ">
                                                                    <label class="control-label"><b>Agencia</b></label>
                                                                    <div class="col-sm-12">
                                                                        <asp:DropDownList ID="ddlAgencia" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAgencia_SelectedIndexChanged"></asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label"><b>Dirreción</b></label>
                                                                    <asp:TextBox ID="txtDireccion" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>


                                                <asp:UpdatePanel runat="server" ID="udpFechasEstudio" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group ">
                                                                    <label for="example-datetime-local-input" class="col-6 col-form-label"><b>Fecha Estudio</b></label>

                                                                    <div class="col-12">
                                                                        <asp:TextBox value="2011-08-19T13:45:00" ID="txtFechaEstudio" runat="server" type="date" class="form-control"></asp:TextBox>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group ">
                                                                    <label for="example-datetime-local-input" class="col-6 col-form-label"><b>Fecha Envío</b></label>
                                                                    <div class="col-12">
                                                                        <asp:TextBox value="2011-08-19T13:45:00" ID="txtFechaEnvio" runat="server" type="date" class="form-control" AutoPostBack="true"></asp:TextBox>
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

                        <%-- Sección 2 --%>
                        <div class="tab-pane  p-20" id="nav_EstudioPrevio" role="tabpanel">
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Estudio Previo</h4>
                                            <br />
                                            <%-- TABLA 1 --%>
                                            <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                                <thead>
                                                    <tr>
                                                        <th class="border text-xl-center">Fotografía</th>
                                                        <th class="border text-xl-center">Seleccionar Fotografía
                                                        </th>
                                                        <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="1" class="border text-xl-center">
                                                            <abbr title="Rotten Tomato Rating">Fotografía</abbr>
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <tr>
                                                        <asp:UpdatePanel runat="server" ID="udpTodoCuartoTelecomunicaciones" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <td class="title"><a class="link" href="javascript:void(0)">Cuarto de telecomunicaciones antes de la inspección</a></td>

                                                                <td>
                                                                    <asp:UpdatePanel runat="server" ID="udpCuartoTelecomunicaciones" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:FileUpload ID="fuCuartoTelecomunicaciones" runat="server" onchange="img1(this);" Autoposback="true" />

                                                                            </td>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    <td>
                                                                        <img id="imgCuartoTelecomunicaciones" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />
                                                                    </td>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </tr>
                                                      
                                                </tbody>

                                            </table>

                                            <%-- TABLA 2 --%>
                                            <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Pregunta</th>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="2" class="border text-xl-center">Si / No
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">¿El cableado se encuentra etiquetado?</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpEtiquetado" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblEtiquetado" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal" AutoPostBack="true">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">¿Es necesario re-ubicar el equipo de telecomunicaciones?</a></td>

                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpReubicar" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblReubicar" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblReubicar_TextChanged">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>

                                                    </tr>

                                                </tbody>

                                            </table>

                                            <%-- TABLE VISIBLE --%>
                                            <%--<div class="row" runat="server" id="Div1" visible="true">--%>
                                                
                                             <%-- TABLA 3 --%>
                                            <table  class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Pregunta</th>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw- sortable-default-coldata-tablesaw-priority="3" class="border text-xl-center">Si / No </th>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="2" class="border text-xl-center">Seleccionar Fotografía
                                                        </th>
                                                        <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="1" class="border text-xl-center">
                                                            <abbr title="Rotten Tomato Rating">Fotografía</abbr>
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:UpdatePanel runat="server" ID="udpImgReubicar" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <tr>
                                                                <td class="title"><a class="link" href="javascript:void(0)">Fotografia Reubicar</a></td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:FileUpload ID="fuReubicar" runat="server" onchange="img2(this);" />
                                                                </td>
                                                                <td>
                                                                    <img id="imgReubicar" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />
                                                                </td>
                                                            </tr>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Cableado desordenado</a></td>

                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpDesordenado" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblDesordenado" runat="server" CssClass="custom-checkbox" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblDesordenado_TextChanged" AutoPostBack="true">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>

                                                        <td>
                                                            <asp:FileUpload ID="fuDesordenado" runat="server" onchange="img3(this);" />
                                                        </td>
                                                        <td>
                                                            <img id="imgDesordenado" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />

                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Equipo expuesto a humedad o polvo</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpExpuestpHumedo" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblExpuestoHumedo" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>
                                                            <asp:FileUpload ID="fuExpuestoHumedo" runat="server" onchange="img4(this);" />
                                                        </td>
                                                        <td>
                                                            <img id="imgExpuestoHumedo" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />

                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Equipo expuesto a robo o daño</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpExpuestoRobo" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblExpuestoRobo" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>

                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>
                                                            <asp:FileUpload ID="fuExpuestoRobo" runat="server" onchange="img5(this);" />
                                                        </td>
                                                        <td>
                                                            <img id="imgExpuestoRobo" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Ajenos al equipo de comunicación</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpElemetoAjeno" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblElementoAjenos" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>
                                                            <asp:FileUpload ID="fuElemetoAjenos" runat="server" onchange="img6(this);" />
                                                        </td>
                                                        <td>
                                                            <img id="imgElementoAjeno" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />

                                                        </td>
                                                    </tr>
                                                

                                                </tbody>

                                            </table>
                                       

                                            <%-- TABLA 4 --%>
                                            <table class="table color-bordered-table muted-bordered-table table-bordered" data-tablesaw-mode="swipe">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw-priority="persist" class="border text-xl-center">Pregunta</th>
                                                        <th scope="col" data-tablesaw-sortable-coldata-tablesaw- sortable-default-coldata-tablesaw-priority="3" class="border text-xl-center">Si / No </th>

                                                    </tr>
                                                </thead>

                                                <tbody>


                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">¿Cuenta con UPS?</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpUps" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblUps" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">


                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>

                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">¿Cuenta con aire acondicionado?</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpAire" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblAire" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Categoria de cables</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpCategoria" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblCategoria" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Vertical">
                                                                        <asp:ListItem Value="5" Text="Categoria 5"></asp:ListItem>
                                                                        <asp:ListItem Value="6" Text="Categoria 6"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td class="title"><a class="link" href="javascript:void(0)">Estandares de rotulación?</a></td>
                                                        <td>
                                                            <asp:UpdatePanel runat="server" ID="udpRotulacion" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:RadioButtonList ID="rblRotulacion" runat="server" CssClass="custom-checkbox" BorderStyle="None" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="si" Text="Si"></asp:ListItem>
                                                                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>

                                                    </tr>


                                                </tbody>

                                            </table>
                                            <%-- </div>--%>

                                            <asp:UpdatePanel runat="server" ID="udpImgPlano" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <br />
                                                    <br />

                                                    <div class="row ">
                                                        <div class="col-md-12 align-content-center" >
                                                            <div class="form-group">
                                                                <asp:Label runat="server" ID="lbPlano"><h3>Plano del Estudio</h3> </asp:Label>
                                                                <asp:Label runat="server" ID="Label1"><h4>Imagen del plano de estudio a realizar</h4> </asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group" style="align-content:center">
                                                                <asp:FileUpload ID="fuPlano" runat="server" onchange="img7(this);" />
                                                               
                                                            </div>
                                                        </div>
                                                         <div class="col-md-6">
                                                            <div class="form-group" style="align-content:center">
                                                              
                                                                <img id="imgPlano" height="200" width="300" src="" style="border-width: 0px; visibility: hidden;" />
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

                        <%-- Sección 3 --%>
                        <div class="tab-pane p-20" id="nav_Materiales" role="tabpanel">
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Materiales a Solicitar según estudio</h4>
                                            <br />

                                            <div class="row">
                                                <asp:UpdatePanel runat="server" ID="udpMetariales" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="control-label"><b>Materiales</b></label>
                                                                <div class="col-sm-12">
                                                                    <asp:DropDownList ID="ddlMateriales" runat="server" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlMateriales_SelectedIndexChanged"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>


                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpCantidad" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <label class="control-label"><b>Cantidad</b></label>
                                                                <asp:TextBox ID="txtCantidad" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="form-group ">
                                                        <label class="control-label"><b>Unidades</b></label>
                                                        <asp:UpdatePanel runat="server" ID="udpUnidades" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="col-sm-12">
                                                                    <asp:DropDownList ID="ddlMedidas" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlMedidas_SelectedIndexChanged"></asp:DropDownList>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>

                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <br />
                                                    <asp:UpdatePanel runat="server" ID="udpAgregar" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnAgregar" runat="server" Text="ADD" class="btn  btn-block btn-success" OnClick="btnAgregar_Click" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:UpdatePanel ID="UpdateDivMateriales" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Materiales Agregados</h4>
                                                <p>Ordenados por fecha de ingreso</p>
                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <asp:GridView ID="GVMateriales" runat="server"
                                                                    CssClass="table table-bordered"
                                                                    AutoPostBack="true"
                                                                    PagerStyle-CssClass="pgr"
                                                                    HeaderStyle-CssClass="table"
                                                                    RowStyle-CssClass="rows"
                                                                    AutoGenerateColumns="false"
                                                                    AllowPaging="true"
                                                                    GridLines="None"
                                                                    PageSize="10"
                                                                    OnPageIndexChanging="GVMateriales_PageIndexChanging"
                                                                    OnRowCommand="GVMateriales_RowCommand">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Width="60px" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BtnBorrar" runat="server" Text="Eliminar" class="btn btn-inverse-primary  mr-2" CommandArgument='<%# Eval("numero") %>' CommandName="Eliminar" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="numero" HeaderText="Numero" Visible="true" />
                                                                        <asp:BoundField DataField="nombre" HeaderText="Material" />
                                                                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                                                                        <asp:BoundField DataField="medida" HeaderText="Unidades" />
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

                        <%-- Sección 4 --%>
                        <div class="tab-pane p-20" id="nav_Estimacion" role="tabpanel">
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Estimaciones de Recursos</h4>
                                            <br />
                                            <div class="row">

                                                <asp:UpdatePanel runat="server" ID="udpDuracion" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="control-label"><b>Duración del trabajo (Horas)</b></label>
                                                                <asp:TextBox ID="txtHorasTrabajo" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <asp:UpdatePanel runat="server" ID="udpParticipantes" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="control-label"><b>Número de participantes</b></label>
                                                                <asp:TextBox ID="txtParticipantes" runat="server" type="Number" class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpTransporte" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <label class="control-label"><b>Transporte</b></label>
                                                                <br />
                                                                <asp:RadioButtonList ID="rblTransporte" runat="server">
                                                                    <asp:ListItem Text="Si" Value="si"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>




                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="updAlimentacion" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <label class="control-label"><b>Alimentación</b></label>
                                                                <br />
                                                                <asp:RadioButtonList ID="rblALimentación" runat="server">
                                                                    <asp:ListItem Text="Si" Value="si"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpObservaciones" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <label class="control-label"><b>Observaciones</b></label>
                                                                <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" Rows="5" runat="server" type="text" class="form-control"></asp:TextBox>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpGuardar" UpdateMode="Conditional">
                                                            <ContentTemplate>

                                                                <div style="margin-left: auto; margin-right: auto; text-align: center; width: 40%;">
                                                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" type="button" class="btn btn-block btn-success" OnClick="btnGuardar_Click" />
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

                        <%-- Sección 5 --%>
                        <div class="tab-pane p-20" id="nav_Aprobacion" role="tabpanel">
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

                                            <h4 class="card-title">Aprobaciones</h4>
                                            <br />
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"><b>¿La información ingresada es aprobada como valida?</b></label>
                                                        <br />
                                                        <asp:UpdatePanel runat="server" ID="udpAprobado" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:RadioButtonList ID="rblAprobada" runat="server">
                                                                    <asp:ListItem Text="Si" Value="si"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="row col-6">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpObservacionesAprobacion" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <label class="control-label"><b>Observaciones </b></label>
                                                                <asp:TextBox TextMode="MultiLine" Rows="5" Columns="50" ID="txtObservacionesAprobacion" runat="server" type="text" class="form-control"></asp:TextBox>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>


                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <asp:UpdatePanel runat="server" ID="udpEnviar" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                 <div style="margin-left: auto; margin-right: auto; text-align: center; width: 40%;">
                                                                    <asp:Button ID="btnEnviarAprobacion" runat="server" Text="Enviar" type="button" class="btn btn-block btn-success" OnClick="btnEnviar_Click" />
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

                    </div>

                </div>
            </div>
        </div>
    </div>


      <%--MODAL DE PASSWORD EMPLEADO--%>

    <div class="modal fade" id="politicaprivacidad" tabindex="-1" role="dialog" aria-labelledby="aceptacion de condiciones" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="exampleModalLongTitle" style="color: black;font-weight: normal;">Política de privacidad   <span style="color: black;font-weight: bold;"><?php echo $nmhotel ?></span></h5>
                </div>
                <div class="modal-body">
                    <p style="color: black;line-height:25px;text-justify: auto;font-size: 1.2rem"><?php echo $condiciones ?> <a href="https://<?= $url ?>"> <?= $url ?></a> </p>
                    <br>
                    <div class="collapse" id="containerFiltro">
                        <p style="color: black;line-height:25px;text-justify: auto;font-size: 1.2rem"><?php echo $ingles ?> <a href="https://<?= $url ?>"> <?= $url ?></a> </p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button  class="btn btn-raised btn-warning ripple float-left"  data-toggle="collapse" data-target="#containerFiltro"  type="button">View in english</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- MODAL DE MENSAJE DE CONFIRMACIÓN --%>

    <div class="modal fade" id="MensajeAceptacionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbMensaje" runat="server" CssClass="align-content-center"><b>¿Está seguro de que desea guardar los cambios efectuados? </b></asp:Label>
                </div>

                <div class="modal-footer">
                    <asp:UpdatePanel ID="udpModGuardar" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <asp:Button ID="BtnModGuardar" runat="server" Text="Guardar" class="btn btn-primary" AutoPostBack="true" OnClick="BtnModGuardar_Click"/>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="BtnModGuardar" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>