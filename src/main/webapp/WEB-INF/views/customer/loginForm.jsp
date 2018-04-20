<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customer/loginForm</title>

	<script type="text/javascript">
	
	function formCheck() {

		var cust_Id1 = $('#cust_Id').val();
		var cust_Pw1 = $('#cust_Pw').val();
		var cust_Id2 = document.getElementById('cust_Id');
		var cust_Pw2 = document.getElementById('cust_Pw');

		var logincheck = 'fail';

		if (cust_Id2.value == '') {
			alert("ID를 입력해주세요");
			cust_Id.focus();
			return false;
		}
		if (cust_Pw2.value == '') {
			alert("password를 입력해주세요");
			cust_Pw.focus();
			return false;
		}
	}
	
	</script>


</head>
<body>

	<c:url value="../login" var="loginUrl" />

	<div class='login'>
	
		<div class='top'>
			<h2>Login</h2>
		</div>

		<form name="f" action="${loginUrl}" method="POST" onsubmit="return formCheck()">
			<div class='user'>
				<input id="cust_Id" name='cust_Id' placeholder='ID' type='text'>
			</div>
			
			<div class='pw'>
				<input id='cust_Pw' name='cust_Pw' placeholder='Password' type='password'>
			</div>
			
			<div id="check"></div>
			<div class='remlog'>

				<div class="container">
					<input type="submit" value='Login' class="btn-success btn-lg btn-block" id="button">
				</div>
			</div>
		</form>
		
		<div class='forgot'>
			<h3>회원이 아니신가요?</h3>
			<a href='goJoin'>click here</a> to join a new member
		</div>

	</div>

</body>
</html>