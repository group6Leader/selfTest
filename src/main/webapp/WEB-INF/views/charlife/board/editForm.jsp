<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/editForm</title>
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
			if($('#board_Category').val() == '病院口コミ'){
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
		
		if(confirm("修正しますか?")){
			return true;
		}
	};
	
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
					
					<h2>Write Your Comment (Edit) </h2>

					<form action="edit" method="post" onsubmit="return checkForm()">

						<div class="field half" style="width: 200px; font">
							<label for="Category">Category</label>
							<select id="board_Category" class="board_Category" name="board_Category" >
								<option style="color: black;" value="自由掲示板" <c:if test="${b.board_Category == '自由掲示板' }"> selected="selected" </c:if>> 自由掲示板 </option>
								<option style="color: black;" value="病院口コミ" <c:if test="${b.board_Category == '病院口コミ' }"> selected="selected" </c:if>>  病院口コミ  </option>
								<option style="color: black;" value="顧客の声" <c:if test="${b.board_Category == '顧客の声' }"> selected="selected" </c:if>> 顧客の声 </option>
							</select>							
						</div>
						
						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_Title" id="board_Title" type="text" placeholder="Title" value="${b.board_Title }">
						</div>
						
						<!-- Ratings -->
						<label for="Ratings">Ratings</label>
						 <div class="rating">
						  
						  <label>
						    <input type="radio" name="score" value="1" <c:if test="${b.score == 1 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="2" <c:if test="${b.score == 2 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="3" <c:if test="${b.score == 3 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>   
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="4" <c:if test="${b.score == 4 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="5" <c:if test="${b.score == 5 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						 </div> <br><br>
						
						<div class="field">
							<label for="comment">Comment</label>
							<textarea name="content" id="content" rows="6"> ${b.content } </textarea>
						</div>
						
						<ul class="actions">
							<li><input value="Back" class="button alt" type="button" onclick="location.href='./boardList'"></li>
							<li><input value="${b.board_Num }" name="board_Num" type="hidden">
							<li><input value="Complete" class="button alt" type="submit"></li>
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