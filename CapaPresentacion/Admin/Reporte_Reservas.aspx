<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="Reporte_Reservas.aspx.cs" Inherits="CapaPresentacion.Admin.Reporte_Reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-datepicker.css" rel="stylesheet" />
    <style>
        .Full {
          background-color: #FBA394 !important;
        }
        .Libre {
          background-color: #7FF28E !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server"  class=" form-horizontal">
        <asp:hiddenfield id="hfIdUsuario" runat="server" value="0" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- BORDERED TABLE -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Reporte Reservas</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="col-md-2">
                                        <label class="control-label">Fecha Entrada</label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class='input-group date'>
                                            <input type='text' class="form-control DatePicker" data-date-format="dd/mm/yyyy" id="txtFecInicio" readonly />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2">
                                        <label class="control-label">Fecha Salida</label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class='input-group date'>
                                            <input type='text' class="form-control DatePicker" data-date-format="dd/mm/yyyy" id="txtxFecFin" readonly />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="text-center">
                                            <input type="button" name="BtnVerReporte" id="BtnVerReporte" value="Ver Reporte" class="btn btn-success"  />
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered" style="width: 100%" id="dtBasicExample">
                                    <thead>
                                        <tr>
                                            <th>EDIFICIO</th>
                                            <th>PISO</th>
                                            <th>N° HABITACÍON</th>
                                            <th>ESTADO</th>
                                            <th>CAMAS</th>
                                            <th>FECHA ENTRADA</th>
                                            <th>FECHA SALIDA</th>
                                            <th>CHECKOUT/IN</th>
                                            <th>RESUMEN</th>
                                        </tr>
                                    </thead>

                                </table>
                            </div>
                        </div>
                        <!-- END BORDERED TABLE -->
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script src="assets/scripts/jquery.dataTables.min.js"></script>
    <script src="assets/scripts/dataTables.bootstrap4.min.js"></script>
    <script src="assets/scripts/bootstrap-datepicker.min.js"></script>
    <script>
        var table;
        $(document).ready(function () {
            var date = new Date();
            var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        
            $(".DatePicker").datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: true,
                autoclose: true,
            });

            $('.DatePicker' ).datepicker( 'setDate', today );
            VerReporte();
            
        });
        $( "#BtnVerReporte" ).click(function() {
            table.destroy();
            VerReporte();
        });
        function VerReporte() {
            var jsondata = "";
            $.ajax({
                type: "POST",
                url: "Reporte_Reservas.aspx/Select_Reservas",
                data: "{FechaInicio:'" + $("#txtFecInicio").val() + "',FechaFin:'"+ $("#txtxFecFin").val() + "'}",
                contentType: "application/json;",
                dataType: "json",
                success: function (resultado) {

                    jsondata = JSON.parse(resultado.d);
                    table = $('#dtBasicExample').DataTable({
                        "scrollX": true,
                        lengthChange: false,
                        data: jsondata,
                        async:false,
                        columns: [
                            { data: 'NOMBRE_EDIFICIO' },
                            { data: 'PISO' },
                            {
                                data: 'NUMERO',
                                fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                        $(nTd).html("<span>Numero:" + oData.NUMERO + "</span>");
                                }},
                            {
                                data: 'NOMBRE_EDIFICIO',
                                fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                    if (oData.ESTADOHABITACION == "HABITABLE")
                                        $(nTd).html("<span class='label label-info'>" + oData.ESTADOHABITACION + "</span>");
                                    else
                                        $(nTd).html("<span class='label label-danger'>" + oData.ESTADOHABITACION + "</span>");
                                }
                            },
                            { data: 'CANTCAMAS' },
                            { data: 'FECHA_INICIO' },
                            { data: 'FECHA_FIN' },
                            {
                                data: 'CHECKOUTIN',
                                fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                    if (oData.FECHA_INICIO != null)
                                        $(nTd).html("<span>" + oData.CHECKOUTIN + "</span>");
                                    else
                                        $(nTd).html("<span></span>");
                                }
                            },
                            {
                                data: 'LIBRES',
                                fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                            $(nTd).html("<span>" + oData.LIBRES + " Libres </span>");
                                }
                            }

                        ],

                        "language": {
                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "Buscar:",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }
                        },
                        rowCallback: function (row, data, index) {
                            if (data.LIBRES == 0) {
                               $node = this.api().row(row).nodes().to$();
                               $node.addClass('Full')
                            }
                            else {
                               $node = this.api().row(row).nodes().to$();
                               $node.addClass('Libre')
                            }    
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                    var error = eval("(" + XMLHttpRequest.responseText + ")");
                    aler(error.Message);
                }
            });
        }
    </script>
</asp:Content>
