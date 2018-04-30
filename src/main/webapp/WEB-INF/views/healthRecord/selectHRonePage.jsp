<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="../resources/assets2/node_modules/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="../resources/assets2/node_modules/morrisjs/morris.css" rel="stylesheet">
    <!--c3 CSS -->
    <!-- Custom CSS -->
    <link href="../resources/assets2/css/style.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="../resources/assets2/css/pages/dashboard1.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../resources/assets2/css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
    <title>Adminpage</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function del_check() {

		var dia_Num = document.getElementById("dia_Num")

		if (confirm("정말로 삭제 하시겠습니까?")) {

			alert(dia_Num.value);

			location.href = 'deleteHR?dia_Num=' + dia_Num.value;
		}

	}

	function print(printArea) {
		win = window.open();
		self.focus();
		win.document.open();

		/*
			1. div 안의 모든 태그들을 innerHTML을 사용하여 매개변수로 받는다.
			2. window.open() 을 사용하여 새 팝업창을 띄운다.
			3. 열린 새 팝업창에 기본 <html><head><body>를 추가한다.
			4. <body> 안에 매개변수로 받은 printArea를 추가한다.
			5. window.print() 로 인쇄
			6. 인쇄 확인이 되면 팝업창은 자동으로 window.close()를 호출하여 닫힘
		 */
		win.document.write('<html><'head'><title></title><style>');
		win.document
				.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
	}
</script>

<title>Select HealthRecord</title>
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
       
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
<div class="page-wrapper" style="margin-left: 0px;">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h3 class="text-themecolor">HealthRecord</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/www">Home</a></li>
                            <li class="breadcrumb-item active">HealthRecord</li>
                        </ol>
                    </div>
                </div>
                 <div id = "printArea">
<input type="hidden" id="dia_Num" value="${select.dia_Num }">
		<div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${sessionScope.customer.cust_Name } HealthRecord</h4>
                                <h6 class="card-subtitle">List</h6>
                                <div class="table-responsive">
                                    <table class="table" id="keywords">
                                        <thead>
                                            <tr>
                                                <th>Diseases Name</th>
                                                <th>Final Diagnosis</th>
                                                <th>Diseases Category</th>
                                                <th>Usage</th>
                                                <th>First Date</th>
                                                <th>Dia Date</th>
                                                <th>Issue Date</th>
                                                <th>Care Opinions</th>
                                                <th>Ect</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${select.dis_Name }</td>
                                                <td>${select.final_Diagnosis }</td>
                                                <td>${select.dis_Category }</td>
                                                <td>${select.usage }</td>
                                                <td>${select.first_Date }</td>
                                                <td>${select.dia_Date }</td>
                                                <td>${select.issue_Date }</td>
                                                <td>${select.care_Opinions }</td>
                                                <td>${select.ect }</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                     <table class="table" id="keywords">
                                        <thead>
                                            <tr>
                                                <th>Hospital Name</th>
                                                <th>Hospital Address</th>
                                                <th>Hospital PhoneNumber</th>
                                                <th>Customer Number</th>
                                                <th>Doctor Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${select.hos_Name }</td>
                                                <td>${select.hos_Address }</td>
                                                <td>${select.hos_Phone }</td>
                                                <td>${select.cust_Num }</td>
                                                <td>${select.cust_Id }</td>
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
<button class="form-btn" onclick="del_check()">DELETE</button>
<input type = "button" OnClick="print(document.getElementById('printArea').innerHTML)" value="PRINT"/>
	</div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                © 2018 Char Hospital by Null Team
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
    <!-- Bootstrap popper Core JavaScript -->
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
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!--morris JavaScript -->
    <script src="../resources/assets2/node_modules/raphael/raphael-min.js"></script>
    <script src="../resources/assets2/node_modules/morrisjs/morris.min.js"></script>
    <!--c3 JavaScript -->
    <!-- Chart JS -->
    <script src="../resources/assets2/js/dashboard1.js"></script>
		






</body>
</html>