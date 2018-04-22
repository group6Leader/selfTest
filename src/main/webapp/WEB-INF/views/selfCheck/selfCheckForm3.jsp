<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/selfCheck3.css"></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckForm3</title>

<style type="text/css">
body {
	background-color: #F0F8FF;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
	height: 700px;
	width: 800px;
}
</style>

</head>
<body>

	<h1>자기진단 결과</h1>
	<div class="wrapper">
		<div class="row">
			<div class="cell row header">이름 / 자기진단 번호</div>
			<div class="cell">${c.cust_Name }/ ${s.selfCheck_Num }</div>
		</div>
		<div class="row">
			<div class="cell row header">혈압</div>
			<div class="cell">${s.blood_Pressure }</div>
		</div>
		<div class="row">
			<div class="cell row header">흡연</div>
			<div class="cell">${s.smoking }</div>
		</div>
		<div class="row">
			<div class="cell row header">당뇨여부</div>
			<div class="cell">${s.diabetes }</div>
		</div>
		<div class="row">
			<div class="cell row header">수술여부</div>
			<div class="cell">${s.surgery }</div>
		</div>
		<div class="row">
			<div class="cell row header">장애여부</div>
			<div class="cell">${s.disability }</div>
		</div>
		<div class="row">
			<div class="cell row header">복용약</div>
			<div class="cell">${s.medicine }</div>
		</div>
		<div class="row">
			<div class="cell row header">알레르기</div>
			<div class="cell">${s.allergy }</div>
		</div>
		<div class="row">
			<div class="cell row header">해외방문여부</div>
			<div class="cell">${s.overseas_Visits }</div>
		</div>
		<div class="row">
			<div class="cell row header">수면시간</div>
			<div class="cell">${s.sleep_Time }</div>
		</div>
		<div class="row">
			<div class="cell row header">스트레스</div>
			<div class="cell">${s.stress }</div>
		</div>
		<div class="row">
			<div class="cell row header">가족력</div>
			<div class="cell">${s.family_History }</div>
		</div>
		<div class="row">
			<div class="cell row header">임신여부</div>
			<div class="cell">${s.pregnant }</div>
		</div>
		<div class="row">
			<div class="cell row header">아픈부위</div>
			<div class="cell">${s.pain }</div>
		</div>
		<div class="row">
			<div class="cell row header">아픈증상</div>
			<div class="cell">${s.symptom }</div>
		</div>
		<div class="row">
			<div class="cell row header">최종수정일</div>
			<div class="cell">${s.outbreak_Day }</div>
		</div>
	</div> <br>
	
	<button onclick="location.href='../'" style="margin-left: 30px;">홈으로</button>

</body>
</html>