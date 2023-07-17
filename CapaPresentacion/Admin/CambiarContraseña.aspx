<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="CambiarContraseña.aspx.cs" Inherits="CapaPresentacion.Admin.CambiarContraseña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server"  class="form-horizontal">
         <asp:HiddenField runat="server" ID="hfIdUsuario" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">CAMBIAR CONTRASEÑA
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-success alert-dismissable" id="div_msg" runat="server" visible="false">
                            <h4 class="alert-heading">Correcto!</h4>
                            <asp:Label ID="lbmsg" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="alert alert-danger alert-dismissable" id="div_msgerror" runat="server" visible="false">
                            <h4 class="alert-heading">Error!</h4>
                            <asp:Label ID="lbmsgerror" runat="server" Text=""></asp:Label>
                        </div>
                        <fieldset>
                            <div class="form-group">
                                <div class="col-md-12">
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-group">
                            <div class="col-sm-2">
                                <label class="control-label">Usuario</label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label runat="server" CssClass="control-label" ID="lbUsuario"></asp:Label>
                            </div>
                            <div class="col-sm-2">
                                <label class="control-label">Correo</label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label runat="server" CssClass="control-label" ID="lbCorreo"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label class="control-label">Contraseña Actual</label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="txtContrasenaActual" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese contraseña actual"
                                    ControlToValidate="txtContrasenaActual" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label class="control-label">Contraseña Nueva</label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="txtPassNew1" CssClass="form-control" onchange="ValidaPass();" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Contraseña Nueva"
                                    ControlToValidate="txtPassNew1" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            </div>
                             <div class="col-sm-2">
                                <label class="control-label">Repita Contraseña Nueva</label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="txtPassNew2" CssClass="form-control" onchange="ValidaPass();" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Repita Contraseña Nueva"
                                    ControlToValidate="txtPassNew2" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="text-right">
                                <div class="col-md-12">
                                    <asp:Button runat="server" ID="BtnGuardar" CssClass="btn btn-success" ValidationGroup="groupPrincipal" CausesValidation="true" Text="Guardar" OnClick="BtnGuardar_Click" />
                                    <input type="button" name="Cancelar" id="Cancelar" class="btn btn-danger" value="Cancelar" onclick="Regresar();" />
                                </div>
                            </div>
                        </div>
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
                document.location = '<%= new CapaNegocio.Util().SecureUrl("Admin/Index.aspx") %>';
            }
        }, 2000);
         function Regresar() {
             window.location.href = "Index.aspx";
         }
    </script>
    <script>
        function ValidaPass()
        {
            if ($("#<%=txtPassNew1.ClientID%>").val() != "" && $("#<%=txtPassNew2.ClientID%>").val() != "") {
                if ($("#<%=txtPassNew1.ClientID%>").val() != $("#<%=txtPassNew2.ClientID%>").val()) {
                    $("#<%=BtnGuardar.ClientID%>").prop('disabled', true);
                    swal({ type: 'error', title: 'Oops...', text: 'Las contraseñas no coinciden,Vuelva ingresar' });
                }
                else
                     $("#<%=BtnGuardar.ClientID%>").prop('disabled', false);
            }
        }
    </script>
</asp:Content>
