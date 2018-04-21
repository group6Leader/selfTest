<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prescription/prescriptionForm</title>
<link rel="stylesheet" type="text/css"  href="../resources/css/prescription.css">
</head>
<script type="text/javascript">

</script>
<body>
	<h1>Prescription</h1>

 <div class="main">
      <div class="one">
        <div class="register">
          <h3>No.처방전번호	  날짜</h3>
          <form id="reg-form">
            <div>
              <label for="cust_Num">환자번호</label>
              <input type="text" id="cust_Num" spellcheck="false" placeholder="24651"/>
            </div>
            <div>
              <label for="name">환자이름</label>
              <input type="text" id="name" spellcheck="false" placeholder="이대휘"/>
            </div>
            <div>
              <label for="gender">성별</label>
              <input type="text" id="gender" spellcheck="false" placeholder="남" />
            </div>
            <div>
              <label for="address">주소</label>
              <input type="text" id="address" spellcheck="false" placeholder="경기도 고양시 일산동구 .. "/>
            </div>
            <div>
              <label for="phone">전화번호</label>
              <input type="text" id="phone" spellcheck="false" placeholder="01011111111"/>
            </div>
            <div class="sep">
    	        <span class="or">Hospital</span>
	        </div>
	        <div>
              <label for="hospitalName">병원이름</label>
              <input type="text" id="hospitalName" placeholder="병원"/>
            </div>
            <div>
              <label for="phone">전화번호</label>
              <input type="text" id="hospitalphone" spellcheck="false" placeholder="01011111111"/>
            </div>
            <div>
              <label for="hospitalfax">팩스</label>
              <input type="text" id="hospitalfax" spellcheck="false" placeholder="2837464"/>
            </div>
            
            <div>
            <label for="hospitalemail">Email</label>
              <input type="text" id="hospitalemail" spellcheck="false" placeholder="shridhardeshmukh@xyz.com"/>
            </div>
            
            <div>
            <label for="doctorName">의사성함</label>
              <input type="text" id="doctorName" spellcheck="false" placeholder="간나"/>
            </div>
            
            <div class="sep">
    	        <span class="or">처방약</span>
	        </div>
            <button style="margin-left: 410px;">+</button>
            <div>
              <label for="medicineName">처방의약품</label>
              <input type="text" id="medicineName" placeholder="****"/>
            </div>
            <div>
              <label for="medicineVolume">1회 투여량</label>
              <input type="text" id="medicineVolume" placeholder="1정"/>
            </div>
            <div>
              <label for="medicineCount">하루 투여횟수</label>
             <!--  <input type="text" id="medicineCount" placeholder="1회"/> -->
              <select id="medicineCount">
              	<option>하루 1번 </option>
              	<option>하루 2번 </option>
              	<option>하루 3번 </option>
              </select>
            
            </div>
            <div>
              <label for="medicineDay">총 투여일수</label>
              <input type="text" id="medicineDay" placeholder="3일"/>
            </div>
            <div>
              <label></label>
              <input type="submit" value="Print Out" id="create-account" class="button"/>
            </div>
          </form>
  
        </div>
      </div>
     
</div>

</body>
</html>