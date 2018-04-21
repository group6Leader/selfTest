<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selfCheck/selfCheckForm3</title>

	<style type="text/css">
		body {
			background-color: #F0F8FF;
		}
		
		table {
			border: 1px solid black;
			border-collapse: collapse;
			height: 700px; width: 800px;
		}
	
	</style>

</head>
<body>

	<h1>자기진단 결과</h1>

	<table border="1">
		<tr>
			<th style="width: 250px"> 이름  / 자기진단 번호 </th>
			<td> ${c.cust_Name } / ${s.selfCheck_Num } </td>
		</tr>
		
		<tr>
			<th> 혈압 </th>
			<td> ${s.blood_Pressure } </td>
		</tr>
		
		<tr>
			<th> 흡연 </th>
			<td> ${s.smoking } </td>
		</tr>
		
		<tr>
			<th> 당뇨여부 </th>
			<td> ${s.diabetes } </td>
		</tr>
		
		<tr>
			<th> 수술여부 </th>
			<td> ${s.surgery } </td>
		</tr>
		
		<tr>
			<th> 장애여부 </th>
			<td> ${s.disability } </td>
		</tr>
		
		<tr>
			<th> 복용약 </th>
			<td> ${s.medicine } </td>
		</tr>
		
		<tr>
			<th> 알레르기 </th>
			<td> ${s.allergy } </td>
		</tr>
		
		<tr>
			<th> 해외방문여부 </th>
			<td> ${s.overseas_Visits } </td>
		</tr>
		
		<tr>
			<th> 수면시간 </th>
			<td> ${s.sleep_Time } </td>
		</tr>
		
		<tr>
			<th> 스트레스 </th>
			<td> ${s.stress } </td>
		</tr>
		
		<tr>
			<th> 가족력 </th>
			<td> ${s.family_History } </td>
		</tr>
		
		<tr>
			<th> 임신여부 </th>
			<td> ${s.pregnant } </td>
		</tr>
		
		<tr>
			<th> 아픈 부위 </th>
			<td> ${s.pain } </td>
		</tr>
		
		<tr>
			<th> 아픈 증상 </th>
			<td> ${s.symptom } </td>
		</tr>
		
		<tr>
			<th> 최종 수정일 </th>
			<td> ${s.outbreak_Day } </td>
		</tr>
	</table>
	
</body>
</html>