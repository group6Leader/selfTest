<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html><html lang='en' class=''>
<head><script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/anon/pen/GxVKLm" />

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap-grid.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'>
<style class="cp-pen-styles">body {
  /*font-family: "RobotoRegular";*/
  font-family: 'Roboto', sans-serif;
  font-weigth: 400;
}

h3, h4, h5 {
  /*color: #e7e7e7;*/
  font-weight: 300 !important;
}

.calendar-wrapper {
  height: auto;
}

.calendar-header {
  background-color: rgba(18, 15, 25, 0.25);
  height: 100%;
  padding: 20px;
  color: #fff;
  /*font-family: "RobotoLight";*/
  font-family: 'Roboto', sans-serif;
  font-weigth: 300;
  position: relative;
}

.header-title {
  padding-left: 15%;
}

.header-background {
  background-image: url("https://github.com/JustMonk/prod-dip-docs/blob/master/img/first-header.jpg?raw=true");
  height: 200px;
  background-position: center right;
  background-size: cover;
}

.calendar-content {
  background-color: #fff;
  padding: 20px;
  padding-left: 15%;
  padding-right: 15%;
  overflow: hidden;
}

.event-mark {
  width: 5px;
  height: 5px;
  background-color: teal;
  border-radius: 100px;
  position: absolute;
  left: 46%;
  top: 70%;
}

.calendar-footer {
  height: 200px;
  /*font-family: "RobotoLight";*/
  font-family: 'Roboto', sans-serif;
  font-weigth: 300;
  text-align: center;
  background-color: #4b6289 !important;
  position: relative;
  overflow: hidden;
}

.addForm {
  position: absolute;
  top: 100%;
  width: 100%;
  height: 100%;
  background-color: #4b5889 !important;
  transition: top 0.5s cubic-bezier(1, 0, 0, 1);
  padding: 0 5px 0 5px;
}

.addForm input {
  color: #fff;
}

.addForm .row {
  padding-left: 0.75rem;
  padding-right: 0.75rem;
  margin-bottom: 0;
}

.addForm h4 {
  color: #fff;
  margin-bottom: 1rem;
}

.addEventButtons {
  text-align: right;
  padding: 0 0.75rem 0 0.75rem;
}

.addEventButtons a {
  color: black;
  font-weight: 300;
}

.emptyForm {
  padding: 20px;
  padding-left: 15%;
  padding-right: 15%;
}

.emptyForm h4 {
  color: #fff;
  margin-bottom: 2rem;
}

.sidebar-wrapper {
  color: #fff;
  background-color: #5a649c !important;
  padding-top: 0;
  padding-bottom: 20px;
  /*font-family: "RobotoLight";*/
  font-family: 'Roboto', sans-serif;
  font-weigth: 300;
  padding-left: 0;
  padding-right: 0;
}

.sidebar-title {
  padding: 50px 6% 50px 12%;
}

.sidebar-title h4 {
  margin-top: 0;
}

.sidebar-events {
  overflow-x: hidden;
  overflow-y: hidden;
  margin-bottom: 70px;
}

.empty-message {
  font-size: 1.2rem;
  padding: 15px 6% 15px 12%;
}

.eventCard {
  background-color: #fff;
  color: black;
  padding: 12px 24px 12px 24px;
  border-bottom: 1px solid #E5E5E5;
  position: relative;
}

.eventCard-header {
  font-weight: bold;
}

.eventCard-description {
  color: grey;
}

.eventCard-mark-wrapper {
  position: absolute;
  right: 0;
  top: 0;
  height: 100%;
  width: 60px;
  background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 100%);
}

.eventCard-mark {
  width: 8px;
  height: 8px;
  background-color: #b39ddb;
  border-radius: 100px;
  position: absolute;
  left: 50%;
  top: 45%;
}

.day-mark {
  width: 7px;
  height: 7px;
  background-color: #b39ddb;
  border-radius: 100px;
  position: absolute;
  left: 47%;
  top: 67%;
}

.content-wrapper {
  padding-top: 50px;
  padding-bottom: 50px;
  margin-left: 300px;
}

#table-body .col:hover {
  cursor: pointer;
  /*border: 1px solid grey;*/
  background-color: #E0E0E0;
}

.empty-day:hover {
  cursor: default !important;
  background-color: #fff !important;
}

#table-body .row .col {
  padding: .75rem;
}

#table-body .col {
  border: 1px solid transparent;
}

#table-body {}

#table-body .row {
  margin-bottom: 0;
}

#table-body .col {
  padding-top: 1.3rem !important;
  padding-bottom: 1.3rem !important;
}

#calendar-table {
  text-align: center;
}

.prev-button {
  position: absolute;
  cursor: pointer;
  left: 0%;
  top: 35%;
  color: grey !important;
}
.prev-button i{ 
  font-size: 4em;
}

.next-button {
  position: absolute;
  cursor: pointer;
  left: 92%;
  top: 35%;
  color: grey !important;
}
.next-button i{ 
  font-size: 4em;
}


.addEvent {
  box-shadow: 0 5px 15px rgb(57, 168, 228);
  background-color: #39a8e4;
  padding: 10px;
  padding-left: 3em;
  padding-right: 3em;
  cursor: pointer;
  border-radius: 25px;
  color: #fff !important;
  background-image: linear-gradient(135deg, #8d8dd4, #45ced4);
}

.addEvent:hover {
  transition: box-shadow 0.5s;
  box-shadow: 0 5px 25px rgb(57, 168, 228);
}

.mobile-header {
  padding: 0;
  display: none;
  padding-top: 20px;
  padding-bottom: 20px;
  position: fixed;
  z-index: 99;
  width: 100%;
  background-color: #5a649c !important;
}

.mobile-header a i {
  color: #fff;
  font-size: 38px;
}

.mobile-header h4 {
  color: #fff;
}

.mobile-header .row {
  margin-bottom: 0;
}

.mobile-header h4 {
  margin: 0;
  /*font-family: "RobotoLight";*/
  font-family: 'Roboto', sans-serif;
  font-weigth: 300;
}

@media (max-width:992px) {
  .content-wrapper {
    margin-left: 0;
  }
  .mobile-header {
    display: block;
  }
  .calendar-wrapper {
    margin-top: 80px;
  }
  .sidebar-wrapper {
    background-color: #EEEEEE !important;
  }
  .sidebar-title {
    background-color: #5A649C !important;
  }
  .empty-message {
    color: black;
  }
}

@media (max-width:767px) {
  .content-wrapper .container {
    width: auto;
  }
  .calendar-content {
    padding-left: 5%;
    padding-right: 5%;
  }
  body .row {
    margin-bottom: 0;
  }
}

@media (max-width:450px) {
  .content-wrapper {
    padding-left: 0;
    padding-right: 0;
  }
  .content-wrapper .container {
    padding-left: 0;
    padding-right: 0;
  }
}</style></head><body>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet"> 

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>

  <body>

      <div class="content-wrapper grey lighten-3">
        <div class="container">

          <div class="calendar-wrapper z-depth-2">

            <div class="header-background">
              <div class="calendar-header">

                <a class="prev-button" id="prev">
                  <i class="material-icons">keyboard_arrow_left</i>
                </a>
                <a class="next-button" id="next">
                  <i class="material-icons">keyboard_arrow_right</i>
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

                <div id="table-body" class="">

                </div>

              </div>
            </div>

            <div class="calendar-footer">
              <div class="emptyForm" id="emptyForm">
                <h4 id="emptyFormTitle">No events now</h4>
                <a class="addEvent" id="changeFormButton">Add new</a>
              </div>
              <div class="addForm" id="addForm">
                <h4>Add new event</h4>

                <div class="row">
                  <div class="input-field col s6">
                    <input id="eventTitleInput" type="text" class="validate">
                    <label for="eventTitleInput">Title</label>
                  </div>
                  <div class="input-field col s6">
                    <input id="eventDescInput" type="text" class="validate">
                    <label for="eventDescInput">Description</label>
                  </div>
                </div>


                <div class="addEventButtons">
                  <a class="waves-effect waves-light btn blue lighten-2" id="addEventButton">Add</a>
                  <a class="waves-effect waves-light btn grey lighten-2" id="cancelAdd">Cancel</a>
                </div>

              </div>
            </div>

          </div>

        </div>
      </div>

    </div>
    <div class="main-wrapper">
      <div class="sidebar-wrapper z-depth-2 side-nav fixed" id="sidebar">

        <div class="sidebar-title">
          <h4>Events</h4>
          <h5 id="eventDayName">SIDEBAR SUB-TITLE</h5>
        </div>
        <div class="sidebar-events" id="sidebarEvents">
          <div class="empty-message">Sorry, no events to selected date</div>
        </div>

      </div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

    <script>
      $(".button-collapse").sideNav();
    </script>

  </body>

</html>
<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script >var calendar = document.getElementById("calendar-table");
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
  monthTitle.innerHTML = `${monthName} ${yearNum}`;

  if (side == "left") {
    gridTable.className = "animated fadeOutRight";
  } else {
    gridTable.className = "animated fadeOutLeft";
  }

  gridTable.innerHTML = "";

  var newTr = document.createElement("div");
  newTr.className = "row";
  var currentTr = gridTable.appendChild(newTr);

  for (let i = 1; i < startDate.getDay(); i++) {if (window.CP.shouldStopExecution(1)){break;}
    let emptyDivCol = document.createElement("div");
    emptyDivCol.className = "col empty-day";
    currentTr.appendChild(emptyDivCol);
  }
window.CP.exitedLoop(1);


  var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
  lastDay = lastDay.getDate();

  for (let i = 1; i <= lastDay; i++) {if (window.CP.shouldStopExecution(2)){break;}
    if (currentTr.getElementsByTagName("div").length >= 7) {
      currentTr = gridTable.appendChild(addNewRow());
    }
    let currentDay = document.createElement("div");
    currentDay.className = "col";
    if (selectedDayBlock == null && i == currentDate.getDate() || selectedDate.toDateString() == new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()) {
      selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);

      document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("en-US", {
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
window.CP.exitedLoop(2);


  for (let i = currentTr.getElementsByTagName("div").length; i < 7; i++) {if (window.CP.shouldStopExecution(3)){break;}
    let emptyDivCol = document.createElement("div");
    emptyDivCol.className = "col empty-day";
    currentTr.appendChild(emptyDivCol);
  }
window.CP.exitedLoop(3);


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
todayDayName.innerHTML = "Today is " + currentDate.toLocaleString("en-US", {
  weekday: "long",
  day: "numeric",
  month: "short"
});

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
    for (key in globalEventObj[selectedDate.toDateString()]) {if (window.CP.shouldStopExecution(4)){break;}
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
window.CP.exitedLoop(4);

    let emptyFormMessage = document.getElementById("emptyFormTitle");
    emptyFormMessage.innerHTML = `${eventsCount} events now`;
  } else {
    let emptyMessage = document.createElement("div");
    emptyMessage.className = "empty-message";
    emptyMessage.innerHTML = "Sorry, no events to selected date";
    sidebarEvents.appendChild(emptyMessage);
    let emptyFormMessage = document.getElementById("emptyFormTitle");
    emptyFormMessage.innerHTML = "No events now";
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

  document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("en-US", {
    month: "long",
    day: "numeric",
    year: "numeric"
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
  for (let i = 0; i < inputs.length; i++) {if (window.CP.shouldStopExecution(5)){break;}
    inputs[i].value = "";
  }
window.CP.exitedLoop(5);

  let labels = addForm.getElementsByTagName("label");
  for (let i = 0; i < labels.length; i++) {if (window.CP.shouldStopExecution(6)){break;}
    console.log(labels[i]);
    labels[i].className = "";
  }
window.CP.exitedLoop(6);

}

var addEventButton = document.getElementById("addEventButton");
addEventButton.onclick = function (e) {
  let title = document.getElementById("eventTitleInput").value.trim();
  let desc = document.getElementById("eventDescInput").value.trim();

  if (!title || !desc) {
    document.getElementById("eventTitleInput").value = "";
    document.getElementById("eventDescInput").value = "";
    let labels = addForm.getElementsByTagName("label");
    for (let i = 0; i < labels.length; i++) {if (window.CP.shouldStopExecution(7)){break;}
      console.log(labels[i]);
      labels[i].className = "";
    }
window.CP.exitedLoop(7);

    return;
  }

  addEvent(title, desc);
  showEvents();

  if (!selectedDayBlock.querySelector(".day-mark")) {
    console.log("work");
    selectedDayBlock.appendChild(document.createElement("div")).className = "day-mark";
  }

  let inputs = addForm.getElementsByTagName("input");
  for (let i = 0; i < inputs.length; i++) {if (window.CP.shouldStopExecution(8)){break;}
    inputs[i].value = "";
  }
window.CP.exitedLoop(8);

  let labels = addForm.getElementsByTagName("label");
  for (let i = 0; i < labels.length; i++) {if (window.CP.shouldStopExecution(9)){break;}
    labels[i].className = "";
  }
window.CP.exitedLoop(9);


}
//# sourceURL=pen.js
</script>
</body></html>