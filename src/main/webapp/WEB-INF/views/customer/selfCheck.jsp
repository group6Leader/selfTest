<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/selfCheck.css"></c:url>">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		$('.popup').hide();
		$('#brain').click(function(){
			$('.popup').show();
		});
		
		var current_fs, next_fs, previous_fs; //fieldsets
		var left, opacity, scale; //fieldset properties which we will animate
		var animating; //flag to prevent quick multi-click glitches

		$(".next").click(function() {
			if (animating) return false;
			animating = true;
			current_fs = $(this).parent();
			next_fs = $(this).parent().next();

			//activate next step on progressbar using the index of next_fs
			//show the next fieldset
			next_fs.show();
			//hide the current fieldset with style
			current_fs.animate({
				opacity : 0
			}, {
				step : function(now, mx) {
					//as the opacity of current_fs reduces to 0 - stored in "now"
					//1. scale current_fs down to 80%
					scale = 1 - (1 - now) * 0.2;
					//2. bring next_fs from the right(50%)
					left = (now * 50) + "%";
					//3. increase opacity of next_fs to 1 as it moves in
					opacity = 1 - now;
					current_fs.css({
						'transform' : 'scale(' + scale + ')',
						'position' : 'absolute'
					});
					next_fs.css({
						'left' : left,
						'opacity' : opacity
					});
				},
				duration : 800,
				complete : function() {
					current_fs.hide();
					animating = false;
				},
				//this comes from the custom easing plugin
				easing : 'easeInOutBack'
			});
		});

		$(".previous").click(function() {
			if (animating)
				return false;
			animating = true;

			current_fs = $(this).parent();
			previous_fs = $(this).parent().prev();

			//show the previous fieldset
			previous_fs.show();
			//hide the current fieldset with style
			current_fs.animate({
				opacity : 0
			}, {
				step : function(now, mx) {
					//as the opacity of current_fs reduces to 0 - stored in "now"
					//1. scale previous_fs from 80% to 100%
					scale = 0.8 + (1 - now) * 0.2;
					//2. take current_fs to the right(50%) - from 0%
					left = ((1 - now) * 50) + "%";
					//3. increase opacity of previous_fs to 1 as it moves in
					opacity = 1 - now;
					current_fs.css({
						'left' : left
					});
					previous_fs.css({
						'transform' : 'scale(' + scale + ')',
						'opacity' : opacity
					});
				},
				duration : 800,
				complete : function() {
					current_fs.hide();
					animating = false;
				},
				//this comes from the custom easing plugin
				easing : 'easeInOutBack'
			});
		});

		$(".submit").click(function() {
			return false;
		})
	});


	//jQuery time
	
</script>
<title>Self Check</title>
</head>
<body>
	<div class="container">
		<ol class="even">
			<li class='hex' id="brain"><a href="#popup" id="popup-brian"></a></li>
			<a href="#popup"><li class='hex' id="broken-bone"></li></a>
			<a href="#popup"><li class='hex' id="footprint"></li></a>
		</ol>
		<ol class="odd">
			<a href="#popup"><li class='hex' id="stomach"></li></a>
			<a href="#popup"><li class='hex' id="tooth"></li></a>
			<a href="#popup"><li class='hex'></li></a>
		</ol>
		<ol class="even">
			<a href="#popup"><li class='hex'></li></a>
			<a href="#popup"><li class='hex'></li></a>
			<a href="#popup"><li class='hex'></li></a>
		</ol>
	</div>
	<div class="popup" id="popup">
		<div class="popup-inner">
			<div class="popup__photo">
				<img
					src="https://images.unsplash.com/photo-1515224526905-51c7d77c7bb8?ixlib=rb-0.3.5&s=9980646201037d28700d826b1bd096c4&auto=format&fit=crop&w=700&q=80"
					alt="">
			</div>
			<div class="popup__text">
				<h1>Lorem ipsum dolor sit amet</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Integer ex velit, viverra non vulputate vitae, blandit vitae nisl.
					Nullam fermentum orci et erat viverra bibendum. Aliquam sed varius
					nibh, vitae mattis purus. Mauris elementum sapien non ullamcorper
					vulputate. Orci varius natoque penatibus et magnis dis parturient
					montes, nascetur ridiculus mus. Sed eget felis sit amet eros
					viverra pulvinar.</p>
			</div>
			<a class="popup__close" href="#">X</a>
		</div>
	</div>
	<div class="popup" id="popup_brain">
		<div class="popup-inner">
			<!-- MultiStep Form -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form id="msform">
						<!-- fieldsets -->
						<fieldset>
							<h2 class="fs-title">머리 자가진단</h2>
							<h3 class="fs-subtitle">증상을 체크해주세요</h3>
							<input type="checkbox" value="머리가 지끈거림">
							<input type="text" name="twitter" placeholder="Twitter" />
							<input type="button" name="next" class="next action-button" value="Next" />
						</fieldset>
						<fieldset>
							<h2 class="fs-title">Social Profiles</h2>
							<h3 class="fs-subtitle">Your presence on the social network</h3>
							<input type="text" name="twitter" placeholder="Twitter" />
							<input type="text" name="facebook" placeholder="Facebook" />
							<input type="text" name="gplus" placeholder="Google Plus" /> 
							<input type="button" name="previous" class="previous action-button-previous" value="Previous" /> 
							<input type="button" name="next" class="next action-button" value="Next" />
						</fieldset>
						<fieldset>
							<h2 class="fs-title">Create your account</h2>
							<h3 class="fs-subtitle">Fill in your credentials</h3>
							<input type="text" name="email" placeholder="Email" /> 
							<input type="password" name="pass" placeholder="Password" /> 
							<input type="password" name="cpass" placeholder="Confirm Password" /> 
							<input type="button" name="previous" class="previous action-button-previous" value="Previous" /> 
							<input type="submit" name="submit" class="submit action-button" value="Submit" />
						</fieldset>
					</form>
					<!-- link to designify.me code snippets -->
					<!-- /.link to designify.me code snippets -->
				</div>
			</div>
			<!-- /.MultiStep Form -->
			<a class="popup__close" href="#">X</a>
		</div>
	</div>


</body>
</html>