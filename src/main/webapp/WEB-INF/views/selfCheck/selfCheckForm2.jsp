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
		By <a href="/www" target="_blank">Char Hospital</a>
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
          		<span id="title">痛い部位を選んだ後、部位による症状をチェックしてください。</span> <br><br>
          		<button class="button button-inline button-large" onclick="location.href='../'">終了</button>
          	</div>

	<!-- 머리 -->
    <form action="goSelfCheck2" method="post">
         
		<div class="page" id="p2">
     		<section class="content head">
     			<input type="hidden" value="head" name="pain">
     			
     			<h1>1. 今の症状はどうですか ? </h1>
		     	<ul class="list">
		     		
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="目くらむ" class="checkbox">目くらむ</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="頭が痛い" class="checkbox">頭が痛い</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="熱があるそう" class="checkbox">熱があるそう </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="気を失った" class="checkbox">気を失った</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="頭が痒い" class="checkbox">頭が痒い</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="皮膚にトラブルがある" class="checkbox">皮膚にトラブルがある</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom"value="高熱がする" class="checkbox">高熱がする</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="微熱がする" class="checkbox">微熱がする </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="体温が落ちた" class="checkbox">体温が落ちた</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="風気味がある" class="checkbox">風気味がある</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普段より汗が出る" class="checkbox">普段より汗が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox">無し</label>
					</li>
					
		      	</ul>
      		</section>
			
			<section class="content head">
      			<h1>2.  頭が痛い場合いどんな風に痛いですか?</h1>
     			<ul class="list">
     				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="頭がつつかれるように痛い" class="checkbox"> 頭がつつかれるように痛い</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="痛みがひどい" class="checkbox"> 痛みがひどい</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="こめかみから感じられる痛み" class="checkbox"> こめかみから感じられる痛み</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="特に後頭部が痛い" class="checkbox"> 特に後頭部が痛い</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label> 
					</li>
					
      			</ul>
     	 	</section>

			<section class="content head">
      			<h1>3. 頭が痛い場合どんな症状がありますか?</h1>
     			<ul class="list">
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="24以内に回復した" class="checkbox">24以内に回復した</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="24時間以上症状が続く" class="checkbox"> 24時間以上症状が続く</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="気を失ってはないが、眠くなる" class="checkbox"> 気を失ってはないが、眠くなる</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox">無し</label> 
					</li>
      			
      			</ul>
      		</section>
      		
     		<section class="content head">
      			<h1>4. 次の内容をチェックしてください。</h1>
      			
   	 			<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="事故(転倒、 衝突、 交通事故 等)があった" class="checkbox">事故(転倒、 衝突、 交通事故 等)があった</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普段よりめくらむ" class="checkbox">普段よりめくらむ</label>						
						<label class="label--checkbox"><input type="checkbox" name="symptom" value=" 無し" class="checkbox"> 無し</label>
					</li>
    			</ul>
    			
      		</section>
			
			<section class="content head">
				<h1>5. その他</h1>
					<textarea name="symptom" placeholder="チェックの項目にない症状を書いてください。"></textarea>
			</section>

		<input type="submit" value="提出" class="button button-inline button-large">
		<!-- <button class="button button-inline button-large">제출하기</button> -->
		</div>
	
	</form>	
 
 
	<!-- 목  -->
	<form action="goSelfCheck2" method="post">
	
		<div class="page" id="p3">
    		<section class="content neck">
        		<input type="hidden" value="neck" name="pain">
       		 	<h1>1. 今の症状はどうですか ? </h1>
       			
       			<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="食べ物や唾を飲み込むのが難しい" class="checkbox"> 食べ物や唾を飲み込むのが難しい</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉が腫れた" class="checkbox"> 喉が腫れた</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="血を吐いた" class="checkbox"> 血を吐いた</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉が痛い" class="checkbox"> 喉が痛い</label>
					</li>
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉に塊がある" class="checkbox">喉に塊がある</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="咳が出る" class="checkbox"> 咳が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="痰が出る" class="checkbox"> 痰が出る</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉がかゆい" class="checkbox"> 喉がかゆい</label>
					</li>
				
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="声が変わった" class="checkbox">声が変わった</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉が渇く" class="checkbox"> 喉が渇く </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label>
					</li>
        		</ul>
        	</section>
 	 		
 	 		<section class="content neck">
      	 	
      	 		<h1>2.鼻水が出る場合、どんな症状ですか?</h1>
       			<ul class="list">
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="澄んだ鼻水が出る" class="checkbox"> 澄んだ鼻水が出る</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="黄色い鼻水が出る" class="checkbox"> 黄色い鼻水が出る</label>
				</li>
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="べたべたした鼻水が出る" class="checkbox"> べたべたした鼻水が出る</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="無い" class="checkbox"> 無い</label> 
				</li>
        		</ul>
        	</section>
	
			<section class="content neck">
        		<h1>3. 呼吸困難がある場合、全ての症状を選んでください。(重複選択可能)</h1>
       	 		<ul class="list">
				
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="胸苦しいし息することが難しい" class="checkbox"> 胸苦しいし息することが難しい </label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="息をする時音がする" class="checkbox">息をする時音がする</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="呼吸のテンポが速くなる" class="checkbox"> 呼吸のテンポが速くなる</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox">無し</label> 
				</li>
        		</ul>
			</section>
			
			<section class="content neck">
       		
       		<h1>4. 痰が出る場合、全ての症状を選んでください。</h1>
       	 	<ul class="list">
			
				<li class="list__item">
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="普通の痰が出る" class="checkbox"> 普通の痰が出る</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="べたべたした痰が出る" class="checkbox"> べたべたした痰が出る</label> 
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="黄色い痰が出る" class="checkbox"> 黄色い痰が出る</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="血が混じた痰が出る" class="checkbox"> 血が混じた痰が出る</label>
					<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label>
				</li>
        	</ul>
        	
        	</section>
			
			<section class="content neck">
			<h1>5. その他</h1>
				<textarea name="symptom" placeholder="チェックの項目にない症状を書いてください。"></textarea>
			</section>
		
		<input type="submit" value="提出" class="button button-inline button-large">	
		<!-- <button class="button button-inline button-large">제출하기</button> -->

		</div>

	</form>

	<!-- 코 -->
	<form action="goSelfCheck2" method="post">
		<div class="page" id="p4">
          	<section class="content nose">
          		<input type="hidden" value="nose" name="pain">
          		<h1>1. 今の症状はどうですか ? </h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="鼻水が出る" class="checkbox">鼻水が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="鼻水が喉まで行く" class="checkbox"> 鼻水が喉まで行く</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="鼻が詰まる" class="checkbox"> 鼻が詰まる</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="くしゃみが出る" class="checkbox"> くしゃみが出る</label>
					</li>
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="鼻や喉がかゆい" class="checkbox">鼻や喉がかゆい</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="鼻が痛い" class="checkbox"> 鼻が痛い</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="目が回る" class="checkbox"> 目が回る</label>
					</li>
					<li class="list__item">	
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="風邪気味がある" class="checkbox"> 風邪気味がある</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="微熱が続く" class="checkbox"> 微熱が続く</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label>
					</li>
        		</ul>
          	</section>
		  	
		  	<section class="content nose">
          		<h1>2.鼻水が出る場合の症状はどうですか?</h1>
       	 		
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普通の鼻水が出る" class="checkbox"> 普通の鼻水が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="黄色い鼻水が出る" class="checkbox"> 黄色い鼻水が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="べたべたした鼻水が出る" class="checkbox"> べたべたした鼻水が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox">無し</label> 
					</li>
        		</ul>
          	</section>
			
			<section class="content nose">
          		<h1>3. 呼吸困難がある場合、全ての症状を選んでください。</h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="胸苦しいし息をすることが難しい" class="checkbox"> 胸苦しいし息をすることが難しい </label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="息をする時音がする" class="checkbox">息をする時音がする</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="呼吸のテンポが速くなる" class="checkbox">呼吸のテンポが速くなる</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox">無し</label> 
					</li>
        		</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>4. 咳が出る場合、全ての症状を選んでください。</h1>
       	 		
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普通の咳が出る" class="checkbox">普通の咳が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="ワンワンと犬のような咳が出る" class="checkbox"> ワンワンと犬のような咳が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="空咳が出る" class="checkbox">空咳が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="咳が長く続く" class="checkbox">咳が長く続く</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="夜に咳がひどくなる" class="checkbox"> 夜に咳がひどくなる</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="息が止まるような咳が出る" class="checkbox"> 息が止まるような咳が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label>				
					</li>	
	        	</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>5. 痰が出る場合、全ての症状を選んでください。</h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普通の痰が出る" class="checkbox">  普通の痰が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="べたべたした痰が出る" class="checkbox"> べたべたした痰が出る</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="黄色い痰が出る" class="checkbox"> 黄色い痰が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="血が混じった痰が出る" class="checkbox"> 血が混じった痰が出る</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value=" 無し" class="checkbox"> 無し</label>
					</li>
        		</ul>
          	</section>
          	
          	<section class="content nose">
          		<h1>6. 当たるものは？</h1>
       	 	
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="普段と違って口臭を感じる" class="checkbox">普段と違って口臭を感じる</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="食欲を失った" class="checkbox"> 食欲を失った</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="お腹の調子が悪い" class="checkbox"> お腹の調子が悪い</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="喉に何かがあるような違和感を感じる" class="checkbox">喉に何かがあるような違和感を感じる</label> 
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="エアコンの風に長時間当たった" class="checkbox"> エアコンの風に長時間当たった</label>
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="ほっぺたを押す時痛みを感じる" class="checkbox">ほっぺたを押す時痛みを感じる</label> 						
						<label class="label--checkbox"><input type="checkbox" name="symptom" value="無し" class="checkbox"> 無し</label>
					</li>
	        	</ul>
        	</section>
        	
			<section class="content neck">
				<h1>7. その他</h1>
					<textarea name="symptom" placeholder="チェックの項目にない症状を書いてください。"></textarea>
			</section>
			
			<input type="submit" value="提出" class="button button-inline button-large">
			<!-- <button class="button button-inline button-large">제출하기</button> -->	   
			
		</div> 
	</form>

	<!-- 입 -->
	<form action="goSelfCheck2" method="post">		
        <div class="page" id="p5">
          	<section class="content mouth">
          		<h1>1. 今の症状はどうですか。 </h1>
       	 		<ul class="list">
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="唾が出た" class="checkbox">唾が出た</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="血を吐いた" class="checkbox">血を吐いた</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="普段と違って口臭を感じる" class="checkbox">普段と違って口臭を感じる</label>
					</li>
			
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="唇にまめが出来た" class="checkbox">唇にまめが出来た</label> 
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="口の中や舌がただれた" class="checkbox">口の中や舌がただれた</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="口を開くことが難しい" class="checkbox">口を開くことが難しい</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="食べ物を噛む時痛い" class="checkbox">食べ物を噛む時痛い</label>
					</li>
			
					<li class="list__item">						
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="歯茎が痛い" class="checkbox">歯茎が痛い</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="奥歯が痛い" class="checkbox">奥歯が痛い</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="歯がしみる" class="checkbox">歯がしみる</label>
						<label class="label--checkbox"><input type="checkbox" name="mouthQ1" value="無し" class="checkbox">無し</label>
					</li>
        		</ul>
          	</section>
		  	
		  	<section class="content mouth">
				<h1>2. その他</h1>
					<textarea name="mouthQ2" placeholder="チェックの項目にない症状を書いてください。"></textarea>
			</section>
			
			<input type="submit" value="提出" class="button button-inline button-large">
			<!-- <button class="button button-inline button-large">제출하기</button> -->
			
		</div>
	</form> 
 		
 		
	<!-- 귀 -->
 	<form action="goSelfCheck2" method="post">
 		<div class="page" id="p6">
          	<section class="content ear">
          		<h1>1. 今の症状はどうですか ? </h1>
       	 		<ul class="list">
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="耳が痛い" class="checkbox">耳が痛い</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="耳から膿が出る" class="checkbox">耳から膿が出る</label> 
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="耳が痒い" class="checkbox">耳が痒い</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="音が聞こえない" class="checkbox">音が聞こえない</label>
					</li>
					
					<li class="list__item">
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="耳から変な音がする" class="checkbox">耳から変な音がする</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="騒音が聞こえる" class="checkbox">騒音が聞こえる</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="皮膚にトラブルがある" class="checkbox">皮膚にトラブルがある</label>
						<label class="label--checkbox"><input type="checkbox" name="earQ1" value="無し" class="checkbox"> 無し</label>
					</li>
        		</ul>
          	</section>
		 	
		 	<section class="content ear">
				<h1>2. その他</h1>
					<textarea name="earQ2" placeholder="チェックの項目にない症状を書いてください。"></textarea>
			</section>
			
			<input type="submit" value="提出" class="button button-inline button-large">
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
					<li><a href="#t2" id="first">頭</a></li>
					<li><a href="#t3">喉</a></li>
					<li><a href="#t4">鼻</a></li>
					<li><a href="#t5">口</a></li>
					<li><a href="#t6">耳</a></li>
				</ul>
			</section>
		</div>
	</div>

	<br>
	<br>

</body>
</html>