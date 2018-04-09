<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckForm</title>
</head>
<body>

	<h1>자가진단</h1>
	
	<form action="goSelfCheck" method="post">
		
		<div>
			<label for="blood_Pressure">혈압</label>
			<input type="text" name="blood_Pressure" placeholder="혈압">
		
		</div> <br>

		<div>
			<label for="smoking">담배</label> <br>
			
			<input type="radio" name="smoking" class="smoking" value="없음"> 없음
			<input type="radio" name="smoking" class="smoking" value="한갑"> 하루 한 갑
			<input type="radio" name="smoking" class="smoking" value="두갑"> 하루 두 갑
		</div> <br>
		
		<div>
		
			<label for="drinking">음주</label> <br>
			
			<input type="radio" name="drinking" class="drinking" value="없음" > 없음
			<input type="radio" name="drinking" class="drinking" value="한번"> 일주일 1번
			<input type="radio" name="drinking" class="drinking" value="두세번"> 일주일 2~3번
			<input type="radio" name="drinking" class="drinking" value="대여섯번"> 일주일 5~6번
			
			
		</div> <br>
		
		<div>
		
			<label for="diabetes">당뇨병</label> <br>
			
			<input type="radio" name="diabetes" class="diabetes" value="없음"> 없음
			<input type="radio" name="diabetes" class="diabetes" value="있음"> 있음	
			
		</div> <br>

		<div>
			
			<label for="surgery">수술여부</label> <br>
			
			<input type="radio" name="surgery" class="diabetes" value="없음"> 없음
			<input type="radio" name="surgery" class="diabetes" value="있음"> 있음
		
		</div> <br>
		
		<div>
			<label for="diabetes">장애여부</label> <br>
			
			<input type="radio" name="disability" class="diabetes" value="없음"> 없음
			<input type="radio" name="disability" class="diabetes" value="있음"> 있음
		
		</div> <br>
		
		<div>
			<label for="medicine">최근 복용약</label>
			
			<input type="text" name="medicine" placeholder="최근 복용약">
		
		</div> <br>

		<div>
			<label for="allergy">알레르기</label>
			
			<input type="text" name="allergy" placeholder="알레르기">
		
		</div> <br>
		
		<div>
			<label for="overseas_Visits">최근 해외방문 여부</label> <br>
			
			<input type="radio" name="overseas_Visits" class="overseas_Visits" value="없음"> 없음
			<input type="radio" name="overseas_Visits" class="overseas_Visits" value="있음"> 있음
		
		</div> <br>
		
		<div>
			<label for="sleep_Time">평균 수면시간</label>
			
			<input type="text" name="sleep_Time" placeholder="평균 수면시간">
		
		</div> <br>
		
		<div>
			<label for="stress">스트레스 받는 정도</label> <br>
			
			<input type="radio" name="stress" class="stress" value="없음"> 없음
			<input type="radio" name="stress" class="stress" value="적음"> 적음
			<input type="radio" name="stress" class="stress" value="많음"> 많음
			<input type="radio" name="stress" class="stress" value="심함"> 심함
		
		</div> <br>
		
		<div>
			<label for="family_history">가족력</label>
			
			<input type="text" name="family_History" placeholder="가족력">
		
		</div> <br>
		
		<div>
			<label for="pregnant">현재 임신여부</label> <br>
			
			<input type="radio" name="pregnant" class="pregnant" value="없음"> 없음
			<input type="radio" name="pregnant" class="pregnant" value="있음"> 있음
		
		</div> <br>
	
		<div>
			<input type="submit" value="다음">
		</div>

	</form>
	
	
</body>
</html>