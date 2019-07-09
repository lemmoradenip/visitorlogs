<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ARTAR</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet" />
</head>

<body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="index.html">ARTAR</a>

        <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Navbar Search -->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
                <%--<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
                <%--<div class="input-group-append">
                   <button class="btn btn-primary" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                   
                </div>--%>
            </div>
        </form>

        <!-- Navbar -->
        <ul class="navbar-nav ml-auto ml-md-0">
            <%--  <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <span class="badge badge-danger">9+</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>--%>
            <%-- <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span class="badge badge-danger">7</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>--%>
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Hello ! <asp:Label ID="outputUsername" runat="server">Human</asp:Label>
                    <i class="fas fa-user-circle fa-fw"></i>

                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">Settings</a>
                    <a class="dropdown-item" href="#">Activity Log</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="login.aspx" data-toggle="modal" data-target="#logoutModal">Logout</a>
                </div>
            </li>
        </ul>

    </nav>

    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="dashboard.aspx">
                    <i class="fa fa-address-book"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <%--        <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                    <h6 class="dropdown-header">Login Screens:</h6>
                    <a class="dropdown-item" href="login.html">Login</a>
                    <a class="dropdown-item" href="register.html">Register</a>
                    <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
                    <div class="dropdown-divider"></div>
                    <h6 class="dropdown-header">Other Pages:</h6>
                    <a class="dropdown-item" href="404.html">404 Page</a>
                    <a class="dropdown-item active" href="blank.html">Blank Page</a>
                </div>
            </li>--%>

            <li class="nav-item">
                <a class="nav-link" href="reports.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Reports</span></a>
            </li>
           <%-- <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>--%>
        </ul>

        <div id="content-wrapper">

            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <%-- <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.html">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Guest Book</li>
                </ol>--%>

                <!-- Page Content -->
                <div class="container">
                    <form id="formnewvisitor" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="updatepanelcard" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <!-- New Guest -->
                                    <div class="col-sm-5 ">


                                        <div class="card card-register mx-auto  mb-3">
                                            <div class="card-header"><i class="fas fa-user-plus mr-2"></i>New Guest | Visitor</div>
                                            <div class="card-body bg-light">



                                                <div id="dv_error" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show">
                                                    <strong>Warning!</strong> A problem occur while fetching data.
                                                         <asp:Label ID="lblerror" runat="server"></asp:Label>
                                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                </div>
                                                <div id="dv_success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show">
                                                    <strong>Sucess!</strong> New record has been added successfully.
                            
                                               <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <div class="form-label-group">
                                                                <%--<input type="text" id="inputVisitorName" class="form-control" placeholder="Visitor Name" required="required" autofocus="autofocus">--%>
                                                                <asp:TextBox ID="inputVisitorName" runat="server" class="form-control" placeholder="Visitor Name" required="required" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputVisitorName">Visitor Name</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <div class="form-label-group">
                                                                <%--<input type="text" id="inputCompany" class="form-control" placeholder="From Company" required="required" autofocus="autofocus">--%>
                                                                <asp:TextBox ID="inputCompany" runat="server" class="form-control" placeholder="Company" required="required" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputCompany">Company</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <div class="form-label-group">
                                                                <%--<input type="text" id="inputPersontoVisit" class="form-control" placeholder="Person to visit" required="required" autofocus="autofocus">--%>
                                                                <asp:TextBox ID="inputPersontoVisit" runat="server" class="form-control" placeholder="Person to visit" required="required" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputPersontoVisit">Person to visit</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">

                                                                <label for="sel1">Purpose:</label>

                                                                <asp:DropDownList ID="inputPurpose" runat="server" required="required" class="form-control">
                                                                    <asp:ListItem>Business Meeting</asp:ListItem>
                                                                    <asp:ListItem>Personal Meeting</asp:ListItem>
                                                                    <asp:ListItem>Delivery</asp:ListItem>

                                                                </asp:DropDownList>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">

                                                                <label for="sel1">Gender:</label>
                                                                <asp:DropDownList ID="inputGender" runat="server" required="required" class="form-control">
                                                                    <asp:ListItem>Male</asp:ListItem>
                                                                    <asp:ListItem>Female</asp:ListItem>
                                                                </asp:DropDownList>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-6">
                                                            <div class="form-label-group">
                                                                <%--<input type="text" id="inputMobile" class="form-control" placeholder="Mobile Number" required="required" autofocus="autofocus">--%>
                                                                <asp:TextBox ID="inputMobile" runat="server" TextMode="Number" class="form-control" placeholder="MobileNo" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputMobile">Mobile No.</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-label-group">
                                                                <asp:TextBox ID="inputEmail" runat="server" TextMode="Email" class="form-control" placeholder="Email" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputEmail">Email</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-row">
                                                        <div class="col-md-12">
                                                            <div class="form-label-group">
                                                                <asp:TextBox ID="inputNotes" runat="server" class="form-control" placeholder="Notes" autofocus="autofocus"></asp:TextBox>
                                                                <label for="inputNotes">Notes</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <%--    <a class="btn btn-primary btn-block" href="login.html">Register</a>--%>
                                                <asp:Button class="btn btn-primary btn-block" runat="server" OnClick="inputButton_Click" ID="inputButton" Text="Add" />
                                                <asp:Button class="btn btn-danger btn-block" runat="server" OnClick="inputReset_Click" ID="inputReset" Text="Clear" />
                                                <asp:HiddenField ID="hfId" runat="server" />



                                            </div>
                                        </div>

                                    </div>
                                    <!-- End of New Guess -->

                                    <!--List of Active Visitor-->
                                    <div class="col-sm-7 bg-lightgray">
                                        <div class="card mt-2">
                                            <div class="card-header">
                                                <i class="fas fa-address-book mr-2"></i>
                                                Active Guest
                                            </div>
                                            <div class="card-body">
                                                <div id="dv_errorlist" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show">
                                                    <strong>Warning!</strong> A problem occur.
                                                         <asp:Label ID="lblerror_list" runat="server"></asp:Label>
                                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                </div>

                                                <div class="table-responsive">
                                                    <asp:GridView ID="outputVisitor" runat="server" CssClass="table table-striped table-bordered table-sm bs-select" Width="100%" CellSpacing="0" AutoGenerateColumns="false" DataSourceID="sdsvisito">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="inputVisitorOUT" runat="server" Text="OUT" OnClick="inputVisitorOUT_Click" class="btn btn-outline-danger btn-block" />
                                                                    <asp:LinkButton ID="inputVisitorVOID" OnClientClick="return confirm('Are you sure you want to cancel?')" runat="server" Text="CANCEL" OnClick="inputVisitorVOID_Click" class="btn btn-outline-dark btn-block" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:BoundField DataField="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                                            <asp:BoundField DataField="Company" HeaderText="Company" />
                                                            <asp:BoundField DataField="contactperson" HeaderText="Person to visit" />
                                                            <asp:BoundField DataField="purpose" HeaderText="Purpose" />
                                                            <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                                                            <asp:BoundField DataField="email" HeaderText="Email" />
                                                            <asp:BoundField DataField="notes" HeaderText="Notes" />
                                                            <asp:BoundField DataField="transactiondate" HeaderText="Date" />
                                                            <asp:BoundField DataField="createdby" HeaderText="OnDuty-Staff" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="sdsvisito" runat="server" ConnectionString="<%$ ConnectionStrings:Artar_Bonyan %>" SelectCommand="SELECT * FROM [visitors] where status=0 and void=0 order by transactiondate asc"></asp:SqlDataSource>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!--End of List of Active Visitor-->
                                </div>


                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </form>
                </div>

            </div>

        </div>

    </div>
    <!-- /.content-wrapper -->




    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.aspx">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <script src="js/custom.js"></script>
      <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>



  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
</body>

</html>
