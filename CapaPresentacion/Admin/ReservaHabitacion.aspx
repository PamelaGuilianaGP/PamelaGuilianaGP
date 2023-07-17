<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservaHabitacion.aspx.cs" Inherits="CapaPresentacion.Admin.ReservaHabitacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reserva habitaciones</title>
    <meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <link rel="stylesheet" href="assets/css/demo.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet"/>
    <link rel="icon" type="image/png" sizes="96x96" href="../images/icons/favicon.png"/>
    <style>
        .ColumnaOculta {
            display: none;
        }
    </style>
</head>
<body>
     <form runat="server"  class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" />
         <asp:ScriptManager runat="server" ID="ST"></asp:ScriptManager>
          <div class="main-content" >
            <div class="container-fluid">
                <div class="panel panel-primary" style="margin-left: -14px;margin-right: -14px;">
                    <div class="panel-heading">MODULO DE RESERVAS EN <asp:Label runat="server" ID="LbEdificio" ></asp:Label>
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
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" >
                            <ContentTemplate>

                                <div class="form-group">
                                    <asp:Repeater runat="server" ID="TabPiso">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading" style="padding: 7px;">
                                                        <i class='fas fa-building' style='font-size:20px'></i>
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
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="N°" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LbNumeroHabitacion" runat="server" Text='<%# Eval("NumHabitacion")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="5%" HorizontalAlign="center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Camas Disponibles" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LbCamasDisponibles" style='font-size:20px;margin-right: 4px;' runat="server" Text='<%# Eval("CamasDisponibles")%>'>&nbsp;&nbsp;</asp:Label><i class='fas fa-bed' style='font-size:20px'></i>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="10%" HorizontalAlign="center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Reservados">
                                                                        <ItemTemplate>
                                                                            <asp:Table ID="TableReservados" runat="server"  CssClass="table table-striped table-bordered table-condensed">
                                                                               
                                                                            </asp:Table>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="50%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CheckIn-Out" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                           
                                                                            <i class='fas fa-arrow-alt-circle-left' style='font-size:30px'></i>
                                                                            <i class='fas fa-arrow-alt-circle-right' style='font-size:30px'></i>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="15%"  HorizontalAlign="center"  />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Reservar">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="BtnReservar" CssClass="btn btn-success btn-xs" CausesValidation="false" CommandArgument='<%#Eval("IdHabitacion")%>'
                                                                                OnClientClick="return MostrarMensajesConfirm(this.id);"><span class="glyphicon glyphicon-bed fa-1x"></span></asp:LinkButton>
                                                                            <asp:LinkButton runat="server" ID="BtnVerDetalle" CssClass="btn btn-warning btn-xs" CausesValidation="false" CommandArgument='<%#Eval("IdHabitacion")%>'
                                                                                OnClientClick="return MostrarMensajesConfirm(this.id);"><span class="glyphicon glyphicon-eye-open fa-1x"></span></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="15%" />
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="form-group">
                            <div class="text-right">
                                <div class="col-md-12">
                                    <input type="button" name="btnCancelar" value="Cancelar" class="btn btn-danger" onclick="Regresar();" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
         </form>
</body>
<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</html>
