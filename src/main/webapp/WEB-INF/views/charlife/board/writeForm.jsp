<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- Comment -->
			<section id="post" class="wrapper bg-img" data-bg="banner2.jpg">
				<div class="inner">
				<article class="box">
					
					
					<h2>Write Your Comment</h2>

					<form action="write" method="post">

						<div class="field half first">
							<label for="Title">Title</label>
							<input name="board_Title" id="board_Title" type="text" placeholder="Title">
						</div>
						<div class="field half">
							<label for="Hospital Name">Hospital Name</label>
							<input name="hos_Name" id="hos_Name" type="text" placeholder="Hospital Name">
						</div>
						<div class="field">
							<label for="comment">Comment</label>
							<textarea name="content" id="content" rows="6" placeholder="Comment"></textarea>
						</div>
						<ul class="actions">
							<li><input value="Send" class="button alt" type="submit" style="margin-left: 200px;"></li>
						</ul>
					</form>


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