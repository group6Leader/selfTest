<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/join.css"></c:url>">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$('#cust_Id').on('keyup',IdChk);

	 
	var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //이메일 요휴성검사

	var RegexName = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; //이름 유효성 검사 2~4자 사이

	var RegexId = /^[a-z0-9_-]{3,16}$/; //아이디 유효성 검사 316자 사이
	
	var RegexTel = /^[0-9]{8,11}$/; //전화번호 유효성 검사 */

	$("form").submit(function() {
		if (!RegexId.test($.trim($("#cust_Id").val())))
		{
			alert("아이디 오류");
			$("#cust_Id").focus();
			return false;
		}
		if (!RegexName.test($.trim($("#cust_Name").val())))
		{
			alert("이름은 한글로 2~4자 이내로 해주세요.");
			$("#cust_Name").focus();
			return false;
		}
		if (!RegexEmail.test($.trim($("#cust_Email").val())))
		{
			alert("이메일 오류");
			$("#cust_Email").focus();
			return false;
		}
	});



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
	        url: "uploadAjax",
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
	                str += "<img class='photo' src='displayFile?fileName="+data+"'></a>";
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
	    alert("이미지 삭제")
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

function IdChk(){
	var cust_Id = $('#cust_Id').val();
	$.ajax({
		url:'idcheck'
		,type:'post'
		,data:{
			cust_Id:cust_Id
		}
		,dataType:'json'
		,success:function(data){
			console.log(data);
			var html = '<span id="check">';
			if(data['cust_Id']!=""){
				html += '중복되는 아이디가 있습니다.';
			}else{
				html += '사용가능한 아이디 입니다.';
			}
			html += '</span>';
			
			$('#check').html(html);
		}
		,error:function(err){
			console.log(JSON.stringify(err));
		}
	});
}


	

	document.addEventListener("change", function(event) {
		let
		element = event.target;
		if (element && element.matches(".form-element-field")) {
			element.classList[element.value ? "add" : "remove"]("-hasvalue");
		}
	});
	window.onload = function() {
		appendYear();
		appendMonth();
		appendDay();
	}
	
	
	
	function appendYear() {

		var date = new Date();

		var year = date.getFullYear();

		var selectValue = document.getElementById("year");

		var optionIndex = 0;

		for (var i = year - 100; i <= year; i++) {

			selectValue.add(new Option(i + "년", i), optionIndex++);

		}

	}

	function appendMonth() {

		var selectValue = document.getElementById("month");

		var optionIndex = 0;

		for (var i = 1; i <= 12; i++) {

			selectValue.add(new Option(i + "월", i), optionIndex++);

		}

	}

	function appendDay() {

		var selectValue = document.getElementById("day");

		var optionIndex = 0;

		for (var i = 1; i <= 31; i++) {

			selectValue.add(new Option(i + "일", i), optionIndex++);

		}

	}

	// 원본파일이름을 목록에 출력하기 위해
	function getOriginalName(fileName) {
	    // 이미지 파일이면
	    if(checkImageType(fileName)) {
	        return; // 함수종료
	    }
	    // uuid를 제외한 원래 파일 이름을 리턴
	    var idx = fileName.indexOf("_")+1;
	    return fileName.substr(idx);
	}
	
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

		};

		function checkImageType(fileName) {
	        // i : ignore case(대소문자 무관)
	        var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	        return fileName.match(pattern); // 규칙이 맞으면 true
	    }
</script>
<style>
    small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHAR HOSPITAL JOIN</title>
</head>
<body>
	<!-- Taken from https://codepen.io/jonnitto/project/editor/XRPjxx -->
	<video width="1280" height="720" class="background" autoplay muted loop>
		<source src="https://codepen.jonnitto.ch/BackgroundVideo.mp4"
			type="video/mp4">
	</video>
	<form class="form-card" action="custJoin" method="post" enctype="multipart/form-data">
		<fieldset class="form-fieldset">
			<legend class="form-legend">JOIN US</legend>
			
			
  <div style="text-align: right; margin-bottom: 1.1rem;">Photo Upload</div>
    <!-- 파일을 업로드할 영역 -->
    <div class="fileDrop">
    <!-- 업로드된 파일 목록 -->
    <div class="uploadedList"></div>
    </div>
			
			
			<div class="form-element form-input">
				<input id="cust_Name" name="cust_Name" class="form-element-field"
					placeholder="Please fill in your full name" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Name</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Id" name="cust_Id" class="form-element-field" placeholder="Please your id"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">ID</label>
				<div id="check"></div>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Pw" name="cust_Pw" class="form-element-field" placeholder="Please your password"
					type="password" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Password</label>
			</div>
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">성별</div>
				<label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="M" /> <i
					class="form-radio-button"></i> <span>남자</span>
				</label> <label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="F" /> <i
					class="form-radio-button"></i> <span>여자</span>
				</label>
				
				
			</div>
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">생년월일 </div>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="year" name="birth_Year">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Year</label>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="month" name="birth_Month">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Month</label>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="day" name="birth_Day">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Day</label>
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Address</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Phone" name="cust_Phone" class="form-element-field"
					placeholder="Please your PhoneNumber" type="number" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">PhoneNumber</label>
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Email" name="cust_Email" class="form-element-field" placeholder=" " type="email"
					required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Email</label> <small
					class="form-element-hint">We will never spam you!</small>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Major" name="cust_Major" class="form-element-field"
					placeholder="Please your job // if you doctor please enter major" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Job</label>
			</div>
			
			
		</fieldset>
		<div class="form-actions">
			<button class="form-btn" type="submit">JOIN</button>
			<button class="form-btn-cancel -nooutline" type="reset">Reset</button>
		</div>

	</form>
</body>
</html>