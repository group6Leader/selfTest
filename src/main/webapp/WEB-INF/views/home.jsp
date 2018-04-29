<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Char Hospital</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="./resources/assets/css/fonticons.css">
<link rel="stylesheet" href="./resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="./resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<!--For Plugins external css-->
<link rel="stylesheet" href="./resources/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="./resources/assets/css/home.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="./resources/assets/css/responsive.css" />
<script src="./resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/modernizr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">

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
	// Placeholder fixed for Internet Explorer
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
	
	function formCheck() {

		var cust_Id1 = $('#cust_Id').val();
		var cust_Pw1 = $('#cust_Pw').val();
		var cust_Id2 = document.getElementById('cust_Id');
		var cust_Pw2 = document.getElementById('cust_Pw');

		var logincheck = 'fail';

		if (cust_Id2.value == '') {
			alert("ID를 입력해주세요");
			cust_Id.focus();
			return false;
		}
		if (cust_Pw2.value == '') {
			alert("password를 입력해주세요");
			cust_Pw.focus();
			return false;
		}
	
	}

	function remoteCheck() {

		$(location).attr('href', "chat-ws");
	}
	
</script>
<script type="text/javascript">
$(window).scroll(function(){
    if ($(window).scrollTop() >= 300) {
       $('.gn-menu-main').addClass('fixed-header');
    }
    else {
       $('.gn-menu-main').removeClass('fixed-header');
    }
});
</script>

<script type="text/javascript">
	function loginCheck(){
		if(${sessionScope.member == null}){
			alert("로그인 후에 예약이 가능합니다.");
			location.href ="./";
			return;
		}
		if(${sessionScope.customer.division == 1 }){
			location.href="./reservation/book";
		}
		if(${sessionScope.customer.division == 2 }){
			location.href="./reservation/book2";
		}
	}
</script>
<script type="text/javascript">
	function map(){
		location.href="./mapping/map";		
	}
</script>

</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<header id="main_menu" class="header navbar-fixed-top">
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
									<a class="navbar-brand" href=""> <img src="./resources/assets/images/logo.jpg" />
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
										
										<c:if test="${sessionScope.customer != null}">
										<li><a class="codrops-icon codrops-icon-drop" href="customer/logout" id='Logout'>
											<span>Logout</span></a>
										</li>
										</c:if>
										
										<c:if test="${sessionScope.customer == null}">
											<li><a id="SignIn">LOGIN</a></li>
										</c:if>
										
										<%-- <sec:authorize access="isAnonymous()">
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
										</sec:authorize> --%>
										
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
	
	<c:if test="${sessionScope.myReservation != null}">
		<div id="container-floating"> 
  			<div class="nd1 nds" data-toggle="tooltip" data-placement="left"><img class="reminder">
    		<p class="letter">${myReservation}</p>
  		</div>
  			<div id="floating-button" data-toggle="tooltip" data-placement="left" data-original-title="Create">
    			<p class="plus"><i class="far fa-bell"></i></p>
    			<p class="edit"><i class="fas fa-bell"></i></p>
  			</div>

		</div>
	</c:if>

	<!-- About Section -->
	<section id="aboutus" class="aboutus margin-top-120">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="head_title text-center margin-top-80">
						<h1>CHAR HOSPITAL</h1>
						<c:if test="${sessionScope.customer.division == 1 }">
							<h3>${sessionScope.customer.cust_Name } 様を歓迎します。</h3>
							
						</c:if>
						
						<c:if test="${sessionScope.customer.division == 2 }">
							<h3>${sessionScope.customer.cust_Name } 様を歓迎します。</h3>
							
						</c:if>
						
					</div>
					<!-- End of head title -->

					<div class="main_about_area">
						<div class="row">

							<div class="col-sm-6">
								<div class="signle_about_left">
									<img src="./resources/assets/images/service3.jpg" alt="" />
								</div>


							</div>

							<div class="col-sm-5 col-sm-push-1">
								<div class="single_about">
									<div class="separator2"></div>
									<h3> Welcome to Char Hospital </h3>

									<p> Char Hospitalは患者さんと医者さんの架け橋になるホームページです。 </p> <br>
									
									<h4> How to use </h4>
											
									<p> First. アカウントを作ります。 </p>
									
									<!-- 자가진단을 하세요 -->
									<p> Second. 自己診断を作成します。 </p>
									
									<p> Third. 遠隔診療をするために予約をします。 </p>
									
									<p> Fourth. 遠隔診療を通して医者さんから正確な診断を受けます。</p>
									
									<!-- Experience the state of the art facilities and services. -->
								
									<!-- We specialize on remote medical treatment support system.
									
									저희는 원격진료 시스템과 통합병원예약사이트, Char life로 
										의료적인 도움을 드립니다. 첨단기술과 의학이 만나 더 편리하고
										섬세하게 여러분은 질병을 케어합니다.		 -->		
								
									<!-- <p>언제 어디서든 간편하게 나를 가장 잘아는 주치의에게 진료를 받으세요.</p> -->

									<a href="" class="btn btn-default">get in touch</a>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- End of col-sm-12 -->
			</div>
			<!-- End of row -->
		</div>
		<!-- End of Container -->
		<hr />
	</section>
	<!-- End of about Section -->



	<!-- counter Seection -->
	<section id="counter" class="counter">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_counter sections text-center">
						<div class="row">
							<div class="col-sm-4 col-xs-12">
								<div class="single_counter_right">
									<h4 class="statistic-counter">4</h4>
									<div class="separator"></div>
									<p>doctor</p>
								</div>
							</div>
							<!-- End of col-sm-4 -->

							<div class="col-sm-4 col-xs-12">
								<div class="single_counter_right">
									<h4 class="statistic-counter">20</h4>
									<div class="separator"></div>
									<p>patient</p>
								</div>
							</div>
							<!-- End of col-sm-4 -->

							<div class="col-sm-4 col-xs-12">
								<div class="single_counter_right">
									<h4 class="statistic-counter">0</h4>
									<div class="separator"></div>
									<p>Telemedicine</p>
								</div>
							</div>
							<!-- End of col-sm-4 -->

						</div>
						<!-- End of row -->
					</div>
				</div>
				<!-- End of col-sm-12 -->
			</div>
			<!-- End of row -->
		</div>
		<!-- End of Container -->
	</section>
	<!-- End of counter Section -->



	<!-- Team Section -->
	<section id="team" class="team colorsbg sections">
		<div class="container">
			<div class="row">
				<div class="main_team_area">
					<div class="head_title text-center">
						<h1>遠隔診療が可能な医者</h1>
					</div>
					<!-- End of head title -->
					<div class="main_team text-center">
						<div class="single_team">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="row">
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>ちゃ‧エジン</h4>
											<div class="separator"></div>
											<p>外科専攻</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team2.jpg" alt="" />
											<h4>キム‧ジュンヒョン</h4>
											<div class="separator"></div>
											<p>内科専攻</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team3.jpg" alt="" />
											<h4>ぞ‧ミンゼ</h4>
											<div class="separator"></div>
											<p>精神医学科専攻</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
								</div>
							</div>
							<!-- End of col-sm-10 -->
						</div>
						<div class="single_team">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="row">
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>シン‧ドンチュル</h4>
											<div class="separator"></div>
											<p>歯科専攻</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>joshua spencer</h4>
											<div class="separator"></div>
											<p>founder</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>diane lewis</h4>
											<div class="separator"></div>
											<p>artist, designer</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
								</div>
							</div>
							<!-- End of col-sm-10 -->
						</div>
						<div class="single_team">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="row">
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>paul hall</h4>
											<div class="separator"></div>
											<p>art director</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>joshua spencer</h4>
											<div class="separator"></div>
											<p>founder</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
									<div class="col-sm-4">
										<div class="team">
											<img class="img-circle"
												src="./resources/assets/images/team1.jpg" alt="" />
											<h4>diane lewis</h4>
											<div class="separator"></div>
											<p>artist, designer</p>
										</div>
									</div>
									<!-- End of col-sm-4 -->
								</div>
							</div>
							<!-- End of col-sm-10 -->
						</div>
					</div>
				</div>
			</div>
			<!-- End of row -->
		</div>
		<!-- End of Container -->
	</section>
	<!-- End of counter Section -->

	<!-- Contact Section -->
	<section id="contact" class="contact">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_contact sections">
						<div class="head_title text-center whitetext">
							<h1>お問い合わせ</h1>
						</div>

						<div class="row">
							<div class="contact_contant">
								<div class="col-sm-6 col-xs-12">
									<div class="single_message_right_info">
										<ul class="whitetext">
											<li><i class="fa fa-map-marker"></i> <span>お問い合わせの前に</span></li>
											<li><i class="fa fa-mobile-phone"></i> <span>原則、土日祝祭日を除く3営業日以内に返信をさせて頂きます。</span></li>
											<li><i class="fa fa-mobile-phone"></i> <span>3営業日を過ぎても返信がない場合、お問い合わせが送信出来ていないか、返信させて頂いた<br>
												メールがうまく受信出来ていない可能性がございます。<br>
												迷惑メールフォルダやごみ箱に振り分けられていないかご確認頂き、これでも確認出来ない
												場合は、別のメールアドレスよりお問い合わせ頂くようお願い致します。</span></li>
											<li><i class="fa fa-mobile-phone"></i> <span>病院、薬の情報に関しては、正確ではない場合もあります。</span></li>
											<li><i class="fa fa-envelope-o"></i> <span>question@charhospital.com</span></li>
										</ul>

										<div class="contact_socail transition margin-top-80">
											<a href=""><i class="fa fa-facebook img-circle"></i></a> <a
												href=""><i class="fa fa-twitter img-circle"></i></a> <a
												href=""><i class="fa fa-google-plus img-circle"></i></a> <a
												href=""><i class="fa fa-pinterest img-circle"></i></a> <a
												href=""><i class="fa fa-instagram img-circle"></i></a>
										</div>
									</div>
								</div>
								<!-- End of col-sm-6 -->

								<div class="col-sm-6 col-xs-12">
									<div class="single_contant_left margin-top-60">
										<form action="#" id="formid">
											<!--<div class="col-lg-8 col-md-8 col-sm-10 col-lg-offset-2 col-md-offset-2 col-sm-offset-1">-->

											<div class="form-group">
												<label>名前</label> <input type="text" class="form-control"
													name="name" required="" style="color: white;">
											</div>

											<div class="form-group">
												<label>メール</label> <input type="email"
													class="form-control" name="email" required="" style="color: white;">
											</div>

											<div class="form-group">
												<label>メッセージ</label>
												<textarea class="form-control" name="message" rows="8" style="color: white;"></textarea>
											</div>

											<div class="">
												<input type="submit" value="submit" class="btn btn-default">
											</div>
											<!--</div>-->
										</form>
									</div>
								</div>
							</div>
							<!-- End of messsage contant-->
						</div>
					</div>
				</div>
			</div>
			<!-- End of row -->
		</div>
		<!-- End of container -->
	</section>
	<!-- End of contact Section -->




	<!-- footer section -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="main_footer">
				<div class="row">
					<div class="col-sm-12">
						<div class="copyright_text text-center">
							<p class=" wow fadeInRight" data-wow-duration="1s">
								Made by <i class="fa fa-heart"></i> Char Yejin<i class="fa fa-heart"></i>Kim Joonhyung<i class="fa fa-heart"></i>
								Jo Minje<i class="fa fa-heart"></i>Sin Dongcheol<a target="_blank"
									href="http://bootstrapthemes.co">Project CharHospital</a>2018. All
								Rights Reserved CharProjectTeam
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End of container -->
	</footer>
	<!-- End of footer Section-->



	<!-- START SCROLL TO TOP  -->

	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>

	<script src="./resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="./resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="./resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="./resources/assets/js/masonry/masonry.min.js"></script>
	<script type="text/javascript">
            $('.mixcontent').masonry();
        </script>

	<script src="./resources/assets/js/jquery.sliderPro.min.js"></script>
	<script type="text/javascript">
            $(document).ready(function ($) {
                $('#example3').sliderPro({
                    width: 960,
                    height: 200,
                    fade: true,
                    arrows: false,
                    buttons: true,
                    fullScreen: false,
                    shuffle: true,
                    smallSize: 500,
                    mediumSize: 1000,
                    largeSize: 3000,
                    thumbnailArrows: true,
                    autoplay: false,
                    thumbnailsContainerSize: 960

                });
            });
        </script>
	<script src="./resources/assets/js/plugins.js"></script>
	<script src="./resources/assets/js/home.js"></script>
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
