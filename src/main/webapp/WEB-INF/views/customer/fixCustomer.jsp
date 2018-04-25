<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/fix.css"></c:url>">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
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
 
 $('#fixBtn').on('click',function(){
	 
	 	if(!confirm("수정하시겠습니까?")){
	 		return false;
	 	}
	 
	 	
		var cust_Id = $('#cust_Id').val();
		var cust_Pw = $('#cust_Pw').val();		
		var cust_Name = $('#cust_Name').val();
		var cust_Address = $('#cust_Address').val(); 
		var cust_Birth = $('#cust_Birth').val();		
		var cust_Sex = $(':radio[name="cust_Sex"]:checked').val();					
		var cust_Phone = $('#cust_Phone').val();
		var cust_Email = $('#cust_Email').val();
		var cust_Major = $('#cust_Major').val();
		
		if(cust_Pw == ''){
			alert("password를 입력해주세요");
			return false;
		}
		
		
		$.ajax({
			url : "custFix"
			,type : "post"			
			,data : {			

				cust_Id: cust_Id
				,cust_Pw : cust_Pw
				,cust_Name : cust_Name
				,cust_Address : cust_Address
				,cust_Phone : cust_Phone
				,cust_Email : cust_Email
				,cust_Major : cust_Major
				
			},success : function(msg) {
				alert(msg);
			},error : function(err) {
				alert(JSON.stringify(err));
			}
		
		});
		
		
		});
 $('#delBtn').on('click',function(){
		
	 
	 	if(!confirm("삭제하시겠습니까?")){
	 		
	 		return false;
	 	}
	 	
	 	
		var cust_Id = $('#cust_Id').val();
	
	
		
		$.ajax({
			url : "custDel"
			,type : "post"			
			,data : {			

				cust_Id: cust_Id
				
				
			},success : function(msg) {
				alert(msg);
				document.location.href = "/www/";
			},error : function(err) {
				alert(JSON.stringify(err));
			}
		
		});
		
		
		});

 
 
 
 
 
});


	

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
	<form class="form-card" action="" method="post" enctype="multipart/form-data">
		<fieldset class="form-fieldset">
			<legend class="form-legend">FIX US</legend>
			<%-- ${login } --%>

	
	
	<div style="text-align: left; margin-bottom: 1.1rem;">Photo Upload</div>
    <!-- 파일을 업로드할 영역 -->
    <div id="filecontainer">
    <div class="fixfileDrop">
    <!-- 업로드된 파일 목록 -->
    	<div class="fixuploadedList">			
			<img class='photo' alt="" src="download?saved=${login.saved_File}" >
		</div>
	</div>		  
    <!-- 파일을 업로드할 영역 -->
    <div class="fileDrop" id="fileDropdiv">
    <!-- 업로드된 파일 목록 -->
   		<div class="uploadedList">
   <!-- '<img alt="" src="download?origin='+data.originalfile+'&saved='+data.savedfile+'">' -->
    	</div>
    </div>
    </div>
			<input type="hidden">
			
			
			<div class="form-element form-input">
				<input id="cust_Name" name="cust_Name" class="form-element-field"
					 type="text" placeholder="${login.cust_Name }" value="${login.cust_Name }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Name</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Id" name="cust_Id" class="form-element-field" placeholder="Please your id"
					type="text" disabled="disabled" value="${login.cust_Id }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">ID : ${login.cust_Id }</label>
				<div id="check"></div>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Pw" name="cust_Pw" class="form-element-field" placeholder="Please fix your password"
					type="password" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Password</label>
			</div>
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">성별</div>
				<label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" disabled="disabled" value="M" 
					<c:if test="${login.cust_Sex == 'M' }">
					 checked="checked"</c:if>/> <i
					class="form-radio-button"></i> <span>남자</span>
				</label> <label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" disabled="disabled" value="F" 
					<c:if test="${login.cust_Sex == 'F' }">
					 checked="checked"</c:if>/> <i
					class="form-radio-button"></i> <span>여자</span>
				</label>
				
				
			</div>
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">생년월일  ${login.cust_Birth }</div>
				<input type="hidden" id="cust_Birth" value="${login.cust_Birth }" name="cust_Birth">
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your fix Address"
					type="text" value="${login.cust_Address }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">${login.cust_Address }</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Phone" name="cust_Phone" class="form-element-field"
					placeholder="Please your fix PhoneNumber" type="number" value="${login.cust_Phone }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">${login.cust_Phone }</label>
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Email" name="cust_Email" class="form-element-field" placeholder="Please your fix Email" type="email"
				 value="${login.cust_Email }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">${login.cust_Email }</label> <small
					class="form-element-hint">We will never spam you!</small>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Major" name="cust_Major" class="form-element-field"
					placeholder="Please your fix Major" type="text" value="${login.cust_Major }"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">${login.cust_Major }</label>
			</div>
			
			
		</fieldset>
		<div class="form-actions">
			<button id="fixBtn" class="form-btn" type="button">Fix</button>
			<button id="delBtn" class="form-btn-cancel -nooutline">Delete</button>
		</div>

	</form>
</body>
</html>