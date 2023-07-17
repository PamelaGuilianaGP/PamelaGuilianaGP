<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="CapaPresentacion.Reserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Admin/assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="Admin/assets/css/jquery-ui.css" rel="stylesheet" />
    <style>
        table{
            width:100% !important;
        }
        div.container {
        width: 100% !important;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenMain" runat="server">
    <!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/Reservar.jpg);">
		<h2 class="tit6 t-center">
			RESERVA
		</h2>
	</section>
    <!-- Reservation -->
	<section class="section-reservation bg1-pattern p-t-100 p-b-113">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 p-b-30">
					<div class="t-center">
						<span class="tit2 t-center">
							RESERVA
						</span>

						<h3 class="tit3 t-center m-b-35 m-t-2">
							Habitaciones
						</h3>
					</div>

					<form class="wrap-form-reservation size22 m-l-r-auto" onsubmit="return false">
                        <div id="F1">
                            <div class="row">
                                <div class="col-md-4">
                                    <!-- Date -->
                                    <span class="txt9">Fecha Entrada
                                    </span>

                                    <div class="wrap-inputdate pos-relative txt10 size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="my-calendar bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtFecInicio" id="txtFecInicio">
                                        <i class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- Date -->
                                    <span class="txt9">Fecha Salida
                                    </span>

                                    <div class="wrap-inputdate pos-relative txt10 size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="my-calendar bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtxFecFin" id="txtxFecFin">
                                        <i class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- People -->
                                    <span class="txt9">Persona
                                    </span>

                                    <div class="wrap-inputpeople size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <!-- Select2 -->
                                        <select class="selection-1" name="people" id="people">
                                            <option value="1">1 Persona</option>
                                            <option value="2">2 Personas</option>
                                            <option value="3">3 Personas</option>
                                            <option value="4">4 Personas</option>
                                            <option value="5">5 Personas</option>
                                            <option value="6">6 Personas</option>
                                            <option value="7">7 Personas</option>
                                            <option value="8">8 Personas</option>
                                            <option value="9">9 Personas</option>
                                            <option value="10">10 Personas</option>
                                            <option value="11">11 Personas</option>
                                            <option value="12">12 Personas</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="wrap-btn-booking flex-c-m m-t-6">
                                <!-- Button3 -->
                                <button type="button" class="btn3 flex-c-m size13 txt11 trans-0-4" onclick="VerHabitacionesLibres();">
                                    VER DISPONIBILIDAD
                                </button>
                            </div>
                        </div>
                        <div id="F2" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-striped table-bordered" style="width: 100%" id="dtBasicExample">
                                        <thead>
                                            <tr>
                                                <th>Habitacíon</th>
                                                <th>Personas</th>
                                                <th>Precio / Persona</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="wrap-btn-booking flex-c-m m-t-6">
                                <!-- Button3 -->
                                <div class="col-md-12 text-center">
                                    <button type="button" class="btn btn-danger" onclick="Regresar();">
                                        Atras
                                    </button>
                                    <button type="button" class="btn btn-success" onclick="RecogerDatos();">
                                        Continuar
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div id="F3" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Resumen de la reserva</h4>
                                    <table class="table table-striped table-bordered" style="width: 100%" id="dtf3">
                                        <thead>
                                            <tr>
                                                <th>precio</th>
                                                <th>Habitacíon</th>
                                                <th>Personas</th>
                                                <th style="text-align:center;">Precio / Persona</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Identificador
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtIdentificador" id="txtIdentificador" placeholder="Identificador" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Nombres
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtNombres" id="txtNombres" placeholder="Nombres" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Apellidos
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtApellidos" id="txtApellidos" placeholder="Apellidos" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Nacionalidad
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtNacionalidad" id="txtNacionalidad" placeholder="Nacionalidad" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Telefono
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtTelefono" id="txtTelefono" placeholder="Telefono" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Name -->
                                    <span class="txt9">Correo
                                    </span>

                                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="txtCorreo" id="txtCorreo" placeholder="Correo" required>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <!-- Message -->
                                    <span class="txt9">Mensaje
                                    </span>
                                    <textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" name="Coment" id="Coment" placeholder="Mensaje"></textarea>
                                    <small class='text-muted'>Estimado Cliente Si Ud. ya se registro anteriormente solo ingrese su indentificador (DNI/PASAPORTE , ETC)</small>
                                    <input type="hidden" value="0" id="IdHuesped" name="IdHuesped" />
                                </div>
                                <div class="col-12" id="DivLoading" style="display: none;">
                                    <div class="alert alert-danger" role="alert">
                                        Guardando Informacíon espere Por favor...
                                    </div>
                                </div>
                            </div>
                            <div class="wrap-btn-booking flex-c-m m-t-6">
                                <!-- Button3 -->
                                <div class="col-md-12 text-center" >
                                    <button type="button" class="btn btn-danger" onclick="RegresarF3();">
                                        Atras
                                    </button>
                                    <button type="submit" class="btn btn-success" onclick="FinalizarReserva();" >
                                        Finalizar
                                    </button>
                                </div>
                            </div>
                        </div>
					</form>
				</div>
			</div>

			<div class="info-reservation flex-w p-t-80">
				<div class="size23 w-full-md p-t-40 p-r-30 p-r-0-md">
					<h4 class="txt5 m-b-18">
						RESERVA POR TELÉFONO
					</h4>

					<p class="size25">
						Tambien puedes reservar por teléfono solo tienes que comunicarte con nosotros llamando al teléfono:
						<span class="txt24"><a href="tel:+51984444804">984444804</a></span>
					</p>
				</div>
			</div>
		</div>
	</section>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script src="Admin/assets/scripts/jquery-1.12.4.js"></script>
    <script src="Admin/assets/scripts/jquery-ui.js"></script>
    <script src="Admin/assets/scripts/jquery.dataTables.min.js"></script>
    <script src="Admin/assets/scripts/dataTables.bootstrap4.min.js"></script>

    <script>
        var table;
        var tablef3;
        var Registros = [];
        var DataNew = [];
        function VerHabitacionesLibres()
        {
            $.ajax({
                type: "POST",
                url: 'Reserva.aspx/ObtenerHabitacionesLibres',
                data: "{ 'FechaInicio': '" + $("#txtFecInicio").val() + "','FechaFin':'" + $("#txtxFecFin").val() + "',CantPersonas:'" + $("#people").val() + "'}",
                contentType: "application/json;",
                dataType: "json",
                success: function (data) {
                    if (data.d != "0" && data.d != "") {
                        jsondata = JSON.parse(data.d);
                       table = $('#dtBasicExample').DataTable({
                            "scrollX": true,
                           "scrollY": "500px",
                           "lengthChange": false,
                            "paging": false,
                            "scrollCollapse": true,
                           "info": false,
                            
                            data: jsondata,
                            columns:[
                                    {
                                        data: 'NOMBRE_EDIFICIO',
                                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                            $(nTd).html("<h5 class='badge badge-pill badge-light'>" + oData.NOMBRE_EDIFICIO + "</h5><br>" +
                                                "<small class='text-muted'> <i class='fa fa-bed text-danger' style='font-size:larger;' aria-hidden='true'></i> Capacidad " + oData.CAMAS + " Personas&nbsp;&nbsp;" +
                                                "<i class='fa fa-university text-danger' aria-hidden='true' style='font-size:larger;'></i> Habitacion Nro: " + oData.NUMERO + " Piso: " + oData.PISO + "</small > ");
                                        }
                                    },
                                    {
                                        data: 'NOMBRE_EDIFICIO',
                                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                            $(nTd).html("<select class='form-control camas' id='ddl_"+oData.ID+"'>" + GeneraCombo(oData.CAMAS,oData.ID) + "</select>");
                                        }
                                    },
                                    {
                                        data: 'NOMBRE_EDIFICIO',
                                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                            $(nTd).html("<h5 class='badge badge-pill badge-light text-center'>" + oData.MONEDA + " " + oData.PRECIO.toFixed(2) + "</h5>");
                                        }
                                    },
                                
                           ],
                            "columnDefs": [
                                {"width": "50%", "targets": 0 },
                                {"targets": 2,"className": "text-center"}
                          ],
                        
                        });
                        $(".dataTables_scrollHeadInner").css("width", "100%");
                        $("#F1").hide();
                        $("#F2").show();
                    }
                    else {
                        swal({ type: 'Aviso', title: 'Oops...', text: 'No hay capacidad en las fechas seleccionadas,Disculpe' })
                    }

                }
            });
        }
        function RecogerDatos() {
            flag = false;
            
            $(".camas").each(function () {
                var array = $(this).val().split(",");
                Identity = array[0];
                Camas = array[1];
                if (Camas != 0) {

                    Registros.push({
                        Id: Identity,
                        Camas: Camas
                    });
                    flag = true;
                }
                   
            })
            if (flag)
                OpenUltimaFase(Registros)
            else
                swal({ type: 'Aviso', title: 'Oops...', text: 'Tiene que seleccionar cantidad de personas a reservas' });
        }
        function OpenUltimaFase(Registros)
        {
            
            table.rows().every(function (rowIdx, tableLoop, rowLoop) {
               
                var DataGet = this.data();
                Registros.forEach(function(Reg, index) {
                    if (DataGet.ID == Reg.Id) {
                        DataNew.push({
                            CAMAS: Reg.Camas,
                            ID: DataGet.ID,
                            MONEDA: DataGet.MONEDA,
                            NOMBRE_EDIFICIO: DataGet.NOMBRE_EDIFICIO,
                            NUMERO: DataGet.NUMERO,
                            PISO: DataGet.PISO,
                            PRECIO: DataGet.PRECIO

                        });
                    }
                });
            });
             //console.log(DataNew[0]);
            //console.log(DataNew);
            tablef3 = $('#dtf3').DataTable({
                "scrollX": true,
                "scrollY": "500px",
                "lengthChange": false,
                "paging": false,
                "scrollCollapse": true,
                "searching": false,
                "info":     false,
                data: DataNew,
                columns: [
                    {
                        data: 'PRECIO',
                    },
                    {
                        data: 'NOMBRE_EDIFICIO',
                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                            $(nTd).html("<h5 class='badge badge-pill badge-light'>" + oData.NOMBRE_EDIFICIO + "</h5><br>" +
                                "<small class='text-muted'><i class='fa fa-bed text-danger' style='font-size:larger;' aria-hidden='true'></i> Capacidad " + oData.CAMAS + " Personas&nbsp;&nbsp;" +
                                "<i class='fa fa-university text-danger' aria-hidden='true' style='font-size:larger;'></i> Habitacion Nro: " + oData.NUMERO + " Piso: " + oData.PISO + "</small > ");
                        }
                    },
                    {
                        data: 'NOMBRE_EDIFICIO',
                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                            $(nTd).html("<h5 class='badge badge-pill badge-light'>" + oData.CAMAS + " Reservados</h5><br>" +
                                "<small class='text-muted'>Cantidad de reservas</small>");
                        }
                    },
                    {
                        data: 'NOMBRE_EDIFICIO',
                        fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                            $(nTd).html("<h5 class='badge badge-pill badge-light'>" + oData.MONEDA + " " + oData.PRECIO.toFixed(2) + "</h5>");
                        }
                    },

                ],
                "columnDefs": [
                    { "visible": false, "targets": 0 },
                    { "width": "50%", "targets": 1 },
                    {"targets": 3,"className": "text-center"}
                  ],
                "footerCallback": function ( row, data, start, end, display ) {
			        var api = this.api(), data;
			 
			        // Remove the formatting to get integer data for summation
			        var intVal = function ( i ) {
			            return typeof i === 'string' ?
			                i.replace(/[\$,]/g, '')*1 :
			                typeof i === 'number' ?
			                    i : 0;
                    };
			        // Total over all pages
			        total5 = api
			            .column(0)
			            .data()
			            .reduce( function (a, b) {
			                return intVal(a) + intVal(b);
			            }, 0 );
                    // Update footer
                    $(api.column(2).footer()).html('Precio Total');
                    $(api.column(3).footer()).html('S/.'+ parseFloat(total5).toFixed(2));
			          
        			}
            });
            $(".dataTables_scrollHeadInner").css("width", "100%");
            $("#F2").hide();
            $("#F3").show();
  
        }
        function Regresar() {
            table.destroy();
            $("#F1").show();
            $("#F2").hide();
            DataNew = [];
            Registros = [];
        }
        function RegresarF3() {
            tablef3.destroy();
            $("#F2").show();
            $("#F3").hide();
            DataNew = [];
            Registros = [];
        }
        function FinalizarReserva() {
             
            if (ValidaForm())
            {
                $("#DivLoading").show();

                $.ajax({
                    url: 'Reserva.aspx/GuardarReserva',
                    data: "{Identificador: '" + $("#txtIdentificador").val() + "'," +
                        "Nombres: '" + $("#txtNombres").val() + "'," +
                        "Apellidos: '" + $("#txtApellidos").val() + "'," +
                        "Nacionalidad: '" + $("#txtNacionalidad").val() + "'," +
                        "Telefono: '" + $("#txtTelefono").val() + "'," +
                        "Correo: '" + $("#txtCorreo").val() + "'," +
                        "FechaIngreso:'" + $("#txtFecInicio").val() + "'," +
                        "FechaSalida:'" + $("#txtxFecFin").val() + "'," +
                        "Comentario:'" + $("#Coment").val() + "'," +
                        "Array:'" + JSON.stringify(DataNew) + "'," +
                        "IdHuesped:'" + $("#IdHuesped").val() + "'," +
                        "IdUsuario:'0'}",
                    dataType: "json",
                    type: "POST",
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == "ok") {
                            $("#DivLoading").hide();
                            swal("Aviso!", "Su reserva fue aceptada, Pronto se estarán comunicando con ud. para la confirmación  Gracias Por su preferencia", "success");
                              setTimeout(function(){ location.reload(); }, 6000);
                        } else {
                            $("#DivLoading").hide();
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
        function ValidaForm() {
            if ($("#txtIdentificador").val() != "" && $("#txtNombres").val() != "" && $("#txtApellidos").val() != "" && $("#txtNacionalidad").val() != "" && $("#txtTelefono").val() != "" && $("#txtCorreo").val() != "")
                return true;
            else
                return false;
        }
    </script>
    <script>
        function GeneraCombo(Cant,IdC) {
            var html = "";
            for (i = 0; i <= Cant; ++i) {
                html += "<option value='"+IdC+","+i+"'>" + i + "</option>";
            }
            return html;
        }
        $("#txtIdentificador").autocomplete({
            source: function (request, response) {
              
                $.ajax({
                        type: "POST",
                        url: 'Reserva.aspx/GetHuesped',
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
    
</asp:Content>

