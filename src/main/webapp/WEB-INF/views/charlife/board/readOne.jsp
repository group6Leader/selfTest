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
	
	<style type="text/css">
	td.white {
		background-color: #ffffff;
	}
	
	</style>
	
	<script type="text/javascript">
		function del(board_Num) {
			
			if(confirm("정말 삭제하시겠습니까?")){
				location.href='./delete?board_Num=' + board_Num;
			}
		}
		
		function edit(board_Num) {
			
			if(confirm("정말 수정하시겠습니까?")){
				location.href='./edit?board_Num=' + board_Num;
			}
		}
		
		function del2(board_Num, reply_Num) {
			
			if(confirm("정말 삭제하시겠습니까?")){
				location.href='../reply/delete?board_Num=' + board_Num + '&reply_Num=' + reply_Num;
			}
		}
		
			

           	
		function editForm(board_Num, reply_Num, text) {
			
			var div = document.getElementById("div"+reply_Num);
			
			var str = '<form name="editForm' + reply_Num + '" action="../reply/edit" method="post">';
			str += '<input type="hidden" name="reply_Num" value="'+reply_Num+'">';
			str += '<input type="hidden" name="board_Num" value="'+board_Num+'">';
			str += '&nbsp;';
			str += '<input type="text" name="text" value="' + text + '" style="width:530px;">';
			str += '&nbsp;';
			str += '<a href="javascript:editResult(document.editForm' + reply_Num + ')">[저장]</a>';
			str += '&nbsp;';
			str += '<a href="javascript:editCancel(document.getElementById(\'div' + reply_Num + '\'))">[취소]</a>';
			str += '</form>';
			div.innerHTML = str;
			
		}
		
		function editResult(form) {
			if (confirm('수정된 내용을 저장하시겠습니까?')) {
				form.submit();
			}
		}
		
		function editCancel(div) {

			div.innerHTML = '';
		}
		
		$(':radio').change(function() {
			  console.log('New star rating: ' + this.value);
		});
	
	</script>		
		
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
						<select id="board_Category" name="board_Category">
							<option style="color: black;" value="병원 평가"> 병원 평가 </option>
							<option style="color: black;" value="자유 게시판"> 자유 게시판 </option>
							<option style="color: black;" value="고객의 목소리"> 고객의 목소리 </option>
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
						    <input type="radio" name="score" value="1" readonly="readonly" <c:if test="${b.score == 1 }"> checked="checked" </c:if>/>
						    <%-- <input id="noSmoking" type="radio" name='smoking' checked='checked' value="없음" <c:if test="${s.smoking == '없음' }"> checked="checked" </c:if>/> --%>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="2" readonly="readonly" <c:if test="${b.score == 2 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="3" readonly="readonly" <c:if test="${b.score == 3 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>   
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="4" readonly="readonly" <c:if test="${b.score == 4 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						  
						  <label>
						    <input type="radio" name="score" value="5" readonly="readonly" <c:if test="${b.score == 5 }"> checked="checked" </c:if>/>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						    <span class="icon">★</span>
						  </label>
						 </div> <br><br>
						
	
						<!-- Content -->					
						<div class="field">
							<label for="comment">Content</label>
							<textarea name="content" id="content" rows="6" readonly="readonly"> ${b.content } </textarea>
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
						<li><input value="Delete" class="button alt" type="button" onclick="del(${b.board_Num})"></li>
						
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