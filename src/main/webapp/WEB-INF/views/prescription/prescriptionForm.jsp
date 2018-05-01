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
<title>prescription/readOne</title>
<link rel="stylesheet" type="text/css"  href="../resources/css/prescription.css">
<script type="text/javascript">
		
	function add() {
		/* alert('1'); */
		
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('pre_set').innerHTML;
	    document.getElementById('field').appendChild(div);
	       
	};
	
	function checkForm() {
		var med_Name = $('#med_Name').val();
		var med_Amount = $('#med_Amount').val();
		var med_Count = $('#med_Count').val();
		var med_Content = $('#med_Content').val();
		
		if(med_Name == '') {
			alert("Please Enter the Medicine's Name");
			
			return false;
		}
		
		if(med_Amount == '') {
			alert("Please Enter How Many Pills Per Time");
			
			return false;
		}
		
		if(med_Count == '') {
			alert("Please Enter How Many Times a Day");
			
			return false;
		}
		
		if(med_Content == '') {
			alert("Please Enter How to Take the Medicine");
			
			return false;
		}
		
		return true;
	};
	
</script>

</head>
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
                        <li> <a class="waves-effect waves-dark" href="../selfCheck/goSelfCheck" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">Let's Go SelfCheck</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../selfCheck/goSelfCheck3" aria-expanded="false"><i class="fa fa-check-square"></i><span class="hide-menu">SelfCheck</span></a>
                        </li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('DOCTOR')">
                        <li> <a class="waves-effect waves-dark" href="../reservation/book2" aria-expanded="false"><i class="fa fa-calendar"></i><span class="hide-menu">Reservation</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../healthRecord/goHealthRecordList" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">HealthRecord</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="prescriptionResult" aria-expanded="false"><i class="fa fa-list-alt"></i><span class="hide-menu">Prescription</span></a>
                        </li>
                        </sec:authorize>
                    </ul>
                   
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
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
                        <h3 class="text-themecolor">New Prescription</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="prescriptionIndList?cust_Num=${cust_Num }">patient List</a></li>
                            <li class="breadcrumb-item active">New Prescription</li>
                        </ol>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <form id="reg-form" action="goPrescription" method="post" onsubmit="return checkForm()">
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-3 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Tab panes -->
                            <div class="card-body">
                                <div class="form-horizontal form-material">
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">Patient Number</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Num" name="cust_Num" value="${c.cust_Num }" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">Patient Name</label>
                                        <div class="col-md-12">
                                            <input type="text" id="name" name="cust_Name" value="${c.cust_Name }" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">Gender</label>
                                        <div class="col-md-12">
                                            <input type="text" id="gender" value="${c.cust_Sex }" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">Address</label>
                                        <div class="col-md-12">
                                            <input type="text" id="address" value="${c.cust_Address }" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">PhoneNumber</label>
                                        <div class="col-md-12">
                                            <input type="text" id="phone" value="${c.cust_Phone }" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                  </div></div></div></div>
                                  <div class="col-lg-3 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Tab panes -->
                            <div class="card-body">
                                <div class="form-horizontal form-material">
                      
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hos_Name" name="hos_Name" value="CHAR HOSPITAL" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital Address</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hos_Phone" name="hos_Phone" placeholder="PhoneNumber" value="021231234" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital Phone</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hos_Address" name="hos_Address" placeholder="Address" value="서울시 강남구 삼성동 코엑스" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Doctor Name</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Id" name="cust_Id" placeholder="Doctor Name" readonly="readonly" value="${d.cust_Name }" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital Fax</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hospitalfax" name="hospitalfax" placeholder="Fax" value="029876543" readonly="readonly" class="form-control form-control-line">
                                        </div>
                                    </div>
                      				</div></div></div></div>
                  
                     <div class="col-lg-3 col-xlg-9 col-md-7" id="pre_set">
                        <div class="card">
                            <!-- Tab panes -->
                            <div class="card-body">
                                <div class="form-horizontal form-material">
                                	
                                	<!-- 약 이름 -->
                                    <div class="form-group">
                                        <label class="col-md-12">Medicine Name</label>
                                        <div class="col-md-12">
                                            <input type="text" id="med_Name" name="med_Name" placeholder="Medicine Name" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <!-- 투약량 -->
                                    <div class="form-group">
                                        <label class="col-md-12">Medicine Amount</label>
                                        <div class="col-md-12">
                                            <input type="text" id="med_Amount" name="med_Amount" placeholder="Medicine Amount" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <!-- 투약횟수 -->
                                    <div class="form-group">
                                        <label class="col-md-12">Medicine Count</label>
                                        
                                        <div class="col-sm-12">
                                            <select name="med_Count" id="med_Count" class="form-control form-control-line">
                                                	<option>Once</option>
                                                	<option>Twice</option>
                                                	<option>Three Times</option>
                                            </select>
                                        </div>
                                        
                                    </div>
                                    
                                  	<!-- 복용법 -->
                                    <div class="form-group">
                                        <label class="col-sm-12">How to</label>
                                        
                                        <div class="col-md-12">
                                            <input type="text" id="med_Content" name="med_Content" placeholder="How to" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12"></label>
                                        <div class="col-md-12">
                                            <button type="button" onclick="add()" class="btn btn-rounded">Add</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    	<div id="field" class="col-lg-3 col-xlg-9 col-md-7"></div>
                    <!-- Column -->
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" id="create-account" class="btn btn-success">PrintOut</button>
                                        </div>
                                    </div>
                </form>
                <!-- Row -->
                
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
                © 2018 Adminwrap by wrappixel.com
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
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../resources/assets2/node_modules/jquery/jquery.min.js"></script>
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


			

</body>
</html>