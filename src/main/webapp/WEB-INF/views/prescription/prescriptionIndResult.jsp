<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/selfCheck3.css"></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/prescriptionResult</title>

<style type="text/css">
	body {
		background-color: #F0F8FF;
	}

</style>

</head>
<body>

	<h1>${p.pre_Num }번 처방전</h1>
	
	<div class="wrapper">
		<div class="row">
			<div class="cell row header">환자</div>
			<div class="cell"></div>
		</div>
		
		<div class="row">
			<div class="cell row header">환자성함</div>
			<div class="cell">${c.cust_Name }</div>
		</div>
		<div class="row">
			<div class="cell row header">성별</div>
			<div class="cell">${c.cust_Sex }</div>
		</div>
		<div class="row">
			<div class="cell row header">주소</div>
			<div class="cell">${c.cust_Address }</div>
		</div>
		<div class="row">
			<div class="cell row header">전화번호</div>
			<div class="cell">${c.cust_Phone }</div>
		</div>
		<div class="row">
			<div class="cell row header"></div>
			<div class="cell"></div>
		</div>
		<div class="row">
			<div class="cell row header">병원</div>
			<div class="cell"></div>
		</div>
		<div class="row">
			<div class="cell row header">병원이름</div>
			<div class="cell"></div>
		</div>
		<div class="row">
			<div class="cell row header">주소</div>
			<div class="cell">${s.allergy }</div>
		</div>
		<div class="row">
			<div class="cell row header">전화번호</div>
			<div class="cell">${s.overseas_Visits }</div>
		</div>
	</div> <br>

 	<%-- <div id="patient"></div>
	<div>
	환자성함
	${c.cust_Name }
	</div>	

	<div>
	성별
	${c.cust_Sex }
	</div>	

	<div>
	주소
	${c.cust_Address }
	</div>	
	
	<div>
	전화번호
	${c.cust_Phone }
	</div>
	
	<div id="hospital">
		<div>
		병원이름
		</div>

		<div>
		주소
		</div>		
		
		<div>
		전화번호
		</div>		
	</div> --%>
		
	
	<table border="1">
		<tr>
			<th> 처방의약품 </th>
			<th> 투여량 </th>
			<th> 하루 투여횟수 </th>
			<th> 복용법 </th>
		</tr>
		
		<tr>
			<th>
			<c:forEach items="${med_Name }" var="i">
			<br> ${i} <br><br>
			</c:forEach>
			</th>
			
			<th>
			<c:forEach items="${med_Amount }" var="i">
			<br> ${i} <br><br>
			</c:forEach>
			</th>
			
			<th>
			<c:forEach items="${med_Count }" var="i">
			<br> ${i} <br><br>
			</c:forEach>
			</th>
			
			<th>
			<c:forEach items="${med_Content }" var="i">
			<br> ${i} <br><br>
			</c:forEach>
			</th>
	
	</table>
	
	
	<%-- <div id="medicine">
		<div>
		처방의약품
		1회 투여량
		하루 투여횟수
		복용법
		</div>
		${p.med_Name }
		
		<div>
		<c:forEach items="${med_Name }" var="i">
			${i} <br>
		</c:forEach>
		
		<c:forEach items="${med_Amount }" var="i">
			${i} <br>
		</c:forEach>
			
		<c:forEach items="${med_Count }" var="i">
			${i} <br>
		</c:forEach>
		
		<c:forEach items="${med_Content }" var="i">
			${i} <br>
		</c:forEach>


		</div>
	</div> --%>

</body>
</html>