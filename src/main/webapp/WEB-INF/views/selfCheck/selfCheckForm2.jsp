<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/selfCheck.css"></c:url>">
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="../resources/css/style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../resources/js/modernizr.custom.js"></script>

<title>selfCheck/selfCheck2</title>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<div id="preloader">
  <div id="status"> <img src="img/preloader.gif" height="64" width="64" alt=""> </div>
</div>
<!-- Navigation -->
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"> <i class="fa fa-bars"></i> </button>
      <a class="navbar-brand page-scroll" href="#page-top"> <i class="fa fa-paper-plane-o"></i> Modus</a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
      <ul class="nav navbar-nav">
        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
        <li class="hidden"> <a href="#page-top"></a> </li>
        <li> <a class="page-scroll" href="#about">About</a> </li>
        <li> <a class="page-scroll" href="#services">Services</a> </li>
        <li> <a class="page-scroll" href="#works">Portfolio</a> </li>
        <li> <a class="page-scroll" href="#team">Team</a> </li>
        <li> <a class="page-scroll" href="#testimonials">Testimonials</a> </li>
        <li> <a class="page-scroll" href="#contact">Contact</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container --> 
</nav>

<!-- Header -->
<div id="intro">
  <div class="intro-body">
    <div class="container">
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <h1>We are <span class="brand-heading">Modus</span></h1>
          <p class="intro-text">A full-service digital agency that loves what we do</p>
          <a href="#about" class="btn btn-default page-scroll">Learn More</a> </div>
      </div>
    </div>
  </div>
</div>
<!-- About Section -->
<div id="about">
  <div class="container">
    <div class="section-title text-center center">
      <h2>About us</h2>
      <hr>
    </div>
    <div class="row">
      <div class="col-md-4"><img src="img/about.jpg" class="img-responsive"></div>
      <div class="col-md-4">
        <div class="about-text">
          <h4>Who We Are</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec ornare diam commodo nibh.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum. </p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="about-text">
          <h4>What We Do</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec ornare diam.</p>
          <ul>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Consectetur adipiscing commodo</li>
            <li>Duis sed dapibus leo sed dapibus</li>
            <li>Sed commodo nibh ante bibendum</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Services Section -->
<div id="services" class="text-center">
  <div class="container">
    <div class="section-title center">
      <h2>Our Services</h2>
      <hr>
    </div>
    <div class="space"></div>
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <div class="service"> <i class="fa fa-desktop"></i>
          <h3>Web Design</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque etiam.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"> <i class="fa fa-cogs"></i>
          <h3>Web Development</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"> <i class="fa fa-tablet"></i>
          <h3>App Design</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque etiam.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"><i class="fa fa-html5"></i>
          <h3>PSD to HTML5</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque.</p>
        </div>
      </div>
    </div>
    <div class="space"></div>
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <div class="service"><i class="fa fa-wordpress"></i>
          <h3>WordPress</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque etiam.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"><i class="fa fa-bullhorn"></i>
          <h3>Marketing</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"><i class="fa fa-rocket"></i>
          <h3>Branding</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque etiam.</p>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="service"><i class="fa fa-leaf"></i>
          <h3>Print Design</h3>
          <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in tempus eleifend pellentesque natoque.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio Section -->
<div id="works">
  <div class="container"> <!-- Container -->
    <div class="section-title text-center center">
      <h2>Our Portfolio</h2>
      <hr>
      <div class="clearfix"></div>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
    </div>
    <div class="categories">
      <ul class="cat">
        <li>
          <ol class="type">
            <li><a href="#" data-filter="*" class="active">All</a></li>
            <li><a href="#" data-filter=".lorem">Web Design</a></li>
            <li><a href="#" data-filter=".consectetur">Web Development</a></li>
            <li><a href="#" data-filter=".dapibus">Branding</a></li>
          </ol>
        </li>
      </ul>
      <div class="clearfix"></div>
    </div>
    <div class="row">
      <div class="portfolio-items">
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 lorem">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/01.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Design</p>
              </div>
              <img src="img/portfolio/01.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 consectetur">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/02.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Development</p>
              </div>
              <img src="img/portfolio/02.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 lorem">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/03.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Design</p>
              </div>
              <img src="img/portfolio/03.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 lorem">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/04.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Design</p>
              </div>
              <img src="img/portfolio/04.jpg" class="../resources/img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 consectetur">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/05.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Development</p>
              </div>
              <img src="img/portfolio/05.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 dapibus">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/06.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Branding</p>
              </div>
              <img src="img/portfolio/06.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 dapibus consectetur">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/07.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Development, Branding</p>
              </div>
              <img src="img/portfolio/07.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 lorem">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="../resources/img/portfolio/08.jpg" title="Project description" rel="prettyPhoto">
              <div class="hover-text">
                <h4>Project Title</h4>
                <p>Web Design</p>
              </div>
              <img src="img/portfolio/08.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Team Section -->
<div id="team" class="text-center">
  <div class="container">
    <div class="section-title center">
      <h2>Meet the team</h2>
      <hr>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
    </div>
    <div id="row">
      <div class="col-xs-6 col-md-3 col-sm-6">
        <div class="thumbnail"> <img src="../resources/img/team/01.jpg" alt="..." class="img-thumbnail team-img">
          <div class="caption">
            <h3>John Doe</h3>
            <p>Founder / CEO</p>
          </div>
        </div>
      </div>
      <div class="col-xs-6 col-md-3 col-sm-6">
        <div class="thumbnail"> <img src="../resources/img/team/02.jpg" alt="..." class="img-thumbnail team-img">
          <div class="caption">
            <h3>Mike Doe</h3>
            <p>Web Designer</p>
          </div>
        </div>
      </div>
      <div class="col-xs-6 col-md-3 col-sm-6">
        <div class="thumbnail"> <img src="../resources/img/team/03.jpg" alt="..." class="img-thumbnail team-img">
          <div class="caption">
            <h3>Jane Doe</h3>
            <p>Creative Director</p>
          </div>
        </div>
      </div>
      <div class="col-xs-6 col-md-3 col-sm-6">
        <div class="thumbnail"> <img src="../resources/img/team/04.jpg" alt="..." class="img-thumbnail team-img">
          <div class="caption">
            <h3>Larry Show</h3>
            <p>Project Manager</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Testimonials Section -->
<div id="testimonials" class="text-center">
  <div class="container">
    <div class="section-title center">
      <h2>What our clients say</h2>
      <hr>
    </div>
    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div class="row testimonials">
          <div class="col-sm-4">
            <blockquote><i class="fa fa-quote-left"></i>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elitduis sed dapibus leo nec ornare.</p>
              <div class="clients-name">
                <p><strong>John Doe</strong><br>
                  <em>CEO, Company Inc.</em></p>
              </div>
            </blockquote>
          </div>
          <div class="col-sm-4">
            <blockquote><i class="fa fa-quote-left"></i>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elitduis sed dapibus leo nec ornare.</p>
              <div class="clients-name">
                <p><strong>Jane Doe</strong><br>
                  <em>CEO, Company Inc.</em></p>
              </div>
            </blockquote>
          </div>
          <div class="col-sm-4">
            <blockquote><i class="fa fa-quote-left"></i>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elitduis sed dapibus leo nec ornare.</p>
              <div class="clients-name">
                <p><strong>Chris Smith</strong><br>
                  <em>CEO, Company Inc.</em></p>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Contact Section -->
<div id="contact" class="text-center">
  <div class="container">
    <div class="section-title center">
      <h2>Contact us</h2>
      <hr>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
    </div>
    <div class="col-md-8 col-md-offset-2">
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-map-marker fa-2x"></i>
          <p>4321 California St,<br>
            San Francisco, CA 12345</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-envelope-o fa-2x"></i>
          <p>info@company.com</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-phone fa-2x"></i>
          <p> +1 123 456 1234<br>
            +1 321 456 1234</p>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="col-md-8 col-md-offset-2">
      <h3>Leave us a message</h3>
      <form name="sentMessage" id="contactForm" novalidate>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input type="text" id="name" class="form-control" placeholder="Name" required="required">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <input type="email" id="email" class="form-control" placeholder="Email" required="required">
              <p class="help-block text-danger"></p>
            </div>
          </div>
        </div>
        <div class="form-group">
          <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message" required></textarea>
          <p class="help-block text-danger"></p>
        </div>
        <div id="success"></div>
        <button type="submit" class="btn btn-default">Send Message</button>
      </form>
      <div class="social">
        <h3>Follow us</h3>
        <ul>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
          <li><a href="#"><i class="fa fa-github"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div id="footer">
  <div class="container">
    <p>Copyright &copy; Modus. Designed by <a href="http://www.templatewire.com" rel="nofollow">TemplateWire</a></p>
  </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script type="text/javascript" src="../resources/js/jquery.1.11.1.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script type="text/javascript" src="../resources/js/bootstrap.js"></script> 
<script type="text/javascript" src="../resources/js/SmoothScroll.js"></script> 
<script type="text/javascript" src="../resources/js/jquery.prettyPhoto.js"></script> 
<script type="text/javascript" src="../resources/js/jquery.isotope.js"></script> 
<script type="text/javascript" src="../resources/js/jquery.parallax.js"></script> 
<script type="text/javascript" src="../resources/js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="../resources/js/contact_me.js"></script> 

<!-- Javascripts
    ================================================== --> 
<script type="text/javascript" src="../resources/js/selfcheck2.js"></script>
</body>
<!-- <body>
	<h1>자기진단2</h1>

	<div id="head"> 머리 <br><br>

		<label for="headQ1"> 1) 현재 증상은   </label> <br><br>

			<input type="checkbox" name="headQ1" value="어지럽다"> 어지럽다 <br>
			<input type="checkbox" name="headQ1" value="머리가 아프다"> 머리가 아프다 <br>
			<input type="checkbox" name="headQ1" value="열이 나는 것 같다"> 열이 나는 것 같다 <br>
			<input type="checkbox" name="headQ1" value="기절을 했다"> 기절을 했다 <br>
			<input type="checkbox" name="headQ1" value="머리가 가렵다"> 머리가 가렵다 <br>
			<input type="checkbox" name="headQ1" value="피부에 문제가 있다"> 피부에 문제가 있다 <br>
			<input type="checkbox" name="headQ1" value="고열이 난다"> 고열이 난다 <br>
			<input type="checkbox" name="headQ1" value="미열이 난다"> 미열이 난다 <br>
			<input type="checkbox" name="headQ1" value="체온이 떨어졌다"> 체온이 떨어졌다 <br>
			<input type="checkbox" name="headQ1" value="몸살기운이 있다"> 몸살기운이 있다 <br>
			<input type="checkbox" name="headQ1" value="평소보다 땀이 많이 난다"> 평소보다 땀이 많이 난다 <br>
			<input type="checkbox" name="headQ1" value="해당 없음"> 해당 없음 <br><br><br>
			
			
		<label for="headQ2"> 2) 머리가 아픈 경우 어떻게 아픕니까?  </label> <br><br>
		
			<input type="checkbox" name="headQ2" value="머리가 조이는 듯 하다"> 머리가  조이는 듯 하게 아프다 <br>
			<input type="checkbox" name="headQ2" value="쪼개질 것 같다"> 쪼개질 것 처럼 아프다 <br>
			<input type="checkbox" name="headQ2" value="관자놀이 부근에 박동성이 느껴지는 두통이다"> 관자놀이 부근에 박동성이 느껴지는 두통이다 <br>
			<input type="checkbox" name="headQ2" value="특히 뒷통수 부위가 아프다"> 특히 뒷통수 부위가 아프다 <br>
			<input type="checkbox" name="headQ2" value="해당 없음"> 해당 없음 <br><br><br>	
			
			
		<label for="headQ3"> 3) 머리가 아픈 경우 어떻게 아픕니까?  </label> <br><br>
			<input type="checkbox" name="headQ3" value="24시간 이내에 회복했다"> 24시간 이내에 회복했다 <br>
			<input type="checkbox" name="headQ3" value="24시간 이상 증상이 있다"> 24시간 이상 증상이 있다 <br>
			<input type="checkbox" name="headQ3" value="기절하진 않았지만 자꾸 졸려왔다"> 기절하진 않았지만 자꾸 졸려왔다 <br>
			<input type="checkbox" name="headQ3" value="해당 없음"> 해당 없음 <br><br><br>
			

		<label for="headQ4"> 4) 다음에 해당되는 것은? </label> <br><br>
			<input type="checkbox" name="headQ4" value="사고(넘어짐, 부딪힘, 교통사고 등)가 있었다"> 사고(넘어짐, 부딪힘, 교통사고 등)가 있었다 <br>
			<input type="checkbox" name="headQ4" value="평소보다 어지럽다"> 평소보다 어지럽다 <br>
			<input type="checkbox" name="headQ4" value="해당 없음"> 해당 없음 <br><br><br>
			
			
		<label for="headQ5"> 5) 기타 </label> <br><br>
			<textarea rows="5" cols="100" name="headQ5"></textarea>
			
	</div> <br><br>

	<div id="neck"> 목 <br><br>
	
		<label for="neckQ1"> 1) 현재 증상은?  </label>	<br><br>

			<input type="checkbox" name="neckQ1" value="음식이나 침을 삼키기 곤란하다"> 음식이나 침을 삼키기 곤란하다 <br>
			<input type="checkbox" name="neckQ1" value="목이 부었다"> 목이 부었다 <br>
			<input type="checkbox" name="neckQ1" value="피를 토했다"> 피를 토했다 <br>
			<input type="checkbox" name="neckQ1" value="목이 아프다"> 목이 아프다 <br>
			<input type="checkbox" name="neckQ1" value="목에 덩어리가 만져진다"> 목에 덩어리가 만져진다 <br>
			<input type="checkbox" name="neckQ1" value="기침이 난다"> 기침이 난다 <br>
			<input type="checkbox" name="neckQ1" value="가래가 나온다"> 가래가 나온다 <br>
			<input type="checkbox" name="neckQ1" value="목(안)이 가렵다"> 목(안)이 가렵다 <br>
			<input type="checkbox" name="neckQ1" value="사춘기도 아닌데 목소리가 변했다"> 사춘기도 아닌데 목소리가 변했다 <br>
			<input type="checkbox" name="neckQ1" value="구갈(목막름)이 심하다"> 구갈(목마름)이 심하다 <br>
			<input type="checkbox" name="neckQ1" value="해당 없음"> 해당 없음 <br><br><br>
			
		<label for="neckQ2"> 2) 콧물이 나올 경우 어떤 증상입니까 </label><br><br>
		
			<input type="checkbox" name="neckQ2" value="맑은 콧물이 나온다"> 맑은 콧물이 나온다 <br>
			<input type="checkbox" name="neckQ2" value="누런 콧물이 나온다"> 누런 콧물이 나온다 <br>
			<input type="checkbox" name="neckQ2" value="찐득한 콧물이 나온다"> 찐득한 콧물이 나온다 <br>
			<input type="checkbox" name="neckQ2" value="해당 없음"> 해당 없음 <br><br><br>
			
		<label for="neckQ3"> 3) 호홉 곤란이 있다면 보기에서 해당되는 증상을 모두 선택하세요(중복 선택 가능) </label><br><br>
		
			<input type="checkbox" name="neckQ3" value="가슴이 답답하고 숨쉬기 힘들다"> 가슴이 답답하고 숨쉬기 힘들다 <br>
			<input type="checkbox" name="neckQ3" value="숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다"> 숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다. <br>
			<input type="checkbox" name="neckQ3" value="숨을 가쁘게 쉰다. 빠른 호홉을 한다"> 숨을 가쁘게 쉰다. 빠른 호홉을 한다 <br>
			<input type="checkbox" name="neckQ3" value="해당 없음"> 해당 없음 <br><br><br>

		<label for="neckQ4"> 4) 가래가 나온다면 보기에서 해당되는 증상을 모두 선택하세요.  </label><br><br>
		
			<input type="checkbox" name="neckQ4" value="일반적인 가래가 나온다"> 일반적인 가래가 나온다 <br>
			<input type="checkbox" name="neckQ4" value="끈적이는 가래가 나온다"> 끈적이는 가래가 나온다 <br>
			<input type="checkbox" name="neckQ4" value="누런색 가래가 나온다"> 누런색 가래가 나온다 <br>
			<input type="checkbox" name="neckQ4" value="피가 섞인 가래가 나온다"> 피가 섞인 가래가 나온다 <br>
			<input type="checkbox" name="neckQ4" value="해당 없음"> 해당 없음 <br><br><br>	

		<label for="neckQ5"> 5) 기타 </label> <br><br>
			<textarea rows="5" cols="100" name="neckQ5"></textarea>
	
	</div> <br><br>
	
	
	<div id="nose"> 코 <br><br>
	
		<label for="noseQ1"> 1) 현재 증상은?  </label>	<br><br>
	
			<input type="checkbox" name="noseQ1" value="콧물이 난다"> 콧물이 난다 <br>
			<input type="checkbox" name="noseQ1" value="콧물이 목뒤로 넘어간다"> 콧물이 목뒤로 넘어간다 <br>
			<input type="checkbox" name="noseQ1" value="코가 막힌다"> 코가 막힌다 <br>
			<input type="checkbox" name="noseQ1" value="재채기가 난다"> 재채기가 난다 <br>
			<input type="checkbox" name="noseQ1" value="코, 목이 간지럽다"> 코, 목이 간지럽다 <br>
			<input type="checkbox" name="noseQ1" value="코가 아프다"> 코가 아프다 <br>
			<input type="checkbox" name="noseQ1" value="어지럽다"> 어지럽다 <br>
			<input type="checkbox" name="noseQ1" value="몸살기운이 있다"> 몸살기운이 있다 <br>
			<input type="checkbox" name="noseQ1" value="미열이 난다"> 미열이 난다 <br>
			<input type="checkbox" name="noseQ1" value="해당 없음"> 해당 없음 <br><br><br>
			
		<label for="noseQ2"> 2) 콧물이 난다면 보기에서 해당되는 증상을 모두 선택하세요.  </label> <br><br>	
		
			<input type="checkbox" name="noseQ2" value="맑은 콧물이 나온다"> 맑은 콧물이 나온다 <br>
			<input type="checkbox" name="noseQ2" value="누런 콧물이 나온다"> 누런 콧물이 나온다 <br>
			<input type="checkbox" name="noseQ2" value="찐득한 콧물이 나온다"> 찐득한 콧물이 나온다 <br>
			<input type="checkbox" name="noseQ2" value="해당 없음"> 해당 없음 <br><br><br>

		<label for="noseQ3"> 3) 호홉곤란이 있다면 보기에서 해당되는 증상을 모두 선택하세요. </label> <br><br>

			<input type="checkbox" name="noseQ3" value="가슴이 답답하고 숨쉬기 힘들다"> 가슴이 답답하고 숨쉬기 힘들다 <br>
			<input type="checkbox" name="noseQ3" value="숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다"> 숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다. <br>
			<input type="checkbox" name="noseQ3" value="숨을 가쁘게 쉰다. 빠른 호홉을 한다"> 숨을 가쁘게 쉰다. 빠른 호홉을 한다 <br>
			<input type="checkbox" name="noseQ3" value="해당 없음"> 해당 없음 <br><br><br>

		<label for="noseQ4"> 4) 기침을 한다면 보기에서 해당되는 증상을 모두 선택하세요 </label> <br><br>
		
			<input type="checkbox" name="noseQ4" value="'콜록~콜록' 일반적인 기침을 한다"> '콜록~콜록' 일반적인 기침을 한다 <br>
			<input type="checkbox" name="noseQ4" value="'컹!컹!' 개짖는 소리 같은 기침을 한다"> '컹!컹!' 개짖는 소리 같은 기침을 한다 <br>
			<input type="checkbox" name="noseQ4" value="'켁, 켁' 마른 기침을 한다"> '켁, 켁' 마른 기침을 한다 <br>
			<input type="checkbox" name="noseQ4" value="기침을 잦게 자주한다"> 기침을 잦게 자주한다 <br>
			<input type="checkbox" name="noseQ4" value="밤에 기침이 심해진다"> 밤에 기침이 심해진다 <br>
			<input type="checkbox" name="noseQ4" value="숨이 넘어갈 듯이 기침을 한다"> 숨이 넘어갈 듯이 기침을 한다 <br>
			<input type="checkbox" name="noseQ4" value="해당 없음"> 해당 없음 <br><br><br> 
			
		<label for="noseQ5"> 5) 가래가 나온다면 보기에서 해당되는 증상을 모두 선택하세요.  </label><br><br>
		
			<input type="checkbox" name="noseQ5" value="일반적인 가래가 나온다"> 일반적인 가래가 나온다 <br>
			<input type="checkbox" name="noseQ5" value="끈적이는 가래가 나온다"> 끈적이는 가래가 나온다 <br>
			<input type="checkbox" name="noseQ5" value="누런색 가래가 나온다"> 누런색 가래가 나온다 <br>
			<input type="checkbox" name="noseQ5" value="피가 섞인 가래가 나온다"> 피가 섞인 가래가 나온다 <br>
			<input type="checkbox" name="noseQ5" value="해당 없음"> 해당 없음 <br><br><br>	
			
			
		<label for="noseQ6"> 6) 다음에 해당하는 것은  </label><br><br>

			<input type="checkbox" name="noseQ6" value="평소와 다르게 입냄새가 난다"> 평소와 다르게 입냄새가 난다 <br>
			<input type="checkbox" name="noseQ6" value="식욕이 저하됐다"> 식욕이 저하됐다 <br>
			<input type="checkbox" name="noseQ6" value="속이 미식거린다"> 속이 미식거린다 <br>
			<input type="checkbox" name="noseQ6" value="목안에 뭐가 있는 것 같은 이물감이 느껴진다"> 목안에 뭐가 있는 것같은 이물감이 느껴진다 <br>
			<input type="checkbox" name="noseQ6" value="에어컨에 장시간 노출됐다"> 에어컨에 장시간 노출됐다 <br>
			<input type="checkbox" name="noseQ6" value="코 옆 양 볼 부분을 눌렀을 때 아프다"> 코 옆 양 볼 부분을 눌렀을 때 아프다 <br>	
			<input type="checkbox" name="noseQ6" value="해당 없음"> 해당 없음 <br><br><br>			
			
		<label for="noseQ7"> 7) 기타 </label> <br><br>
			<textarea rows="5" cols="100" name="noseQ7"></textarea>	
			
	</div>	
	
	<div id="mouth"> 입 <br><br>
	
		<label for="mouthQ1"> 1) 현재 증상은?  </label>	<br><br>
		
			<input type="checkbox" name="mouthQ1" value="침을 흘린다"> 침을 흘린다 <br>
			<input type="checkbox" name="mouthQ1" value="피를 토했다"> 피를 토했다 <br>
			<input type="checkbox" name="mouthQ1" value="치아나 잇몸이 간지럽거나 아프지 않는데 입냄새가 난다"> 치아나 잇몸이 간지럽거나 아프지 않는데 입냄새가 난다 <br>
			<input type="checkbox" name="mouthQ1" value="입술에 물집이 잡혔다"> 입술에 물집이 잡혔다 <br>
			<input type="checkbox" name="mouthQ1" value="입안이나 혀가 헐었다"> 입안이나 혀가 헐었다 <br>
			<input type="checkbox" name="mouthQ1" value="입을 벌리기가 힘들다"> 입을 벌리기가 힘들다 <br>
			<input type="checkbox" name="mouthQ1" value="음식물을 씹을 때 아프다"> 음식물을 씹을 때 아프다 <br>	
			<input type="checkbox" name="mouthQ1" value="잇몸이 아프다"> 잇몸이 아프다 <br>
			<input type="checkbox" name="mouthQ1" value="어금니가 아프다"> 어금니가 아프다 <br>
			<input type="checkbox" name="mouthQ1" value="이가 시리다"> 이가 시리다 <br>
			<input type="checkbox" name="mouthQ1" value="해당 없음"> 해당 없음 <br><br><br>	
			
		<label for="mouthQ2"> 2) 기타 </label> <br><br>
			<textarea rows="5" cols="100" name="mouthQ2"></textarea>		
		
	</div> <br><br>
	
	<div id="ear"> 귀 <br><br>
	
		<label for="earQ1"> 1) 현재 증상은?  </label> <br><br>
		
			<input type="checkbox" name="earQ1" value="귀가 아프다"> 귀가 아프다 <br>
			<input type="checkbox" name="earQ1" value="귀에서 분비물(고름)이 나온다"> 귀에서 분비물(고름)이 나온다 <br>
			<input type="checkbox" name="earQ1" value="귀가 가렵다"> 귀가 가렵다 <br>
			<input type="checkbox" name="earQ1" value="소리가 잘 안 들린다"> 소리가 잘 안 들린다 <br>
			<input type="checkbox" name="earQ1" value="귀에서 잡음이 들리다"> 귀에서 잡음이 들리다 <br>
			<input type="checkbox" name="earQ1" value="남들이 듣지 못하는 사람 목소리가 아닌 소음이 들린다"> 남들이 듣지 못하는 사람 목소리가 아닌 소음이 들린다 <br>
			<input type="checkbox" name="earQ1" value="피부에 문제가 있다"> 피부에 문제가 있다 <br>
			<input type="checkbox" name="earQ1" value="해당 없음"> 해당 없음 <br><br><br>	
			
		<label for="earQ2"> 2) 기타 </label> <br><br>
			<textarea rows="5" cols="100" name="earQ2"></textarea>		
			
	</div> <br><br>
	
</body>
 -->
 </html>