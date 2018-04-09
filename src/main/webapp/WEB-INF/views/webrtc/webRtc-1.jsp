<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>webRtc-1</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>

<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.min.js"></c:url>"></script>

<script type="text/javascript" src="<c:url value="/resources/webrtc/DetectRTC.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/resources/webrtc/global.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/resources/webrtc/highlight.min.js"></c:url>"></script>
<script type="text/javascript">

	$(function() {
	    
		navigator.getUserMedia = navigator.getUserMedia ||
		navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

		$('#sendBtn').click(function() {
		  // getUserMedia(접근할 미디어, 성공 callback, 실패 callback);
		  navigator.getUserMedia({audio:true, video:true}, success, error);
		});
		
		function success(stream) {
		  console.log('success', arguments);
		  
		  // 비디오 테그에 stream 할당
		  $('video')[0].srcObject = stream;
		
		  // do something...
		}
		
		function error(error) {
		  console.log('error', arguments);
		
		  alert('카메라와 마이크를 허용해주세요');
		}
		});
	
</script>
</head>
<body>
<div id="content">
  <div class="wrap">
    <video autoplay></video>
 

  <input type="button" id="sendBtn" value="getUserMedia">
  </div>
</div>

</body>
</html>