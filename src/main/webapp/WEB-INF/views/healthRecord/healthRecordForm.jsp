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
$(document).ready(function() {
	
	$('#dis_Category').on('keyup',dis_Category_Chk);
	
	
	function dis_Category_Chk(){
		var dis_Category = $('#dis_Category').val();
	
		$.ajax({
			url:'dis_Category_chk'
			,type:'post'
			,data:{
				dis_Category:dis_Category
			}
			,dataType:'json'
			,success:function(disCode){
				console.log(disCode);
				
				var html = '<span id="check">';
				
				if(disCode!=""){
				
					$.each(disCode, function(index , item){
						
						html += index + ' : ' + item.dis_Code + '<br />'; 
						console.log(item);

					})
				
				}else{
					html += '없는 코드 입니다.';
				}
				html += '</span>';
				
				$('#check').html(html);
			}
			,error:function(err){
				console.log(JSON.stringify(err));
			}
		});
	}	
});
	
	
	

$( function() {
    $( "#first_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );

$( function() {
    $( "#dia_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );

$( function() {
    $( "#issue_Date" ).datepicker({ dateFormat: 'yy-mm-dd' });
  } );
	

function docReserveList() {
	/* alert('1'); */
	
	window.open("findCust", "newWindow", "top=50, left=400, height=500, width=1000, resizable=no");

}	
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HealthRecord</title>
</head>
<body>
	
	<div class="form-element form-input">
				<input id="cust_Name" name="cust_Name" class="form-element-field"
					placeholder="sign dictor name" type="text" disabled="disabled"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">cust_Name</label>
			</div>
	<form class="form-card" action="insertHealthRecord" method="post" enctype="multipart/form-data">
		<fieldset class="form-fieldset">
			<legend class="form-legend">HealthRecord
			
			
			
			</legend>
			
<!-- 	int dia_Num;
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
	String doctor id
	int dia_del; // -->
			
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
				
			</div>
			
			
			<div class="form-element form-input">
				<input id="dis_Category" name="dis_Category" class="form-element-field" placeholder="Select dis_Category."
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">dis_Category</label>
				<div id="check"></div>
			</div>
			
			
			
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">usage</div>
				<label class="form-radio-label"> <input name="usage"
					class="form-radio-field" type="radio" value="submit" /> <i
					class="form-radio-button"></i> <span>제출용</span>
				</label> <label class="form-radio-label"> <input name="usage"
					class="form-radio-field" type="radio" value="save" /> <i
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
				<input id="care_Opinions" name="care_Opinions" class="form-element-field" placeholder="Write care_Opinions"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">care_Opinions</label>
			</div>
			
			<div class="form-element form-input">
				<input id="ect" name="ect" class="form-element-field" placeholder="Write ect"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">ect</label>
			</div>
			
			<div class="form-element form-input">
				<input id="hos_Name" name="hos_Name" class="form-element-field" placeholder="hospital_Name"
					type="text" required disabled="disabled"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Name</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="hos_Address" name="hos_Address" class="form-element-field" placeholder="hospital_Address"
					type="text" required disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Address</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="hos_Phone" name="hos_Phone" class="form-element-field"
					placeholder="hospital_Phone" type="number" required disabled="disabled"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Phone</label>
			</div>
			
			
			<div class="form-element form-input">
				<input id="cust_Num" name="cust_Num" class="form-element-field"
					placeholder="write customer name" type="text" required disabled="disabled"/>
				<div class="form-element-bar"></div>
				<label class="form-element-label">cust_Num</label>
				<c:if test="${sessionScope.customer.division == 2 }">
				<button class="docReserveList" onclick="docReserveList()" value="findCust">FIND_CUST</button>
				</c:if> 
				
			
			</div>
			
			
			
			<div class="form-element form-input">
				<input id="cust_Id" name="cust_Id" class="form-element-field"
					placeholder="sign dictor name" type="text" value = "${record.cust_Id }"required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">doctor_Name</label>
			</div>
			
			
			
		</fieldset>
		<div class="form-actions">
			<button class="form-btn" type="submit">JOIN</button>
			<button class="form-btn-cancel -nooutline" type="reset">Reset</button>
		</div>

	</form>
	
	
	
</body>
</html>