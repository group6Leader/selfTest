<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/assets2/images/favicon.png">
	<link href="https://fonts.googleapis.com/earlyaccess/sawarabimincho.css" rel="stylesheet" />
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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<link rel="canonical" href="https://codepen.io/anon/pen/GxVKLm" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap-grid.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/book.css"></c:url>">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.login').hide();
	$('.gn-icon-menu').hover(function() {
		$('.gn-menu-wrapper').toggleClass('gn-open-part');
	});

	$('.gn-menu-wrapper').hover(function() {
		$(this).toggleClass('gn-open-all');
	});

});
</script>
<script type="text/javascript">
$(document).ready(function() {var calendar = document.getElementById("calendar-table");
var gridTable = document.getElementById("table-body");
var currentDate = new Date();
var selectedDate = currentDate;
var selectedDayBlock = null;
var globalEventObj = {};
var lastDay;
var sidebar = document.getElementById("sidebar");

function createCalendar(date, side) {
  var currentDate = date;
  var startDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);

  var monthTitle = document.getElementById("month-name");
  var monthName = currentDate.toLocaleString("en-US", {
    month: "long"
  });
  var yearNum = currentDate.toLocaleString("en-US", {
    year: "numeric"
  });
  monthTitle.innerHTML = '${monthName} ${yearNum}';

  if (side == "left") {
    gridTable.className = "animated fadeOutRight";
  } else {
    gridTable.className = "animated fadeOutLeft";
  }

  gridTable.innerHTML = "";

  var newTr = document.createElement("div");
  newTr.className = "row";
  var currentTr = gridTable.appendChild(newTr);


  for (let i = 1; i < startDate.getDay(); i++) {
    let emptyDivCol = document.createElement("div");
    emptyDivCol.className = "col empty-day";
    currentTr.appendChild(emptyDivCol);
  }

  lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
  lastDay = lastDay.getDate();
  
  for (let i = 1; i <= lastDay; i++) {
    if (currentTr.getElementsByTagName("div").length >= 7) {
      currentTr = gridTable.appendChild(addNewRow());
    }
    let currentDay = document.createElement("div");
    currentDay.className = "col";
    currentDay.id = "col"+i;
    currentDay.value = i;
    currentDay.style="height: 67.6px;";
    if (selectedDayBlock == null && i == currentDate.getDate() || selectedDate.toDateString() == new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()) {
      selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);

      document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("en-us", {
        month: "long",
        day: "numeric",
        year: "numeric"
      });

      selectedDayBlock = currentDay;
      setTimeout(() => {
        currentDay.classList.add("blue");
        currentDay.classList.add("lighten-3");
      }, 900);
    }
    //날짜 부분
    currentDay.innerHTML = i;
    currentTr.appendChild(currentDay);
  }
  
  for (let i = currentTr.getElementsByTagName("div").length; i < 7; i++) {
    let emptyDivCol = document.createElement("div");
    emptyDivCol.className = "col empty-day";
    currentTr.appendChild(emptyDivCol);
  }

  setTimeout(() => {
    if (side == "left") {
      gridTable.className = "animated fadeInLeft";
    } else {
      gridTable.className = "animated fadeInRight";
    }
  }, 270);

  function addNewRow() {
    let node = document.createElement("div");
    node.className = "row";
    return node;
  }
}

createCalendar(currentDate);

var todayDayName = document.getElementById("todayDayName");
todayDayName.innerHTML = "오늘은 " + currentDate.toLocaleString("ko-kr", {
  weekday: "long",
  day: "numeric",
  month: "short"
}) + " 입니다.";

var prevButton = document.getElementById("prev");
var nextButton = document.getElementById("next");

prevButton.onclick = changeMonthPrev;
nextButton.onclick = changeMonthNext;

function changeMonthPrev() {
  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1);
  createCalendar(currentDate, "left");
}
function changeMonthNext() {
  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1);
  createCalendar(currentDate, "right");
}

function addEvent(title, desc) {
  if (!globalEventObj[selectedDate.toDateString()]) {
    globalEventObj[selectedDate.toDateString()] = {};
  }
  globalEventObj[selectedDate.toDateString()][title] = desc;
}

function showEvents() {
  let sidebarEvents = document.getElementById("sidebarEvents");
  let objWithDate = globalEventObj[selectedDate.toDateString()];

  sidebarEvents.innerHTML = "";

  if (objWithDate) {
    let eventsCount = 0;
    for (key in globalEventObj[selectedDate.toDateString()]) {
      let eventContainer = document.createElement("div");
      let eventHeader = document.createElement("div");
      eventHeader.className = "eventCard-header";

      let eventDescription = document.createElement("div");
      eventDescription.className = "eventCard-description";

      eventHeader.appendChild(document.createTextNode(key));
      eventContainer.appendChild(eventHeader);

      eventDescription.appendChild(document.createTextNode(objWithDate[key]));
      eventContainer.appendChild(eventDescription);

      let markWrapper = document.createElement("div");
      markWrapper.className = "eventCard-mark-wrapper";
      let mark = document.createElement("div");
      mark.classList = "eventCard-mark";
      markWrapper.appendChild(mark);
      eventContainer.appendChild(markWrapper);

      eventContainer.className = "eventCard";

      sidebarEvents.appendChild(eventContainer);

      eventsCount++;
    }
    let emptyFormMessage = document.getElementById("emptyFormTitle");
    emptyFormMessage.innerHTML = `${eventsCount} events now`;
  } else {
    let emptyMessage = document.createElement("div");
    emptyMessage.className = "empty-message";
    emptyMessage.innerHTML = "";
    sidebarEvents.appendChild(emptyMessage);
    let emptyFormMessage = document.getElementById("emptyFormTitle");
    emptyFormMessage.innerHTML = "예약 하기";
  }
}

gridTable.onclick = function (e) {

  if (!e.target.classList.contains("col") || e.target.classList.contains("empty-day")) {
    return;
  }

  if (selectedDayBlock) {
    if (selectedDayBlock.classList.contains("blue") && selectedDayBlock.classList.contains("lighten-3")) {
      selectedDayBlock.classList.remove("blue");
      selectedDayBlock.classList.remove("lighten-3");
    }
  }
  selectedDayBlock = e.target;
  selectedDayBlock.classList.add("blue");
  selectedDayBlock.classList.add("lighten-3");

  selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), parseInt(e.target.innerHTML));

  showEvents();

  document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("ko-kr", {
    month: "long",
    day: "numeric",
    year: "numeric"
  });
  
  $.ajax({
      url:"book",
      type:'GET',
      data: {selectedDate: selectedDate},
      success:function(data){
      },
      error:function(jqXHR, textStatus, errorThrown){
      }
  });
  
}


if(${list!=null}){	
	 var arrName = [];
	var arrDate = [];
	var year;
	var month;
	var date;
	var hour;
	
		list = '${list}';
		var str = list.split(",");
		for(var key in str){				
			 if(str[key].includes('cust_Name')){
				arrName.push(str[key]);
				alert(str[key]);
			}
			if(str[key].includes('res_Date')){
				arrDate.push(str[key]);
				alert(str[key]);
			} 				
		}
		
		for(var i = 0; i<arrDate.length; i++){
			//arrName[i];
			//2018040510
			//2018042915
			year = arrDate[i].substring(10, 14);
			if(arrDate[i].substring(14, 15) == 0){
				month = arrDate[i].substring(15, 16);
			}else{
				month = arrDate[i].substring(14, 16);	
			}			
			if(arrDate[i].substring(16,17) == 0){
				date = arrDate[i].substring(17,18);
			}else{
				date = arrDate[i].substring(16, 18);
			}
			hour = arrDate[i].substr(18,2);
			alert(year +"년 " + month+ "월 " + date + "일 " + hour +"시");
			
			 for(var i = 1; i<lastDay; i++){
				var day = document.getElementById("col"+i).value;
				 if(date == day){
					document.getElementById("col"+i).innerHTML = '<div class="col" id="col'+i+'"value="'+i+'"style="background-color: aqua;"></div>';
				}
				
			}
		}
				
}



var changeFormButton = document.getElementById("changeFormButton");
var addForm = document.getElementById("addForm");
changeFormButton.onclick = function (e) {
  addForm.style.top = 0;
}

var cancelAdd = document.getElementById("cancelAdd");
cancelAdd.onclick = function (e) {
  addForm.style.top = "100%";
  let inputs = addForm.getElementsByTagName("input");
  for (let i = 0; i < inputs.length; i++) {
    inputs[i].value = "";
  }
  let labels = addForm.getElementsByTagName("label");
  for (let i = 0; i < labels.length; i++) {
    console.log(labels[i]);
    labels[i].className = "";
  }
}

var addEventButton = document.getElementById("addEventButton");
addEventButton.onclick = function (e) {
	
  let title = document.getElementById("eventTitleInput").value.trim();
  let desc = document.getElementById("eventDescInput").value.trim();

  if (!title || !desc) {
    document.getElementById("eventTitleInput").value = "";
    document.getElementById("eventDescInput").value = "";
    let labels = addForm.getElementsByTagName("label");
    for (let i = 0; i < labels.length; i++) {
      console.log(labels[i]);
      labels[i].className = "";
    }
    return;
  }
   
  addEvent(title, desc); 
  showEvents();

  if (!selectedDayBlock.querySelector(".day-mark")) {
    console.log("work");
    selectedDayBlock.appendChild(document.createElement("div")).className = "day-mark";
  }

  let inputs = addForm.getElementsByTagName("input");
  for (let i = 0; i < inputs.length; i++) {
    inputs[i].value = "";
  }
  let labels = addForm.getElementsByTagName("label");
  for (let i = 0; i < labels.length; i++) {
    labels[i].className = "";
  }
  
  $.ajax({
      url:"reservation",
      type:'GET',
      data: {hour: desc, doctor: title},
      success:function(data){      	  
    	  if(${haveRes != null}){
    	  		alert("예약이 존재합니다.");
    	  }  
    	  if(${resErrorMsg != null}){
    		   alert("예약불가 합니다.");
    	  }
    	  location.href="book";
      },
      error:function(jqXHR, textStatus, errorThrown){
          self.close();
      }
  });
}});
</script>
<script type="text/javascript">


  
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
                            <!--  <img src="download?saved=${login.saved_File}" alt="user" class="" /> -->
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
                        <h3 class="text-themecolor">Dashboard</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                  
                </div>
                <div class="container">

			<div class="calendar-wrapper z-depth-2">

				<div class="header-background">
					<div class="calendar-header">
						<a class="prev-button" id="prev"> <i class="material-icons">keyboard_arrow_left</i></a>
						<a class="next-button" id="next"> <i class="material-icons">keyboard_arrow_right</i></a>
						<div class="row header-title">
							<div class="header-text">
								<h3 id="month-name">February</h3>
								<h5 id="todayDayName">Today is Friday 7 Feb</h5>
							</div>
						</div>
					</div>
				</div>

				<div class="calendar-content">
					<div id="calendar-table" class="calendar-cells">

						<div id="table-header">
							<div class="row">
								<div class="col">Mon</div>
								<div class="col">Tue</div>
								<div class="col">Wed</div>
								<div class="col">Thu</div>
								<div class="col">Fri</div>
								<div class="col">Sat</div>
								<div class="col">Sun</div>
							</div>
						</div>

						<div id="table-body" class=""></div>

					</div>
				</div>

				<div class="calendar-footer">
					<div class="emptyForm" id="emptyForm">
						<h4 id="emptyFormTitle">예약 하기</h4>
						<a class="addEvent" id="changeFormButton">Add new</a>
					</div>
					<div class="addForm" id="addForm">
						<h4>담당의사와 예약시간을 선택해주세요.</h4>

						<div class="row">
							<div class="input-field col s6">
								<div class="column-4 form-select">
									<select name="" id="eventTitleInput">
										<option value="" disabled="disabled">진료종류</option>
										<option selected="selected">Dr차예진</option>
										<option>Dr조민제</option>
										<option>Dr김준형</option>
										<option>Dr신동철</option>
									</select>
								</div>
							</div>
							<div class="input-field col s6">
								<div class="column-4 form-select">
									<select name="" id="eventDescInput">
										<option value="" disabled="disabled">Time
											Table</option>
										<option selected="selected">9:00</option>
										<option>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
										<option>13:00</option>
										<option>14:00</option>
										<option>15:00</option>
										<option>16:00</option>
										<option>17:00</option>
										<option>18:00</option>
									</select>
								</div>
							</div>
						</div>


						<div class="addEventButtons">
							<a class="addEvent"
								id="addEventButton">Add</a> <a
								class="addEvent"
								id="cancelAdd">Cancel</a>
						</div>

					</div>
				</div>

			</div>
		<div class="sidebar-wrapper z-depth-2" id="sidebar">
			<div class="sidebar-title">
				<h4 style="color: white;">선택 일자</h4>
				<h5 id="eventDayName" style="color: white;">SIDEBAR SUB-TITLE</h5>
			</div>
			<div class="sidebar-events" id="sidebarEvents">
				<div class="empty-message"></div>
			</div>
			
			<div class="resStatas">
			<c:if test="${sessionScope.myReservation != null }">
				&emsp;&emsp;${myReservation }
				<br><br>
				<a href="./deleteBook"><button style="margin-left: 30px;">예약 취소</button></a>
			</c:if>
			<c:if test="${list != null }">
				<div class="table-responsive" style="width: 25rem; margin-left: 2rem; margin-top: -8rem;padding:2px 25px; background-color: rgba(255,255,255,0.3);">
                                    <table class="table" id="keywords">
                                         <c:forEach var="list" items="${list}">
                                        <thead>
                                            <tr>
                                                <th>Reservation Number</th>
                                                <th>Reservation Date</th>
                                                <th>Patient Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${list.res_Num }</div></td>
                                                <td>${list.res_Date }</div></td>
                                                <td>${list.cust_Name }</div></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
			</c:if>
		</div>
		</div>

		</div>
                
                </div>
                <!-- ============================================================== -->
                <!-- End Notification And Feeds -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
            </div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

	<script>
      $(".button-collapse").sideNav();
    </script>
  <footer class="footer"> © 2018 Adminwrap by wrappixel.com </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    </div>
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