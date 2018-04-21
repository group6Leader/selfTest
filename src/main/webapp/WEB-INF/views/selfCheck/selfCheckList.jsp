<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckList</title>
	<style type="text/css">
		table {
			border: 1px solid black;
			border-collapse: collapse;
			height: 300px; width: 400px;	
		}
		
		body {
			background-color: #F0F8FF;	
		}
		
	</style>

</head>
<body>

	<h1>자가진단 리스트</h1>
	
	<table border="1">
		<tr>
			<th> 자가진단번호 </th>
			<th> 고객번호 </th>
		</tr>
			
		<c:forEach var="vo" items="${sList }">
		
		<tr>
			<th> ${vo.selfCheck_Num } </th>
			<th> <a href="readOne?cust_Num=${vo.cust_Num }"> ${vo.cust_Num } </a> </th>
		
		</tr>
		</c:forEach>	
		
	
	
	</table>

	
	
</body>
</html>