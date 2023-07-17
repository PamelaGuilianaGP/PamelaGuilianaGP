<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CapaPresentacion.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenMain" runat="server">
    <!-- Slide1 -->
    <section class="section-slide">
        <div class="wrap-slick1">
            <div class="slick1" runat="server" id="GaleriaCarusel">
               <div class="item-slick1 item12-slick1 slick-slide" style="background-image: url(&quot;images/Portada12TemploCoricancha.jpg&quot;); width: 1423px; position: relative; left: -15653px; top: 0px; z-index: 998; opacity: 0; transition: opacity 500ms ease 0s;" data-slick-index="11" aria-hidden="true" tabindex="-1" role="tabpanel" id="slick-slide011" aria-describedby="slick-slide-control011"><div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170"><span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="fadeInDown">Cerca del:</span><h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="fadeInUp">Templo Coricancha</h2><div class="wrap-btn-slide1 animated visible-false" data-appear="zoomIn"><a href="Reserva.aspx" class="btn1 flex-c-m size1 txt3 trans-0-4" tabindex="-1">Reservar</a></div></div></div>
            </div>
            <div class="wrap-slick1-dots"></div>
        </div>
    </section>
        <!-- Welcome -->
        <section class="section-welcome bg1-pattern p-t-120 p-b-105">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-t-45 p-b-30">
                        <div class="wrap-text-welcome t-center">
                            <span class="tit2 t-center">Paco Hostel
                            </span>

                            <h3 class="tit3 t-center m-b-35 m-t-5">Bienvenido
                            </h3>

                            <p class="t-center m-b-22 size3 m-l-r-auto">
                                Paco Hostel estamos ubicados en el ombligo del mundo Cusco , brindamos servicios de hospeadaje.
                            </p>

                            <a href="Nosotros.aspx" class="txt4">Nuestra Historia
							<i class="fa fa-long-arrow-right m-l-10" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-6 p-b-30">
                        <div class="wrap-pic-welcome size2 bo-rad-10 hov-img-zoom m-l-r-auto">
                            <img src="images/our-story-01.jpg" alt="IMG-OUR">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Intro -->
        <section class="section-intro">
            <div class="header-intro parallax100 t-center p-t-135 p-b-158" style="background-image: url(images/bg-intro-01.jpg);">
                <span class="tit2 p-l-15 p-r-15">Galeria
                </span>

                <h3 class="tit4 t-center p-l-15 p-r-15 p-t-3">Paco Hostel
                </h3>
            </div>

            <!-- Gallery -->

                <div runat="server" id="GaleriaHtml"></div>
         
            <!-- Our menu -->
            <section class="section-ourmenu bg2-pattern p-t-115 p-b-120">
                <div class="container">
                    <div class="title-section-ourmenu t-center m-b-22">
                        <span class="tit2 t-center">Descubrir
                        </span>

                        <h3 class="tit5 t-center m-t-2">Nuestros Servicios
                        </h3>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/CamaSimple01.jpg" alt="IMG-MENU">

                                        <!-- Button2 -->
                                            <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/CamaSimple01.jpg" data-lightbox="gallery">Cama Simple</a>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/CamasMixtas.jpg" alt="IMG-MENU">
                                         <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/CamasMixtas.jpg" data-lightbox="gallery">Camas Mixtas</a>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/BañosAmplios.jpg" alt="IMG-MENU">

                                        <!-- Button2 -->
                                        <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/BañosAmplios.jpg" data-lightbox="gallery">Baños Amplios</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-12">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/HabitacionDoble.jpg" alt="IMG-MENU">

                                        <!-- Button2 -->
                                         <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/HabitacionDoble.jpg" data-lightbox="gallery">Habitacíon Doble</a>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/HabitacionFamiliar.jpg" alt="IMG-MENU">

                                        <!-- Button2 -->
                                        <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/HabitacionFamiliar.jpg" data-lightbox="gallery">Habitacíon Familiar</a>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <!-- Item our menu -->
                                    <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                        <img src="images/BañosLimpios.jpg" alt="IMG-MENU">

                                        <!-- Button2 -->
                                        <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/BañosLimpios.jpg" data-lightbox="gallery">Baños Limpios</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Item our menu -->
                            <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                <img src="images/HabitacionParejas.jpg" alt="IMG-MENU">

                                <!-- Button2 -->
                                <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/HabitacionParejas.jpg" data-lightbox="gallery">Para Parejas</a>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Item our menu -->
                            <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                <img src="images/HabitacionCama2Plazas.jpg" alt="IMG-MENU">

                                <!-- Button2 -->
                                <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/HabitacionCama2Plazas.jpg" data-lightbox="gallery">Cama 2 Plazas</a>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Item our menu -->
                            <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                <img src="images/DuchasMixtas.jpg" alt="IMG-MENU">

                                <!-- Button2 -->
                                <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/DuchasMixtas.jpg" data-lightbox="gallery">Duchas Mixtas</a>
                            </div>
                        </div>
                        <div class="col-6">
                            <!-- Item our menu -->
                            <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                <img src="images/WifiGratis.jpg" alt="IMG-MENU">

                                <!-- Button2 -->
                                <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/WifiGratis.jpg" data-lightbox="gallery">Internet Gratis</a>
                            </div>
                        </div>
                        <div class="col-6">
                            <!-- Item our menu -->
                            <div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30">
                                <img src="images/PapelJabon.jpg" alt="IMG-MENU">

                                <!-- Button2 -->
                                <a class="btn2 flex-c-m txtServicios ab-c-m size4" href="images/PapelJabon.jpg" data-lightbox="gallery">Aseo</a>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- Video -->
            <section class="section-video parallax100" style="background-image: url(images/2780a863-8d5d-49c6-b0a4-fd7e3c82d0cf.jpg);">
                <div class="content-video t-center p-t-225 p-b-250">
                    <span class="tit2 p-l-15 p-r-15">Descubre nuestro
                    </span>

                    <h3 class="tit4 t-center p-l-15 p-r-15 p-t-3">Servicio de calidad
                    </h3>

                    <div class="btn-play ab-center size16 hov-pointer m-l-r-auto m-t-43 m-b-33" data-toggle="modal" data-target="#modal-video-01">
                        <div class="flex-c-m sizefull bo-cir bgwhite color1 hov1 trans-0-4">
                            <i class="fa fa-play fs-18 m-l-2" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </section>
            <div class="modal fade" id="modal-video-01" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                <div class="modal-dialog" role="document" data-dismiss="modal">
                    <div class="close-mo-video-01 trans-0-4" data-dismiss="modal" aria-label="Close">×</div>
                    <div class="wrap-video-mo-01">
                        <div class="w-full wrap-pic-w op-0-0">
                            <img src="images/2780a863-8d5d-49c6-b0a4-fd7e3c82d0cf.jpg" alt="IMG">
                        </div>
                        <div class="video-mo-01" style="opacity: 0;">
                            <iframe src="images/VID-20190710-WA0017.mp4?autoplay=1"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
    <script>
        function Page(IdPage) {
            $(".wrap-gallery").hide();
            $("#page" + IdPage).show();
            $(".item-pagination").removeClass("active-pagination");
            $("#Pag" + IdPage).addClass("item-pagination flex-c-m trans-0-4 active-pagination");
        }
    </script>
</asp:Content>
