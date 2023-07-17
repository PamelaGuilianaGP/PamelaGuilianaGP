<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="fullscreen-bg">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login | Paco Hostel - mejor hostel de la ciudad Cusco</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css"/>
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css"/>
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css"/>
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet"/>
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png"/>
	<link rel="icon" type="image/png" sizes="96x96" href="../images/icons/favicon.png"/>
    <style>
        .auth-box .header {
            margin-bottom: 15px;
        }

        .auth-box .form-auth-small .btn {
            margin-top: 0px;
        }
    </style>
</head>
<body>
        <!-- WRAPPER -->
        <div id="wrapper">
            <div class="vertical-align-wrap">
                <div class="vertical-align-middle">
                    <div class="auth-box ">
                        <div class="left">
                            <div class="content">
                                <div class="header">
                                    <div class="logo text-center">
                                        <img src="../images/icons/logo2.png" alt="Klorofil Logo" style="height:130px"/>
                                        <p class="lead">Inicia sesíon</p>
                                    </div>
                                </div>
                                <form class="form-auth-small" runat="server">
                                    <asp:ScriptManager runat="server" ID="Scriptmanager"></asp:ScriptManager>
                                    
                                    <div class="form-group">
                                        <label for="signin-email" class="control-label sr-only">Usuario</label>
                                        <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" placeholder="Ingrese su usuario"></asp:TextBox>
                                        
                                         <asp:RequiredFieldValidator ID="rfvddlTipoEquipo" runat="server" ErrorMessage="Ingrese usuario"
                                        ControlToValidate="txtUser" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="signin-password" class="control-label sr-only">Contraseña</label>
                                        <asp:TextBox runat="server" ID="txtPass" placeholder="Ingrese Contraseña" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su contraseña"
                                        ControlToValidate="txtPass" InitialValue="" SetFocusOnError="true" ForeColor="Red" ValidationGroup="groupPrincipal"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="clearfix">
                                            <asp:Label runat="server" ID="lbMsg" ForeColor="Red"></asp:Label>
                                    </div>
                                    <asp:Button runat="server" ID="btnEntrar" ValidationGroup="groupPrincipal" CausesValidation="true" CssClass="btn btn-primary btn-lg btn-block" Text="ENTRAR" OnClick="btnEntrar_Click"/>
                                    <div class="bottom">
                                        <span class="helper-text"><i class="fa fa-lock"></i><a href="RecuperarPass.aspx">Olvidaste tu contraseña?</a></span>
                                    </div>
                                   
                                </form>
                            </div>
                        </div>
                        <div class="right">
                            <div class="overlay"></div>
                            <div class="content text">
                                <h1 class="heading">Paco Hostel</h1>
                                <p>Cusco - Perú</p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END WRAPPER -->
</body>
</html>
