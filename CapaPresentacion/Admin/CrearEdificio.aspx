<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="CrearEdificio.aspx.cs" Inherits="CapaPresentacion.Admin.CrearEdificio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server"  class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">CREAR EDIFICIO
                    </div>
                    <div class="panel-body">

                        <fieldset>
                            <div class="form-group">
                                <div class="col-md-12">
                                  
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label class="control-label"> Nombre Edificio</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtEdificio" CssClass="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese nombre del edificio"
                                        ControlToValidate="txtEdificio" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                <label class="control-label">Nro de pisos</label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox runat="server" ID="txtPisos" CssClass="form-control solo-numero"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Nro Pisos"
                                    ControlToValidate="txtPisos" InitialValue="" SetFocusOnError="true" ForeColor="Red" 
                                    ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label class="control-label">Descripcíon</label>
                            </div>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="text-right">
                                <div class="col-md-12">
                                    <asp:Button runat="server" ID="BtnGuardarHotel" CssClass="btn btn-success" ValidationGroup="groupPrincipal" CausesValidation="true" Text="Guardar Hotel" OnClick="BtnGuardarHotel_Click" />
                                    <asp:Button runat="server" ID="BtnCancelar" CssClass="btn btn-danger" OnClientClick="Regresar();" Text="Cancelar" />
                                </div>
                            </div>
                            </div>
                    </div>
                </div>


            </div>
        </div>
        <asp:Label runat="server" ID="lbMsg" Text="0"></asp:Label>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script>
        function MostrarAlerta() {
            if ($("#<%=lbMsg.ClientID%>").text() == "1") {
                swal("Aviso","Edificio Creado Correctamente" , "success");
            }
            else
               swal("Error", "Si el error persite comuniquese con el administrador", "error");
           
        }
        function Regresar() {
             window.location.href = "ListadoHotel.aspx";
         }
    </script>
</asp:Content>
