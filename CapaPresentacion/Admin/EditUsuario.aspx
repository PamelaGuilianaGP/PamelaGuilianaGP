<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="EditUsuario.aspx.cs" Inherits="CapaPresentacion.Admin.EditUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server" class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" Value="0"/>
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">Modificar Datos</div>
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

                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Identificador</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtIdentificador" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese identificador (DNI)"
                                            ControlToValidate="txtIdentificador" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="GroupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Nombre Usuario</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese Nombre de usuario"
                                            ControlToValidate="txtUsuario" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="GroupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">Tipo Usuario</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList runat="server" ID="ddlTipoUsuario" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Nombres</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Nombres"
                                            ControlToValidate="txtNombres" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="GroupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">Apellidos</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese Apellidos"
                                            ControlToValidate="txtApellidos" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="GroupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Correo</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese Correo"
                                            ControlToValidate="txtCorreo" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="GroupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">Activo</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButtonList runat="server" ID="RdActivo" RepeatDirection="Horizontal" CssClass="form-control">
                                            <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                                            <asp:ListItem Value="0">NO</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="text-right">
                                        <div class="col-md-12">
                                            <asp:Button runat="server" ID="BtnGuardar" CssClass="btn btn-success" OnClick="BtnGuardar_Click" ValidationGroup="GroupPrincipal" CausesValidation="true" Text="Actualizar Datos" />
                                            <input type="button" name="btnCancelar" value="Cancelar" class="btn btn-danger" onclick="Regresar();" />
                                        </div>
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
                document.location = '<%= new CapaNegocio.Util().SecureUrl("Admin/ListadoUsuarios.aspx") %>';
            }
        }, 2000);
         function Regresar() {
             window.location.href = "ListadoUsuarios.aspx";
         }
         function MostrarMensajesConfirm(uniqueID) {
             if (confirm("Esta Seguro de Eliminar esta Habitacíon?"))
                 return true;
             else
                 return false;
         }
    </script>
</asp:Content>
