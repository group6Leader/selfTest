<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/selfCheckList.css"></c:url>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
	
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-latest.js"></c:url>"></script>
	
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.tablesorter.js"></c:url>"></script>

<script type="text/javascript">
$(function(){
	  $('#keywords').tablesorter(); 
	});
</script>
<style type="text/css">
body {
		background-color: #F0F8FF;
	}
</style>



<title>selfCheck/selfCheckList</title>

</head>
<body>

<div id="wrapper">
<h1>自己診断リスト</h1>



<table id="keywords" cellspacing="0" cellpadding="0">

	<thead>
		<tr>
			<th><span>自己診断番号</span></th>
			<th><span>顧客番号</span></th>
			<th><span>ID</span></th>
			<th><span>名前</span></th>
			<th><span>生年月日</span></th>
			<th><span>自己診断日</span></th>
		</tr>
     </thead>

     <tbody>
        <c:forEach var="vo" items="${sList }">
		<tr>
			<td class="lalign"> ${vo.selfCheck_Num } </td>
			<td> ${vo.cust_Num } </td>
			<td> ${vo.cust_Id } </td>
			<td> <a href="readOne?cust_Num=${vo.cust_Num }"> ${vo.cust_Name } </a></td>
			<td> ${vo.cust_Birth } </td>
			<td> ${vo.outbreak_Day } </td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
	
</body>
</html>