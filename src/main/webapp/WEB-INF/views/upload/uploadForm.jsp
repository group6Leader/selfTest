<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<title>Insert title here</title>
<style>
    /* iframe 스타일 설정 */
    iframe {
        width: 600px;
        height: 100px;
        border: 1px;
        border-style: solid;
    }
     .fileDrop {
        width:600px;
        height: 200px;
        border: 1px dotted blue;
    }

    small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
    }
</style>
<script>
function addFilePath(msg){
    console.log(msg); // 파일명 콘솔 출력
    document.getElementById("form1").reset(); // ifream에 업로드결과를 출력 후 form에 저장된 데이터 초기화
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
	                str += "<img src='displayFile?fileName="+data+"'></a>";
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
</script>
</head>
<body>

    <!-- enctype="multipart/form-data" 파일업로드 필수 옵션 -->
    <!-- application/x-www-form-urlencoded 기본옵션 -->
    <form id="form1" target="iframePhoto" action="uploadForm" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="업로드">    
    </form>
    
    <!-- form data가 이곳으로 이동 -->
    <iframe name="iframePhoto"></iframe>
    
     <h2>AJAX File Upload</h2>
    <!-- 파일을 업로드할 영역 -->
    <div class="fileDrop">
    <!-- 업로드된 파일 목록 -->
    <div class="uploadedList"></div>
    </div>

    
</body>
</html>