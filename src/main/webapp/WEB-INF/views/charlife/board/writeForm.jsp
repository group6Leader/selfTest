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
	<script type="text/javascript">
	$(document).ready(function() {

		$(".fileDrop").on("dragenter dragover", function(event){
	        event.preventDefault(); // 기본효과를 막음
	    });
		$(".fileDrop").on("drop", function(event) {
		    event.preventDefault(); 
		    var files = event.originalEvent.dataTransfer.files;
		    var file = files[0];
		    console.log(file);
		    var formData = new FormData();
		    formData.append("file", file);

		    $.ajax({
		        type:"post",
		        url: "uploadboard",
		        data: formData,
		        dataType: "text",
		        processData: false,
		        contentType: false,
		        // 업로드 성공하면
		        success: function(data) {
		            var str = "";
		            // 이미지 파일이면 썸네일 이미지 출력
		            if(checkImageType(data)){ 
		                str = "<div><a href='displayFile?fileName="+getImageLink(data)+"'>";
		                str += "<img class='img-circle' src='displayFile?fileName="+data+"'></a>";
		            // 일반파일이면 다운로드링크
		            } else { 
		                str = "<div><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
		            }
		            // 삭제 버튼
		            str += "<span data-src="+data+">[삭제]</span></div>";
		            $(".uploadedList").append(str);
		        }
		    });
		});
		
	 $(".uploadedList").on("click", "span", function(event){
		    alert("이미지 삭제");
		    var that = $(this); // 여기서 this는 클릭한 span태그
		    $.ajax({
		        url: "deleteFile",
		        type: "post",
		        // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
		        // 태그.attr("속성")
		        data: {fileName:$(this).attr("data-src")}, // json방식
		        dataType: "text",
		        success: function(result){
		            if( result == "deleted" ){
		                // 클릭한 span태그가 속한 div를 제거
		                that.parent("div").remove();
		            }
		        }
		    });
		});
	});
	
	// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
	function getImageLink(fileName) {
	    // 이미지파일이 아니면
	    if(!checkImageType(fileName)) { 
	        return; // 함수 종료 
	    }
	    // 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
	    // 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    var front = fileName.substr(0, 12); // 년원일 경로 추출
	    var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
	    console.log(front); // /2017/03/09/
	    console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    // 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    return front+end; // 디렉토리를 포함한 원본파일명을 리턴

	    // 이미지파일 형식을 체크하기 위해

		}

		function checkImageType(fileName) {
	        // i : ignore case(대소문자 무관)
	        var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	        return fileName.match(pattern); // 규칙이 맞으면 true
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
			<section id="post" class="wrapper bg-img">
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
						<label for="content">Photo UpLode</label>
						<div class="fileDrop" id="fileDropdiv" style="width: 50rem; height:10rem; background-color: rgba(222,222,222,0.8);">
    								<!-- 업로드된 파일 목록 -->
   							<div class="uploadedList">
   											<!-- '<img alt="" src="download?origin='+data.originalfile+'&saved='+data.savedfile+'">' -->
    						</div>
   						</div>
   						</div>
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