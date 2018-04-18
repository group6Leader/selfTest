<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/selfCheck.css"></c:url>">
<title>selfCheck/selfCheck2</title>
</head>
<body>



<header>
  <h1>Pure <strong>CSS</strong> Steps</h1>
  <p>... a sassy "Step By Step" process.</p>
</header>
<section>
  <article>
    <form class="pure-steps">
      <input type="radio" name="steps" class="pure-steps_radio" id="step-0" checked="">
      <input type="radio" name="steps" class="pure-steps_radio" id="step-1">
      <input type="radio" name="steps" class="pure-steps_radio" id="step-2">
      <div class="pure-steps_group">
        <ol>
          <li class="pure-steps_group-step">
            <header>
              <h2 class="pure-steps_group-step_legend">Welcome</h2>
              <p class="pure-steps_group-step_item">The <strong>"Step By Step"</strong> pattern is usually 100% developed with JavaScript but you can use CSS too.</p>
              <p class="pure-steps_group-step_item">Enjoy this example of "what can be done" <strong>just with SASS,</strong> simulating a "sign-up" process.</p>
              <p class="pure-steps_group-step_item"></p>
            </header>
          </li>
          <li class="pure-steps_group-step">
            <fieldset>
              <legend class="pure-steps_group-step_legend">Sign Up</legend>
              <p class="pure-steps_group-step_item flexy-item flexy-column reverse">
                <input type="text" placeholder="Type your email here" value="" id="input_email">
                <label for="input_email">Email</label>
              </p>
              <p class="pure-steps_group-step_item flexy-item flexy-column reverse">
                <input type="text" placeholder="Type your nick here" value="" id="input_nick">
                <label for="input_nick">Nick</label>
              </p>
              <p class="pure-steps_group-step_item flexy-item flexy-column reverse">
                <input type="password" placeholder="Type your password here" value="" id="input_password">
                <label for="input_password">Password</label>
              </p>
            </fieldset>
          </li>
          <li class="pure-steps_group-step flexy-item">
            <div class="pure-steps_preload">
              <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
                <path d="M31.8,3.6c-0.2-0.5-0.4-0.9-0.9-1.2C30.4,2,29.7,1.8,29,1.9c-0.6,0.1-1.2,0.4-1.6,1l-8.5,11.2l0,0l-7.2,9.5l-7.1-9.4 c-0.5-0.7-1.3-1-2.1-1c-0.5,0-1,0.2-1.4,0.5c-0.5,0.4-0.9,1-1,1.7s0.1,1.2,0.5,1.8l9.1,12.1l0,0c0.1,0.2,0.3,0.3,0.4,0.4 c0.4,0.3,0.9,0.5,1.4,0.5c0.8,0,1.6-0.3,2.1-1L22.1,18l0,0l9.1-12.1C32,5.2,32.1,4.4,31.8,3.6z"></path>
              </svg>
            </div>
          </li>
        </ol>
        <ol class="pure-steps_group-triggers">
          <li class="pure-steps_group-triggers_item">
            <label for="step-0">Restart</label>
          </li>
          <li class="pure-steps_group-triggers_item">
            <label for="step-1">Sign Up</label>
          </li>
          <li class="pure-steps_group-triggers_item">
            <label for="step-2">Jump in</label>
          </li>
        </ol>
      </div>
      <br>
      <label for="step-0">Restart</label>
    </form>
  </article>
</section>

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
</html>