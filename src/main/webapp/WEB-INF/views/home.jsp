<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="./resources/css/sideBar.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.login').hide();
		$('.gn-icon-menu').hover(function() {
			$('.gn-menu-wrapper').toggleClass('gn-open-part');
		});

		$('.gn-menu-wrapper').hover(function() {
			$(this).toggleClass('gn-open-all');
		});

	});
	// Placeholder fixed for Internet Explorer
	$(function() {

		$('#SignIn').on('click', function(event) {
			event.preventDefault();//href 사용 안함
			$('.login').show();
		});
		// close
		$('#close').on('click', function() {
			$('.login').hide('fast');
		});

		var input = document.createElement("input");
		if (('placeholder' in input) == false) {
			$('[placeholder]').focus(function() {
				var i = $(this);
				if (i.val() == i.attr('placeholder')) {
					i.val('').removeClass('placeholder');
					if (i.hasClass('password')) {
						i.removeClass('password');
						this.type = 'password';
					}
				}
			}).blur(function() {
				var i = $(this);
				if (i.val() == '' || i.val() == i.attr('placeholder')) {
					if (this.type == 'password') {
						i.addClass('password');
						this.type = 'text';
					}
					i.addClass('placeholder').val(i.attr('placeholder'));
				}
			}).blur().parents('form').submit(function() {
				$(this).find('[placeholder]').each(function() {
					var i = $(this);
					if (i.val() == i.attr('placeholder'))
						i.val('');
				})
			});
		}

	});
	
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

		/* $.ajax({
			url : 'customer/login',
			type : 'post',
			data : {
				cust_Id : cust_Id1,
				cust_Pw : cust_Pw1
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				var html = '<span id="check">';
				if (data['check'] == "errorId") {
					html += data.value;
					
				} else if (data['check'] == "errorPw") {
					html += data.value;
					
				} else {
					logincheck = 'success';
					
				
					$(location).attr('href',"")
					
					alert("로그인이 완료 되었습니다.")
				}
				html += '</span>';

				$('#check').html(html);
			},
			error : function(err) {
				console.log(JSON.stringify(err));
			}
		}); */

	}

	function remoteCheck() {

		$(location).attr('href', "chat-ws");
	}

	// show password
	// $(document).ready(function(){
	// $("#pw").focus(function(){
	// this.type = "text";
	// }).blur(function(){
	// this.type = "password";
	// })
	// });
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>

	<div class="container">
		<ul id="gn-menu" class="gn-menu-main">
			<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav class="gn-menu-wrapper">
					<div class="gn-scroller">
						<ul class="gn-menu">
							
							<li class="gn-search-item">
							<input placeholder="Search" type="search" class="gn-search"> 
								<a class="gn-icon gn-icon-search">
									<span>Search</span>
								</a>
							</li>
							
							<li>
								<a class="gn-icon gn-icon-download">진료</a>
									<ul class="gn-submenu">
										<li>
											<a class="gn-icon gn-icon-illustrator" href="selfCheck/goSelfCheck">자가진단</a>
										</li>
										<li>
											<a class="gn-icon gn-icon-photoshop" href="chat/goChat">원격진료</a>
										</li>
										<li>
											<a class="gn-icon gn-icon-photoshop" href="reservation/book">예약하기</a>
										</li>
									</ul>
							</li>

							<li>
								<a class="gn-icon gn-icon-cog">Settings</a>
							</li>
							<li>
								<a class="gn-icon gn-icon-help">Help</a>
							</li>
							<li>
								<a class="gn-icon gn-icon-archive">WebRTC</a>
									<ul class="gn-submenu">
										<li>
											<a class="gn-icon gn-icon-article" href="webrtc/goWebRtc1">WebRTC1</a>
										</li>
										<li>
											<a class="gn-icon gn-icon-pictures" href="webrtc/goWebRtc2">WebRTC2</a>
										</li>
										<li>
											<a class="gn-icon gn-icon-videos" href="webrtc/goWebRtc3">WebRTC3</a>
										</li>
									</ul>
							</li>
						</ul>
					</div>
					<!-- /gn-scroller -->
				</nav>
			</li>
			<li><a href="">Char LIFE</a></li>
			<c:if test="${sessionScope.loginID != null}">
			<li><a href="">My Page</a></li>
			<li>
				<a class="codrops-icon codrops-icon-prev">
					<span>VOC</span>
				</a>
			</li>
			</c:if>
			<li>
				<sec:authorize access="isAnonymous()">
				
				<a class="codrops-icon codrops-icon-drop" id='SignIn'>
					<span>Login</span>
				</a>

				</sec:authorize>
				
				
				<sec:authorize access="isAuthenticated()">
    				
					<a class="codrops-icon codrops-icon-drop" href="customer/logout" id='SignIn'>
						<span>Logout</span>
					</a>
				
				</sec:authorize>
			</li>
		</ul>
		<header>
			<h1>
				Char Hospital <span>Welcome To
					<a>CHAR HOSPITAL</a> page
				</span>
			</h1>
		</header>
	</div>


	<div id="slideshow">
		<div class="slide-wrapper">
			<div class="slide">
				<h1 class="slide-number"></h1>
			</div>
			<div class="slide">
				<h1 class="slide-number"></h1>
			</div>
			<div class="slide">
				<h1 class="slide-number"></h1>
			</div>
			<div class="slide">
				<h1 class="slide-number"></h1>
			</div>
		</div>
	</div>

	<c:url value="/login" var="loginUrl" />

	<div class='login'>
		<button class='close' id='close'></button>



		<div class='top'>
			<h2>Login&nbsp;to&nbsp;download&nbsp;area</h2>
		</div>


		<form:form name="f" action="${loginUrl}" method="POST">
			<div class='user'>
				<input id="cust_Id" name='cust_Id' placeholder='ID' type='text'>
			</div>
			<div class='pw'>
				<input id='cust_Pw' name='cust_Pw' placeholder='Password'
					type='password'>
			</div>
			<div id="check"></div>
			<div class='remlog'>

				<input type="submit" value='Sign in'>

			</div>
		</form:form>
		<div class='forgot'>
			<h3>회원이 아니신가요?</h3>
			<a href='customer/goJoin'>click here</a> to join a new member
		</div>

	</div>

</body>
</html>
