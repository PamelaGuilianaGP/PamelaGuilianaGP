<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="ListadoHotel.aspx.cs" Inherits="CapaPresentacion.Admin.ListadoHotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form action="/" runat="server" method="post">
        <div class="main-content">
            <div class="container-fluid">
                <asp:HiddenField id="hfIdUsuario" runat="server" Value="0"/>
                <div class="row">
                    <div class="col-md-12">
                        <!-- BORDERED TABLE -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Listado Hotel</h3>
                                <div class="text-right">
                                    <a href="CrearEdificio.aspx"  class="btn btn-primary">Crear Edificio</a>
                                    
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped table-bordered" style="width: 100%" id="dtBasicExample">
                                    <thead>
                                        <tr>
                                            <th>EDIFICIO</th>
                                            <th>DESCRIPCION</th>
                                            <th>ESTADO</th>
                                            <th>PISOS</th>
                                            <th>HABITACIONES</th>
                                            <th>LIBRES</th>
                                            <th>EDIT</th>
                                            <th>RESERVAR</th>
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

    <script>
        $(document).ready(function () {
            var jsondata = "";
                $.ajax({
                    type: "POST",
                    url: "ListadoHotel.aspx/ObtenerEdificio",
                    contentType: "application/json;",
                    dataType: "json",
                    success: function (resultado) {
                        
                        jsondata = JSON.parse(resultado.d);
                        var table = $('#dtBasicExample').DataTable({
                            "scrollX": true,
                            lengthChange: false,
                            data: jsondata,
                            columns: [
                                { data: 'NOMBRE_EDIFICIO' },
                                { data: 'DESCRIPCION' },
                                { data: 'ESTADO' },
                                { data: 'PISOS' },
                                { data: 'HABITACIONES' },
                                { data: 'LIBRES' },
                                {
                                    data: 'ID',
                                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                        $(nTd).html("<a href='EditarEdificio.aspx?Id=" + GetStringBase64(oData.ID) + "' class='btn btn-info btn-xs'><i class='glyphicon glyphicon-pencil'></i>&nbsp;Editar</a>");
                                    }
                                },
                                {
                                    data: 'ID',
                                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                        $(nTd).html("<a href='Reservahabitaciones.aspx?Id=" + GetStringBase64(oData.ID) + "' class='btn btn-success btn-xs'><i class='glyphicon glyphicon glyphicon-bed'></i>&nbsp;Reservar</a>");
                                    }
                                },

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
                            }
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                        var error = eval("(" + XMLHttpRequest.responseText + ")");
                        aler(error.Message);
                    }
                });
            
        });
        function GoCreate() {
            window.location.href = "CrearEdificio.aspx";
        }
        function GetStringBase64(cadena) {
            var ParamEncode64 = "";
            $.ajax({
                type: "POST",
                url: "ListadoHotel.aspx/EncrypBase64",
                data: '{Param: "' + cadena + '"}',
                contentType: "application/json;",
                dataType: "json",
                async:false,
                success: function (resultado) {
                    ParamEncode64 = resultado.d;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                    var error = eval("(" + XMLHttpRequest.responseText + ")");
                    aler(error.Message);
                }
            });
            return ParamEncode64;
        }
        
    </script>
</asp:Content>
