<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/readOne</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="../resources/css/charlife.css" />
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	
	<script type="text/javascript">
		function del(board_Num) {
			/* alert('1');
			alert(board_Num); */
			
			location.href='./delete?board_Num=' + board_Num;
		}
		
		function edit(board_Num) {
			/* alert('2');
			alert(board_Num); */
			
			location.href='./edit?board_Num=' + board_Num;
		}
		
		function del2(board_Num, reply_Num) {
			alert('1');
			
			location.href='../reply/delete?board_Num=' + board_Num + '&reply_Num=' + reply_Num;
		}
	
	</script>
	
	<style type="text/css">
	/* .rating {
		transform: translate(-50%, -50%);
		display: flex;	
	}
	
	.rating input {
		display: none;
	
	}
	
	.rating label {
		/* display: block; */
		cursor: pointer;
		/* width: 50px; */
		background: #ccc;
	}
	
	.rating label:before {
		content: '\f005';
		font-family: fontAwesome;
		/* position: relative; */
		/* display: block; */
		font-size: 50px;
		color: #101010;
	}
	
	.rating label:after {
		content: '\f005';
		font-family: fontAwesome;
		/* position: absolute; */
		/* display: block; */
		font-size: 50px;
		color: #1f9cff;
	} */
	
	
	</style>
		
		
</head>

	<body class="subpage">

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="gocharlife"><span>Back To</span> CharLife</a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>
		
		<!-- Board -->
			<section id="post" class="wrapper bg-img" data-bg="banner2.jpg">
				<div class="inner">
				<article class="box">
					
					
					<h2>${b.board_Num } Board Message</h2>

					<form action="write" method="post">

						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_Title" id="board_Title" type="text" value="${b.board_Title }">
						</div>
						
						
						<!-- Ratings -->
						<div class="rating">
							
							
							Low &nbsp; <input type="radio" name="score" id="star1" value=1 checked="checked" <c:if test="${b.score == 1 }"> checked="checked" </c:if>/>
							<label for="star1"></label>
						 	
						 	<input type="radio" name="score" id="star2" value="2" <c:if test="${b.score == 2 }"> checked="checked" </c:if>/> 
						 	<label for="star2"></label>
						 	
						 	<input type="radio" name="score" id="star3" value="3" <c:if test="${b.score == 3 }"> checked="checked" </c:if>> 
						 	<label for="star3"></label>
						 	
						 	<input type="radio" name="score" id="star4" value="4" <c:if test="${b.score == 4 }"> checked="checked" </c:if>> 
						 	<label for="star4"></label>
						 	
						 	<input type="radio" name="score" id="star5" value="5" <c:if test="${b.score == 5 }"> checked="checked" </c:if>> 
						 	<label for="star5">High</label>
						
						</div> <br>
						
						<!--  -->
						
						<div class="field">
							<label for="comment">Comment</label>
							<textarea name="content" id="content" rows="6"> ${b.content } </textarea>
						</div>
					</form>
						
						
					<!-- 댓글 -->
					<%-- ${sessionScope.loginId } <br> --%>

					<form action="../reply/insert" method="post">
						<label for="Comment">Comment</label> 
						
						<input type="text" id="text" name="text" placeholder="Comment"> <br>
						<input type="hidden" id="board_Num" name="board_Num" value="${b.board_Num }">
						
						<input type="submit" value="등록">

					</form> <br>
				
					<table border="1">
						<tr>
							<th style="width: 300px;"> Num </th>
							<th style="width: 700px;"> Text </th>
							<th>  </th>
							<th>  </th>
						</tr>
					
					<c:forEach var="vo" items="${rList }">
						<tr>
							<td> ${vo.reply_Num } </td>
							<td> ${vo.text } </td>
							
							<c:if test="${sessionScope.customer.cust_Num == vo.cust_Num }">
							<td> <input type="button" value="수정" onclick="edit2(${vo.board_Num}, ${vo.reply_Num})"> </td>
							<td> <input type="button" value="삭제" onclick="del2(${vo.board_Num}, ${vo.reply_Num})"> </td>
							</c:if>
						</tr>		
					
					</c:forEach>
						
					</table>
						
					
					<!-- Buttons -->
					<ul class="actions">
						<li><input value="Back" class="button alt" type="button" onclick="location.href='./boardList'"></li>
						<li><input value="Delete" class="button alt" type="button" onclick="del(${b.board_Num})"></li>
						
						<li><input value="Edit" class="button alt" type="button" onclick="edit(${b.board_Num})"></li>
					</ul>


				<!-- private int board_Num;
				private String board_Title;
				private String hos_Name;
				private String content;
				private String input_Date;
				private int hits;
				private int score;
				private String original_File;
				private String saved_File;
				private int cust_Num; -->

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