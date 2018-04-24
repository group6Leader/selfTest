<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/selfCheckList.css"></c:url>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-latest.js"></c:url>"></script>
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.tablesorter.js"></c:url>"></script>
<title>prescription/prescriptionList</title>
<script type="text/javascript">
$(function(){
	  $('#keywords').tablesorter(); 
	});
	</script>
</head>
<body>

	<div id="wrapper">
	<h1>환자 명단</h1>
    <table id="keywords" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th><span>고객번호</span></th>
          <th><span>아이디 </span></th>
          <th><span>이름</span></th>
          <th><span>생년월일</span> </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${cList }">
		<tr>
			<td class="lalign"> ${vo.cust_Num } </td>
			<td> ${vo.cust_Id } </td>
			<td> <a href="prescriptionIndList?cust_Num=${vo.cust_Num }"> ${vo.cust_Name } </a> </td>
			<td> ${vo.cust_Birth } </td>
		</tr>
		</c:forEach>
      </tbody>
    </table>
  </div>
	
</body>
</html>