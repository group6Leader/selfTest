<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/join.css"></c:url>">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function del_check() {

		var dia_Num = document.getElementById("dia_Num")

		if (confirm("정말로 삭제 하시겠습니까?")) {

			alert(dia_Num.value);

			location.href = 'deleteHR?dia_Num=' + dia_Num.value;
		}

	}

	function print(printArea) {
		win = window.open();
		self.focus();
		win.document.open();

		/*
			1. div 안의 모든 태그들을 innerHTML을 사용하여 매개변수로 받는다.
			2. window.open() 을 사용하여 새 팝업창을 띄운다.
			3. 열린 새 팝업창에 기본 <html><head><body>를 추가한다.
			4. <body> 안에 매개변수로 받은 printArea를 추가한다.
			5. window.print() 로 인쇄
			6. 인쇄 확인이 되면 팝업창은 자동으로 window.close()를 호출하여 닫힘
		 */
		win.document.write('<html><'head'><title></title><style>');
		win.document
				.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
	}
</script>

<title>Select HealthRecord</title>
</head>
<body>
	<!-- div 영역 -->
	<div id="printArea">




		<input type="hidden" id="dia_Num" value="${select.dia_Num }">



		<fieldset class="form-fieldset">
			<legend class="form-legend">HealthRecord </legend>


			<div class="form-element form-input">
				<input id="cust_Name" name="cust_Name" class="form-element-field"
					placeholder="Enter name" type="text" value="${select.cust_Name }"
					disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Customer Name</label>
			</div>




			<div class="form-element form-input">
				<input id="dis_Name" name="dis_Name" class="form-element-field"
					placeholder="Enter disease name" type="text"
					value="${select.dis_Name }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Diseases Name</label>
			</div>


			<div class="form-element form-input">
				<input id="final_Diagnosis" name="final_Diagnosis"
					class="form-element-field" placeholder="Enter final_Diagnosis."
					type="text" value="${select.final_Diagnosis }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">final_Diagnosis</label>

			</div>


			<div class="form-element form-input">
				<input id="dis_Category" name="dis_Category"
					class="form-element-field" placeholder="Select dis_Category."
					type="text" value="${select.dis_Category }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">dis_Category</label>
				<div id="check"></div>
			</div>

			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">usage</div>
				<label class="form-radio-label"> <c:if
						test="${select.usage == 'submit' }">

						<input name="usage" class="form-radio-field" type="radio"
							value="submit" checked="checked" readonly="readonly" />
						<i class="form-radio-button"></i>
						<span>제출용</span>
					</c:if>


				</label> <label class="form-radio-label"> <c:if
						test="${select.usage == 'save' }">
						<input name="usage" class="form-radio-field" type="radio"
							value="save" checked="checked" readonly="readonly" />
						<i class="form-radio-button"></i>
						<span>보관용 </span>
					</c:if>
				</label>


			</div>

			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">
					first_Date <input type="text" id="first_Date" name="first_Date"
						value="${select.first_Date }" disabled="disabled">
				</div>

			</div>




			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">
					dia_Date <input type="text" id="dia_Date" name="dia_Date"
						value="${select.dia_Date }" disabled="disabled">
				</div>
			</div>



			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">
					issue_Date <input type="text" id="issue_Date" name="issue_Date"
						value="${select.issue_Date }" disabled="disabled">
				</div>
			</div>





			<div class="form-element form-input">
				<input id="care_Opinions" name="care_Opinions"
					class="form-element-field" placeholder="Write care_Opinions"
					type="text" value="${select.care_Opinions }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">care_Opinions</label>
			</div>

			<div class="form-element form-input">
				<input id="ect" name="ect" class="form-element-field"
					placeholder="Write ect" type="text" value="${select.ect }"
					disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">ect</label>
			</div>

			<div class="form-element form-input">
				<input id="hos_Name" name="hos_Name" class="form-element-field"
					placeholder="hospital_Name" type="text" value="${select.hos_Name }"
					disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Name</label>
			</div>


			<div class="form-element form-input">
				<input id="hos_Address" name="hos_Address"
					class="form-element-field" placeholder="hospital_Address"
					type="text" value="${select.hos_Address }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Address</label>
			</div>


			<div class="form-element form-input">
				<input id="hos_Phone" name="hos_Phone" class="form-element-field"
					placeholder="hospital_Phone" type="number"
					value="${select.hos_Phone }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">hos_Phone</label>
			</div>


			<div class="form-element form-input">
				<input id="cust_Num" name="cust_Num" class="form-element-field"
					placeholder="write customer name" type="text"
					value="${select.cust_Num }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">cust_Num</label>
				<c:if test="${sessionScope.customer.division == 2 }">
					<button class="docReserveList" onclick="docReserveList()"
						value="findCust">FIND_CUST</button>
				</c:if>


			</div>



			<div class="form-element form-input">
				<input id="cust_Id" name="cust_Id" class="form-element-field"
					placeholder="sign dictor name" type="text"
					value="${select.cust_Id }" disabled="disabled" />
				<div class="form-element-bar"></div>
				<label class="form-element-label">doctor_Name</label>
			</div>



		</fieldset>


		<div class="form-actions"></div>
		<button class="form-btn" onclick="del_check()">DELETE</button>
		<!-- <button class="form-btn-cancel -nooutline" onclick="print_check()">PRINT</button> -->
		<input type="button"
			OnClick="print(document.getElementById('printArea').innerHTML)"
			value="PRINT" />
	</div>





</body>
</html>