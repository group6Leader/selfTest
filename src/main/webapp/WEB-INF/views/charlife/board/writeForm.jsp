<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/writeForm</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../resources/css/charlife.css" />
        <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" type="text/css"  href="../resources/css/rating.css">
		
		<script type="text/javascript">
		$(document).ready(function() {
			$('.rating').hide();
			$('.gn-icon-menu').hover(function() {
				$('.gn-menu-wrapper').toggleClass('gn-open-part');
			});

			$('.gn-menu-wrapper').hover(function() {
				$(this).toggleClass('gn-open-all');
			});
		});
		
		</script>
		
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="gocharlife"><span>Back To</span> CharLife</a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>
		
		<!-- Comment -->
			<section id="post" class="wrapper bg-img" data-bg="banner2.jpg">
				<div class="inner">
				<article class="box">
					
					
					<h2>Write Your Comment</h2>

					<form action="write" method="post">

						<div class="field half" style="width: 200px; font">
							<label for="Category">Category</label>
							<select id="board_Category" name="board_Category" >
								<option style="color: black;" value="병원 평가" > 병원 평가 </option>
								<option style="color: black;" value="자유 게시판"> 자유 게시판 </option>
								<option style="color: black;" value="고객의 목소리"> 고객의 목소리 </option>
							</select>							
						</div>
						
						<!-- <input name="hos_Name" id="hos_Name" type="text" placeholder="Hospital Name"> -->
						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_Title" id="board_Title" type="text" placeholder="Title">
						</div>
						
						<c:if test="$(#board_Category).value">
						<!-- Ratings -->
						<label>Ratings</label>
						 <div class="rating">
						  
						  <label>
						    <input type="radio" name="score" value="1"/>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="2" />
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="3" />
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>   
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="4" />
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="5" checked="checked"/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						 </div> <br><br>	
						</c:if>
						
						<div class="field">
							<label for="content">Content</label>
							<textarea name="content" id="content" rows="6" placeholder="Content"></textarea>
						</div>
						
						<ul class="actions">
							<li><input value="Send" class="button alt" type="submit" style="margin-left: 200px;"></li>
						</ul>
					</form>

				</article>
				</div>
			</section>

		<!-- Scripts -->
					<script src="../resources/js/jquery.min.js"></script>
			<script src="../resources/js/jquery.scrolly.min.js"></script>
			<script src="../resources/js/jquery.scrollex.min.js"></script>
			<script src="../resources/js/skel.min.js"></script>
			<script src="../resources/js/util.js"></script>
			<script src="../resources/js/charlife.js"></script>
		

	</body>
</html>