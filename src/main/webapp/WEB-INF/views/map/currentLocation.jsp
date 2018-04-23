<%@ page session="true" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../resources/css/sideBar.css">
<link rel="stylesheet" type="text/css" href="../resources/css/currentLocation.css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBTHJM9dvtB89wLTDFXOOX2TG5zttwa4RU">
	
</script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	var nav = null;
	var map;
	var marker;
	var markers;
	var arrX = [];  //lat
	var arrY = [];  //lng
	var markersArr = [];  //마커 삭제를 위한 배열
	var clickedLocation;
	var hosLocation;
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

		// This event listener will call addMarker() when the map is clicked.
		/* 지도에서 마우스 클릭시 마커 생성 */
		google.maps.event.addListener(map, 'click', function(event) {			
			addMarker(event.latLng);
			var clickedLocation = event.latLng.toString();
			$.ajax({
			      url:"currentLocation",
			      type:'GET',
			      data: {clickedLocation: clickedLocation},
			      dataType:"JSON",
			      success:function(data){	
			    				    	  
			    	  for(let ele of data) {
			    	  		var yadmNm = ele.yadmNm;
				    		var addr = ele.addr;
				    		var hospUrl = ele.hospUrl;
				    		var telno = ele.telno;
							var xPos = ele.xPos;
							var yPos = ele.yPos;					
							arrX.push(xPos);
							arrY.push(yPos);
							//console.log('병원명:'+yadmNm, '주소:'+addr, '홈페이지:'+hospUrl, '전화:'+telno, 'x:'+xPos, 'y:'+yPos);							
					  }			    	 			    	  
			    	  
			    	  for(var i=0; i<arrY.length; i++){
				    	  	hosLocation = new google.maps.LatLng(arrY[i], arrX[i]);
						  	addMarkers(hosLocation);
				      }			    	  
			      },
			      error:function(jqXHR, textStatus, errorThrown){
			    	 
			      }
			  });
			
		});
	}

	// Add a marker to the map and push to the array.
	/*
	 * 이 소스는 마커를 하나만 추가할 수 있도록 구현해놓습니다.
	 * 개발자분들 재량에 따라 코드를 응용하도록 하세요.  
	 */
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
	function addMarkers(hosLocation){
		//기존에 있던 마커 삭제 후
		//새 마커 추가하기
		markers = new google.maps.Marker({
			position : hosLocation,
			map : map
		});
		
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
	function hosSearch(){
		var yadmNm = document.getElementById("yadmNm").value;
		var dgsbjtCd = document.getElementById("dgsbjtCd").value;
		var sgguCdNm = document.getElementById("sgguCdNm").value;
		var radius = document.getElementById("radius").value;
		
		if(dgsbjtCd == null || dgsbjtCd ==""){
			alert("진료과목을 선택하세요.");
			return false;
		}
		if(sgguCdNm == null || sgguCdNm ==""){
			alert("지역을 선택하세요.");
			return false;
		}
		if(radius == null || radius ==""){
			alert("반경을 설정해주세요.");
			return false;
		}
		return true;		
</script>

</head>
<body>

	 <div class="container">
		<ul id="gn-menu" class="gn-menu-main mainmenusetting">
			<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav class="gn-menu-wrapper">
					<div class="gn-scroller">
						<ul class="gn-menu">
							
							<li class="gn-search-item">
							<input placeholder="Search" type="search" class="gn-search"> 
								<a class="gn-icon gn-icon-search">
									<span>Search</span>
								</a>
							</li>
							
							<li>
								<a class="gn-icon gn-icon-download">진료</a>
									<ul class="gn-submenu">
										<sec:authorize access="isAuthenticated()">
										<c:if test="${sessionScope.customer.division != 2}">
										<li>
											<a class="gn-icon gn-icon-illustrator" href="selfCheck/goSelfCheck">자가진단</a>
										</li>
										</c:if>
										</sec:authorize>
										<li>
											<a class="gn-icon gn-icon-photoshop" href="chat/goChat">원격진료</a>
										</li>
										<li>
											<a href="javascript:loginCheck()" class="gn-icon gn-icon-photoshop" >예약하기</a>
										</li>
									</ul>
							</li>
                           <c:if test="${sessionScope.customer != null}">
							<li>
								<a class="gn-icon gn-icon-cog" href="customer/goFix">Settings</a>
							</li>
							</c:if>
							<li>
								<a class="gn-icon gn-icon-help" href="prescription/goPrescription">처방전</a>
							</li>
							<li>
								<a class="gn-icon gn-icon-archive">WebRTC</a>
									<ul class="gn-submenu">
										<li>
											<a class="gn-icon gn-icon-article" href="webrtc/goWebRtc">RemoteHP</a>
										</li>
										
									</ul>
							</li>
						</ul>
					</div>
					<!-- /gn-scroller -->
				</nav>
			</li>
			<li><a href="">Char LIFE</a></li>
			<li><a href="javascript:map()">지도</a></li>
			<c:if test="${sessionScope.customer != null}">
			<li><a href="customer/goFix">My Page</a></li>
			<li>
				<a class="codrops-icon codrops-icon-prev">
					<span>VOC</span>
				</a>
			</li>
			</c:if>
			<c:if test="${sessionScope.myReservation != null}">
				<li>
					${myReservation}
				</li>
			</c:if>
			<li>
				<sec:authorize access="isAnonymous()">
				<c:if test="${sessionScope.customer == null}">
				<a class="codrops-icon codrops-icon-drop" id='SignIn'>
					<span>Login</span>
				</a>
				</c:if>
				</sec:authorize>
				
				
				<sec:authorize access="isAuthenticated()">
    				<c:if test="${sessionScope.customer != null}">
					<a class="codrops-icon codrops-icon-drop" href="customer/logout" id='Logout'>
						<span>Logout</span>
					</a>
					</c:if>
					
					<c:if test="${sessionScope.customer == null}">
					<a class="codrops-icon codrops-icon-drop" id='SignIn'>
					<span>Login</span>
					</a>
					</c:if>
				
				</sec:authorize>
			</li>
		</ul>
</div>

	<div class="map_container">
		<div class="" id="map_canvas"></div>
		<div class="map_menu">
				<div class="map-controls">
			<form action="currentLocation" method="get" onsubmit="return hosSearch()">
			    <h6 class="title">
			      	병원명
			    </h6>
			    <input type="text" id="yadmNm" value="" class="input-color" placeholder="차 병원">
			    <h6 class="title">
					진료과목
			    </h6>		    
			    <select name="dgsbjtCd" id="dgsbjtCd">
						<option disabled="disabled" selected="selected">진료과목</option>
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
			    <h6 class="title">
					지역
			    </h6>
			    <select name="sgguCdNm" id="sgguCdNm">
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
				<h6 class="title">
					반경
			    </h6>
				<input type="range" name="radius" id="radius" value="1" step="1" min="1" max="100">
			    <hr>
			    <button class="btn btn-update-map">search </button>			  
		    </form>
	  </div>
  	  
	  <div class="map" id="map">
	  </div>
		</div>
	</div>	

</body>

</html>