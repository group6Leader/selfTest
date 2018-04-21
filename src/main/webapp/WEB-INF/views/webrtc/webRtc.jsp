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

<script>
var wsocket;

function connect() {
	wsocket = new SockJS("<c:url value="/chat-sockjs"/>");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}
function disconnect() {
	wsocket.close();
}
function onOpen(evt) {
	appendMessage("연결되었습니다.");
}
function onMessage(evt) {
	var data = evt.data;
	if (data.substring(0, 4) == "msg:") {
		appendMessage(data.substring(4));
	}
}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send() {
	var nickname = $("#nickname").val();
	var msg = $("#message").val();
	wsocket.send("msg:"+nickname+":" + msg);
	$("#message").val("");
}

function appendMessage(msg) {
	$("#chatMessageArea").append(msg+"<br>");
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	$("#chatArea").scrollTop(maxScroll);
}

$(document).ready(function() {
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();	
		}
		event.stopPropagation();
	});
	$('#sendBtn').click(function() { send(); });
	$('#enterBtn').click(function() { connect(); });
	$('#exitBtn').click(function() { disconnect(); });
});



//웹채팅

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
    var token = Date.now()+"-"+"Remote";
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


//여기 밑에는 음성인식 자막
$(function() {
	  if (typeof webkitSpeechRecognition != 'function') {
	    alert('크롬에서만 동작 합니다.');
	    return false;
	  }

	  var recognition = new webkitSpeechRecognition();
	  var isRecognizing = false;
	  var ignoreOnend = false;
	  var finalTranscript = '';
	 	var audio = document.getElementById('audio');
	  var $btnMic = $('#btn-mic');
	 	var $result = $('#result');
	 	var $iconMusic = $('#icon-music');
	  recognition.continuous = true;
	  recognition.interimResults = true;

	  recognition.onstart = function() {
	    console.log('onstart', arguments);
	    isRecognizing = true;

	    $btnMic.attr('class', 'on');
	  };

	  recognition.onend = function() {
	    console.log('onend', arguments);
	    isRecognizing = false;

	    if (ignoreOnend) {
	      return false;
	    }

	    // DO end process
	    $btnMic.attr('class', 'off');
	    if (!finalTranscript) {
	      console.log('empty finalTranscript');
	      return false;
	    }

	    if (window.getSelection) {
	      window.getSelection().removeAllRanges();
	      var range = document.createRange();
	      range.selectNode(document.getElementById('final-span'));
	      window.getSelection().addRange(range);
	    }

	  };

	  recognition.onresult = function(event) {
	    console.log('onresult', event);

	    var interimTranscript = '';
	    if (typeof(event.results) == 'undefined') {
	      recognition.onend = null;
	      recognition.stop();
	      return;
	    }

	    for (var i = event.resultIndex; i < event.results.length; ++i) {
	      if (event.results[i].isFinal) {
	        finalTranscript += event.results[i][0].transcript;
	      } else {
	        interimTranscript += event.results[i][0].transcript;
	      }
	    }

	    finalTranscript = capitalize(finalTranscript);
	    final_span.innerHTML = linebreak(finalTranscript);
	    interim_span.innerHTML = linebreak(interimTranscript);

	    console.log('finalTranscript', finalTranscript);
	    console.log('interimTranscript', interimTranscript);
	    fireCommand(interimTranscript);
	  };

	  
	  function fireCommand(string) {
	  	if (string.endsWith('레드')) {
	  		$result.attr('class', 'red');
	  	} else if (string.endsWith('블루')) {
	  		$result.attr('class', 'blue');
	  	} else if (string.endsWith('그린')) {
	  		$result.attr('class', 'green');
	  	} else if (string.endsWith('옐로우')) {
	  		$result.attr('class', 'yellow');
	  	} else if (string.endsWith('오렌지')) {
	  		$result.attr('class', 'orange');
	  	} else if (string.endsWith('그레이')) {
	  		$result.attr('class', 'grey');
	  	} else if (string.endsWith('골드')) {
	  		$result.attr('class', 'gold');
	  	} else if (string.endsWith('화이트')) {
	  		$result.attr('class', 'white');
	  	} else if (string.endsWith('블랙')) {
	  		$result.attr('class', 'black');
	  	} else if (string.endsWith('알람') || string.endsWith('알 람')) {
	  		alert('알람');
	  	} else if (string.endsWith('노래 켜') || string.endsWith('음악 켜')) {
	  		audio.play();
	  		$iconMusic.addClass('visible');
	  	} else if (string.endsWith('노래 꺼') || string.endsWith('음악 꺼')) {
	  		audio.pause();
	  		$iconMusic.removeClass('visible');
	  	} else if (string.endsWith('볼륨 업') || string.endsWith('볼륨업')) {
	  		audio.volume += 0.2;
	  	} else if (string.endsWith('볼륨 다운') || string.endsWith('볼륨다운')) {
	  		audio.volume -= 0.2;
	  	} else if (string.endsWith('스피치') || string.endsWith('말해줘') || string.endsWith('말 해 줘')) {
	  	  textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
	  	}
	  }

	  recognition.onerror = function(event) {
	    console.log('onerror', event);

	    if (event.error == 'no-speech') {
	      ignoreOnend = true;
	    } else if (event.error == 'audio-capture') {
	      ignoreOnend = true;
	    } else if (event.error == 'not-allowed') {
	      ignoreOnend = true;
	    }

	    $btnMic.attr('class', 'off');
	  };

	  var two_line = /\n\n/g;
	  var one_line = /\n/g;
	  var first_char = /\S/;

	  function linebreak(s) {
	    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
	  }

	  function capitalize(s) {
	    return s.replace(first_char, function(m) {
	      return m.toUpperCase();
	    });
	  }

	  function start(event) {
	    if (isRecognizing) {
	      recognition.stop();
	      return;
	    }
	    recognition.lang = 'ko-KR';
	    recognition.start();
	    ignoreOnend = false;

	    finalTranscript = '';
	    final_span.innerHTML = '';
	    interim_span.innerHTML = '';

	  }

	  /**
	   * textToSpeech
	   * 지원: 크롬, 사파리, 오페라, 엣지
	   */
	  function textToSpeech(text) {
	    console.log('textToSpeech', arguments);

	    /*
	    var u = new SpeechSynthesisUtterance();
	    u.text = 'Hello world';
	    u.lang = 'en-US';
	    u.rate = 1.2;
	    u.onend = function(event) {
	      log('Finished in ' + event.elapsedTime + ' seconds.');
	    };
	    speechSynthesis.speak(u);
	    */

	    // simple version
	    speechSynthesis.speak(new SpeechSynthesisUtterance(text));
	  }

	  /**
	   * requestServer
	   * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
	   */
	  function requestServer() {
	    $.ajax({
	      method: 'post',
	      url: 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
	      data: '/examples/speech-recognition/hello.wav',
	      contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
	      success: function(data) {

	      },
	      error: function(xhr) {

	      }
	    });
	  }

	  /**
	   * init
	   */
	  $btnMic.click(start);
	  $('#btn-tts').click(function() {
	    textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
	  });
	});

</script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/webrtc.css"></c:url>">
</head>
<body onload="start()">
  <div id="loading_state">
    loading...
  </div>
  <div id="open_call_state">
    <video id="remote_video"></video>
    <video id="local_video"></video>
  </div>
  
<div class="chat">
  <div class="chat-title">
    <h1>의사이름</h1>
    <h2>분야</h2>
    <figure class="avatar">
      <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/156381/profile/profile-80.jpg" /></figure>
  </div>
  <div class="messages">
    <div class="messages-content"></div>
  </div>
  <div class="message-box">
    <textarea class="message-input" placeholder="Type message..."></textarea>
    <button type="submit" class="message-submit">Send</button>
  </div>

</div>
<div class="bg"></div>
<div class="jamaku" id="me"></div>
<div class="jamaku" id="you"></div>

</body>
</html>
