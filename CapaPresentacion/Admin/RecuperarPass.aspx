<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPass.aspx.cs" Inherits="CapaPresentacion.Admin.RecuperarPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="fullscreen-bg">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Paco | Hostel - Recuperacíon de contraseña</title>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css"/>
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css"/>
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css"/>
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet"/>
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../images/icons/favicon.png"/>
	<link rel="icon" type="image/png" sizes="96x96" href="../images/icons/favicon.png"/>
    <style>
        .auth-box.lockscreen .user .name {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
   <!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<h1 class="sr-only">Paco Hostel - Recuperacíon de contraseña</h1>
						<div class="logo text-center"><img src="../images/icons/logo2.png" alt="Logo Paco Hostel" style="width:130px;"/></div>
						<div class="user text-center">
							<h4 class="name">Ingrese su usuario , para enviarle un correo de recuperacíon contraseña</h4>
						</div>
						<form runat="server" id="FormRecuperarPass">
							<div class="input-group">
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" required="" placeholder="Usuario"></asp:TextBox>
                                 
								<span class="input-group-btn">
                                    <asp:LinkButton runat="server" ID="lbFoo" OnClick="lbFoo_Click" CausesValidation="true" ValidationGroup="groupPrincipal"  CssClass="btn btn-primary">
                                        <i class="fa fa-arrow-right"></i>
                                    </asp:LinkButton>
								</span>
							</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su Usuario"
                                            ControlToValidate="txtUsuario" InitialValue="" SetFocusOnError="true" ForeColor="Red"
                                            ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                            <div class="alert alert-danger alert-dismissable" id="div_msg" runat="server" visible="false">
                                <asp:Label runat="server" ID="lbMsg"></asp:Label>
                            </div>
						</form>
                        <div style="height: 15px; text-align: center;">
                            <button class="btn btn-danger" onclick="RegresarLogin();"><i class="fa fa-arrow-left"></i>&nbsp;Regresar al Login</button>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</body>
<script>
    function RegresarLogin() {
        window.location.href = "Login.aspx";
    }
</script>
</html>
