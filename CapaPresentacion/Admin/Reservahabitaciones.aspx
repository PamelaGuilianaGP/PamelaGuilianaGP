<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="Reservahabitaciones.aspx.cs" Inherits="CapaPresentacion.Admin.Reservahabitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <link href="assets/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="assets/css/fullcalendar.css" rel="stylesheet" />
    <link href="assets/css/jquery-ui.css" rel="stylesheet" />

    <style>
        .ColumnaOculta {
            display: none;
        }
        ul.ui-autocomplete {
            z-index: 1100;
        }
        td {
            vertical-align:middle !important;
            text-align:center !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server" class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" />
        <asp:ScriptManager runat="server" ID="ST"></asp:ScriptManager>
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary" style="margin-left: -14px; margin-right: -14px;">
                    <div class="panel-heading">
                        MODULO DE RESERVAS EN
                        <asp:Label runat="server" ID="LbEdificio"></asp:Label>
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
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                            <ContentTemplate>

                                <div class="form-group">
                                    <asp:Repeater runat="server" ID="TabPiso">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading" style="padding: 7px;">
                                                        <i class='fas fa-building' style='font-size: 20px'></i>
                                                        <asp:Label runat="server" ID="LbIdPiso" CssClass="ColumnaOculta" Text='<%# Eval("Id") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="LbPiso" CommandArgument='<%# Eval("Id") %>' Text='<%# Eval("Nombre") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-group" style="overflow-x:auto;white-space:nowrap;">
                                                            <asp:GridView ID="gvhabitaciones" runat="server" AutoGenerateColumns="false" RowStyle-VerticalAlign="Middle"
                                                                CssClass="table table-striped table-bordered table-condensed" OnRowDataBound="gvhabitaciones_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField ItemStyle-CssClass="ColumnaOculta" HeaderStyle-CssClass="ColumnaOculta">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LdIdHabitacion" HeaderText="LdIdHabitacion" runat="server" Text='<%# Eval("IdHabitacion")%>'></asp:Label>
                                                                            <asp:Label ID="LbIdEstado" HeaderText="LbIdEstado" runat="server" Text='<%# Eval("IdEstado")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="N°" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LbNumeroHabitacion" runat="server" Text='<%# Eval("NumHabitacion")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Camas" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LbCamasDisponibles" CssClass="label label-success" Style='font-size: 14px; margin-right: 4px;' runat="server" Text='<%# Eval("CamasDisponibles")%>'>&nbsp;&nbsp;</asp:Label><i class='fas fa-bed' ></i>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="10%" HorizontalAlign="center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Reservados" HeaderStyle-VerticalAlign="Middle" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <asp:Table ID="TableReservados" runat="server" CssClass="table table-striped table-bordered table-condensed">
                                                                                
                                                                            </asp:Table>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="65%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Reservar">
                                                                        <ItemTemplate>
                                                                            <a href="JavaScript:<%# "OpenModalReserva(" +Eval("IdHabitacion") + " );"%>" class="btn btn-success btn-xs" >
                                                                                <span class="glyphicon glyphicon-bed fa-1x"></span></a>
                                                                            <a href="JavaScript:<%# "OpenModalVisual(" +Eval("IdHabitacion") + " );"%>" class="btn btn-warning btn-xs">
                                                                                <span class="glyphicon glyphicon-eye-open fa-1x"></span></a>

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
     <!--Modal Reservas-->
    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="overflow-y: scroll;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nueva Reserva</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                                <div class="col-sm-12">
                                <label for="recipient-name" class="col-form-label">Ingrese identificador:</label>
                                <input type="text" class="form-control" id="txtIdentificador" name="txtIdentificador" data-provide="typeahead"  autocomplete="off"/>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" style="background-color:#3dade4;color:white;">
                                <h5 class="panel-title">Mostrar Calendarizacíon</h5>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up lnr-chevron-down"></i></button>
                                </div>
                            </div>
                            <div class="panel-body" style="display: none;">
                                <div class="form-group">
                                    <div id="calendar" class="Calendario"></div>
                                </div>
                            </div>
                        </div>
                        <!-- PANEL DEFAULT -->
                        <div class="panel">
                            <div class="panel-heading" style="background-color:#3dade4;color:white;">
                                <h5 class="panel-title">Esconder Datos</h5>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                </div>
                            </div>
                            <div class="panel-body">
                                
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Nombres:</label>
                                    <input type="text" class="form-control" id="txtNombres" />
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Apellidos:</label>
                                    <input class="form-control" id="txtApellidos" />
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Nacionalidad:</label>
                                    <input class="form-control" id="txtNacionalidad" />
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Telefono:</label>
                                    <input class="form-control" id="txtTelefono" />
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Correo:</label>
                                    <input class="form-control" id="txtCorreo" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                            <label for="recipient-name" class="col-form-label">Fecha Ingreso:</label>
                                <div class='input-group date' >
                                    <input type='text' class="form-control DatePicker" data-date-format="dd/mm/yyyy"  id="txtFecInicio" readonly />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                                </div>
                            <div class="col-sm-6">
                               <label for="recipient-name" class="col-form-label">Fecha Salida:</label>
                                <div class='input-group date' >
                                    <input type='text' class="form-control DatePicker" data-date-format="dd/mm/yyyy" id="txtxFecFin" readonly/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                                
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label for="recipient-name" class="col-form-label">Comentario:</label>
                                <textarea class="form-control" id="Coment" name="Coment"></textarea>
                            </div>
                        </div>
                        <input type="hidden" name="IdHab" id="IdHab" value="" />
                        <input type="hidden" name="IdHuesped" id="IdHuesped" value="0" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="GuardarReserva();">Reservar</button>
                </div>
            </div>
        </div>
    </div>
     <!--Modal ModalVisual-->
    <div class="modal fade bd-example-modal-lg" id="ModalVisual" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="overflow-y: scroll;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Visualizar Reservas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="panel">
                            <div class="panel-heading" style="background-color:#3dade4;color:white;">
                                <h5 class="panel-title">Mostrar Calendarizacíon</h5>
                                <div class="right">
                                     <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div id="s" class="Calendario"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script src="assets/scripts/bootstrap-datepicker.min.js"></script>
    <script src="assets/scripts/moment.min.js"></script>
    <script src="assets/scripts/fullcalendar.min.js"></script>
    <script src="assets/scripts/es.js"></script>
    
    <script>
         $("#txtIdentificador").autocomplete({
            source: function (request, response) {
              
                $.ajax({
                        type: "POST",
                        url: 'Reservahabitaciones.aspx/GetHuesped',
                        data: "{ 'Identificador': '" + request.term + "'}",
                        contentType: "application/json;",
                        dataType: "json",
                        success: function (data) {
                        //alert(data.d);
                        response($.map($.parseJSON(data.d), function (el) {
                            return {
                                value: el.IDENTIFICADOR,
                                id: el.ID,
                                nombres: el.NOMBRES,
                                apellidos: el.APELLIDOS,
                                telefono: el.TELEFONO,
                                correo: el.CORREO,
                                nacionalidad:el.NACIONALIDAD,
                                 };
                             }));

                        }

                });
            },
            minLength: 2,
            select: function (event, ui) {
                $("#txtIdentificador").val(ui.item.value);
                $("#txtNombres").val(ui.item.nombres);
                $("#txtApellidos").val(ui.item.apellidos);
                $("#txtTelefono").val(ui.item.telefono);
                $("#txtNacionalidad").val(ui.item.nacionalidad);
                $("#txtCorreo").val(ui.item.correo);
                $("#IdHuesped").val(ui.item.id)
            },
            open: function () {
                $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
            },
            close: function () {
                $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
            }
        });
    </script>
    <script>
       
        function OpenModalReserva(Idhabitacion) {
            $('#IdHab').val(Idhabitacion);
            GetCalendarizacion();
            $('#exampleModal').modal('show')
        }
        function OpenModalVisual(Idhabitacion) {
            $('#IdHab').val(Idhabitacion);
            GetCalendarizacion();
            $('#ModalVisual').modal('show')
        }
       
        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        
        $(".DatePicker").datepicker({
            format: 'dd/mm/yyyy',
            todayHighlight: true,
            autoclose: true,
        });

         $('.DatePicker' ).datepicker( 'setDate', today );
    </script>
    <script>
        function GuardarReserva() {
            if (ValidaForm()) {
                $.ajax({
                 url: 'Reservahabitaciones.aspx/GuardarReserva',
                 data: "{Identificador: '" + $("#txtIdentificador").val() + "',"+
                     "Nombres: '" + $("#txtNombres").val() + "'," +
                     "Apellidos: '" + $("#txtApellidos").val() + "'," +
                     "Nacionalidad: '" + $("#txtNacionalidad").val() + "'," +
                     "Telefono: '" + $("#txtTelefono").val() + "'," +
                     "Correo: '" + $("#txtCorreo").val() + "'," +
                     "FechaIngreso:'" + $("#txtFecInicio").val() + "'," +
                     "FechaSalida:'" + $("#txtxFecFin").val() + "'," +
                     "Comentario:'"+$("#Coment").val()+"',"+
                     "Idhabitacion:'" + $("#IdHab").val() + "'," +
                     "IdHuesped:'" + $("#IdHuesped").val() + "'," +
                     "IdUsuario:'" + $("#<%=hfIdUsuario.ClientID %>").val() + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == "ok") {
                            swal("Aviso", data.d, "success");
                            $('#exampleModal').modal('hide');
                            location.reload();
                        } else {
                            swal({
                            type: 'error',
                                title: 'Oops...',
                                text: data.d
                            })
                        }
                 
                    }
                });
            }
         
        }
        function ValidaForm()
        {
            var Flag = false;
            if ($("#txtIdentificador").val() != "") {
                if ($("#txtNombres").val() != "") {
                    if ($("#txtApellidos").val() != "") {
                        if ($("#txtTelefono").val() != "") {
                            if ($("#txtFecInicio").val() != "" && $("#txtxFecFin").val() != "") 
                                Flag = true;
                            else
                                swal("Ingrese Fechas");
                        }
                        else
                            swal("Ingrese Telefono");
                    }
                    else
                        swal("Ingrese Nombres");
                }
                else
                    swal("Ingrese Nombres");
            }
            else
                swal("Ingrese Identificador");

            return Flag;
        }
    </script>
    <script>
        function RealizarCheckInOut(IdReserva,Check)
        {
            swal({
              title: "Aviso",
              text: "Esta seguro de realizar el Check" + Check + " ?",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete)
                {
                    $.ajax({
                        type: "POST",
                        url: 'Reservahabitaciones.aspx/Realizar_CheckIN_CheckOUT',
                        data: "{ 'IdReserva': '" +IdReserva + "','Idusuario':'" + $("#<%=hfIdUsuario.ClientID %>").val() + "','Tipo':'"+Check+"'}",
                        contentType: "application/json;",
                        dataType: "json",
                        success: function (data) {
                            if (data.d != "0") {
                                swal(data.d, { icon: "success", });
                                 location.reload();
                            }
                            else {
                                swal({type: 'error',title: 'Oops...',text: 'Ocurrio un error , si persiste comunicarse con el administrador'})
                            }

                        }
                    });  
                } 
            });
        }
    </script>
    <script>
         var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        var DataCalendar;
        function GetCalendarizacion() {
            $('.Calendario').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay',
                    lang: 'es'
                },
                defaultDate: today,
                navLinks: false,
                editable: false,
                eventLimit: true,
                events: function (start, end, timezone, callback) {
                    $.ajax({
                        type: "POST",
                        url: 'Reservahabitaciones.aspx/Reservas_Por_Habitacion',
                        data: "{ 'IdHabitacion': '" + $('#IdHab').val() + "'}",
                        contentType: "application/json;",
                        dataType: "json",
                        success: function (data) {
                            var events = [];
                            $.each($.parseJSON(data.d), function(i, item) {
                                events.push({
                                    title: item.NOMBRES,
                                    start: item.FECINICIO,
                                    end: item.FECFIN
                                });
                            })
                           
                            callback(events);

                        }
                    });
                }
            }); 
        }
        
    </script>
    <script>
        function EliminarReserva(IdReserva) {

            swal({
                  title: "Aviso!",
                  text: 'Si desea eliminar esta reserva tiene que ingresar el motivo:',
                  content: "input",
                  icon: "warning",
                  dangerMode: true,
                  button: {
                      text: "Eliminar!",
                      closeModal: false,
                },

            })
                .then(name => {
                    if (name != "" && name != null) {
                    $.ajax({
                        type: "POST",
                        url: 'Reservahabitaciones.aspx/EliminarReserva',
                        data: "{ 'IdReserva': '" +IdReserva + "','IdUsuario':'" + $("#<%=hfIdUsuario.ClientID %>").val() + "',Comentario:'"+name+"'}",
                        contentType: "application/json;",
                        dataType: "json",
                        success: function (data) {
                            if (data.d != "0") {
                                 swal("Bien!", data.d, "success");
                                 location.reload();
                            }
                            else {
                                swal({type: 'error',title: 'Oops...',text: 'Ocurrio un error , si persiste comunicarse con el administrador'})
                            }

                        }
                    });
                }
                else
                    swal({type: 'error',title: 'Oops...',text: 'Tiene que ingresar un motivo por que se esta eliminando la reserva'})
            })

        }
    </script>
    <script>
       function Regresar() {
             window.location.href = "ListadoHotel.aspx";
         }
    </script>
</asp:Content>
