<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/selfCheckList.css"></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckList</title>
	<!-- <style type="text/css">
		table {
			border: 1px solid black;
			border-collapse: collapse;
			height: 600px; width: 600px;	
		}
		
		body {
			background-color: #F0F8FF;	
		}
		
	</style> -->

</head>
<body>

	<%-- <h1>자가진단 리스트</h1>
	
	<table border="1">
		<tr>
			<th> 자가진단번호 </th>
			<th> 고객번호 </th>
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 생년월일 </th>
			<th> 자가진단일 </th>
			
		</tr>
			
		<c:forEach var="vo" items="${sList }">
		
		<tr>
			<th> ${vo.selfCheck_Num } </th>
			<th> <a href="readOne?cust_Num=${vo.cust_Num }"> ${vo.cust_Num } </a> </th>
			<th> ${vo.cust_Id } </th>
			<th> ${vo.cust_Name } </th>
			<th> ${vo.cust_Birth } </th>
			<th> ${vo.outbreak_Day } </th>
		</tr>
	
		</c:forEach>	
		
	</table> --%>

<h1>자가진단 리스트</h1>

  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th> 자가진단번호 </th>
          <th> 고객번호 </th>
          <th> 아이디 </th>
          <th> 이름 </th>
          <th> 생년월일 </th>
          <th> 자가진단일 </th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
   
        <c:forEach var="vo" items="${sList }">
		
		<tr>
			<th> ${vo.selfCheck_Num } </th>
			<th> <a href="readOne?cust_Num=${vo.cust_Num }"> ${vo.cust_Num } </a> </th>
			<th> ${vo.cust_Id } </th>
			<th> ${vo.cust_Name } </th>
			<th> ${vo.cust_Birth } </th>
			<th> ${vo.outbreak_Day } </th>
		</tr>
	
		</c:forEach>
      </tbody>
    </table>
  </div>

<!-- follow me template -->
<!-- <div class="made-with-love">
  Made with
  <i>♥</i> by
  <a target="_blank" href="https://codepen.io/nikhil8krishnan">Nikhil Krishnan</a>
</div> -->
	
</body>
</html>