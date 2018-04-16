<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>PeerJS - 영상 채팅 예제</title>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/peer.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/sockjs-0.3.min.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/adapter.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/DetectRTC.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/global.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/highlight.min.js"></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webrtc/socket.io.js"></c:url>"></script>
	<script type="text/javascript"
	src="<c:url value="/resources/webrtc/webrtc_signal_server.js"></c:url>"></script>
<!-- <script type="text/javascript">
	
	// Compatibility shim
	navigator.getUserMedia = navigator.getUserMedia
			|| navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
	// PeerJS object
	var peer = new Peer({
		key : 'lwjd5qra8257b9',
		debug : 3
	});
	peer.on('open', function() {
		$('#my-id').text(peer.id);
	});
	// Receiving a call
	peer.on('call', function(call) {
		// Answer the call automatically (instead of prompting user) for demo purposes
		call.answer(window.localStream);
		step3(call);
	});
	peer.on('error', function(err) {
		alert(err.message);
		// Return to step 2 if error occurs
		step2();
	});
	// Click handlers setup
	$(function() {
		$('#make-call').click(function() {
			// Initiate a call!
			var call = peer.call($('#callto-id').val(), window.localStream);
			step3(call);
		});
		$('#end-call').click(function() {
			window.existingCall.close();
			step2();
		});
		// Retry if getUserMedia fails
		$('#step1-retry').click(function() {
			$('#step1-error').hide();
			step1();
		});
		// Get things started
		step1();
	});
	function step1() {
		// Get audio/video stream
		navigator.getUserMedia({
			audio : true,
			video : true
		}, function(stream) {
			// Set your video displays
			$('#my-video').prop('src', URL.createObjectURL(stream));
			window.localStream = stream;
			step2();
		}, function() {
			$('#step1-error').show();
		});
	}
	function step2() {
		$('#step1, #step3').hide();
		$('#step2').show();
	}
	function step3(call) {
		// Hang up on an existing call if present
		if (window.existingCall) {
			window.existingCall.close();
		}
		// Wait for stream on the call, then set peer video display
		call.on('stream', function(stream) {
			$('#their-video').prop('src', URL.createObjectURL(stream));
		});
		// UI stuff
		window.existingCall = call;
		$('#their-id').text(call.peer);
		call.on('close', step2);
		$('#step1, #step2').hide();
		$('#step3').show();
	}
</script>


</head>

<body>

	<div class="pure-g">

		Video area
		<div class="pure-u-2-3" id="video-container">
			<video id="their-video" autoplay></video>
			<video id="my-video" muted="true" autoplay></video>
		</div>

		Steps
		<div class="pure-u-1-3">
			<h2>PeerJS Video Chat</h2>

			Get local audio/video stream
			<div id="step1">
				<p>Please click `allow` on the top of the screen so we can
					access your webcam and microphone for calls.</p>
				<div id="step1-error">
					<p>Failed to access the webcam and microphone. Make sure to run
						this demo on an http server and click allow when asked for
						permission by the browser.</p>
					<a href="#" class="pure-button pure-button-error" id="step1-retry">Try
						again</a>
				</div>
			</div>

			Make calls to others
			<div id="step2">
				<p>
					Your id: <span id="my-id">...</span>
				</p>
				<p>Share this id with others so they can call you.</p>
				<h3>Make a call</h3>
				<div class="pure-form">
					<input type="text" placeholder="Call user id..." id="callto-id">
					<a href="#" class="pure-button pure-button-success" id="make-call">Call</a>
				</div>
			</div>

			Call in progress
			<div id="step3">
				<p>
					Currently in call with <span id="their-id">...</span>
				</p>
				<p>
					<a href="#" class="pure-button pure-button-error" id="end-call">End
						call</a>
				</p>
			</div>
		</div>
	</div>


</body>
</html> -->
<script>
/*

  webrtc_polyfill.js by Rob Manson
  NOTE: Based on adapter.js by Adam Barth

  The MIT License

  Copyright (c) 2010-2013 Rob Manson, http://buildAR.com. All rights reserved.

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

*/

var webrtc_capable = true;
var rtc_peer_connection = null;
var rtc_session_description = null;
var get_user_media = null;
var connect_stream_to_src = null;
var stun_server = "stun.l.google.com:19302";

if (navigator.getUserMedia) { // WebRTC 1.0 standard compliant browser
  rtc_peer_connection = RTCPeerConnection;
  rtc_session_description = RTCSessionDescription;
  get_user_media = navigator.getUserMedia.bind(navigator);
  connect_stream_to_src = function(media_stream, media_element) {
    // https://www.w3.org/Bugs/Public/show_bug.cgi?id=21606
    media_element.srcObject = media_stream;
    media_element.play();
  };
} else if (navigator.mozGetUserMedia) { // early firefox webrtc implementation
  rtc_peer_connection = mozRTCPeerConnection;
  rtc_session_description = mozRTCSessionDescription;
  get_user_media = navigator.mozGetUserMedia.bind(navigator);
  connect_stream_to_src = function(media_stream, media_element) {
    media_element.mozSrcObject = media_stream;
    media_element.play();
  };
  stun_server = "74.125.31.127:19302";
} else if (navigator.webkitGetUserMedia) { // early webkit webrtc implementation
  rtc_peer_connection = webkitRTCPeerConnection;
  rtc_session_description = RTCSessionDescription;
  get_user_media = navigator.webkitGetUserMedia.bind(navigator);
  connect_stream_to_src = function(media_stream, media_element) {
    media_element.src = webkitURL.createObjectURL(media_stream);
  };
} else {
  alert("This browser does not support WebRTC - visit WebRTC.org for more info");
  webrtc_capable = false;
}
</script>
<script>
/*

  basic_video_call.js by Rob Manson

  The MIT License

  Copyright (c) 2010-2013 Rob Manson, http://buildAR.com. All rights reserved.

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

*/

var call_token; // unique token for this call
var signaling_server; // signaling server for this call
var peer_connection; // peer connection object

function start() {
  // create the WebRTC peer connection object
  peer_connection = new rtc_peer_connection({ // RTCPeerConnection configuration 
    "iceServers": [ // information about ice servers
      { "url": "stun:"+stun_server }, // stun server info
    ]
  });

  // generic handler that sends any ice candidates to the other peer
  peer_connection.onicecandidate = function (ice_event) {
    if (ice_event.candidate) {
      signaling_server.send(
        JSON.stringify({
          type: "new_ice_candidate",
          candidate: ice_event.candidate ,
        })
      );
    }
  };

  // display remote video streams when they arrive using local <video> MediaElement
  peer_connection.onaddstream = function (event) {
    connect_stream_to_src(event.stream, document.getElementById("remote_video"));
    // hide placeholder and show remote video
    document.getElementById("loading_state").style.display = "none";
    document.getElementById("open_call_state").style.display = "block";
  };

  // setup stream from the local camera 
  setup_video();

  // setup generic connection to the signaling server using the WebSocket API
  signaling_server = new SockJS("<c:url value="/chat-sockjs"/>");

  if (document.location.hash === "" || document.location.hash === undefined) { // you are the Caller

    // create the unique token for this call 
    var token = Date.now()+"-"+Math.round(Math.random()*10000);
    call_token = "#"+token;

    // set location.hash to the unique token for this call
    document.location.hash = token;

    signaling_server.onopen = function() {
      // setup caller signal handler
      signaling_server.onmessage = caller_signal_handler;

      // tell the signaling server you have joined the call 
      signaling_server.send(
        JSON.stringify({ 
          token:call_token,
          type:"join",
        })
      );
    }

    document.title = "You are the Caller";
    document.getElementById("loading_state").innerHTML = "Ready for a call...ask your friend to visit:<br/><br/>"+document.location;

  } else { // you have a hash fragment so you must be the Callee 
    
    // get the unique token for this call from location.hash
    call_token = document.location.hash;

    signaling_server.onopen = function() {
      // setup caller signal handler
      signaling_server.onmessage = callee_signal_handler;

      // tell the signaling server you have joined the call 
      signaling_server.send(
        JSON.stringify({ 
          token:call_token,
          type:"join",
        })
      );

      // let the caller know you have arrived so they can start the call
      signaling_server.send(
        JSON.stringify({ 
          token:call_token,
          type:"callee_arrived",
        })
      );
    }

    document.title = "You are the Callee";
    document.getElementById("loading_state").innerHTML = "One moment please...connecting your call...";
  }

}

/* functions used above are defined below */

// handler to process new descriptions
function new_description_created(description) {
  peer_connection.setLocalDescription(
    description, 
    function () {
      signaling_server.send(
        JSON.stringify({
          token:call_token,
          type:"new_description",
          sdp:description 
        })
      );
    }, 
    log_error
  );
}

// handle signals as a caller
function caller_signal_handler(event) {
  var signal = JSON.parse(event.data);
  if (signal.type === "callee_arrived") {
    peer_connection.createOffer(
      new_description_created, 
      log_error
    );
  } else if (signal.type === "new_ice_candidate") {
    peer_connection.addIceCandidate(
      new RTCIceCandidate(signal.candidate)
    );
  } else if (signal.type === "new_description") {
    peer_connection.setRemoteDescription(
      new rtc_session_description(signal.sdp), 
      function () {
        if (peer_connection.remoteDescription.type == "answer") {
          // extend with your own custom answer handling here
        }
      },
      log_error
    );
  } else {
    // extend with your own signal types here
  }
}

// handle signals as a callee
function callee_signal_handler(event) {
  var signal = JSON.parse(event.data);
  if (signal.type === "new_ice_candidate") {
    peer_connection.addIceCandidate(
      new RTCIceCandidate(signal.candidate)
    );
  } else if (signal.type === "new_description") {
    peer_connection.setRemoteDescription(
      new rtc_session_description(signal.sdp), 
      function () {
        if (peer_connection.remoteDescription.type == "offer") {
          peer_connection.createAnswer(new_description_created, log_error);
        }
      },
      log_error
    );
  } else {
    // extend with your own signal types here
  }
}

// setup stream from the local camera 
function setup_video() {
  get_user_media(
    { 
      "audio": true, // request access to local microphone
      "video": true  // request access to local camera
    }, 
    function (local_stream) { // success callback
      // display preview from the local camera & microphone using local <video> MediaElement
      connect_stream_to_src(local_stream, document.getElementById("local_video"));
      // add local camera stream to peer_connection ready to be sent to the remote peer
      peer_connection.addStream(local_stream);
    },
    log_error
  );
}

// generic error handler
function log_error(error) {
  console.log(error);
}

</script>
<style>
html, body {
  padding: 0px;
  margin: 0px;
  font-family: "Arial","Helvetica",sans-serif;
}
#loading_state {
  position: absolute;
  top: 45%;
  left: 0px;
  width: 100%;
  font-size: 20px;
  text-align: center;
}
#open_call_state {
  display: none;
}
#local_video {
  position: absolute;
  top: 10px;
  left: 10px;
  width: 160px;
  height: 120px;
  background: #333333;
}
#remote_video {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1024px;
  height: 768px;
  background: #999999;
}
</style>
</head>
<body onload="start()">
  <div id="loading_state">
    loading...
  </div>
  <div id="open_call_state">
    <video id="remote_video"></video>
    <video id="local_video"></video>
  </div>
</body>
</html>
