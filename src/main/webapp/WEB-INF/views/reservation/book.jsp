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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/sideBar.css">

<link rel="canonical" href="https://codepen.io/anon/pen/GxVKLm" />
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap-grid.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
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

  var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
  lastDay = lastDay.getDate();

  for (let i = 1; i <= lastDay; i++) {
    if (currentTr.getElementsByTagName("div").length >= 7) {
      currentTr = gridTable.appendChild(addNewRow());
    }
    let currentDay = document.createElement("div");
    currentDay.className = "col";
    if (selectedDayBlock == null && i == currentDate.getDate() || selectedDate.toDateString() == new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()) {
      selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);

      document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("ko-kr", {
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

<script type="text/javascript">/* 
	
	if(${jsonList != null}){
		var resList = JSON.parse('${jsonList}');
		for(var i=0; i<resList.length; i++){
			alert(resList[i]);
		}; */
</script>
</head>

<body>
<div class="container">
		<ul id="gn-menu" class="gn-menu-main mainmenusetting">
			<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav class="gn-menu-wrapper" id="gnmenuwrapper">
					<div class="gn-scroller">
						<ul class="gn-menu" id="gnmenu">
							
							<li class="gn-search-item">
							<input placeholder="Search" type="search" class="gn-search" id="gnsearch"> 
								<a class="gn-icon gn-icon-search">
									<span>Search</span>
								</a>
							</li>
							
							<li>
								<a class="gn-icon gn-icon-download">진료</a>
									<ul class="gn-submenu">
										<sec:authorize access="isAuthenticated()">
										<c:if test="${sessionScope.customer.division != 2}">
										<li>
											<a class="gn-icon gn-icon-illustrator" href="../selfCheck/goSelfCheck">자가진단</a>
										</li>
										</c:if>
										</sec:authorize>
										<li>
											<a class="gn-icon gn-icon-photoshop" href="../webrtc/goWebRtc">원격진료</a>
										</li>
										<li>
											<a href="../reservation/book" class="gn-icon gn-icon-photoshop" >예약하기</a>
										</li>
									</ul>
							</li>
                           <c:if test="${sessionScope.customer != null}">
							<li>
								<a class="gn-icon gn-icon-cog" href="../customer/goFix">Settings</a>
							</li>
							</c:if>
							<li>
								<a class="gn-icon gn-icon-help" href="../prescription/prescriptionIndList2">처방전</a>
							</li>
							<li>
								<a class="gn-icon gn-icon-archive" href="../webrtc/goWebRtc">WebRTC</a>
									<ul class="gn-submenu">
										<li>
											<a class="gn-icon gn-icon-article" href="webrtc/goWebRtc">RemoteHP</a>
										</li>
										
									</ul>
							</li>
						</ul>
					</div>
					<!-- /gn-scroller -->
				</nav>
			</li>
			<li>
				<a href="/www" class="codrops-icon codrops-icon-prev">
					<span>Char Hospital</span>
				</a>
			</li>
			<li><a href="../charlife/gocharlife">Char LIFE</a></li>
			<c:if test="${sessionScope.customer != null}">
			<li><a href="../customer/goFix">My Page</a></li>
			
			</c:if>
			<c:if test="${sessionScope.myReservation != null}">
				<li>
					${myReservation}
				</li>
			
			</c:if>
			<li>
				<sec:authorize access="isAuthenticated()">
    				<c:if test="${sessionScope.customer != null}">
					<a class="codrops-icon codrops-icon-drop" href="customer/logout" id='Logout'>
						<span>Logout</span>
					</a>
					</c:if>
				
				</sec:authorize>
			</li>
		</ul>
 	</div>

	<div class="content-wrapper grey lighten-3">
		<div class="container">

			<div class="calendar-wrapper z-depth-2">

				<div class="header-background">
					<div class="calendar-header">

						<a class="prev-button" id="prev"> <i class="material-icons">keyboard_arrow_left</i>
						</a> <a class="next-button" id="next"> <i class="material-icons">keyboard_arrow_right</i>
						</a>

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
								<div class="column-6 form-select">
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
								<div class="column-6 form-select">
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
							<a class="waves-effect waves-light btn blue lighten-2"
								id="addEventButton">Add</a> <a
								class="waves-effect waves-light btn grey lighten-2"
								id="cancelAdd">Cancel</a>
						</div>

					</div>
				</div>

			</div>

		</div>
	</div>

	<div class="main-wrapper">
		<div class="sidebar-wrapper z-depth-2 side-nav fixed" id="sidebar">

			<div class="sidebar-title">
				<h4>선택 일자</h4>
				<h5 id="eventDayName">SIDEBAR SUB-TITLE</h5>
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
				<c:forEach var="list" items="${list}">
				   &emsp;&emsp; 예약번호 : ${list.res_Num},
				   예약일 : ${list.res_Date},
				   환자번호 : ${list.cust_Num}
				    <br>
				</c:forEach>
			</c:if>
		</div>
		</div>
		
		
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

</body>
</html>