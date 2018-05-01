<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/prescriptionSuccess</title>
</head>
<body>

	<h1>처방전 작성이 완료됐습니다!</h1>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join Complete</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Viga" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Courgette" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<style type="text/css">
body.notfound-header-sec {
  background: #66e0ff;
  color: #fff;
  font-family: 'Open Sans', sans-serif;
  max-height: 700px;
  overflow: hidden;
  position: relative;
font-family: 'Berkshire Swash', cursive;
  font-family: 'Courgette', cursive;
}
#clouds {
  padding: 100px 0;
  background: #66e0ff;
  overflow: hidden;
}
.c {
  overflow: hidden;
}
/*Time to finalise the cloud shape*/
.cloud {
  width: 200px;
  height: 60px;
  background: #fff;
  border-radius: 200px;
  position: relative;
}
.cloud:before,
.cloud:after {
  content: '';
  position: absolute;
  background: #fff;
  width: 100px;
  height: 80px;
  top: -15px;
  left: 10px;
  border-radius: 100px;
  transform: rotate(30deg);
}
.cloud:after {
  width: 120px;
  height: 120px;
  top: -55px;
  left: auto;
  right: 15px;
}
.x1 {
  animation: moveclouds 15s linear infinite;
  opacity: .9;
   left: 200px;
}
.x2 {
  left: 250px;
  transform: scale(0.6);
  opacity: 0.6;
  animation: moveclouds 35s linear infinite;
}
.x3 {
  left: 185px;
  top: -200px;
  transform: scale(0.8);
  opacity: 0.8;
  animation: moveclouds 30s linear infinite;
}
.x4 {
  left: 470px;
  top: -220px;
  transform: scale(0.75);
  opacity: 0.75;
  animation: moveclouds 25s linear infinite;
}
.x5 {
  left: 150px;
  top: -135px;
  transform: scale(0.8);
  opacity: 0.8;
  animation: moveclouds 22s linear infinite;
}
.x6 {
  left: 470px;
  top: -100px;
  transform: scale(0.75);
  opacity: 0.75;
  animation: moveclouds 18s linear infinite;
}
.x7 {
  left: 470px;
  top: -10px;
  transform: scale(0.75);
  opacity: 0.75;
  animation: moveclouds 15s linear infinite;
}
.x8 {
  left: 470px;
  top: 100px;
  transform: scale(0.75);
  opacity: 0.75;
  animation: moveclouds 18s linear infinite;
}
@keyframes moveclouds {
  0% {
    margin-left: 1400px;
  }
  100% {
    margin-left: -1000px;
  }
}
.c {
  text-align: center;
  display: block;
  position: absolute;
  width: 100%;
  margin: 100px auto;
}
._404 {
  font-size: 120px;
  position: relative;
  display: inline-block;
  z-index: 2;
  top: 5rem;
  height: 275px;
  letter-spacing: 15px;
}
._1 {
  text-align: center;
  display: block;
  position: relative;
  letter-spacing: 12px;
  font-size: 4em;
  line-height: 80%;
}
._2 {
color:gray;
  text-align: center;
  display: block;
  position: relative;
  font-size: 23px;
  margin-bottom: 20px;
  top:3px;
  top:0.8rem;
}
.text {
  font-size: 70px;
  text-align: center;
  position: relative;
  margin: 19px 0px 0px 0px;
  /* top: 256.301px; */
  z-index: 3;
  width: 100%;
  line-height: 1.2em;
  display: inline-block;
}
.back-btn {
  background-color: #ffffff;
  position: relative;
  display: inline-block !important;
  width: 358px;
  padding: 5px !important;
  z-index: 5;
  font-size: 25px !important;
  margin: 0 auto;
  color: #66e0ff;
  text-decoration: none;
  margin-right: 0px;
  border-radius: 0px !important;
}
.back-btn:hover {
  color: #6699ff;
}
.back-btn:focus {
  box-shadow: none !important;
}
.right {
  float: right;
  width: 60%;
}
hr.hr {
  padding: 0;
  border: none;
  border-top: 5px solid #fff;
  color: #fff;
  text-align: center;
  margin: 0px auto;
  width: 420px;
  height: 30px;
  z-index: -10;
}
hr.hr:after {
  content: "\2022";
  display: inline-block;
  position: relative;
  top: -14px;
  font-size: 1em;
  padding: 0 0.75em;
  background: #66e0ff;
}
@media (min-width: 1200px) {
  ._404 {
    left: 10px;
  }
}
@media (min-width: 375px) and (max-width: 1025px) {
  ._404 {
    font-size: 200px;
    left: 10px;
  }
}
@media (max-width: 415px) {
  ._404 {
    font-size: 125px;
    height: 150px;
    left: 2px;
  }
  hr.hr {
    width: 250px;
  }
  .back-btn {
    width: 300px;
  }
  .c {
    margin: 50px auto;
  }
}
  .x1{
    left: 100px;
      animation: moveclouds 9s linear infinite;
  }
  .x2{
      animation: moveclouds 33s linear infinite;
      left: 200px;
  }
  .x3{
      animation: moveclouds 25s linear infinite;
      left: 200px;
  } 
  .x4{
     animation: moveclouds 12s linear infinite;
     left: 200px;
  }
  .x5{
      animation: moveclouds 16s linear infinite;
          left: 200px;
  }
  .x6{
      animation: moveclouds 20s linear infinite;
      left: 200px;
  }
  .x7{
      animation: moveclouds 13s linear infinite;
      left: 200px;
  }
  .x8{
      animation: moveclouds 15s linear infinite;
      left: 400px;
      top: 50px;
  }
}
@media (min-width: 992px) {
  .adj-pad {
    padding-left: 20px;
  }
}
@media (max-width: 767px){
  @keyframes moveclouds {
    0% {
      margin-left: 400px;
    }
    100% {
      margin-left: -1000px;
    }
  }
@media (min-width: 767px) and (max-width: 1025px){
  @keyframes moveclouds {
    0% {
        margin-left: 500px;
    }
    100% {
        margin-left: -1000px;
    }
  }
  .x1 {
    left: 500px;
  }
}
  @media(max-width: 350px){
  .x1{
    left: 10px;
    animation: moveclouds 12s linear infinite;
  }
  .x4{
    left: 100px;
    animation: moveclouds 15s linear infinite;
  }
}</style>
</head>
<body class="notfound-header-sec" translate="no">
	<div class='c'>
	    <div class='_1'>Prescription Completed</div>
	    <!--  <hr class="hr">
	    <div class='_1'>Char Hospital</div>
	    <div class='_2'>'Check your E-mail'</div>
	    <a class='btn back-btn' href='/www'>BACK TO HOME PAGE</a> -->
	</div>
	<div id="clouds">
		<div class="cloud x1"></div>
		<div class="cloud x2"></div>
		<div class="cloud x3"></div>
		<div class="cloud x4"></div>
		<div class="cloud x5"></div>
		<div class="cloud x6"></div>
		<div class="cloud x7"></div>
		<div class="cloud x8"></div>
	</div>
</body>
</html>