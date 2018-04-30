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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/editForm.css"></c:url>">
<title>selfCheck/selfCheckForm</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$('#smileys input').on('click', function() {
	$('#result').html($(this).val());
});
</script>
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
<div class="page-wrapper" >
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
                            <li class="breadcrumb-item active">SelfCheck</li>
                        </ol>
                    </div>
                </div>
                <form action="goSelfCheck" method="post">
		<div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">SelfCheck</h4>
                                <h6 class="card-subtitle">List</h6>
								<h4>Blood Pressure</h4>
								<input type="text" name="blood_Pressure" placeholder="ex) 평균혈압 100" value="100"<c:if test="${s.blood_Pressure != 0}"> value="${s.blood_Pressure }"</c:if>>
								<h3 class="small">* 血圧の平均値を入力してください。</h3>
								<h4>Smoking</h4>
			<input id="noSmoking" type="radio" name='smoking' checked='checked' value="없음" <c:if test="${s.smoking == '없음' }"> checked="checked" </c:if>/>
			<label for="noSmoking">無し</label> 
						
			<input id='halfSmoking' type="radio" name='smoking' value="하루 한 갑 미만" <c:if test="${s.smoking == '하루 한 갑 미만' }"> checked="checked" </c:if>/>
			<label for="halfSmoking">タバコ一箱未満</label>
			
			<input id='oneSmoking' type="radio" name='smoking' value="하루 한 갑" <c:if test="${s.smoking == '하루 한 갑' }"> checked="checked" </c:if>/>
			<label for="oneSmoking">タバコ一箱</label>
			
			<input id='moreSmoking' type="radio" name='smoking' value="하루 한 갑 이상" <c:if test="${s.smoking == '하루 한 갑 이상' }"> checked="checked" </c:if>/>
			<label for="moreSmoking">タバコ一箱以上</label>
								<h4>Drinking</h4>
			
			<input id="noDrinking" type="radio" name='drinking' checked='checked' value="안함" <c:if test="${s.drinking == '안함' }"> checked="checked" </c:if>/>
			<label for="noDrinking">お酒を飲まない</label> 
			
			<input id='oneDrinking' type="radio" name='drinking' value="일주일 1번 이하" <c:if test="${s.drinking == '일주일 1번 이하' }"> checked="checked" </c:if>/>
			<label for="oneDrinking">週一回以下</label>
			
			<input id='twoDrinking' type="radio" name='drinking' value="일주일 2~3번" <c:if test="${s.drinking == '일주일 2~3번' }"> checked="checked" </c:if>/>
			<label for="twoDrinking">週2~3回</label>
			
			<input id='moreDrinking' type="radio" name='drinking' value="일주일 3번 이상" <c:if test="${s.drinking == '일주일 3번 이상' }"> checked="checked" </c:if>/>
			<label for="moreDrinking">週3回以上</label>
								<h4>Diabetes</h4>
			<input id="noDiabetes" type="radio" name='diabetes' checked='checked' value="없음" <c:if test="${s.diabetes == '없음' }"> checked="checked" </c:if>/>
			<label for="noDiabetes">糖尿なし</label> 
			<input id='yesDiabetes' type="radio" name='diabetes' value="있음" <c:if test="${s.diabetes == '있음' }"> checked="checked" </c:if>/>
			<label for="yesDiabetes">糖尿有り</label>
			<h4>Surgery</h4>
			<input id="noSurgery" type="radio" name='surgery' checked='checked' value="없음" <c:if test="${s.surgery == '없음' }"> checked="checked" </c:if>/>
			<label for="noSurgery">手術経験無し</label> 
			<input id='yesSurgery' type="radio" name='surgery' value="있음" <c:if test="${s.surgery == '있음' }"> checked="checked" </c:if>/>
			<label for="yesSurgery">手術経験有り</label>
			<h4>Obstacle</h4>
			<input id="noDisability" type="radio" name='disability' checked='checked' value="없음" <c:if test="${s.disability == '없음' }"> checked="checked" </c:if>/>
			<label for="noDisability">障害無し</label> 
			<input id='yesDisability' type="radio" name='disability' value="있음" <c:if test="${s.disability == '있음' }"> checked="checked" </c:if>/>
			<label for="yesDisability">障害有り</label>
			<h4>Medicine</h4>
			<input type="text" name="medicine" placeholder="ex) 없음" value="${s.medicine }">
			<h3 class="small">*最近飲んだ薬を書いてください。</h3>
			<h4>Allergy</h4>
			<input type="text" name="allergy" placeholder="ex) 갑각류 알레르기" value="${s.allergy }">
			<h4>Overseas Visits</h4>
			<input id="noOverseas_Visits" type="radio" name='overseas_Visits' checked='checked' value="없음" <c:if test="${s.overseas_Visits== '없음' }"> checked="checked" </c:if>/>
			<label for="noOverseas_Visits">無し</label> 
			<input id='yesOverseas_Visits' type="radio" name='overseas_Visits' value="있음" <c:if test="${s.overseas_Visits== '있음' }"> checked="checked" </c:if>/>
			<label for="yesOverseas_Visits">有り</label>
			<h3 class="small">*3か月以内に海外旅行可否を教えてください。</h3>
			<h4>Sleep Time</h4>
			<input id="4hour" type="radio" name='sleep_Time' checked='checked' value="4시간 이하" <c:if test="${s.sleep_Time == '4시간 이하' }"> checked="checked" </c:if>/>
			<label for="4hour">4時間以下</label> 
			<input id='6hour'type="radio" name='sleep_Time' value="4~6시간" <c:if test="${s.sleep_Time == '5~6시간' }"> checked="checked" </c:if>/>
			<label for="6hour">4～6時間</label>
			<input id='8hour'type="radio" name='sleep_Time' value="6~8시간" <c:if test="${s.sleep_Time == '7~8시간' }"> checked="checked" </c:if>/>
			<label for="8hour">6~8時間</label>
			<input id='over8hour'type="radio" name='sleep_Time' value="8시간 이상" <c:if test="${s.sleep_Time == '8시간 이상' }"> checked="checked" </c:if>/>
			<label for="over8hour">8時間以上</label>

			<h4>Stress</h4>
	        <input id="super-happy" type="radio" name='stress' checked='checked' value="super-happy" <c:if test="${s.stress == 'super-happy' }"> checked="checked" </c:if>/>
			<label for="super-happy">とても幸せ</label> 
			
			<input id='happy' type="radio" name='stress' value="happy" <c:if test="${s.stress == 'happy' }"> checked="checked" </c:if>/>
			<label for="happy">幸せ</label>
			
			<input id='neutral' type="radio" name='stress' value="neutral" <c:if test="${s.stress == 'neutral' }"> checked="checked" </c:if>/>
			<label for="neutral">普通</label>
			
			<input id='sad' type="radio" name='stress' value="sad" <c:if test="${s.stress == 'sad' }"> checked="checked" </c:if>/>
			<label for="sad">悲しい</label>
			
			<input id='super-sad' type="radio" name='stress' value="super-sad" <c:if test="${s.stress == 'super-sad' }"> checked="checked" </c:if>/>
			<label for="super-sad">とても悲しい</label>

			<h4>Family history</h4>
			<input type="text" name="family_History" placeholder="ex) B형 감염 보균자" value="${s.family_History }">
			
			<c:if test="${sessionScope.customer.cust_Sex == 'F' }">			
			<h4>Pregnant</h4>
			<input id="NoPregnant" type="radio" name='pregnant' checked='checked' value="없음" <c:if test="${s.pregnant == '없음' }"> checked="checked" </c:if>/>
			<label for="NoPregnant">無し</label> 
			<input id='YesPregnant' type="radio" name='pregnant' value="있음" <c:if test="${s.pregnant == '있음' }"> checked="checked" </c:if>/>
			<label for="YesPregnant">有り</label>
			</c:if>
            </div>
            
	                    <input type="submit" class="custom-btn btn-1" value="다음">
                        </div>
                    </div>
                </div>
                </form>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
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