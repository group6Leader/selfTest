<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="./resources/css/sideBar.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.login').hide();
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
	<nav class="main-menu">
		<div>
			<a class="logo" href="home"> </a>
		</div>
		<div class="settings"></div>
		<div class="scrollbar" id="style-1">

			<ul>

				<li>
					<a href="">
					<i class="fa fa-home fa-lg"></i>
					<span class="nav-text">Home</span>
				</a></li>

				<li>
					<a id='SignIn'>
					<i class="fa fa-user fa-lg"></i>
					<span class="nav-text">Login</span>
					</a>
				</li>


				<li>
					<a href="">
					<i class="fa fa-envelope-o fa-lg"></i>
					<span class="nav-text">Contact</span>
					</a>
				</li>

				<li class="darkerlishadow">
					<a href="">
					<i class="fa fa-clock-o fa-lg"></i> 
					<span class="nav-text">News</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-desktop fa-lg"></i>
					<span class="nav-text">Technology</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-plane fa-lg"></i>
					<span class="nav-text">Travel</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-shopping-cart"></i>
					<span class="nav-text">Shopping</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-microphone fa-lg"></i>
					<span class="nav-text">Film & Music</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com"> 
					<i class="fa fa-flask fa-lg"></i> 
					<span class="nav-text">Web Tools</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-picture-o fa-lg"></i>
					<span class="nav-text">Art & Design</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-align-left fa-lg"></i>
					<span class="nav-text">Magazines</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com"> 
					<i class="fa fa-gamepad fa-lg"></i>
					<span class="nav-text">Games</span>
					</a>
				</li>

				<li class="darkerli">
					<a href="http://startific.com">
					<i class="fa fa-glass fa-lg"></i>
					<span class="nav-text">Life & Style </span>
					</a>
				</li>

				<li class="darkerlishadowdown">
					<a href="http://startific.com">
					<i class="fa fa-rocket fa-lg"></i>
					<span class="nav-text">Fun</span>
					</a>
				</li>


			</ul>


			<li>
				<a href="http://startific.com"> 
				<i class="fa fa-question-circle fa-lg"></i>
				<span class="nav-text">Help</span>
				</a>
			</li>


			<ul class="logout">
				<li>
					<a href="http://startific.com"> 
					<i class="fa fa-lightbulb-o fa-lg"></i> 
					<span class="nav-text">	BLOG </span>
					</a>
				</li>
			</ul>
		</div>
	</nav>

	<div id="slideshow">
		<div class="slide-wrapper">
			<div class="slide">
				<h1 class="slide-number">1</h1>
			</div>
			<div class="slide">
				<h1 class="slide-number">2</h1>
			</div>
			<div class="slide">
				<h1 class="slide-number">3</h1>
			</div>
			<div class="slide">
				<h1 class="slide-number">4</h1>
			</div>
			<div class="slide">
				<h1 class="slide-number">5</h1>
			</div>
		</div>
	</div>

	<div id="box">
		<button value="원격진료"></button>
		<button value="예약하러가기"></button>
	</div>
	<div class='login'>
		<button class='close' id='close'></button>
		<div class='top'>
			<h2>Login&nbsp;to&nbsp;download&nbsp;area</h2>
		</div>
		<div class='user'>
			<input name='username' placeholder='Mail' type='text'>
		</div>
		<div class='pw'>
			<input id='pw' name='password' placeholder='Password' type='password'>
		</div>
		<div class='remlog'>
			<div class='remember'>
				<input checked='checked' id='remember' name='remember'
					type='checkbox'> <label for='remember'></label>remember me
			</div>
			<input type='submit' value='Sign in'>
		</div>
		<div class='forgot'>
			<h3>Forgot your password?</h3>
			<a href='#'>click here</a> to order a new password.
		</div>
	</div>

</body>
</html>
