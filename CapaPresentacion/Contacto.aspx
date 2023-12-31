﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="CapaPresentacion.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenMain" runat="server">
        <!-- Title Page -->
        <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/Contacto.jpg);">
            <h2 class="tit6 t-center">Contáctanos
            </h2>
        </section>
        <!-- Contact form -->
        <section class="section-contact bg1-pattern p-t-90 p-b-113">
            <!-- Map -->
            <div class="container">
                <div class="map bo8 bo-rad-10 of-hidden">
                    <div class="contact-map size37" id="google_map" data-map-x="40.704644" data-map-y="-74.011987" data-pin="images/icons/icon-position-map.png" data-scrollwhell="0" data-draggable="1"></div>
                </div>
            </div>

            <div class="container">
                <h3 class="tit7 t-center p-b-62 p-t-105">MANDANOS UN MENSAJE
                </h3>

                <form class="wrap-form-reservation size22 m-l-r-auto">
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Name -->
                            <span class="txt9">Nombre
                            </span>

                            <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="name" placeholder="Nombre">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Email -->
                            <span class="txt9">Email
                            </span>

                            <div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email" placeholder="Email">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Phone -->
                            <span class="txt9">Telefono
                            </span>

                            <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="phone" placeholder="Telefono">
                            </div>
                        </div>

                        <div class="col-12">
                            <!-- Message -->
                            <span class="txt9">Mensaje
                            </span>
                            <textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" name="message" placeholder="Mensaje"></textarea>
                        </div>
                    </div>

                    <div class="wrap-btn-booking flex-c-m m-t-13">
                        <!-- Button3 -->
                        <button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
                            Enviar
                        </button>
                    </div>
                </form>

                <div class="row p-t-135">
                    <div class="col-sm-8 col-md-4 col-lg-4 m-l-r-auto p-t-30">
                        <div class="dis-flex m-l-23">
                            <div class="p-r-40 p-t-6">
                                <img src="images/icons/map-icon.png" alt="IMG-ICON">
                            </div>

                            <div class="flex-col-l">
                                <span class="txt5 p-b-10">UBICACÍON
                                </span>

                                <span class="txt23 size38">AV. Pardo 827 - Cusco
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-8 col-md-3 col-lg-4 m-l-r-auto p-t-30">
                        <div class="dis-flex m-l-23">
                            <div class="p-r-40 p-t-6">
                                <img src="images/icons/phone-icon.png" alt="IMG-ICON">
                            </div>


                            <div class="flex-col-l">
                                <span class="txt5 p-b-10">LLÁMANOS
                                </span>

                                <span class="txt23 size38"><a href="tel:+51984444804">984444804</a>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-8 col-md-5 col-lg-4 m-l-r-auto p-t-30">
                        <div class="dis-flex m-l-23">
                            <div class="p-r-40 p-t-6">
                                <img src="images/icons/clock-icon.png" alt="IMG-ICON">
                            </div>


                            <div class="flex-col-l">
                                <span class="txt5 p-b-10">HORARIO DE APERTURA
                                </span>

                                <span class="txt23 size38">Las 24 horas del día
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
    <!--===============================================================================================-->
</asp:Content>
