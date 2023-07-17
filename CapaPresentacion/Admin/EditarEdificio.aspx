<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="EditarEdificio.aspx.cs" Inherits="CapaPresentacion.Admin.EditarEdificio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .ColumnaOculta {
            display: none;
        }

        span.radio {
            padding: 0px;
        }

            span.radio > input[type="radio"] {
                margin: 8px -5px 7px 0px;
            }

            span.radio > label {
                float: left;
                margin-right: 5px;
                padding: 0px 5px 0px 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
     <form runat="server"  class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" />
         <asp:ScriptManager runat="server" ID="ST"></asp:ScriptManager>
          <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">CREAR EDIFICIO
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
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" >
                            <ContentTemplate>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Nombre Edificio</label>
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
                                        <asp:DropDownList runat="server" ID="ddlPisos" AutoPostBack="true" CssClass="form-control" 
                                            OnSelectedIndexChanged="ddlPisos_SelectedIndexChanged" AppendDataBoundItems="true">
                                            <asp:ListItem Value="" Text="Seleccione"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                            <asp:ListItem Value="13" Text="13"></asp:ListItem>
                                            <asp:ListItem Value="14" Text="14"></asp:ListItem>
                                            <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese Nro Pisos"
                                            ControlToValidate="ddlPisos" InitialValue="" SetFocusOnError="true" ForeColor="Red"
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
                                    <div class="col-sm-2">
                                        <label class="control-label">Estado</label>
                                    </div>
                                     <div class="col-sm-4">
                                         <asp:RadioButtonList runat="server" ID="rdEstado" CssClass="checkbox-inline" RepeatLayout="Flow" repeatdirection="Horizontal">
                                             <asp:ListItem Value="1">SI</asp:ListItem>
                                             <asp:ListItem Value="0">NO</asp:ListItem>
                                         </asp:RadioButtonList>
                                         </div>
                                </div>
                                <legend>Agregar Habitaciones</legend>
                                <div class="form-group">
                                    <div class="col-md-2">
                                        <label class="control-label">Seleccione Piso</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList runat="server" ID="ddlPisosHotel" CssClass="form-control">
                                            <asp:ListItem Value="">Seleccione Piso</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Seleccione Piso"
                                            ControlToValidate="ddlPisosHotel" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="grouphab"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Cant.habitaciones</label>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:TextBox runat="server" ID="txtCantidadHab" CssClass="form-control solo-numero" placeholder="Cantidad"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese Cantidad"
                                            ControlToValidate="txtCantidadHab" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="grouphab"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label">Camas</label>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList runat="server" ID="ddlCantCamas" CssClass="form-control">
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label">Estado</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                                            <asp:ListItem Value="1">HABITABLE</asp:ListItem>
                                            <asp:ListItem Value="2">EN REPARACION</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button runat="server" ID="AgregarHab" CssClass="btn btn-success" OnClick="AgregarHab_Click" Text="Agregar Habitacíon" ValidationGroup="grouphab" CausesValidation="true" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:Repeater runat="server" ID="TabPiso">
                                            <ItemTemplate>
                                                <div class="col-md-12">
                                                    <div class="panel panel-primary">
                                                        <div class="panel-heading" style="padding: 7px;">
                                                            <span class="lnr lnr-dice"></span>
                                                            <asp:Label runat="server" ID="LbIdPiso" CssClass="ColumnaOculta" Text='<%# Eval("Id") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="LbPiso" CommandArgument='<%# Eval("Id") %>' Text='<%# Eval("Nombre") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <asp:GridView ID="gvhabitaciones" runat="server" AutoGenerateColumns="false" 
                                                                    CssClass="table table-striped table-bordered table-condensed" OnRowDataBound="gvhabitaciones_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField ItemStyle-CssClass="ColumnaOculta" HeaderStyle-CssClass="ColumnaOculta">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="LdIdHabitacion" HeaderText="LdIdHabitacion" runat="server" Text='<%# Eval("IdHabitacion")%>'></asp:Label>
                                                                                <asp:Label ID="LbIdEstado" HeaderText="LbIdEstado" runat="server" Text='<%# Eval("IdEstado")%>'></asp:Label>
                                                                                <asp:Label ID="IdTipoMoneda" HeaderText="IdTipoMoneda" runat="server" Text='<%# Eval("IdTipoMoneda")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="N°">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="LbNumeroHabitacion" runat="server" Text='<%# Eval("NumHabitacion")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Camas">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox runat="server" ID="txtNroCamashab" CssClass="form-control solo-numero" MaxLength="5" Text='<%# Eval("NumCamas")%>'></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Precio">
                                                                            <ItemTemplate>
                                                                                <div class="col-md-8">
                                                                                    <asp:DropDownList CssClass="form-control" ID="dllTipoMoneda" runat="server">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" onkeypress="return filterFloat(event,this);" MaxLength="10" Text='<%# Eval("Precio")%>'></asp:TextBox>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="22%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Estado" >
                                                                            <ItemTemplate>
                                                                                    <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                                                                                    <asp:ListItem Value="1">HABITABLE</asp:ListItem>
                                                                                    <asp:ListItem Value="2">EN REPARACION</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="20%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Eliminar">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton runat="server" ID="BtnEliminar" CssClass="btn btn-danger" CausesValidation="false" CommandArgument='<%#Eval("IdHabitacion")%>'
                                                                                    OnClick="BtnEliminar_Click" OnClientClick="return MostrarMensajesConfirm(this.id);"><span class="glyphicon glyphicon-trash fa-1x"></span></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                             <HeaderStyle Width="8%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="form-group">
                            <div class="text-right">
                                <div class="col-md-12">
                                    <asp:Button runat="server" ID="BtnGuardarHotel" CssClass="btn btn-success" ValidationGroup="groupPrincipal" OnClick="BtnGuardarHotel_Click" CausesValidation="true" Text="Guardar Hotel" />
                                    <input type="button" name="btnCancelar" value="Cancelar" class="btn btn-danger" onclick="Regresar();" />
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
                document.location = '<%= new CapaNegocio.Util().SecureUrl("Admin/ListadoHotel.aspx") %>';
            }
        }, 2000);
         function Regresar() {
             window.location.href = "ListadoHotel.aspx";
         }
         function MostrarMensajesConfirm(uniqueID) {
             if (confirm("Esta Seguro de Eliminar esta Habitacíon?"))
                 return true;
             else
                 return false;
         }
    </script>
</asp:Content>
