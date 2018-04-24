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
	<h1>처방전 리스트</h1>
    <table id="keywords" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th><span>처방전번호</span></th>
          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${pList }">
		<tr>
			<th> <a href="prescriptionIndResult?pre_Num=${vo.pre_Num }"> ${vo.pre_Num } </a></th>
		</tr>
		</c:forEach>
      </tbody>
    </table>
  </div>
	
</body>
</html>