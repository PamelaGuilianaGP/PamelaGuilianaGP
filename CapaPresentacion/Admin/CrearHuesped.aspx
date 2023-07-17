<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="CrearHuesped.aspx.cs" Inherits="CapaPresentacion.Admin.CrearHuesped" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server" class="form-horizontal" id="frm">
        <asp:hiddenfield runat="server" id="hfIdUsuario" value="0" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">Crear Huesped</div>
                    <div class="panel-body">
                        <div class="alert alert-success alert-dismissable" id="div_msg" runat="server" visible="false">
                            <h4 class="alert-heading">Correcto!</h4>
                            <asp:label id="lbmsg" runat="server" text=""></asp:label>
                        </div>
                        <div class="alert alert-danger alert-dismissable" id="div_msgerror" runat="server" visible="false">
                            <h4 class="alert-heading">Error!</h4>
                            <asp:label id="lbmsgerror" runat="server" text=""></asp:label>
                        </div>
                        <fieldset>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label class="control-label">Identificador</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtIdentificador" runat="server" cssclass="form-control" Onblur="ValidaIdentificador(this.value)"></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" errormessage="Ingrese identificador (DNI)"
                                        controltovalidate="txtIdentificador" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                                <div class="col-sm-2">
                                    <label class="control-label">Nacionalidad</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtNacionalidad" runat="server" cssclass="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" errormessage="Ingrese Nacionalidad"
                                        controltovalidate="txtNacionalidad" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label class="control-label">Nombres</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtNombres" runat="server" cssclass="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" errormessage="Ingrese Nombres"
                                        controltovalidate="txtNombres" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                                <div class="col-sm-2">
                                    <label class="control-label">Apellidos</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtApellidos" runat="server" cssclass="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" errormessage="Ingrese Apellidos"
                                        controltovalidate="txtApellidos" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label class="control-label">Telefono</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtTelefono" runat="server" cssclass="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" errormessage="Ingrese telefono"
                                        controltovalidate="txtTelefono" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                                <div class="col-sm-2">
                                    <label class="control-label">Correo</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:textbox id="txtCorreo" runat="server" cssclass="form-control" onchange="ValidaCorreo(this.value);" ></asp:textbox>
                                    <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" errormessage="Ingrese Correo"
                                        controltovalidate="txtCorreo" initialvalue="" setfocusonerror="true" forecolor="Red" validationgroup="GroupPrincipal"></asp:requiredfieldvalidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <label class="control-label">Estado</label>
                                </div>
                                <div class="col-md-4">
                                   <asp:RadioButtonList runat="server" ID="RdActico" CssClass="form-control" RepeatDirection="Horizontal">
                                       <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                                       <asp:ListItem Value="2">InActivo</asp:ListItem>
                                   </asp:RadioButtonList>
                                </div>
                            </div>
                             <div class="form-group">
                                    <div class="text-right">
                                        <div class="col-md-12">
                                            <asp:Button runat="server" ID="BtnGuardar" CssClass="btn btn-success" OnClick="BtnGuardar_Click" ValidationGroup="GroupPrincipal" CausesValidation="true" Text="Guardar" />
                                            <input type="button" name="btnCancelar" value="Cancelar" class="btn btn-danger" onclick="Regresar();" />
                                        </div>
                                    </div>
                                </div>
                        </fieldset>
                    </div>

                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
     <script>
        setTimeout(function () {
            if ($('#<%= div_msg.ClientID %>').val() == "") {
                $('#<%= div_msg.ClientID %>').hide('slow');
                document.location = '<%= new CapaNegocio.Util().SecureUrl("Admin/ListadoHuesped.aspx") %>';
            }
        }, 3000);
         function Regresar() {
             window.location.href = "ListadoHuesped.aspx";
        }
        function ValidaCorreo(Value) {
             $("#<%= BtnGuardar.ClientID%>").attr("disabled", false);
            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (!filter.test(Value)) {
                $("#<%= BtnGuardar.ClientID%>").attr("disabled", true);
                swal({ type: 'error', title: 'Oops...', text: 'El correo ingresado es invalido' });
            }
                
         }
         function ValidaIdentificador(value) {
             $.ajax({
                 type: "POST",
                 url: 'CrearHuesped.aspx/Valida_Identicador_Huesped',
                 data: "{ 'Identificador': '" + value + "'}",
                 contentType: "application/json;",
                 dataType: "json",
                 success: function (data) {
                     if (data.d == "1") {
                         $("#<%= BtnGuardar.ClientID%>").attr("disabled", false);
                     }
                     else {
                         $("#<%= BtnGuardar.ClientID%>").attr("disabled", true);
                         swal({ type: 'error', title: 'Oops...', text: 'El identificador ya esta siendo usado por otro huesped' })
                     }

                 }
             });
         }
    </script>
</asp:Content>
