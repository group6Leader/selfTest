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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$('.rating').hide(); 
          	$('#board_Category').change(function(){
			if($('#board_Category').val() == '병원 평가'){
  				$('.rating').show()
			}else{
 				$('.rating').hide()
			}
		})
	})
	
	function checkForm() {
		/* alert('1'); */
		
		var board_Title = $('#board_Title').val();
		var content = $('#content').val();
		
		if(board_Title == '') {
			/* alert('2') */
			alert('Please Enter Title')
			
			return false;
		}
		
		if(content == '') {
			/* alert('3') */
			alert('Please Enter Content')
			
			return false;
		}
		
		return true;
	}

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

					<form action="write" method="post" onsubmit="return checkForm()">

						<div class="field half" style="width: 200px; font">
							<label for="Category">Category</label>
							<select id="board_Category" class="board_Category" name="board_Category" >
								<option style="color: black;" value="자유 게시판"> 자유 게시판 </option>
								<option style="color: black;" value="병원 평가">  병원 평가  </option>
								<option style="color: black;" value="고객의 목소리"> 고객의 목소리 </option>
							</select>							
						</div>
					
						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_Title" id="board_Title" type="text" placeholder="Title">
						</div>
					
						<!-- Ratings -->
						<label for="Ratings">Ratings</label>
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