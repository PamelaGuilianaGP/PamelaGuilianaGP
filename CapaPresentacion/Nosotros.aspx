<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="CapaPresentacion.Nosotros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenMain" runat="server">
    <!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/Nosotros.jpg);">
		<h2 class="tit6 t-center">
			Acerca de nosotros
		</h2>
	</section>
    <!-- Our Story -->
	<section class="bg2-pattern p-t-116 p-b-110 t-center p-l-15 p-r-15">
		<span class="tit2 t-center">
			Paco Hostel
		</span>

		<h3 class="tit3 t-center m-b-35 m-t-5">
			Nuestra Historia
		</h3>

		<p class="t-center size32 m-l-r-auto">
			Paco Hostel se apertura brindando un servicio de alojamiento de calidad con precios accesibles , para nuestros clientes contamos con cuartos dobles triples y cuadruplex, todas con agua caliente las 24 horas, desayuno incluido en el centro histórico de la ciudad imperial del Cusco a pocas cuadras de la plaza de armas.
		</p>
	</section>
    <!-- Video -->
	<section class="section-video parallax100" style="background-image: url(images/header-menu-01.jpg);">
		<div class="content-video t-center p-t-225 p-b-250">
			<span class="tit2 p-l-15 p-r-15">
				Descubrir
			</span>

			<h3 class="tit4 t-center p-l-15 p-r-15 p-t-3">
				Nuestro Video
			</h3>

			<div class="btn-play ab-center size16 hov-pointer m-l-r-auto m-t-43 m-b-33" data-toggle="modal" data-target="#modal-video-01">
				<div class="flex-c-m sizefull bo-cir bgwhite color1 hov1 trans-0-4">
					<i class="fa fa-play fs-18 m-l-2" aria-hidden="true"></i>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
