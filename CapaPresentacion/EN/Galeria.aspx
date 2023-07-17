<%@ Page Title="" Language="C#" MasterPageFile="~/EN/MasterPageEN.Master" AutoEventWireup="true" CodeBehind="Galeria.aspx.cs" Inherits="CapaPresentacion.EN.Galeria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenMain" runat="server">
     <!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(../images/Galeria.jpg);">
		<h2 class="tit6 t-center">
			GALLERY
		</h2>
	</section>
    <!-- Gallery -->
    <div class="section-gallery p-t-118 p-b-100">
        <div class="text-center">
             <button class="label-gallery txt26 trans-0-4 is-actived" data-filter="*">
            Our gallery
        </button>
        </div>
         <div runat="server" id="GaleriaHtml"></div>
       
    </div>
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
