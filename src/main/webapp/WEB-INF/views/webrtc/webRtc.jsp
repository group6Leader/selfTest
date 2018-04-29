<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html style="font-size: 10px;">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="../resources/assets/css/fonticons.css">
<link rel="stylesheet" href="../resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="../resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<!--For Plugins external css-->
<link rel="stylesheet" href="../resources/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="../resources/assets/css/home.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="../resources/assets/css/responsive.css" />
<script src="../resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PeerJS - 영상 채팅 예제</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/css/sideBar.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
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


<script type="text/javascript">
	function selfCheckList() {
		/* alert('1'); */
		window.open("../selfCheck/goSelfCheckList", "newWindow", "top=50, left=400, height=500, width=1000, resizable=no");
	}
	
	function selfCheckOne() {
		/* alert('1'); */
		window.open("../selfCheck/goSelfCheck3", "newWindow", "top=50, left=400, height=500, width=1000, resizable=no");
	}
</script>


<script>
$(document).ready(function() {
	$('.login').hide();
	$('.gn-icon-menu').hover(function() {
		$('.gn-menu-wrapper').toggleClass('gn-open-part');
	});

	$('.gn-menu-wrapper').hover(function() {
		$(this).toggleClass('gn-open-all');
	});

});
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
	wsocket.send("msg:"+nickname+"/"+msg);
	$(".chat_text").val("");
}

function appendMessage(msg) {
	
	var strArray = msg.split("/");
	var nickname = $("#nickname").val();
	var i;
		if(strArray.length==1){
			/*시스템 메세지*/
			$(".chat_s").append("<div class='chat_bubble-1'>"+msg+"</div>");
		}else if(strArray[0]=="jamaku"){
			if($("#you").html() == ""){			
			
			}else{
				$("#you").empty();
			}
				for(i=1;i<strArray.length;i++){
					$("#you").append(strArray[i]);
				}	

				setTimeout(function() {
					
		    	
		    		strArray.length == 0;

		    		}, 10000); // 10000ms(3초)가 경과하면 이 함수가 실행됩니다.
				
				
				
		}else{
			if(strArray[0]==nickname){
				for(i=1;i<strArray.length;i++){
					$(".chat_s").append("<div class='chat_bubble-2'>"+strArray[i]+"</div>");
				}
			}else{
				for(i =1;i<strArray.length;i++){
					$(".chat_s").append("<div class='chat_bubble-1'>"+strArray[i]+"</div>");
				}
			}
		}

	
	$(".chat_s").scrollTop($('.chat_s').prop('scrollHeight'));
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
    
    var check = $("#check").val();
     	
  	if(check == 2){
  		var token = "12345678910"+"-"+"Remote";
  	    call_token = "#"+token;
  	}else if(check == 1){
  		var token = "12345678910"+"-"+"Remote";
  		call_token = "#"+token;
  	}
  
    /* var token = Date.now()+"-"+"Remote";
    call_token = "#"+token; */


    
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
    document.getElementById("loading_state").innerHTML = "Ready for a call...ask your friend to visit:<br/><br/>";
    /*+document.location;*/

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
	        finalTranscript = event.results[i][0].transcript;
	      } else {
	        interimTranscript = event.results[i][0].transcript;
	      }
	    }

	        finalTranscript = capitalize(finalTranscript);
	    
	
	        wsocket.send("msg:"+"jamaku"+"/" + finalTranscript);
	    	final_span.innerHTML = linebreak(finalTranscript);
	    	interim_span.innerHTML = linebreak(interimTranscript);

	    	console.log('finalTranscript', finalTranscript);
	    	console.log('interimTranscript', interimTranscript);
	    	fireCommand(interimTranscript);
	    
	  
	  
	  };

	  
	 

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

<body onload="start()" style="font-size: 10px; margin: 0px;">
<input type="hidden" value ="${sessionScope.customer.division}" id="check">

<div id="btnTool" style="position: relative; left: 30rem; top:60rem;">
<button onClick="window.location.reload()" id="webRtcbtn" class="btnTools"><i class='fas fa-play'></i></button>
<c:if test="${sessionScope.customer.division == 2 }">
	<button class="selfcheck btntools" onclick="selfCheckList()"><i class="fas fa-clipboard"></i></button>
</c:if> 
<c:if test="${sessionScope.customer.division == 1 }">
	<button class="selfcheck btntools" onclick="selfCheckOne()"><i class="fas fa-clipboard"></i></button>
</c:if> 
<button id="btn-mic" class="off btntools"><i class="fas fa-microphone-slash"></i></button>
    
</div>


<input type="hidden" id="nickname" value="${sessionScope.customer.cust_Name }">
<body data-spy="scroll" data-target=".navbar-collapse">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	
	<header id="main_menu" style="" class="header navbar-fixed-top">
		<div class="main_menu_bg">
			<div class="container">
				<div class="row">
					<div class="nave_menu">
						<nav class="navbar navbar-default" id="navmenu">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header" >
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1"
										aria-expanded="false">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a class="navbar-brand" href=""> <img src="../resources/assets/images/logo.jpg" />
									</a>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->

								<c:if test="${param.error != null}">
							        <p> メールの認証をしてください。 </p>
								</c:if>

								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="/www">Char Hospital</a></li>
										<sec:authorize access="hasRole('CUSTOMER')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-haspopup="true">自己診断</a>
											<ul class="dropdown-menu">
												<li><a href="selfCheck/goSelfCheck">自己診断作成</a></li>
												<li><a href="selfCheck/goSelfCheck3">自己診断結果</a></li>
											</ul></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
										<li><a href="customer/goFix">My Page</a></li>
										<li><a href="javascript:loginCheck()">予約</a></li>
										<li><a href="webrtc/goWebRtc">遠隔診療</a></li>
										</sec:authorize>
										
										<sec:authorize access="hasRole('DOCTOR')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">医者さんのメニュー</a>
											<ul class="dropdown-menu">
												<li><a href="healthRecord/goHealthRecord">診断書作成</a></li>
												<li><a href="healthRecord/goHealthRecordList">診断書リスト</a></li>
												<li><a href="prescription/goPrescription">処方箋作成</a></li>
												<li><a href="prescription/prescriptionResult">処方箋リスト</a></li>
											</ul></li>
										</sec:authorize>
										<sec:authorize access="hasRole('CUSTOMER')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">患者さんのメニュー</a>
											<ul class="dropdown-menu">
												<li><a href="prescription/prescriptionIndList2">個人処方箋</a></li>
												<li><a href="healthRecord/goHealthRecordList">個人診断書</a></li>
											</ul></li>
										</sec:authorize>
										
										<li><a href="charlife/gocharlife">CHAR LIFE</a></li>
										<li><a href="javascript:map()">MAP</a></li>
										<li><a href="customer/goAdmin">page</a></li>
										
										<sec:authorize access="isAnonymous()">
											<c:if test="${sessionScope.customer == null}">
											<li><a id="SignIn">LOGIN</a></li>
											</c:if>
										</sec:authorize>
										
					    				<sec:authorize access="isAuthenticated()">
										<li>
										<a class="codrops-icon codrops-icon-drop" href="customer/logout" id='Logout'>
											<span>Logout</span>
										</a>
										</li>
										
										<c:if test="${sessionScope.customer == null}">
											<li><a id="SignIn">LOGIN</a></li>
										</c:if>
										</sec:authorize>
										
									</ul>
								</div>

							</div>
						</nav>
					</div>
				</div>

			</div>

		</div>
	</header>
	<!--End of header -->


  <div id="loading_state">
    loading...
  </div>
  <div id="open_call_state">
    <video id="remote_video"></video>
    <video id="local_video"></video>
  </div>
   <div class="chat">
   <div class="chat_controll">
  <input type="button" id="enterBtn" class="fa" value="      ">
<input type="button" id="exitBtn" class="fa" value="      ">
</div>
  <div class="chat_header">
  <img class="chat_avatar"src="download?saved=${sessionScope.customer.saved_File}" />
  ${sessionScope.customer.cust_Name }    
  <div class="chat_status">${sessionScope.customer.cust_Major }</div>
  </div>
 <div class="chat_s">
  </div>
  <div class="chat_input">
    <input id="message" placeholder="Type here..." class="chat_text">
    <button type="button" id="sendBtn" class="chat_submit fa fa-send"></button>
  </div>
</div>  
 <!--  
  <div class="messages">
    <div class="messages-content"></div>
  </div>
  <div class="message-box">
    <textarea class="message-input" placeholder="Type message..."></textarea>
    <button type="submit" class="message-submit">Send</button>
  </div> -->

<div class="bg"></div>

<div class="jamaku" id="me">
<span class="final" id="final_span"></span>
<span class="interim" id="interim_span"></span>
</div>


<div class="jamaku" id="you"></div>


</body></html>
