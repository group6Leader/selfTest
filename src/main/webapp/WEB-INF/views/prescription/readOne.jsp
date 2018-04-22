<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/readOne</title>
<link rel="stylesheet" type="text/css"  href="../resources/css/prescription.css">
</head>
<body>

	<div class="main">
		<div class="one">
			<div class="register">
				<!-- <h3>No.처방전번호:  </h3>  -->
				<h3 style="text-align: right;">날짜 ${date }</h3>
				<form id="reg-form" action="goPrescription" method="post">
					
					<!-- 환자 -->
					<div>
						<label for="cust_Num">환자번호</label> 
						<input type="text"id="cust_Num" name="cust_Num" value="${c.cust_Num }" spellcheck="false" />
					</div>

					<div>
						<label for="name">환자이름</label> 
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
						<label for="hospitalName">병원이름</label> 
						<input type="text" id="hospitalName" placeholder="병원이름" />
					</div>
					
					<div>
						<label for="phone">전화번호</label> 
						<input type="text" id="hospitalphone" spellcheck="false" placeholder="전화번호" />
					</div>
					
					<div>
						<label for="hospitalfax">팩스</label> <input type="text"
							id="hospitalfax" spellcheck="false" placeholder="팩스" />
					</div>

					<div>
						<label for="hospitalemail">Email</label> <input type="text"
							id="hospitalemail" spellcheck="false" placeholder="Email" />
					</div>

					<div>
						<label for="doctorName">의사성함</label> <input type="text"
							id="doctorName" spellcheck="false" placeholder="의사성함" />
					</div>

					<!-- 처방약 -->
					<div class="sep">
						<span class="or">처방약</span>
					</div>
					
					<button style="margin-left: 410px;">+</button>
					
					<div>
						<label for="medicineName">처방의약품</label> 
						<input type="text" id="medicineName" name="med_Name" placeholder="처방의약품" />
					</div>
					
					<div>
						<label for="medicineVolume">1회 투여량</label> 
						<input type="text" id="medicineVolume" name="med_Amount" placeholder="1회 투여량(1정)" />
					</div>
					
					<div>
						<label for="medicineCount">하루 투여횟수</label>
						<!--  <input type="text" id="medicineCount" placeholder="1회"/> -->
						<select id="medicineCount" name="med_Count">
							<option>하루 1번</option>
							<option>하루 2번</option>
							<option>하루 3번</option>
						</select>
					</div>
					
					<div>
						<label for="medicineDay">복용법</label> 
						<input type="text" id="medicineContent" name="med_Content" placeholder="복용법" />
					</div>
					
					<div>
						<label></label>
						<input type="submit" value="Print Out" id="create-account" class="button" />
					</div>
				</form>

			</div>
		</div>
	</div>



</body>
</html>