<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/readOne</title>
<link rel="stylesheet" type="text/css"  href="../resources/css/prescription.css">
	
	<script type="text/javascript">
	window.onload = function() {
		/* alert(333); */
		var add = document.getElementById('add');
		add.onclick = function() {
			/* alert('1'); */
			
			var div = document.createElement('div');
	        div.innerHTML = document.getElementById('pre_set').innerHTML;
	        document.getElementById('field').appendChild(div);
	        
	        return false;
		}
	}
		
		/* function add() {
			alert('1');
			
			var div = document.createElement('div');
	        div.innerHTML = document.getElementById('pre_set').innerHTML;
	        document.getElementById('field').appendChild(div);
	        
	        return false;
		} */
		
		/* function remove(obj){
			alert(3);
	        // obj.parentNode 를 이용하여 삭제
	        document.getElementById('field').removeChild(obj.parentNode);
	    } */
		
		function checkForm() {
			/* alert('2'); */
			var med_Name = getElementById('med_Name').value;
			var med_Amount = getElementById('med_Amount').value;
			var med_Count = getElementById('med_Count').value;
			var med_Content = getElementById('med_Content').value;
			
			if (med_Name = ''){
				alert('555');
				return false;
			}
			
			console.log(med_Name);
			console.log(med_Amount);
			console.log(med_Count);
			console.log(med_Content);
			
			return false;
		}
		
	</script>

</head>
<body>

	<div class="main">
		<div class="one">
			<div class="register">
				<!-- <h3>No.처방전번호:  </h3>  -->
				<h3 style="text-align: right;">날짜 ${date }</h3>
				<form id="reg-form" action="goPrescription" method="post" onsubmit="return checkForm()">
					
					<!-- 환자 -->
					<div>
						<label for="cust_Num">환자번호</label> 
						<input type="text"id="cust_Num" name="cust_Num" value="${c.cust_Num }" spellcheck="false" />
					</div>

					<div>
						<label for="name">환자성함</label> 
						<input type="text" id="name" value="${c.cust_Name }" spellcheck="false" />
					</div>

					<div>
						<label for="gender">성별</label> 
						<input type="text" id="gender" value="${c.cust_Sex }" spellcheck="false" />
					</div>

					<div>
						<label for="address">주소</label> 
						<input type="text" id="address" value="${c.cust_Address }" spellcheck="false" />
					</div>

					<div>
						<label for="phone">전화번호</label> 
						<input type="text" id="phone" value="${c.cust_Phone }" spellcheck="false" />
					</div>
					
					<!-- 병원 -->
					<div class="sep">
						<span class="or">Hospital</span>
					</div>
					
					<div>
						<label for="hos_Name">병원이름</label> 
						<input type="text" id="hos_Name" name="hos_Name" placeholder="병원이름" />
					</div>

					<div>
						<label for="hos_Address">주소</label> 
						<input type="text" id="hos_Address" name="hos_Address" spellcheck="false" placeholder="주소" />
					</div>
					
					<div>
						<label for="hos_Phone">전화번호</label> 
						<input type="text" id="hos_Phone" name="hos_Phone" spellcheck="false" placeholder="전화번호" />
					</div>

					<div>
						<label for="doctorName">의사성함</label> 
						<input type="text" id="cust_Id" name="cust_Id" spellcheck="false" placeholder="의사성함" />
					</div>
					
					<!-- <div>
						<label for="hospitalfax">팩스</label> <input type="text"
							id="hospitalfax" spellcheck="false" placeholder="팩스" />
					</div> -->


					<!-- 처방약 -->
					<div class="sep">
						<span class="or">처방약</span>
					</div>
					
								
					<div id="pre_set">
						<label for="medicineName">처방의약품</label> 
						<input type="text" id="med_Name" name="med_Name" placeholder="처방의약품" />
					
						<label for="medicineVolume">1회 투여량</label> 
						<input type="text" id="med_Amount" name="med_Amount" placeholder="1회 투여량(1정)" />
					
						<label for="medicineCount">하루 투여횟수</label>
						<!--  <input type="text" id="medicineCount" placeholder="1회"/> -->
						<select id="med_Count" name="med_Count">
							<option>하루 1번</option>
							<option>하루 2번</option>
							<option>하루 3번</option>
						</select>
					
						<label for="medicineDay">복용법</label> 
						<input type="text" id="med_Content" name="med_Content" placeholder="복용법" />
					</div>

					<div id="field"></div>
					
					<button id="add" style="margin-left: 400px;"> 추가 </button> <br><br>

					<label></label>
					<input type="submit" value="Print Out" id="create-account" class="button" />
					
				</form>

			</div>
		</div>
	</div>

</body>
</html>