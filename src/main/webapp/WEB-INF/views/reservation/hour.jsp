<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.button {  
	position:relative;	
	margin-top: 5px;
	background-color: #87CEFA;
	font-size: 15px;
	color: black;
	padding: 10px;
	width: 100px;
	text-align: center;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	text-decoration: none;
	overflow: hidden;
	cursor: pointer;
}

.button:hover {
	color: #DDDDDD;
	 border-color: #DDDDDD;
}

.button2:active {
	 color: #BBBBBB;
	 border-color: #BBBBBB;
}

</style>

<script src="<c:url value='../resources/js/jquery-3.2.1.js'/>"></script>
<script type="text/javaScript">
	var hourList = "${hourList}";	 
	for(var i=0; i<hourList.length; i++) {
	     
	}
</script>
<script type="text/javaScript">
	
<script type="text/javaScript">
	function res_Check(){
		if(confirm("예약 하시겠습니까?") == true){
			return true;
		}else{
			return false;
		}		
	}	
</script>

<title>예약 시간 선택</title>
</head>
<body>
	
	


	
	
	<form id="reservation" action="reservation" method="get" onsubmit="return res_Check()">
		<div style="margin-left: 200px; margin-top: 50px;">
			<div style="margin-bottom: 20px;">예약 시간을 고르세요</div>			
			<div>
				<button class="button" name="hour" id="09" value="09" >9:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="10" value="10" >10:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="11" value="11" >11:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="12" value="12" >12:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="13" value="13" >13:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="14" value="14" >14:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="15" value="15" >15:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="16" value="16" >16:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="17" value="17" >17:00</button>
			</div>
		</div>
	</form>
</body>
</html>
