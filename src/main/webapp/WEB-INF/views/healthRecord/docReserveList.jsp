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
<script type="text/javascript">
function formCheck(custNum) {
	
	
	var search_Num = custNum;
	

	$(document).ready(function() {
	
		$.ajax({
			url : "nameSearch"
			,type : "post"
			,data :{
				
				search_Num : search_Num
				
				
			},success : function(find) {
				
				opener.document.getElementById('cust_Name').value=find.findName;
				opener.document.getElementById('hos_Name').value=find.hos_Name;
				opener.document.getElementById('hos_Address').value=find.hos_Address;
				opener.document.getElementById('hos_Phone').value=find.hos_Phone;
				opener.document.getElementById('cust_Num').value=search_Num;
				
				window.close();
				
			},error : function(err) {
				alert(JSON.stringify(err));
			}
		});
		
	
	
});
	
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Res Customer</title>
</head>
<body>

	<c:forEach var="find_Cust" items="${list }">


		<div class="form-element form-input">
			<input id="hos_Name" name="hos_Name" class="form-element-field"
				placeholder="hospital_Name" type="text"
				value="${find_Cust.hos_Name }" disabled="disabled" />
			<div class="form-element-bar"></div>
			<label class="form-element-label">hos_Name</label>
		</div>


		<div class="form-element form-input">
			<input id="hos_Address" name="hos_Address" class="form-element-field"
				placeholder="hospital_Address" type="text"
				value="${find_Cust.hos_Addr }" disabled="disabled" />
			<div class="form-element-bar"></div>
			<label class="form-element-label">hos_Address</label>
		</div>


		<div class="form-element form-input">
			<input id="hos_Phone" name="hos_Phone" class="form-element-field"
				placeholder="hospital_Phone" type="number"
				value="${find_Cust.hos_Phone }" disabled="disabled" />
			<div class="form-element-bar"></div>
			<label class="form-element-label">hos_Phone</label>
		</div>


		<div class="form-element form-input">
			<input id="cust_Num" name="cust_Num" class="form-element-field"
				placeholder="write customer name" type="text"
				value="${find_Cust.cust_Num }" disabled="disabled" /></a>
			<div class="form-element-bar"></div>
			<label class="form-element-label">cust_Num</label>
			<button onclick="formCheck(${find_Cust.cust_Num })">SELECT</button>

		</div>
		<br>
	</c:forEach>


</body>
</html>