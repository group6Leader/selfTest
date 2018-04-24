<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/prescriptionResult</title>
</head>
<body>

	<h1>${p.pre_Num }번 처방전</h1>
	
	<!-- 진단서가 완료되어야지 여기에 올 수 있지 않을까. -->
	<%-- ${p } --%>
	
	<!-- 환자 부분  -->
	
	<div id="patient">
		<%-- <div>
		처방전번호 
		${p.pre_Num}
		</div> --%>
	
		<div>
		환자성함
		${c.cust_Name }
		</div>	
	
		<div>
		성별
		${c.cust_Sex }
		</div>	
	
		<div>
		주소
		${c.cust_Address }
		</div>	
		
		<div>
		전화번호
		${c.cust_Phone }
		</div>
	</div> <br><br>
	
	<div id="hospital">
		<div>
		병원이름
		</div>

		<div>
		주소
		</div>		
		
		<div>
		전화번호
		</div>		
		
		<!-- <div>
		이메일
		</div> -->		
		
		<!-- <div>
		의사성함
		</div> -->		
	</div> <br><br>
	
	<div id="medicine">
		<div>
		처방의약품	
		${p.med_Name }
		</div>
		
		<div>
		1회 투여량	
		${p.med_Amount }
		</div>
		
		<div>
		하루 투여횟수	
		${p.med_Count }
		</div>
	
		<div>
		복용법
		${p.med_Content }
		</div>
	</div>

</body>
</html>