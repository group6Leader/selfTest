<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/join.css"></c:url>">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	  $('#keywords').tablesorter(); 
	});
	</script>
</head>
<body>
<c:if test="${HR_List=='[]'}">
등록된 진단서가 없습니다.
</c:if>
	<c:if test="${HR_List!='[]'}">
	<div id="wrapper">
	<h1>개인 진단서 리스트</h1>
    <table id="keywords" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th><span>진단서 번호</span></th>
          <th><span>이름</span></th>
          <th><span>병원이름 </span></th>
          <th><span>발행일</span></th>
          <th><span>의사이름</span> </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="list" items="${HR_List }">
		<tr>
		<td><a href="selectHRone?dia_Num=${list.dia_Num }"> ${list.dia_Num } </a> </td>
			<td class="lalign"> ${sessionScope.customer.cust_Name } </td>
			<td> ${list.hos_Name } </td>
			<td> ${list.issue_Date } </td>
			<td> ${list.cust_Id } </td>
		</tr>
		</c:forEach>
      </tbody>
    </table>
  </div>
  </c:if>
  
  
</body>
</html>