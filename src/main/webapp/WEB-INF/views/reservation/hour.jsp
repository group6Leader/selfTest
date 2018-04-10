<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<%
	//현재 시간
	Calendar cal = Calendar.getInstance();
	int hour_of_day = cal.get(Calendar.HOUR_OF_DAY);
	
	//오늘 날짜
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(cal.getTime()));
%>

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
.button1{
	position:relative;	
	margin-top: 5px;
	background-color: #848484;
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

<script src="<c:url value='../resources/js/jquery-3.3.1.js'/>"></script>

<script type="text/javascript">
		
	$(document).ready(function(){
		
		var iUseDate = "<%=(String)session.getAttribute("iUseDate")%>"		
		
		if(${hourList} != null){		 
			var hour = JSON.parse('${jsonList}');
			var nine = document.getElementById("nine").value;
			var ten = document.getElementById("ten").value;
			var eleven = document.getElementById("eleven").value;
			var twelve = document.getElementById("twelve").value;
			var thirteen = document.getElementById("thirteen").value;
			var fourteen = document.getElementById("fourteen").value;
			var fifteen = document.getElementById("fifteen").value;
			var sixteen = document.getElementById("sixteen").value;
			var seventeen = document.getElementById("seventeen").value;
			
			for(var i=0; i<hour.length; i++){
				alert(hour[i]);	
				if(nine==hour[i]){
					$('#nine').attr('disabled', 'disabled');
					$('#nine').attr('class', 'button1');
				}
				if(ten==hour[i]){
					$('#ten').attr('disabled', 'disabled');
					$('#ten').attr('class', 'button1');
				}
				if(eleven==hour[i]){
					$('#eleven').attr('disabled', 'disabled');
					$('#eleven').attr('class', 'button1');
				}
				if(twelve==hour[i]){
					$('#twelve').attr('disabled', 'disabled');
					$('#twelve').attr('class', 'button1');
				}				
				if(thirteen==hour[i]){
					$('#thirteen').attr('disabled', 'disabled');
					$('#thirteen').attr('class', 'button1');
				}
				if(fourteen==hour[i]){
					$('#fourteen').attr('disabled', 'disabled');
					$('#fourteen').attr('class', 'button1');
				}
				if(fifteen==hour[i]){
					$('#fifteen').attr('disabled', 'disabled');
					$('#fifteen').attr('class', 'button1');
				}
				if(sixteen==hour[i]){
					$('#sixteen').attr('disabled', 'disabled');
					$('#sixteen').attr('class', 'button1');
				}
				if(seventeen==hour[i]){
					$('#seventeen').attr('disabled', 'disabled');
					$('#seventeen').attr('class', 'button1');
				}
			}
			
			if(iUseDate==<%=intToday%>){
				if(nine<=<%=hour_of_day %>){
					$('#nine').attr('disabled', 'disabled');
					$('#nine').attr('class', 'button1');
				}
			}			
			if(iUseDate==<%=intToday%>){
				if(ten<=<%=hour_of_day %>){
					$('#ten').attr('disabled', 'disabled');
					$('#ten').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(eleven<=<%=hour_of_day %>){
					$('#eleven').attr('disabled', 'disabled');
					$('#eleven').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(twelve<=<%=hour_of_day %>){
					$('#twelve').attr('disabled', 'disabled');
					$('#twelve').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(thirteen<=<%=hour_of_day %>){
					$('#thirteen').attr('disabled', 'disabled');
					$('#thirteen').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(fourteen<=<%=hour_of_day %>){
					$('#fourteen').attr('disabled', 'disabled');
					$('#fourteen').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(fifteen<=<%=hour_of_day %>){
					$('#fifteen').attr('disabled', 'disabled');
					$('#fifteen').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(sixteen<=<%=hour_of_day %>){
					$('#sixteen').attr('disabled', 'disabled');
					$('#sixteen').attr('class', 'button1');
				}
			}
			if(iUseDate==<%=intToday%>){
				if(seventeen<=<%=hour_of_day %>){
					$('#seventeen').attr('disabled', 'disabled');
					$('#seventeen').attr('class', 'button1');
				}
			}
			
		}	
	});
</script>

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
				<button class="button" name="hour" id="nine" value="09" >9:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="ten" value="10" >10:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="eleven" value="11" >11:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="twelve" value="12" >12:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="thirteen" value="13" >13:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="fourteen" value="14" >14:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="fifteen" value="15" >15:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="sixteen" value="16" >16:00</button>
			</div>
			<div>
				<button class="button" name="hour" id="seventeen" value="17" >17:00</button>
			</div>
		</div>
	</form>
</body>
</html>
