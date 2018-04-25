<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/healthRecordForm.css"></c:url>">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<script type="text/javascript">

document.addEventListener("change", function(event) {
	let
	element = event.target;
	if (element && element.matches(".form-element-field")) {
		element.classList[element.value ? "add" : "remove"]("-hasvalue");
	}
});
window.onload = function() {
	appendYear();
	appendMonth();
	appendDay();
}

function appendYear() {

	var date = new Date();

	var year = date.getFullYear();

	var selectValue = document.getElementById("year");

	var optionIndex = 0;

	for (var i = year - 100; i <= year; i++) {

		selectValue.add(new Option(i + "년", i), optionIndex++);

	}

}

function appendMonth() {

	var selectValue = document.getElementById("month");

	var optionIndex = 0;

	for (var i = 1; i <= 12; i++) {

		selectValue.add(new Option(i + "월", i), optionIndex++);

	}

}

function appendDay() {

	var selectValue = document.getElementById("day");

	var optionIndex = 0;

	for (var i = 1; i <= 31; i++) {

		selectValue.add(new Option(i + "일", i), optionIndex++);

	}

}



	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HealthRecord</title>
</head>
<body>
	
	<form class="form-card" action="insertHealthRecord" method="post" enctype="multipart/form-data">
		<fieldset class="form-fieldset">
			<legend class="form-legend">HealthRecord</legend>
			
	int dia_Num;
	String dis_Name; text
	String final_Diagnosis; text	
	String dis_Category; radio - select;
	String first_Date; // 질병 발병일 달력.	
	String dia_Date; // 초기 진단일 달력
	String care_Opinions; //text		
	String ect; //text
	String usage; //용도 radio 
	String issue_Date; // 발행일 sysdate 
	String hos_Name; // 예약 병원. char hosptial
	String hos_Address;
	String hos_Phone;
	int cust_Num; //가져오기. 리스트
	int dia_del; //
			
			<div class="form-element form-input">
				<input id="dis_Name" name="dis_Name" class="form-element-field"
					placeholder="" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Diseases Name</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="final_Diagnosis" name="final_Diagnosis" class="form-element-field" placeholder=""
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">final_Diagnosis</label>
				<div id="check"></div>
			</div>
			
			
			<div class="form-element form-input">
				<input id="dis_Category" name="dis_Category" class="form-element-field" placeholder=""
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">dis_Category</label>
			</div>
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">성별</div>
				<label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="M" /> <i
					class="form-radio-button"></i> <span>남자</span>
				</label> <label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="F" /> <i
					class="form-radio-button"></i> <span>여자</span>
				</label>
				
				
			</div>
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">first_Date </div>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="year" name="birth_Year">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Year</label>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="month" name="birth_Month">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Month</label>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="day" name="birth_Day">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Day</label>
			</div>
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">dia_Date </div>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="year" name="birth_Year">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Year</label>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="month" name="birth_Month">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Month</label>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="day" name="birth_Day">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Day</label>
			</div>
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">issue_Date </div>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="year" name="birth_Year">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Year</label>
			</div>
			
			
			<div class="form-element form-select1">
				<select class="form-element-field" id="month" name="birth_Month">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Month</label>
			</div>
			
			
			<div class="form-element form-select">
				<select class="form-element-field" id="day" name="birth_Day">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Day</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">care_Opinions</label>
			</div>
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">ect</label>
			</div>
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">care_Opinions</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Phone" name="cust_Phone" class="form-element-field"
					placeholder="Please your PhoneNumber" type="number" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">PhoneNumber</label>
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Email" name="cust_Email" class="form-element-field" placeholder=" " type="email"
					required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Email</label> <small
					class="form-element-hint">We will never spam you!</small>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Major" name="cust_Major" class="form-element-field"
					placeholder="Please your job // if you doctor please enter major" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Job</label>
			</div>
			
			
		</fieldset>
		<div class="form-actions">
			<button class="form-btn" type="submit">JOIN</button>
			<button class="form-btn-cancel -nooutline" type="reset">Reset</button>
		</div>

	</form>
</body>
</html>