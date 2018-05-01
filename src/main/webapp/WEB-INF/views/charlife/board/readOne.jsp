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
	<link rel="stylesheet" type="text/css"  href="../resources/css/rating.css">
	
	<script src="../resources/js/jquery-3.3.1.js"></script>
	<script src="../resources/js/charlifeReadOne.js"></script>
	
	<style type="text/css">
		td.white {
			background-color: #ffffff;
		}
	
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
		
					<div class="field half" style="width: 200px; font">
						<label for="Category">Category</label>
						<select id="board_Category" name="board_Category" disabled="disabled">
							<option style="color: black;" value="자유 게시판" <c:if test="${b.board_Category == '자유 게시판' }"> selected="selected" </c:if>> 자유 게시판 </option>
							<option style="color: black;" value="병원 평가" <c:if test="${b.board_Category == '병원 평가' }"> selected="selected" </c:if>> 병원 평가 </option>
							<option style="color: black;" value="고객의 목소리" <c:if test="${b.board_Category == '고객의 목소리' }"> selected="selected" </c:if>> 고객의 목소리 </option>
						</select>							
					</div>

						<!-- Title -->
						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_`Title" id="board_Title" type="text" value="${b.board_Title }" readonly="readonly">
						</div>
						
						
						<!-- Ratings -->
						<label>Ratings</label>
						
						 <div class="rating">
						  
						  <label>
						    <input type="radio" name="score" value="1" disabled="disabled" <c:if test="${b.score == 1 }"> checked="checked" </c:if>/>
						    <%-- <input id="noSmoking" type="radio" name='smoking' checked='checked' value="없음" <c:if test="${s.smoking == '없음' }"> checked="checked" </c:if>/> --%>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="2" disabled="disabled"  <c:if test="${b.score == 2 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="3" disabled="disabled" <c:if test="${b.score == 3 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>   
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="4" disabled="disabled" <c:if test="${b.score == 4 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="5" disabled="disabled"  <c:if test="${b.score == 5 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						 </div> <br><br>
						 <div class="field">
							<label for="comment">Photo</label>
								<div id="filecontainer">
									<img src="download?saved=${b.saved_File}" style="width: 30rem; height:10rem; background-color: rgba(222,222,222,0.8);" />			
								</div>
						</div>
						<!-- Content -->					
						<div class="field">
							<label for="comment">Content</label>
							<textarea name="content" id="content" rows="6" readonly="readonly"> ${b.content } </textarea>
						</div>
					</form>
						
						
					<!-- 댓글 -->
					<%-- ${sessionScope.loginId } <br> --%>

					<form action="../reply/insert" method="post" onsubmit="return checkReply()">
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
							<td id="reply_Num"> ${vo.reply_Num } </td>
							<td class="text" data-num=""> ${vo.text } </td>
							
							<c:if test="${sessionScope.customer.cust_Num == vo.cust_Num }">
							<td> <input type="button" value="수정" onclick="editForm(${vo.board_Num}, ${vo.reply_Num }, '${vo.text }')"> </td>
							<td> <input type="button" value="삭제" onclick="del2(${vo.board_Num}, ${vo.reply_Num})"> </td>
							</c:if>
						</tr>
						<tr>
							<!-- 리플 수정 폼이 나타날 위치 -->
							<td colspan="4"><div id="div${vo.reply_Num}"></div></td>
						</tr>
					
					</c:forEach>
						
					</table>
						
					
					<!-- Buttons -->
					<ul class="actions">
						<li><input value="Back" class="button alt" type="button" onclick="location.href='./boardList'"></li>
						<li><input style="margin-left: 31.3rem" value="Delete" class="button alt" type="button" onclick="del(${b.board_Num})"></li>
						<li><input value="Edit" class="button alt" type="button" onclick="edit(${b.board_Num})"></li>
					</ul>

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