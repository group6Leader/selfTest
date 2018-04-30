<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/assets2/images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="../resources/assets2/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../resources/assets2/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../resources/assets2/css/colors/default.css" id="theme" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckForm3</title>

</head>
<body>

<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">CHAR HOSPITAL</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/www">
                        
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="../resources/assets/images/logo.png" style="width: 160px; padding-left: 60px;" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->    
                         <img src="../resources/assets/images/logo.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up waves-effect waves-dark" href="javascript:void(0)"><i class="fa fa-bars"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-xs-down search-box"> <a class="nav-link hidden-sm-down waves-effect waves-dark" href="javascript:void(0)"><i class="fa fa-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="fa fa-times"></i></a></form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="download?saved=${login.saved_File}" alt="user" class="" />
                            <span class="hidden-md-down">${login.cust_Name}&nbsp;</span> </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect waves-dark" href="../customer/goFix" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">Profile</span></a>
                        </li>
                        <sec:authorize access="hasRole('CUSTOMER')">
                        <li> <a class="waves-effect waves-dark" href="../reservation/book" aria-expanded="false"><i class="fa fa-calendar"></i><span class="hide-menu">Reservation</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="goSelfCheck" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">Let's Go SelfCheck</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="goSelfCheck3" aria-expanded="false"><i class="fa fa-check-square"></i><span class="hide-menu">SelfCheck</span></a>
                        </li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('DOCTOR')">
                        <li> <a class="waves-effect waves-dark" href="../reservation/book2" aria-expanded="false"><i class="fa fa-calendar"></i><span class="hide-menu">Reservation</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../healthRecord/goHealthRecordList" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">HealthRecord</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../prescription/prescriptionResult" aria-expanded="false"><i class="fa fa-list-alt"></i><span class="hide-menu">Prescription</span></a>
                        </li>
                        </sec:authorize>
                    </ul>
                   
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
<div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h3 class="text-themecolor">SelfCheck</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/www">Home</a></li>
                            <li class="breadcrumb-item active">SekfCheck</li>
                        </ol>
                    </div>               
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">SelfCheck</h4>
                                <h6 class="card-subtitle">${login.cust_Name}<code>SelfCheck</code></h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Name / SelfCheck Number</th>                                                
                                                <td>${c.cust_Name }/ ${s.selfCheck_Num }</td>
                                            </tr>
                                        </thead>
                                        <tbody>
											<tr>
                                                <th>Blood Pressure</th>                                                
                                                <td>${s.blood_Pressure }</td>
                                            </tr>
                                            <tr>
                                                <th>Smoking</th>                                                
                                                <td>${s.smoking }</td>
                                            </tr>
                                            <tr>
                                                <th>Diabetes</th>                                                
                                                <td>${s.diabetes }</td>
                                            </tr>
                                            <tr>
                                                <th>Surgery</th>                                                
                                                <td>${s.surgery }</td>
                                            </tr>
                                            <tr>
                                                <th>Disability</th>                                                
                                                <td>${s.disability }</td>
                                            </tr>
                                            <tr>
                                                <th>Medicine</th>                                                
                                                <td>${s.medicine }</td>
                                            </tr>
                                            <tr>
                                                <th>Allergy</th>                                                
                                                <td>${s.allergy }</td>
                                            </tr>
                                            <tr>
                                                <th>Overseas Visits</th>                                                
                                                <td>${s.overseas_Visits }</td>
                                            </tr>
                                            <tr>
                                                <th>Sleep Time</th>                                                
                                                <td>${s.sleep_Time }</td>
                                            </tr>
                                            <tr>
                                                <th>Stress</th>                                                
                                                <td>${s.stress }</td>
                                            </tr>
                                            <tr>
                                                <th>Family History</th>                                                
                                                <td>${s.family_History }</td>
                                            </tr>
                                            <c:if test="${sessionScope.customer.cust_Sex == 'F' }">
                                            <tr>
                                                <th>Pregnant</th>                                                
                                                <td>${s.pregnant }</td>
                                            </tr>
                                            </c:if>
                                            <tr>
                                                <th>Symptom</th>                                                
                                                <td>${s.symptom }</td>
                                            </tr>
                                            <tr>
                                                <th>Outbreak Day</th>                                                
                                                <td>${s.outbreak_Day }</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                © 2018 CharHospital by Null Team
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../resources/assets2/node_modules/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../resources/assets2/node_modules/bootstrap/js/popper.min.js"></script>
    <script src="../resources/assets2/node_modules/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../resources/assets2/js/perfect-scrollbar.jquery.min.js"></script>
    <!--Wave Effects -->
    <script src="../resources/assets2/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../resources/assets2/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../resources/assets2/js/custom.min.js"></script>
    <!-- jQuery peity -->
    <script src="../resources/assets2/node_modules/peity/jquery.peity.min.js"></script>
    <script src="../resources/assets2/node_modules/peity/jquery.peity.init.js"></script>

	
	

</body>
</html>