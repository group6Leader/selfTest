<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/assets2/images/favicon.png">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fix.css"></c:url>">
    <title>My Profile</title>
    <!-- Bootstrap Core CSS -->
    <link href="../resources/assets2/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../resources/assets2/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../resources/assets2/css/colors/default.css" id="theme" rel="stylesheet">
	<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	$(".fileDrop").on("dragenter dragover", function(event){
        event.preventDefault(); // 기본효과를 막음
    });
	$(".fileDrop").on("drop", function(event) {
	    event.preventDefault(); 
	    var files = event.originalEvent.dataTransfer.files;
	    var file = files[0];
	    console.log(file);
	    var formData = new FormData();
	    formData.append("file", file);

	    $.ajax({
	        type:"post",
	        url: "uploadAjax",
	        data: formData,
	        dataType: "text",
	        processData: false,
	        contentType: false,
	        // 업로드 성공하면
	        success: function(data) {
	            var str = "";
	            // 이미지 파일이면 썸네일 이미지 출력
	            if(checkImageType(data)){ 
	                str = "<div><a href='displayFile?fileName="+getImageLink(data)+"'>";
	                str += "<img class='img-circle' src='displayFile?fileName="+data+"'></a>";
	            // 일반파일이면 다운로드링크
	            } else { 
	                str = "<div><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
	            }
	            // 삭제 버튼
	            str += "<span data-src="+data+">[삭제]</span></div>";
	            $(".uploadedList").append(str);
	        }
	    });
	});
	
 $(".uploadedList").on("click", "span", function(event){
	    alert("이미지 삭제")
	    var that = $(this); // 여기서 this는 클릭한 span태그
	    $.ajax({
	        url: "deleteFile",
	        type: "post",
	        // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
	        // 태그.attr("속성")
	        data: {fileName:$(this).attr("data-src")}, // json방식
	        dataType: "text",
	        success: function(result){
	            if( result == "deleted" ){
	                // 클릭한 span태그가 속한 div를 제거
	                that.parent("div").remove();
	            }
	        }
	    });
	});


 $('#fixBtn').on('click',function(){
	 
	 	if(!confirm("수정하시겠습니까?")){
	 		return false;
	 	}
	 
	 	
		var cust_Id = $('#cust_Id').val();
		var cust_Pw = $('#cust_Pw').val();		
		var cust_Name = $('#cust_Name').val();
		var cust_Address = $('#cust_Address').val(); 
		var cust_Birth = $('#cust_Birth').val();		
		var cust_Sex = $(':radio[name="cust_Sex"]:checked').val();					
		var cust_Phone = $('#cust_Phone').val();
		var cust_Email = $('#cust_Email').val();
		var cust_Major = $('#cust_Major').val();
		
		
		$.ajax({
			url : "custFix2"
			,type : "POST"			
			,data : {			

				cust_Id: cust_Id
				,cust_Pw : cust_Pw
				,cust_Name : cust_Name
				,cust_Address : cust_Address
				,cust_Phone : cust_Phone
				,cust_Email : cust_Email
				,cust_Major : cust_Major
				
			},success : function(msg) {
				alert(msg);
			},error : function(err) {
				alert(JSON.stringify(err));
			}
		
		});
		
		
		});

 
 $('#delBtn').on('click',function(){
		
	 
	 	if(!confirm("삭제하시겠습니까?")){
	 		
	 		return false;
	 	}
	 	
	 	
		var cust_Id = $('#cust_Id').val();
	
	
		
		$.ajax({
			url : "custDel"
			,type : "POST"			
			,data : {			

				cust_Id: cust_Id
				
				
			},success : function(msg) {
				alert(msg);
				document.location.href = "/www/";
			},error : function(err) {
				alert(JSON.stringify(err));
			}
		
		});
		
		
		});

}); 
 

	 // 원본파일이름을 목록에 출력하기 위해
	function getOriginalName(fileName) {
	    // 이미지 파일이면
	    if(checkImageType(fileName)) {
	        return; // 함수종료
	    }
	    // uuid를 제외한 원래 파일 이름을 리턴
	    var idx = fileName.indexOf("_")+1;
	    return fileName.substr(idx);
	}
	
	// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
	function getImageLink(fileName) {
	    // 이미지파일이 아니면
	    if(!checkImageType(fileName)) { 
	        return; // 함수 종료 
	    }
	    // 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
	    // 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    var front = fileName.substr(0, 12); // 년원일 경로 추출
	    var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
	    console.log(front); // /2017/03/09/
	    console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    // 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    return front+end; // 디렉토리를 포함한 원본파일명을 리턴

	    // 이미지파일 형식을 체크하기 위해

		}

		function checkImageType(fileName) {
	        // i : ignore case(대소문자 무관)
	        var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	        return fileName.match(pattern); // 규칙이 맞으면 true
	    } 
</script>
<style>


    small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHAR HOSPITAL JOIN</title>
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
                        <li> <a class="waves-effect waves-dark" href="goAdmin" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">Dashboard</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="goFix" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">Profile</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../selfCheck/goSelfCheck3" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu">SelfCheck</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="icon-fontawesome.html" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">Icons</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="map-google.html" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">Map</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="pages-blank.html" aria-expanded="false"><i class="fa fa-bookmark-o"></i><span class="hide-menu">Blank</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="pages-error-404.html" aria-expanded="false"><i class="fa fa-question-circle"></i><span class="hide-menu">404</span></a>
                        </li>
                    </ul>
                    <div class="text-center m-t-30">
                        <a href="https://wrappixel.com/templates/adminwrap/" class="btn waves-effect waves-light btn-info hidden-md-down"> Upgrade to Pro</a>
                    </div>
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
                        <h3 class="text-themecolor">Profile</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Profile</li>
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
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30">
                                    <div id="filecontainer">
									    	<img src="download?saved=${login.saved_File}" class="img-circle" width="150" />			
									</div>
                                    <h4 class="card-title m-t-10">${login.cust_Name }</h4>
                                    <h6 class="card-subtitle">${login.cust_Major }</h6>
                                </center>
                            </div>
                        </div>
                    	<div class="card">
                            <div class="card-body">
                                <center class="m-t-30">
			                   		<div class="fileDrop" id="fileDropdiv">
    								<!-- 업로드된 파일 목록 -->
   										<div class="uploadedList">
   											<!-- '<img alt="" src="download?origin='+data.originalfile+'&saved='+data.savedfile+'">' -->
    									</div>
   									</div>
    									<h4 class="card-title m-t-10">드래그 해주세요.</h4>
                                    <h6 class="card-subtitle">수정을 원하시는 사진을 드래그 해주세요.</h6>
   								</center>
   							</div>
   						</div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Tab panes -->
                            <div class="card-body">
                                <form class="form-horizontal form-material" enctype="multipart/form-data">
                                   <input type="hidden" id="cust_Id" value="${login.cust_Id }">
                                    <div class="form-group">
                                        <label class="col-md-12">Full Name</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Name" name="cust_Name" disabled="disabled" value="${login.cust_Name }" placeholder="Johnathan Doe" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Password</label>
                                        <div class="col-md-12">
                                            <input id="cust_Pw" name="cust_Pw" type="password" value="${login.cust_Pw }" required class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">Gender</label>
                                        <div class="col-sm-12">
                                            <select name="cust_Sex" disabled="disabled" class="form-control form-control-line">
                                                <c:if test="${login.cust_Sex == 'M' }">
                                                	<option selected="selected">M</option>
                                                </c:if>
                                                <c:if test="${login.cust_Sex == 'F' }">
                                                	<option selected="selected">F</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Birth</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Birth" value="${login.cust_Birth }" name="cust_Birth" placeholder="2018/4/27" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Address</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Address" name="cust_Address" value="${login.cust_Address }" placeholder="711-2880 Nulla St.Mankato Mississippi 96522 (257) 563-740" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input type="email" id="cust_Email" name="cust_Email" placeholder="johnathan@admin.com" class="form-control form-control-line" value="${login.cust_Email }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Phone No</label>
                                        <div class="col-md-12">
                                            <input type="number" id="cust_Phone" name="cust_Phone" placeholder="123 456 7890" class="form-control form-control-line" value="${login.cust_Phone }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Major</label>
                                        <div class="col-md-12">
                                            <input type="text" id="cust_Major" value="${login.cust_Major }" name="cust_Major" placeholder="programmer" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button id="fixBtn" class="btn btn-success">Update Profile</button>
                                            <button id="delBtn" class="btn btn-success">Delete Profile</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
    <!-- <script src="../resources/assets2/node_modules/jquery/jquery.min.js"></script> -->
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