<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Reports</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
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
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hello !
                    <asp:Label ID="outputUsername" runat="server">Human</asp:Label>
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
            <li class="nav-item ">
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

            <li class="nav-item active">
                <a class="nav-link " href="reports.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Reports</span></a>
            </li>
          <%--  <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>--%><%--  <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>--%>
        </ul>


        <div id="content-wrapper">
            <form runat="server" id="formmain">
                <div class="container-fluid">
                    <!--Content-->
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="updatepanelcard" runat="server">
                        <ContentTemplate>
                            <div class="card mb-3">
                                <div class="card-header">
                                    <%--  <i class="fas fa-table"></i>
                          
                            <asp:Button ID="inputExportExcel" runat="server" CssClass="btn btn-outline-primary" Text="Export" />--%>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3 text-left">
                                                <i class="fas fa-table"></i> Visitors Logs
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <div class="input-group">
                                                    <%--<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
                                                    <asp:TextBox ID="inputSearch" OnTextChanged="inputSearch_TextChanged" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                                                    <div class="input-group-append">
                                                        <%--<button class="btn btn-primary" type="button">
                                                            <i class="fas fa-search"></i>
                                                        </button>--%>
                                                        <asp:LinkButton ID="inputButtonSearch" runat="server" class="btn btn-primary">
                                                            <i class="fas fa-search"></i>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 text-right">
                                                <asp:LinkButton ID="inputExportExcel" OnClick="inputExportExcel_Click" runat="server" CssClass="btn btn-outline-success" Text="Export"><i class="fa fa-save"></i> Excel</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">

                                    <div class="table-responsive">
                                        <div id="dv_error" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show">
                                            <strong>Warning!</strong> A problem occur while fetching data.
                                                         <asp:Label ID="lblerror" runat="server"></asp:Label>
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        </div>
                                        <asp:GridView ID="dataTable" runat="server" CssClass="table table-striped table-bordered table-sm bs-select" Width="100%" CellSpacing="0" AutoGenerateColumns="false" DataSourceID="sdsvisito">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No.">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                                <asp:BoundField DataField="Company" HeaderText="Company" />
                                                <asp:BoundField DataField="contactperson" HeaderText="Subject" />
                                                <asp:BoundField DataField="purpose" HeaderText="Purpose" />
                                                <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                                                <asp:BoundField DataField="email" HeaderText="Email" />
                                                <asp:BoundField DataField="notes" HeaderText="Notes" />
                                                <asp:BoundField DataField="visitorIn" HeaderText="In" />
                                                <asp:BoundField DataField="visitorOut" HeaderText="Out" />
                                                <asp:BoundField DataField="createdby" HeaderText="OnDuty" />
                                            </Columns>
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="sdsvisito" runat="server" ConnectionString="<%$ ConnectionStrings:Artar_Bonyan %>"
                                            SelectCommand="SELECT * FROM [visitors] where (name like '%'+@keywords+'%' ) or (contactperson like '%'+@keywords+'%' ) or (purpose like '%'+@keywords+'%' ) or (company like '%'+@keywords+'%' ) or (mobile like '%'+@keywords+'%' ) or (notes like '%'+@keywords+'%' ) or (email like '%'+@keywords+'%' ) or (visitorin like '%'+@keywords+'%' ) or (visitorout like '%'+@keywords+'%' ) or (email like '%'+@keywords+'%' ) and status<>0 order by transactiondate asc">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="keywords" ControlID="inputSearch" DefaultValue=" " PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <%--<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr>
                                       
                                    </tbody>
                                </table>--%>
                                    </div>
                                </div>
                                <%-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>--%>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="inputExportExcel" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <!-- /. Content -->

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <%--<footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2019</span>
                    </div>
                </div>
            </footer>--%>
            </form>
        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

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



    <%-- <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>--%>
</body>

</html>

