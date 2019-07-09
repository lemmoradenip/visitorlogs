<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
</head>

<body class="bg-artarhq">

    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">      <i class="fas fa-user"></i> Login</div>
            <div class="card-body">
                <form id="frm" runat="server">

                    <div class="form-group">
                        <div id="dv_error" runat="server" visible="false" class="alert alert-danger fade show">
                            <strong>Error!</strong> Sorry we can't validate your credentials. Please try again!.
                              <asp:Label ID="lblerror" runat="server"></asp:Label>
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <div class="form-label-group">
                            <%--<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">--%>
                            <asp:TextBox runat="server" placeholder="User Name" required="required" class="form-control" ID="inputEmail"></asp:TextBox>
                            <label for="inputEmail">User Name</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-label-group">
                            <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">--%>
                            <asp:TextBox runat="server" TextMode="Password" required="required" placeholder="Email address" class="form-control" ID="inputPassword"></asp:TextBox>

                            <label for="inputPassword">Password</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me">
                                Remember Password
             
                            </label>
                        </div>
                    </div>
                    <%-- <a class="btn btn-primary btn-block" href="index.html">Login</a>--%>
                    <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" class="btn btn-primary btn-block" Text="Login" />
                </form>
                <div class="text-center">
                    <%--   <a class="d-block small mt-3" href="register.html">Register an Account</a>--%>
                    <%--<a class="d-block small" href="support.artar.com.sa">Forgot Password?</a>--%>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
