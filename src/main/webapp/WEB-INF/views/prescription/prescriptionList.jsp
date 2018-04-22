<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/prescriptionList</title>
	<style type="text/css">
		table {
			border: 1px solid black;
			border-collapse: collapse;
			height: 600px; width: 600px;	
		}
		
		body {
			background-color: #F0F8FF;	
		}
		
	</style>

</head>
<body>

	<h1>환자 명단</h1>
	
	<table border="1">
		<tr>
			<th> 고객번호 </th>
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 생년월일 </th>
			
		</tr>
			
		<c:forEach var="vo" items="${cList }">
		
		<tr>
			<th> ${vo.cust_Num } </th>
			<th> ${vo.cust_Id } </th>
			<th> <a href="readOne?cust_Num=${vo.cust_Num }"> ${vo.cust_Name } </a> </th>
			<th> ${vo.cust_Birth } </th>
		</tr>
	
		</c:forEach>	
		
	</table>
	
	

	
	
</body>
</html>