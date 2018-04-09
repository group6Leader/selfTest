<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>webRtc-2</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.min.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/DetectRTC.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/global.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/highlight.min.js"></c:url>"></script>
<script type="text/javascript">
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

	  /**
	   * changeColor
	   *
	   */
	  /*
		  .red 		{ background: red; }
			.blue 	{ background: blue; }
			.green 	{ background: green; }
			.yellow { background: yellow; }
			.orange { background: orange; }
			.grey 	{ background: grey; }
			.gold   { background: gold; }
			.white 	{ background: white; }
			.black  { background: black; }
	 	*/
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




</head>
<body>

<div id="content">
	<span id="icon-music">♬</span>

  <div class="wrap">
    <p>
			WebRTC 관련 예제로 Speech Recognition API를 활용하면 더 재밌는 기능을 만들 수 있습니다.<br>
			아래 버튼을 누른 후 마이크에 이야기를 해보세요. (마이크와 가까울수록 인식률이 좋습니다)
		</p>
    <div id="result">
      <span class="final" id="final_span"></span>
      <span class="interim" id="interim_span"></span>
    </div>
    <button id="btn-mic" class="off">마이크 <span></span></button>
    <button id="btn-tts">Text to speech</button>
    <audio id="audio" src="ending.mp3"></audio>
    <!--
		<div>
		  <button onclick="document.getElementById('audio').play()">Play the Audio</button>
		  <button onclick="document.getElementById('audio').pause()">Pause the Audio</button>
		  <button onclick="document.getElementById('audio').volume+=0.2">Increase Volume</button>
		  <button onclick="document.getElementById('audio').volume-=0.2">Decrease Volume</button>
		</div>
		-->
		<br><br>

		<h3>예약어 (마이크를 켠 상태에서 아래 문자를 읽어보세요)</h3>
		<ul>
			<li>레드, 그린, 옐로우, 오렌지, 그레이, 골드, 블랙</li>
			<li>알람</li>
			<li>노래 켜, 노래 꺼, 음악 켜, 음악 꺼</li>
			<li>볼륨업, 볼륨다운</li>
			<li>스피치, 말해줘</li>
		</ul>
  </div>
</div>




</body>
</html>