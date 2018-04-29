<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CharLife</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../resources/css/charlife.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="gocharlife"><span>Back To</span> CharLife</a></div>
				<a href="#menu"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="gocharlife">Home</a></li>
					<!-- <li><a href="generic.html">Generic</a></li> -->
					<li><a href="boardList">Board</a></li>
				</ul>
			</nav>
		
			<section id="post" class="wrapper bg-img">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Board</h2>
							<p>Write Your Needs</p>
						</header>
						<div class="content">
							<sec:authorize access="isAuthenticated()">
							<button onclick="location.href='write'">Write</button> <br><br>
							</sec:authorize>
							
							<table border="1">
								<tr>
									<th style="width: 80px;"> Num </th>
									<th style="width: 200px;"> Category </th>
									<th style="width: 400px;"> Title </th>
									<th> Hits </th>
								</tr>
								
								<c:forEach items="${bList }" var="vo">
								<tr>
									<th> ${vo.board_Num } </th>
									<th> ${vo.board_Category } </th>
									<th> <a href="readOne?board_Num=${vo.board_Num }"> ${vo.board_Title } </a></th>
									<%-- <th> <a href="read?boardnum=${vo.boardnum }"> ${vo.title } </a> </th> --%>
									
									<th> ${vo.hits } </th>
								</tr>
								
								
								</c:forEach>
								
							</table>
											
						</div>

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