<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/selfCheck3.css"></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/readOne</title>

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

	<script type="text/javascript">
	function goIndPrescription() {
		/* alert(1); */
		/* alert('${c.cust_Num}'); */
		var cust_Num = document.getElementById('prescription').value;
		/* alert(cust_Num); */
		
		location.href = '../prescription/readOne2?cust_Num='+ cust_Num;
	}
	
	</script>


</head>
<body>

	<h1>自己診断結果</h1>
	<div class="wrapper">
		<div class="row">
			<div class="cell row header">名前 / 自己診断番号</div>
			<div class="cell">${c.cust_Name }/ ${s.selfCheck_Num }</div>
		</div>
		<div class="row">
			<div class="cell row header">血圧</div>
			<div class="cell">${s.blood_Pressure }</div>
		</div>
		<div class="row">
			<div class="cell row header">喫煙</div>
			<div class="cell">${s.smoking }</div>
		</div>
		<div class="row">
			<div class="cell row header">糖尿病有無</div>
			<div class="cell">${s.diabetes }</div>
		</div>
		<div class="row">
			<div class="cell row header">手術有無</div>
			<div class="cell">${s.surgery }</div>
		</div>
		<div class="row">
			<div class="cell row header">障害有無</div>
			<div class="cell">${s.disability }</div>
		</div>
		<div class="row">
			<div class="cell row header">服薬有無</div>
			<div class="cell">${s.medicine }</div>
		</div>
		<div class="row">
			<div class="cell row header">アレルギー</div>
			<div class="cell">${s.allergy }</div>
		</div>
		<div class="row">
			<div class="cell row header">海外旅行有無</div>
			<div class="cell">${s.overseas_Visits }</div>
		</div>
		<div class="row">
			<div class="cell row header">睡眠時間</div>
			<div class="cell">${s.sleep_Time }</div>
		</div>
		<div class="row">
			<div class="cell row header">ストレス</div>
			<div class="cell">${s.stress }</div>
		</div>
		<div class="row">
			<div class="cell row header">家族歴</div>
			<div class="cell">${s.family_History }</div>
		</div>
		
		<c:if test="${c.cust_Sex == 'F' }">
		<div class="row">
			<div class="cell row header">妊娠</div>
			<div class="cell">${s.pregnant }</div>
		</div>
		</c:if>
		<div class="row">
			<div class="cell row header">痛い部位</div>
			<div class="cell">${s.pain }</div>
		</div>
		<div class="row">
			<div class="cell row header">症状</div>
			<div class="cell">${s.symptom }</div>
		</div>
		<div class="row">
			<div class="cell row header">最終修正日</div>
			<div class="cell">${s.outbreak_Day }</div>
		</div>
	</div> <br>
	
	<button onclick="location.href='./goSelfCheckList'" style="margin-left: 30px;"> Back </button>
	
	<sec:authorize access="hasRole('DOCTOR')">
	<button onclick="goIndPrescription()" > Prescription </button>
	</sec:authorize>
	
	<input type="hidden" id="prescription" value="${s.cust_Num}">

</body>
</html>