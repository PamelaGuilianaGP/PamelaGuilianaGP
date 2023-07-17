<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="ListadoHuesped.aspx.cs" Inherits="CapaPresentacion.Admin.ListadoHuesped" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form action="/" runat="server" method="post">
        <asp:hiddenfield id="hfIdUsuario" runat="server" value="0" />
        <div class="main-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- BORDERED TABLE -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Listado Huesped</h3>
                                <div class="text-right">
                                    <a href="CrearHuesped.aspx" class="btn btn-primary">Crear Huesped</a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped table-bordered" style="width: 100%" id="dtBasicExample">
                                    <thead>
                                        <tr>
                                            <th>IDENTIFICADOR</th>
                                            <th>NOMBRES</th>
                                            <th>APELLIDOS</th>
                                            <th>TELEFONO</th>
                                            <th>NACIONALIDAD</th>
                                            <th>CORREO</th>
                                            <th>EDIT</th>
                                            <th>ELIMINAR</th>
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
                    url: "ListadoHuesped.aspx/ObtenerHuesped",
                    contentType: "application/json;",
                    dataType: "json",
                    success: function (resultado) {
                        
                        jsondata = JSON.parse(resultado.d);
                        var table = $('#dtBasicExample').DataTable({
                            "scrollX": true,
                            lengthChange: false,
                            data: jsondata,
                            columns: [
                                { data: 'IDENTIFICADOR' },
                                { data: 'NOMBRES' },
                                { data: 'APELLIDOS' },
                                { data: 'TELEFONO' },
                                { data: 'NACIONALIDAD' },
                                { data: 'CORREO' },
                                {
                                    data: 'ID',
                                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                        $(nTd).html("<a href='EditHuesped.aspx?IdHuesped=" + GetStringBase64(oData.ID) + "' class='btn btn-info btn-xs'><i class='glyphicon glyphicon-pencil'></i>&nbsp;Editar</a>");
                                    }
                                },
                                {
                                    data: 'ID',
                                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                        $(nTd).html("<a href=JavaScript:Eliminar('"+GetStringBase64(oData.ID)+"') class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i>&nbsp;Eliminar</a>");
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
        function Eliminar(IdHuesped) {
            swal({
              title: "Aviso",
              text: "Esta seguro que desea eliminar a este Huesped ?",
              icon: "warning",
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete)
                {
                    $.ajax({
                        type: "POST",
                        url: "ListadoHuesped.aspx/EliminaHuesped",
                        data: '{IdHuesped: "' + IdHuesped + '",IdUsuario:"' + $('#<%=hfIdUsuario.ClientID%>').val() + '"}',
                        contentType: "application/json;",
                        dataType: "json",
                        async: false,
                        success: function (resultado) {
                            if (resultado.d > 0) {
                                swal("Aviso", "Se elimino el huesped, Correctamente", "success");
                                setTimeout(function () {
                                    window.location.href = "ListadoHuesped.aspx";
                                }, 2000);
                            }
                            else
                                swal({ type: 'error', title: 'Oops...', text: 'Ocurrio un erro al eliminar el huesped si el error persiste comunicarse con el administrador' });
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                            var error = eval("(" + XMLHttpRequest.responseText + ")");
                            aler(error.Message);
                        }
                    });  
                } 
            });
            
        }
    </script>
</asp:Content>
