<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGaleria.aspx.cs" Inherits="CapaPresentacion.Admin.AdminGaleria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="assets/css/fileinput.min.css" rel="stylesheet" />
      
    <style>
         .ColumnaOculta {
            display: none;
        }
        .ImgHover:hover{
           opacity: 0.7;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <form runat="server" class="form-horizontal">
        <asp:HiddenField runat="server" ID="hfIdUsuario" Value="0" />
        <asp:ScriptManager runat="server" ID="ST"></asp:ScriptManager>
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">Administracíon de galeria</div>
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
                                    <div class="col-md-12">
                                        <asp:FileUpload runat="server" ID="FileUpload" AllowMultiple="true" />
                                        <SMALL class="form-text text-muted">
                                            El tamaño ideal para las fotos de portadas es 1900px por 930px
                                        </SMALL>
                                        <asp:RequiredFieldValidator runat="server" ID="rfFile" ControlToValidate="FileUpload" 
                                            ErrorMessage="Seleccione Fotos" ForeColor="Red" SetFocusOnError="true" InitialValue=""
                                             ValidationGroup="GroupFile">

                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12 text-right">
                                        <asp:Button runat="server" ID="btnSubirFotos" ValidationGroup="GroupFile" CssClass="btn btn-success" Text="Subir Fotos" OnClick="btnSubirFotos_Click" />
                                    </div>
                                </div>
                                <div class="panel panel-primary">
                                    <div class="panel-heading">Listado de fotos</div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <asp:GridView runat="server" ID="GvGaleria" AutoGenerateColumns="false" RowStyle-VerticalAlign="Middle"
                                                CssClass="table table-striped table-bordered table-condensed" OnRowDataBound="GvGaleria_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-CssClass="ColumnaOculta" HeaderStyle-CssClass="ColumnaOculta">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LbActivo" HeaderText="LbActivo" runat="server" Text='<%# Eval("ACTIVO")%>'></asp:Label>
                                                            <asp:Label ID="LbPortada" HeaderText="LbPortada" runat="server" Text='<%# Eval("PORTADA")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Foto">
                                                        <ItemTemplate>
                                                            <div class="col-md-12">
                                                                <a href="JavaScript:MostrarFoto('<%# Eval("LINKFOTO")%>')">
                                                                    <asp:Image runat="server" ImageUrl='<%# Eval("LINKFOTO")%>' ID="ImgGaleria" Style="width: 100%; height: 217px;" CssClass="img-responsive ImgHover" />
                                                                </a>
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Activo">
                                                        <ItemTemplate>
                                                            <asp:RadioButtonList runat="server" CssClass="form-control" ID="RdActivo" RepeatDirection="Vertical">
                                                                <asp:ListItem Value="SI">SI</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Portada">
                                                        <ItemTemplate>
                                                            <asp:RadioButtonList runat="server" CssClass="form-control" ID="RdPortada" RepeatDirection="Vertical">
                                                                <asp:ListItem Value="SI">SI</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Orden">
                                                        <ItemTemplate>
                                                            <asp:TextBox runat="server" ID="txtOrden" CssClass="form-control solo-numero" Text='<%# Eval("ORDEN")%>'></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripcíon Español">
                                                        <ItemTemplate>
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class="control-label">Descripcíon 1</label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" TextMode="MultiLine" Text='<%# Eval("DESCRIPCION")%>'></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class="control-label">Descripcíon 2</label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <asp:TextBox runat="server" ID="txtDescripcion2" CssClass="form-control" TextMode="MultiLine" Text='<%# Eval("DESCRIPCION2")%>'></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripcíon Ingles">
                                                        <ItemTemplate>
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class="control-label">Descripcíon 1</label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <asp:TextBox runat="server" ID="txtDescripcionEn" CssClass="form-control" TextMode="MultiLine" Text='<%# Eval("DESCRIPCION_EN")%>'></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class="control-label">Descripcíon 2</label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <asp:TextBox runat="server" ID="txtDescripcion2En" CssClass="form-control" TextMode="MultiLine" Text='<%# Eval("DESCRIPCION2_EN")%>'></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="El.">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="BtnEliminar" CssClass="btn btn-danger btn-xs" CommandArgument='<%#Eval("ID")%>' OnClientClick="return MostrarMensajesConfirm(this.id);">
                                                               <i class='glyphicon glyphicon-remove'></i>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade bd-example-modal-lg" id="MyModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="../images/photo1.jgp" alt="Foto Galeria" id="ImgGaleria"  class="img-responsive" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script src="assets/scripts/fileinput.min.js"></script>
    <script src="assets/scripts/esFileInput.js"></script>
   
    <script>
        setTimeout(function () {
            if ($('#<%= div_msg.ClientID %>').val() == "") {
                $('#<%= div_msg.ClientID %>').hide('slow');
                document.location = '<%= new CapaNegocio.Util().SecureUrl("Admin/AdminGaleria.aspx") %>';
            }
        }, 2000);
         function Regresar() {
             window.location.href = "index.aspx";
         }
         function MostrarMensajesConfirm(uniqueID) {
             if (confirm("Esta Seguro de Eliminar esta Foto?"))
                 return true;
             else
                 return false;
        }
        function MostrarFoto(LinkFoto) {
            var modalImg = document.getElementById("ImgGaleria");
            modalImg.src = LinkFoto;
            $('#MyModal').modal('show');   
        }
    </script>
    <script>
        // Tipos de archivos admitidos por su extensión
        var tipos = ['jpg', 'jpeg', 'png'];
        // Contadores de archivos subidos por tipo
        var contadores = [0, 0, 0, 0];
        // Reinicia los contadores de tipos subidos
        var reset_contadores = function () {
            for (var i = 0; i < tipos.length; i++) {
                contadores[i] = 0;
            }
        };
        // Incrementa el contador de tipo según la extensión del archivo subido	
        var contadores_tipos = function (archivo) {
            for (var i = 0; i < tipos.length; i++) {
                if (archivo.indexOf(tipos[i]) != -1) {
                    contadores[i] += 1;
                    break;
                }
            }
        };
        // Inicializamos el plugin fileinput:
        //  traducción al español
        //  script para procesar las peticiones de subida
        //  desactivar la subida asíncrona
        //  máximo de ficheros que se pueden seleccionar	
        //  Tamaño máximo en Kb de los ficheros que se pueden seleccionar
        //  no mostrar los errores de tipo de archivo (cuando el usuario selecciona un archivo no permitido)
        //  tipos de archivos permitidos por su extensión (array definido al principio del script)
        $('#<%= FileUpload.ClientID %>').fileinput({
            language: 'es',
            uploadUrl: 'AdminGaleria.aspx',
            uploadAsync: false,
            maxFileCount: 30,
            maxFileSize: 300,
            removeFromPreviewOnError: true,
            allowedFileExtensions: tipos
        });
        // Evento filecleared del plugin que se ejecuta cuando pulsamos el botón 'Quitar'
        //    Vaciamos y ocultamos el div de alerta
        $('#<%= FileUpload.ClientID %>').on('filecleared', function (event) {
            $('div.alert').empty();
            $('div.alert').hide();
        });
        // Evento filebatchuploadsuccess del plugin que se ejecuta cuando se han enviado todos los archivos al servidor
        //    Mostramos un resumen del proceso realizado
        //    Carpeta donde se han almacenado y total de archivos movidos
        //    Nombre y tamaño de cada archivo procesado
        //    Totales de archivos por tipo
        $('#<%= FileUpload.ClientID %>').on('filebatchuploadsuccess', function (event, data, previewId, index) {
            var ficheros = data.files;
            var respuesta = data.response;
            var total = data.filescount;
            var mensaje;
            var archivo;
            var total_tipos = '';

            reset_contadores(); // Resetamos los contadores de tipo de archivo
            // Comenzamos a crear el mensaje que se mostrará en el DIV de alerta
            mensaje = '<p>' + total + ' ficheros almacenados en la carpeta: ' + respuesta.dirupload + '<br><br>';
            mensaje += 'Ficheros procesados:</p><ul>';
            // Procesamos la lista de ficheros para crear las líneas con sus nombres y tamaños
            for (var i = 0; i < ficheros.length; i++) {
                if (ficheros[i] != undefined) {
                    archivo = ficheros[i];
                    tam = archivo.size / 1024;
                    mensaje += '<li>' + archivo.name + ' (' + Math.ceil(tam) + 'Kb)' + '</li>';
                    contadores_tipos(archivo.name);  // Incrementamos el contador para el tipo de archivo subido
                }
            };

            mensaje += '</ul><br/>';
            // Línea que muestra el total de ficheros por tipo que se han subido
            for (var i = 0; i < contadores.length; i++)  total_tipos += '(' + contadores[i] + ') ' + tipos[i] + ', ';
            // Apaño para eliminar la coma y el espacio (, ) que se queda en el último procesado
            total_tipos = total_tipos.substr(0, total_tipos.length - 2);
            mensaje += '<p>' + total_tipos + '</p>';
            // Si el total de archivos indicados por el plugin coincide con el total que hemos recibido en la respuesta del script PHP
            // mostramos mensaje de proceso correcto
            if (respuesta.total == total) mensaje += '<p>Coinciden con el total de archivos procesados en el servidor.</p>';
            else mensaje += '<p>No coinciden los archivos enviados con el total de archivos procesados en el servidor.</p>';
            // Una vez creado todo el mensaje lo cargamos en el DIV de alerta y lo mostramos
            $('div.alert').html(mensaje);
            $('div.alert').show();
        });
        // Ocultamos el div de alerta donde se muestra un resumen del proceso
        $('div.alert').hide();

    </script>
</asp:Content>
