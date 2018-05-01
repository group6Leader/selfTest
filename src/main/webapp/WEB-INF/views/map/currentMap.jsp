<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Map &mdash; 병원검색</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="GetTemplates.co" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../resources/css/login.css">	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../resources/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="../resources/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../resources/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="../resources/css/magnific-popup.css">

	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="../resources/css/bootstrap-datetimepicker.min.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" type="text/css" href="../resources/css/currentLocation.css">

	<!-- Modernizr JS -->
	<script src="../resources/js/modernizr-2.6.2.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">

	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBTHJM9dvtB89wLTDFXOOX2TG5zttwa4RU">
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	var nav = null;
	var map;
	var marker;
	var iterator = 0;
	var yadmNmArr = [];	//병원이름 저장 배열
	var hosInfoArr = [];	//병원정보 저장 배열
	var markersArr = [];  //마커 삭제를 위한 배열
	var clickedLocation;	//클릭한 위치
	var hosLocation = [];		//병원 lng, lat 위치
	/* 현재 위치(위도/경도)를 받아오기 위한 부분 */
	$(function() {
		if (nav == null) {
			nav = window.navigator;
		}
		if (nav != null) {
			var geoloc = nav.geolocation;
			if (geoloc != null) {
				/* Callback 성공 시, successCallback() 호출 */
				geoloc.getCurrentPosition(successCallback);
			} else {
				alert("geolocation not supported");
			}
		} else {
			alert("Navigator not found");
		}
	});

	function successCallback(position) {
		/* 위도 */ var latitude = position.coords.latitude;
		/* 경도 */ var longitude = position.coords.longitude; 		
		
		/* Google Map으로 위도와 경도 초기화 */
		initialize(latitude, longitude);
		
		//현재 좌표값(위도, 경도) 보내기
		$.ajax({
		      url:"currentLocation",
		      type:'GET',
		      data: {lat: latitude, lon: longitude},
		      success:function(data){
		    	  
		      },
		      error:function(jqXHR, textStatus, errorThrown){
		    	  
		      }
		  });
	}

	function initialize(latitude, longitude) {
		/* 현재 위치의 위도와 경도 정보를 currentLocatioon 에 초기화 */
		var currentLocation = new google.maps.LatLng(latitude, longitude);
		var mapOptions = {
			center : currentLocation, /* 지도에 보여질 위치 */ 				
			zoom : 14, /* 지도 줌 (0축소 ~ 18확대),  */ 	
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		/* DIV에 지도 달아주기 */
		map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);
		/* 지도 위에 마커 달아주기 */
		marker = new google.maps.Marker({
			position : currentLocation,
			map : map
		});
		google.maps.event.addListener(marker, 'click', toggleBounce(marker));
				
		/* 지도에서 마우스 클릭시 마커 생성 */
		google.maps.event.addListener(map, 'click', function(event) {			
			addMarker(event.latLng);
			if(Array.isArray(markersArr) & (markersArr.length > 0)){
				removeMarker();				
				markersArr = [];				
			}				   	  	
			
			var yadmNm = document.getElementById("yadmNm").value;
			var dgsbjtCd = document.getElementById("dgsbjtCd").value;
			var sgguCd = document.getElementById("sgguCd").value;
			var radius = document.getElementById("radius").value;
			var numOfRows = document.getElementById("numOfRows").value;
			var clickedLocation = event.latLng.toString();
			
			$.ajax({
			      url:"currentLocation",
			      type:'GET',
			      data: {clickedLocation: clickedLocation, yadmNm: yadmNm, dgsbjtCd: dgsbjtCd, sgguCd: sgguCd, radius: radius, numOfRows: numOfRows},
			      dataType:"JSON",
			      success:function(data){				    		
			    	  markersArr = [];
			    	  arrY = [];
			    	  arrX = [];
			    	  yadmNmArr = [];
			    	  hosInfoArr = [];
			    	  hosLocation = [];
			    	  iterator = 0;
			    	  var hospUrl = "";
			    	  for(let ele of data) {
			    	  		var yadmNm = ele.yadmNm;
				    		var addr = ele.addr;
				    		hospUrl = "";
				    		if(ele.hospUrl == ''){
				    			hospUrl = '없음.';
				    		}else if(ele.hospUrl == null){
				    			hospUrl = '없음.';
				    		}else if(ele.hospUrl.indexOf("http") != -1){
				    			hospUrl = ele.hospUrl;
				    		}else {
				    			hospUrl = ele.hospUrl;
				    		}
				    		
				    		var telno = ele.telno;
							var xPos = ele.xPos;
							var yPos = ele.yPos;
							yadmNmArr.push(yadmNm);
							hosInfoArr.push('<div id="content">'+
								      '<div id="siteNotice">'+
								      '</div>'+
								      '<input type="button" id=firstHeading class="hospitalName" onclick="clickBtn()" value="'+yadmNm+'">'+
								      '<div id="bodyContent">'+
								      '<p><b>홈페이지 : </b>' + '<a href=' + hospUrl + ' target="_blank">'+hospUrl+'</a></p>'+
								      '<p><b>주소 : </b>'+addr+'</p>' +
								      '<p><b>전화번호 : </b><span  >' + telno + '</span></p></div>' +
								      '<input type="hidden" class="hospitalUrl" value="'+hospUrl +'">' +
								      '<input type="hidden" class="hospitalPhone" value="'+telno +'">' + 
								      '<input type="hidden" class="hospitalAddr" value="'+addr +'">' 
									);
							//hosInfoArr.push("홈페이지: " + hospUrl + "\n주소: " + addr + "\n전화번호: " + telno);
							hosLocation.push(new google.maps.LatLng(yPos, xPos));
							//console.log('병원명:'+yadmNm, '주소:'+addr, '홈페이지:'+hospUrl, '전화:'+telno, 'x:'+xPos, 'y:'+yPos);
					  }
			    	  			    	  
			    	  for(var i=0; i<hosLocation.length; i++){			    		  
			    		  addMarkers();			    		  
			      	  }		  			
			    	  			    	  
			      },
			      error:function(jqXHR, textStatus, errorThrown){
			    	  
			      }
			  });			
		});
	}	

	function addMarker(location) {
		/* 기존에 있던 마커 삭제 후 */
		/*새 마커 추가하기. */ 
		marker.setMap(null);
		marker = new google.maps.Marker({
			position : location,
			map : map
		});
		/* 마커 토글바운스 이벤트 걸어주기(마커가 통통 튀도록 애니메이션을 걸어줌) */
		google.maps.event.addListener(marker, 'click', toggleBounce(marker));		
	}

	//검색한 병원 마커들 띠우기
	function addMarkers(){
			
		var markers = new google.maps.Marker({
			position : hosLocation[iterator],
			map : map,
            title: yadmNmArr[iterator] 	// 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});
			markersArr.push(markers);
		    
			var infowindow = new google.maps.InfoWindow({
		    	content: hosInfoArr[iterator]
		    });	// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
  	  			    		  	
		    google.maps.event.addListener(markers, 'click', function(){
		          infowindow.open(map, markers);		//페이지 로딩시 말풍선 실행	
		        
		    });
		    iterator ++;
    }	
	
	//마커들 지우기
	function removeMarker() {
		for ( var i = 0; i < markersArr.length; i++ ) {			
			markersArr[i].setMap(null);	
			delete markersArr[i];			
		}
		//infowindow.close();
	}	
	
	function toggleBounce(marker) {
		if (marker.getAnimation() != null) {
			marker.setAnimation(null);
		} else {
			marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	}
	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('.login').hide();
	$('.gn-icon-menu').hover(function() {
		$('.gn-menu-wrapper').toggleClass('gn-open-part');
	});

	$('.gn-menu-wrapper').hover(function() {
		$(this).toggleClass('gn-open-all');
	});
		
	
});
</script>
<script type="text/javascript">
function clickBtn(){
	var hospitalName = document.querySelector('.hospitalName');
	var hospitalAddr = document.querySelector('.hospitalAddr');
	var hospitalUrl = document.querySelector('.hospitalUrl');
	var hospitalPhone = document.querySelector('.hospitalPhone');
	alert(hospitalAddr.value);
	alert(hospitalUrl.value);
	alert(hospitalPhone.value);
	document.getElementById("hosName").innerHTML = '<input type="text" name="yadmNm" id="yadmNm" value="'+ hospitalName.value +'" class="form-control">';
	document.getElementById("hosUrl").innerHTML = '<input type="hidden" name="hos_Homepage" value="'+ hospitalUrl.value + '" >';
	document.getElementById("hosAddr").innerHTML = '<input type="hidden" name="hos_Addr" value="'+ hospitalAddr.value + '" >';
	document.getElementById("hosPhone").innerHTML = '<input type="hidden" name="hos_Phone" value="'+ hospitalPhone.value +'" >';
}


if(${haveRes != null}){
	alert("예약이 존재합니다. 예약 취소 후 시도해주세요.");
}  

if(${resSuccess != null}){
	alert("예약이 완료되었습니다.");
}

$(function() {

	$('#SignIn').on('click', function(event) {
		event.preventDefault();//href 사용 안함
		$('.login').show();
	});
	// close
	$('#close').on('click', function() {
		$('.login').hide('fast');
	});

	var input = document.createElement("input");
	if (('placeholder' in input) == false) {
		$('[placeholder]').focus(function() {
			var i = $(this);
			if (i.val() == i.attr('placeholder')) {
				i.val('').removeClass('placeholder');
				if (i.hasClass('password')) {
					i.removeClass('password');
					this.type = 'password';
				}
			}
		}).blur(function() {
			var i = $(this);
			if (i.val() == '' || i.val() == i.attr('placeholder')) {
				if (this.type == 'password') {
					i.addClass('password');
					this.type = 'text';
				}
				i.addClass('placeholder').val(i.attr('placeholder'));
			}
		}).blur().parents('form').submit(function() {
			$(this).find('[placeholder]').each(function() {
				var i = $(this);
				if (i.val() == i.attr('placeholder'))
					i.val('');
			})
		});
	}

});
</script>
<script type="text/javascript">
function check(){
	var yadmNm = document.getElementById('yadmNm').value;
	var dgsbjtCd = document.getElementById('dgsbjtCd').value;
	var date = document.getElementById('date').value;
	var time = document.getElementById('time').value;
	
	if(yadmNm == null || yadmNm ==""){
		alert("예약하실 병원을 선택하세요.");
		return false;
	}
	if(dgsbjtCd == null || dgsbjtCd == ""){
		alert("예약하실 진료과목을 선택하세요.");
		return false;
	}
	if(date == null || date == ""){
		alert("예약 날짜를 선택하세요.");
		return false;
	}
	if(time == null || time == ""){
		alert("예약 시간을 선택하세요.");
		return false;
	}
	return true;	
}
</script>

</head>
<body>
<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<header id="main_menu" class="header navbar-fixed-top menu-scroll">
		<div class="main_menu_bg">
			<div class="container">
				<div class="row">
					<div class="nave_menu">
						<nav class="navbar navbar-default" id="navmenu">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1"
										aria-expanded="false">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a class="navbar-brand" href="/www"> <img src="../resources/assets/images/logo.jpg" />
									</a>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->

								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="/www">Char Hospital</a></li>
										<sec:authorize access="hasRole('CUSTOMER')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-haspopup="true">자가진단</a>
											<ul class="dropdown-menu">
												<li><a href="../selfCheck/goSelfCheck">자가진단 하러가기</a></li>
												<li><a href="../selfCheck/goSelfCheck3">자가진단 결과보기</a></li>
											</ul></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
										<li><a href="../customer/goFix">My Page</a></li>
										<c:if test="${sessionScope.customer.division == 2 }">
											<li><a href="../reservation/book2">예약</a></li>
										</c:if>
										<c:if test="${sessionScope.customer.division == 1 }">
											<li><a href="../reservation/book">예약</a></li>
										</c:if>					
										
										<li><a href="../webrtc/goWebRtc">원격진료</a></li>
										</sec:authorize>
										
										<sec:authorize access="hasRole('DOCTOR')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">의사메뉴</a>
											<ul class="dropdown-menu">
												<li><a href="">진단서 작성</a></li>
												<li><a href="">처방전 작성</a></li>
												<li><a href="">처방전 리스트</a></li>
											</ul></li>
										</sec:authorize>
										<sec:authorize access="hasRole('CUSTOMER')">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">환자메뉴</a>
											<ul class="dropdown-menu">
												<li><a href="../prescription/prescriptionIndList2">개인 처방전</a></li>
												<li><a href="../healthRecord/goHealthRecord">개인 진단서</a></li>
											</ul></li>
										</sec:authorize>
										
										<li><a href="../charlife/gocharlife">CHAR LIFE</a></li>
										<li><a href="../mapping/map">MAP</a></li>
										<sec:authorize access="isAnonymous()">
											<c:if test="${sessionScope.customer == null}">
											<li><a id="SignIn">LOGIN</a></li>
											</c:if>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
						    				<c:if test="${sessionScope.customer != null}">
										<li><a href="../customer/logout" id='Logout'>Logout</a></li>
											</c:if>
										</sec:authorize>	
										
										<c:if test="${param.error != null}">
							        		<li> 이메일 인증을 하셔야 합니다. </li>
								    		</c:if>										
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
	
	<div id="page">

	<div class="map_container">
		<div class="" id="map_canvas"></div>
		<div id="gtco-header" class="gtco-cover gtco-cover-md map_menu"> 
		<div class="gtco-container map-controls">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h3 class="cursive-font">Hospital Reservation</h3>
											<form action="../reservation/reservation2" method="get" onsubmit="return check()">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Hospital Name</label>
														<div id="hosName"><input type="text" name="yadmNm" id="yadmNm" value="" class="form-control"></div>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Radius</label>
															<input type="range" name="radius" id="radius" value="1" step="10" min="1" max="101">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Hospital Count</label>
															<input type="range" name="numOfRows" id="numOfRows" value="1" step="10" min="1" max="101">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="activities">Subject</label>
														<select name="dgsbjtCd" id="dgsbjtCd" class="form-control">
															<option value="" disabled="disabled" selected="selected">진료과목</option>
															<option value="00">일반의</option>
															<option value="01">내과</option>
															<option value="02">신경과</option>
															<option value="03">정신건강의학과</option>
															<option value="04">외과</option>
															<option value="05">정형외과</option>
															<option value="06">신경외과</option>
															<option value="07">흉부외과</option>
															<option value="08">성형외과</option>
															<option value="10">산부인과</option>
															<option value="11">소아청소년과</option>
															<option value="12">안과</option>
															<option value="13">이비인후과</option>
															<option value="14">피부과</option>
															<option value="15">비뇨기과</option>
															<option value="49">치과</option>
															<option value="80">한방내과</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="activities">Area</label>
														<select  name="sgguCd" id="sgguCd" class="form-control">
															<option value="" disabled="disabled" selected="selected">지역</option>
															<option value="110001">강남구</option>
															<option value="110002">강동구</option>
															<option value="110003">강서구</option>
															<option value="110004">관악구</option>
															<option value="110005">구로구</option>
															<option value="110006">도봉구</option>
															<option value="110007">동대문구</option>
															<option value="110008">동작구</option>
															<option value="110009">마포구</option>
															<option value="110010">서대문구</option>
															<option value="110011">성동문구</option>
															<option value="110012">성북구</option>
															<option value="110013">영등포구</option>
															<option value="110014">용산구</option>
															<option value="110015">은평구</option>
															<option value="110016">종로구</option>
															<option value="110017">중구</option>
															<option value="110018">송파구</option>
															<option value="110019">중랑구</option>
															<option value="110020">양천구</option>
															<option value="110021">서초구</option>
															<option value="110022">노원구</option>
															<option value="110023">광진구</option>
															<option value="110024">강북구</option>
															<option value="110025">금천구</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Date</label>
														<input type="text" id="date" name="date" value="" class="form-control">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Time</label>
														<input type="text" id="time" name="time" value="" class="form-control">
													</div>
												</div>
												
												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="Reserve Now">
														<input type="hidden" class="btn btn-primary btn-block btn-update-map"> 
														<input type="reset" value="Reset" class="btn btn-primary btn-block btn-reset-map">
													</div>
												</div>
												<div id="hosAddr"><input type="hidden" name="hos_Addr" value=""></div>
												<div id="hosUrl"><input type="hidden" name="hos_Homepage" value=""></div>
												<div id="hosPhone"><input type="hidden" name="hos_Phone" value=""></div>
											</form>	
										</div>										
									</div>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
			</div>

			<div class="map" id="map"></div>
		
	<!-- jQuery -->
	<script src="../resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="../resources/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="../resources/js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="../resources/js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/magnific-popup-options.js"></script>
	
	<script src="../resources/js/moment.min.js"></script>
	<script src="../resources/js/bootstrap-datetimepicker.min.js"></script>


	<!-- Main -->
	<script src="../resources/js/currentLocation.js"></script>
<c:url value="/login" var="loginUrl" />

	<div class='login'>
		<button class='close' id='close'></button>

		<div class='top'>
			<h2>Login</h2>
		</div>

		<form:form name="f" action="${loginUrl}" method="POST" onsubmit="return formCheck()">
			<div class='user'>
				<input id="cust_Id" name='cust_Id' placeholder='ID' type='text'>
			</div>
			<div class='pw'>
				<input id='cust_Pw' name='cust_Pw' placeholder='Password'
					type='password'>
			</div>
			<div id="check"></div>
			<div class='remlog'>

				<div class="container">
					<input type="submit" value='Login' class="btn-success btn-lg btn-block" id="button">
				</div>
			</div>
		</form:form>
		<div class='forgot'>
			<h3>회원이 아니신가요?</h3>
			<a href='customer/goJoin'>click here</a> to join a new member
		</div>
	</div>	
</body>
</html>