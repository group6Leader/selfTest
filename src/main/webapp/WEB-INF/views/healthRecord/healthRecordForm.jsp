<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/join.css"></c:url>">
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


$( function() {
    $( "#first_Date" ).datepicker();
  } );

$( function() {
    $( "#dia_Date" ).datepicker();
  } );

$( function() {
    $( "#issue_Date" ).datepicker();
  } );
	
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
					placeholder="Enter disease name" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Diseases Name</label>
			</div>
		
			
			<div class="form-element form-input">
				<input id="final_Diagnosis" name="final_Diagnosis" class="form-element-field" placeholder="Enter final_Diagnosis."
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
				<div class="form-radio-legend">usage</div>
				<label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="M" /> <i
					class="form-radio-button"></i> <span>제출용</span>
				</label> <label class="form-radio-label"> <input name=cust_Sex
					class="form-radio-field" type="radio" value="F" /> <i
					class="form-radio-button"></i> <span>보관용 </span>
				</label>
				
				
			</div>
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">first_Date 
				<input type="text" id="first_Date" name="first_Date"></div>
				
			</div>
			
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">dia_Date 
				<input type="text" id="dia_Date" name="dia_Date"></div>
			</div>
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">issue_Date 
				<input type="text" id="issue_Date" name="issue_Date"></div>
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
				<label class="form-element-label">hos_Name</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Address" name="cust_Address" class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Address</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Phone" name="cust_Phone" class="form-element-field"
					placeholder="Please your PhoneNumber" type="number" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Phone</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Major" name="cust_Major" class="form-element-field"
					placeholder="Please your job // if you doctor please enter major" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">cust_Num</label>
			</div>
			
			
		</fieldset>
		<div class="form-actions">
			<button class="form-btn" type="submit">JOIN</button>
			<button class="form-btn-cancel -nooutline" type="reset">Reset</button>
		</div>

	</form>
</body>
</html>