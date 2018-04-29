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
    <title>Adminpage</title>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#dis_Category').on('keyup',dis_Category_Chk);
	
	
	function dis_Category_Chk(){
		var dis_Category = $('#dis_Category').val();
	
		$.ajax({
			url:'dis_Category_chk'
			,type:'post'
			,data:{
				dis_Category:dis_Category
			}
			,dataType:'json'
			,success:function(disCode){
				console.log(disCode);
				
				var html = '<span id="check">';
				
				if(disCode!=""){
				
					$.each(disCode, function(index , item){
						
						html += index + ' : ' + item.dis_Code + '<br />'; 
						console.log(item);

					})
				
				}else{
					html += '없는 코드 입니다.';
				}
				html += '</span>';
				
				$('#check').html(html);
			}
			,error:function(err){
				console.log(JSON.stringify(err));
			}
		});
	}	
});
	
	
	

$( function() {
    $( "#first_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );

$( function() {
    $( "#dia_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );

$( function() {
    $( "#issue_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );
	

function docReserveList() {
	/* alert('1'); */
	
	window.open("findCust", "newWindow", "top=50, left=400, height=500, width=1000, resizable=no");

}	
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HealthRecord</title>
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
                        <li> <a class="waves-effect waves-dark" href="../customer/goAdmin" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">Dashboard</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="goFix" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">Profile</span></a>
                        </li>
                        <sec:authorize access="hasRole('CUSTOMER')">
                        <li> <a class="waves-effect waves-dark" href="../selfCheck/goSelfCheck" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">Let's Go SelfCheck</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../selfCheck/goSelfCheck3" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu">SelfCheck</span></a>
                        </li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('DOCTOR')">
                        <li> <a class="waves-effect waves-dark" href="../healthRecord/goHealthRecordList" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">HealthRecord</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../prescription/prescriptionResult" aria-expanded="false"><i class="fa fa-bookmark-o"></i><span class="hide-menu">Prescription</span></a>
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
                        <h3 class="text-themecolor">New HealthRecord</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">New HealthRecord</li>
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
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Tab panes -->
                                <form class="form-horizontal form-material" action="insertHealthRecord" method="post" enctype="multipart/form-data">
                            <div class="card-body">
                                   <input type="hidden" id="cust_Id" value="${login.cust_Id }">
                                    <div class="form-group">
                                        <label class="col-md-12">Diseases Name</label>
                                        <div class="col-md-12">
                                            <input type="text"  id="dis_Name" name="dis_Name" placeholder="Enter disease name" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Final Diagnosis</label>
                                        <div class="col-md-12">
                                            <input id="final_Diagnosis" name="final_Diagnosis" type="text" placeholder="Enter final_Diagnosis" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Birth</label>
                                        <div class="col-md-12">
                                            <input id="final_Diagnosis" name="final_Diagnosis" placeholder="Enter final_Diagnosis."type="text" required class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Diseases Category</label>
                                        <div class="col-md-12">
                                            <input type="text" id="dis_Category" name="dis_Category" placeholder="Select dis_Category." required="required" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">Usage</label>
                                        <div class="col-sm-12">
                                            <select name="usage" class="form-control form-control-line">
                                                	<option value="submit">제출용</option>
                                                	<option value="save">Save</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">First Date</label>
                                        <div class="col-md-12">
                                            <input type="text" id="first_Date"  name="first_Date" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">Diagnosis Date</label>
                                        <div class="col-md-12">
                                            <input type="email"id="dia_Date" name="dia_Date" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Issue Date </label>
                                        <div class="col-md-12">
                                            <input type="text" id="issue_Date" name="issue_Date" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="col-md-12">Care Opinions</label>
                                        <div class="col-md-12">
                                            <input id="care_Opinions" name="care_Opinions" placeholder="Write care_Opinions" required="required" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Ect</label>
                                        <div class="col-md-12">
                                            <input type="text" id="ect" name="ect" class="form-control form-control-line" placeholder="Write ect" required="required" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital Name</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hos_Name" name="hos_Name" placeholder="hospital_Name" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital Address</label>
                                        <div class="col-md-12">
                                            <input type="text" id="hos_Address" name="hos_Address" placeholder="hospital_Address" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Hospital PhoneNumber</label>
                                        <div class="col-md-12">
                                            <input placeholder="hospital_Phone" type="number" readonly="readonly" id="hos_Phone" name="hos_Phone" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Customer Number</label>
                                        <div class="col-md-12">
                                            <input id="cust_Num" name="cust_Num" placeholder="write customer name" type="text" readonly="readonly" class="form-control form-control-line">
                                            <c:if test="${sessionScope.customer.division == 2 }">
												<button class="btn docReserveList" onclick="docReserveList()" value="findCust">FIND_CUST</button>
											</c:if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Doctor Name</label>
                                        <div class="col-md-12">
                                            <input id="cust_Id" name="cust_Id" class="form-control form-control-line" placeholder="sign dictor name" type="text" value = "${record.cust_Id }"required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" id="fixBtn" class="btn btn-success">Submit</button>
                                            <button type="reset" id="delBtn" class="btn btn-success">Reset</button>
                                        </div>
                                    </div>
                            </div>
                                </form>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
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
        

	
</body>
</html>