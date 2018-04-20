<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css"
		href="<c:url value="/resources/css/selfCheck.css"></c:url>">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.menu-trigger').trigger('click');
			$('.menu-trigger').on('click', function() {
				return $('#circle-menu').toggleClass('open');
			});
		});
	</script>
	
	<title>selfCheck/selfCheck2</title>
</head>
<body>

<header>
	<h1>Detail SelfCheck</h1>
	<h3>
		By <a href="" target="_blank">Char Hospital</a>
	</h3>
</header>

<!-- 자가진단 6개  -->
<div class="ct" id="t1">
  <div class="ct" id="t2">
    <div class="ct" id="t3">
      <div class="ct" id="t4">
        <div class="ct" id="t5">
          <div class="ct" id="t6">
          	
			<!-- 맨 첫 화면 문구창  -->
          	<div class="page" id="p1">
          		<span id="title">아픈 부위를 선택하시고 부위에 따른 증상을 체크해주세요.</span>  
          	</div>

	<!-- 머리 -->
    <form action="goSelfCheck2" method="post">
         
		<div class="page" id="p2">
     		<section class="content head">
     			<input type="hidden" value="head" name="pain">
     			
     			<h1>1. 현재 증상은 어떠십니까 ? </h1>
		     	<ul class="list">
		     		
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="어지럽다" class="checkbox">어지럽다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="머리가 아프다" class="checkbox">머리가 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="열이 나는 것 같다" class="checkbox">열이 나는 것 같다 </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="기절을 했다" class="checkbox">기절을 했다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="머리가 가렵다" class="checkbox">머리가 가렵다</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="피부에 문제가 있다" class="checkbox">피부에 문제가 있다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom"value="고열이 난다" class="checkbox">고열이 난다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="미열이 난다" class="checkbox">미열이 난다 </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="체온이 떨어졌다" class="checkbox">체온이 떨어졌다 		</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="몸살기운이 있다" class="checkbox">몸살기운이 있다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="평소보다 땀이 많이 난다" class="checkbox">평소보다 땀이 많이 난다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox">	해당 없음</label>
					</li>
					
		      	</ul>
      		</section>
			
			<section class="content head">
      			<h1>2.  머리가 아픈 경우 어떻게 아픕니까?</h1>
     			<ul class="list">
     				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="머리가 조이는 듯 하다" class="checkbox"> 머리가 조이는 듯 하게 아프다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="쪼개질 것 같다" class="checkbox"> 쪼개질 것 처럼 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="관자놀이 부근에 박동성이 느껴지는 두통이다" class="checkbox"> 관자놀이 부근에 박동성이 느껴지는 두통이다</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="특히 뒷통수 부위가 아프다" class="checkbox"> 특히 뒷통수 부위가 아프다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label> 
					</li>
					
      			</ul>
     	 	</section>

			<section class="content head">
      			<h1>3. 머리가 아픈 경우 어떻게 아픕니까?</h1>
     			<ul class="list">
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="24시간 이내에 회복했다" class="checkbox">24시간 이내에 회복했다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="24시간 이상 증상이 있다" class="checkbox"> 24시간 이상 증상이 있다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="기절하진 않았지만 자꾸 졸려왔다" class="checkbox"> 기절하진 않았지만 자꾸 졸려왔다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox">해당 없음</label> 
					</li>
      			
      			</ul>
      		</section>
      		
     		<section class="content head">
      			<h1>4. 다음에 해당되는 것은?</h1>
      			
   	 			<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="사고(넘어짐, 부딪힘, 교통사고 등)가 있었다" class="checkbox">사고(넘어짐, 부딪힘, 교통사고 등)가 있었다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="평소보다 어지럽다" class="checkbox">평소보다 어지럽다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
    			</ul>
    			
      		</section>
			
			<section class="content head">
				<h1>5. 기타</h1>
					<textarea name="symptom" placeholder="체크항목에 없는 증상에 대해 적어주세요."></textarea>
			</section>

		<input type="submit" value="제출하기" class="button button-inline button-large">
		<!-- <button class="button button-inline button-large">제출하기</button> -->
		</div>
	
	</form>	
 
 
	<!-- 목  -->
	<form action="goSelfCheck2" method="post">
	
		<div class="page" id="p3">
    		<section class="content neck">
        		<input type="hidden" value="neck" name="pain">
       		 	<h1>1. 현재 증상은 어떠십니까 ? </h1>
       			
       			<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="음식이나 침을 삼키기 곤란하다" class="checkbox"> 음식이나 침을 삼키기 곤란하다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="목이 부었다" class="checkbox"> 목이 부었다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="피를 토했다" class="checkbox"> 피를 토했다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="목이 아프다" class="checkbox"> 목이 아프다</label>
					</li>
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="목에 덩어리가 만져진다" class="checkbox">목에 덩어리가 만져진다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="기침이 난다" class="checkbox"> 기침이 난다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="가래가 나온다" class="checkbox"> 가래가 나온다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="목(안)이 가렵다" class="checkbox"> 목(안)이 가렵다</label>
					</li>
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="사춘기도 아닌데 목소리가 변했다" class="checkbox">사춘기도 아닌데 목소리가 변했다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="구갈(목막름)이 심하다" class="checkbox"> 구갈(목마름)이 심하다 </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
        		</ul>
        	</section>
 	 		
 	 		<section class="content neck">
      	 	
      	 		<h1>2.콧물이 나올 경우 어떤 증상 입니까?</h1>
       			<ul class="list">
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="맑은 콧물이 나온다" class="checkbox"> 맑은 콧물이 나온다</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="누런 콧물이 나온다" class="checkbox"> 누런 콧물이 나온다</label>
				</li>
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="찐득한 콧물이 나온다" class="checkbox"> 찐득한 콧물이 나온다</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label> 
				</li>
        		</ul>
        	</section>
	
			<section class="content neck">
        		<h1>3. 호홉 곤란이 있다면 보기에서 해당되는 증상을 모두 선택하세요(중복 선택 가능)</h1>
       	 		<ul class="list">
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="가슴이 답답하고 숨쉬기 힘들다" class="checkbox"> 가슴이 답답하고 숨쉬기 힘들다</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다" class="checkbox">숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다.</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="숨을 가쁘게 쉰다. 빠른 호홉을 한다" class="checkbox"> 숨을 가쁘게 쉰다. 빠른 호홉을 한다</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox">해당 없음</label> 
				</li>
        		</ul>
			</section>
			
			<section class="content neck">
       		
       		<h1>4. 가래가 나온다면 보기에서 해당되는 증상을 모두 선택하세요.</h1>
       	 	<ul class="list">
			
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="일반적인 가래가 나온다" class="checkbox"> 일반적인 가래가 나온다</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="끈적이는 가래가 나온다" class="checkbox"> 끈적이는 가래가 나온다</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="누런색 가래가 나온다" class="checkbox"> 누런색 가래가 나온다</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="피가 섞인 가래가 나온다" class="checkbox"> 피가 섞인 가래가 나온다</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
				</li>
        	</ul>
        	
        	</section>
			
			<section class="content neck">
			<h1>5. 기타</h1>
				<textarea name="symptom" placeholder="체크항목에 없는 증상에 대해 적어주세요."></textarea>
			</section>
		
		<input type="submit" value="제출하기" class="button button-inline button-large">	
		<!-- <button class="button button-inline button-large">제출하기</button> -->

		</div>

	</form>

	<!-- 코 -->
	<form action="goSelfCheck2" method="post">
		<div class="page" id="p4">
          	<section class="content nose">
          		<input type="hidden" value="nose" name="pain">
          		<h1>1. 현재 증상은 어떠십니까 ? </h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="콧물이 난다" class="checkbox">콧물이 난다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="콧물이 목뒤로 넘어간다" class="checkbox"> 콧물이 목뒤로 넘어간다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="코가 막힌다" class="checkbox"> 코가 막힌다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="재채기가 난다" class="checkbox"> 재채기가 난다</label>
					</li>
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="코, 목이 간지럽다" class="checkbox">코, 목이 간지럽다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="코가 아프다" class="checkbox"> 코가 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="어지럽다" class="checkbox"> 어지럽다</label>
					</li>
					<li class="list__item">	
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="몸살기운이 있다" class="checkbox"> 몸살기운이 있다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="미열이 난다" class="checkbox"> 미열이 난다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
        		</ul>
          	</section>
		  	
		  	<section class="content nose">
          		<h1>2.콧물이 나올 경우 어떤 증상 입니까?</h1>
       	 		
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="맑은 콧물이 나온다" class="checkbox"> 맑은 콧물이 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="누런 콧물이 나온다" class="checkbox"> 누런 콧물이 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="찐득한 콧물이 나온다" class="checkbox"> 찐득한 콧물이 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox">해당 없음</label> 
					</li>
        		</ul>
          	</section>
			
			<section class="content nose">
          		<h1>3. 호홉 곤란이 있다면 보기에서 해당되는 증상을 모두 선택하세요</h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="가슴이 답답하고 숨쉬기 힘들다" class="checkbox"> 가슴이 답답하고 숨쉬기 힘들다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다" class="checkbox">숨을 내쉴 때 '쌔~액, 쌔~액' 소리가 난다.</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="숨을 가쁘게 쉰다. 빠른 호홉을 한다" class="checkbox">숨을 가쁘게 쉰다. 빠른 호홉을 한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox">해당 없음</label> 
					</li>
        		</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>4. 기침을 한다면 보기에서 해당되는 증상을 모두 선택하세요</h1>
       	 		
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="'콜록~콜록' 일반적인 기침을 한다" class="checkbox">'콜록~콜록' 일반적인 기침을 한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="'컹!컹!' 개짖는 소리 같은 기침을 한다" class="checkbox"> '컹!컹!' 개짖는 소리 같은 기침을 한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="'켁, 켁' 마른 기침을 한다" class="checkbox">	'켁, 켁' 마른 기침을 한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="기침을 잦게 자주한다" class="checkbox"> 기침을 잦게 자주한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="밤에 기침이 심해진다" class="checkbox"> 밤에 기침이	심해진다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="숨이 넘어갈 듯이 기침을 한다" class="checkbox"> 숨이 넘어갈 듯이 기침을 한다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>				
					</li>	
	        	</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>5. 가래가 나온다면 보기에서 해당되는 증상을 모두 선택하세요.</h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="일반적인 가래가 나온다" class="checkbox"> 일반적인 가래가 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="끈적이는 가래가 나온다" class="checkbox"> 끈적이는 가래가 나온다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="누런색 가래가 나온다" class="checkbox"> 누런색 가래가 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="피가 섞인 가래가 나온다" class="checkbox"> 피가 섞인 가래가 나온다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
        		</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>6. 다음에 해당하는 것은</h1>
       	 	
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="평소와 다르게 입냄새가 난다" class="checkbox">평소와 다르게 입냄새가 난다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="식욕이 저하됐다" class="checkbox"> 식욕이 저하됐다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="속이 미식거린다" class="checkbox"> 속이 미식거린다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="목안에 뭐가 있는 것 같은 이물감이 느껴진다" class="checkbox">목안에 뭐가 있는 것같은 이물감이 느껴진다</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="에어컨에 장시간 노출됐다" class="checkbox"> 에어컨에 장시간 노출됐다</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="코 옆 양 볼 부분을 눌렀을 때 아프다" class="checkbox">코 옆 양 볼 부분을 눌렀을 때 아프다</label> 						<label class="label--checkbox"><input type="checkbox" name="symptom" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
	        	</ul>
        	</section>
        	
			<section class="content neck">
				<h1>7. 기타</h1>
					<textarea name="symptom" placeholder="체크항목에 없는 증상에 대해 적어주세요."></textarea>
			</section>
			
			<input type="submit" value="제출하기" class="button button-inline button-large">
			<!-- <button class="button button-inline button-large">제출하기</button> -->	   
			
		</div> 
	</form>

	<!-- 입 -->
	<form action="goSelfCheck2" method="post">		
        <div class="page" id="p5">
          	<section class="content mouth">
          		<h1>1. 현재 증상은 어떠십니까 ? </h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="침을 흘린다" class="checkbox">침을 흘린다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="피를 토했다" class="checkbox">피를 토했다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="치아나 잇몸이 간지럽거나 아프지 않는데 입냄새가 난다" class="checkbox">치아나 잇몸이 간지럽거나 아프지 않는데 입냄새가 난다</label>
					</li>
			
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="입술에 물집이 잡혔다" class="checkbox">입술에 물집이 잡혔다</label> 
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="입안이나 혀가 헐었다" class="checkbox">입안이나 혀가 헐었다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="입을 벌리기가 힘들다" class="checkbox">입을 벌리기가 힘들다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="음식물을 씹을 때 아프다" class="checkbox">음식물을 씹을 때 아프다</label>
					</li>
			
					<li class="list__item">						
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="잇몸이 아프다" class="checkbox">잇몸이 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="어금니가 아프다" class="checkbox">어금니가 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="이가 시리다" class="checkbox">이가 시리다</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="해당 없음" class="checkbox">해당 없음</label>
					</li>
        		</ul>
          	</section>
		  	
		  	<section class="content mouth">
				<h1>2. 기타</h1>
					<textarea name="mouthQ2" placeholder="체크항목에 없는 증상에 대해 적어주세요."></textarea>
			</section>
			
			<input type="submit" value="제출하기" class="button button-inline button-large">
			<!-- <button class="button button-inline button-large">제출하기</button> -->
			
		</div>
	</form> 
 		
 		
	<!-- 귀 -->
 	<form action="goSelfCheck2" method="post">
 		<div class="page" id="p6">
          	<section class="content ear">
          		<h1>1. 현재 증상은 어떠십니까 ? </h1>
       	 		<ul class="list">
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="귀가 아프다" class="checkbox">귀가 아프다</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="귀에서 분비물(고름)이 나온다" class="checkbox">귀에서 분비물(고름)이 나온다</label> 
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="귀가 가렵다" class="checkbox">귀가 가렵다</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="소리가 잘 안 들린다" class="checkbox">소리가 잘 안 들린다</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="귀에서 잡음이 들리다" class="checkbox"> 귀에서 잡음이 들리다</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="남들이 듣지 못하는 사람 목소리가 아닌 소음이 들린다" class="checkbox">남들이 듣지 못하는 사람 목소리가 아닌 소음이 들린다</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="피부에 문제가 있다" class="checkbox"> 피부에 문제가 있다</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="해당 없음" class="checkbox"> 해당 없음</label>
					</li>
        		</ul>
          	</section>
		 	
		 	<section class="content ear">
				<h1>2. 기타</h1>
					<textarea name="earQ2" placeholder="체크항목에 없는 증상에 대해 적어주세요."></textarea>
			</section>
			
			<input type="submit" value="제출하기" class="button button-inline button-large">
			<!-- <button class="button button-inline button-large">제출하기</button> -->
		
		</div>
	</form>

       </div>  
      </div>
     </div>
    </div>
   </div>
  </div>

	<div id="stage">
		<div id="circle-menu">
			<a class="menu-trigger" href="#" data-open="OPEN" data-close="CLOSE"></a>
			<section>
				<ul>
					<li><a href="#t2" id="first">머리</a></li>
					<li><a href="#t3">목</a></li>
					<li><a href="#t4">코</a></li>
					<li><a href="#t5">입</a></li>
					<li><a href="#t6">귀</a></li>
				</ul>
			</section>
		</div>
	</div>

	<br>
	<br>

</body>
</html>