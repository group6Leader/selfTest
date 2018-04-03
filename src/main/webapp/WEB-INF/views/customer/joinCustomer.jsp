<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/join.css"></c:url>">
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
<title>CHAR HOSPITAL JOIN</title>
</head>
<body>
	<!-- Taken from https://codepen.io/jonnitto/project/editor/XRPjxx -->
	<video width="1280" height="720" class="background" autoplay muted loop>
		<source src="https://codepen.jonnitto.ch/BackgroundVideo.mp4"
			type="video/mp4">
	</video>
	<form class="form-card">
		<fieldset class="form-fieldset">
			<legend class="form-legend">JOIN US</legend>
			<div class="form-element form-input">
				<input class="form-element-field"
					placeholder="Please fill in your full name" type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Name</label>
			</div>
			<div class="form-element form-input">
				<input class="form-element-field" placeholder="Please your id"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">ID</label>
			</div>
			<div class="form-element form-input">
				<input class="form-element-field" placeholder="Please your password"
					type="password" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Password</label>
			</div>
			<div class="form-radio form-radio-block">
				<div class="form-radio-legend">성별</div>
				<label class="form-radio-label"> <input name=sex
					class="form-radio-field" type="radio" value="men" /> <i
					class="form-radio-button"></i> <span>남자</span>
				</label> <label class="form-radio-label"> <input name=sex
					class="form-radio-field" type="radio" value="women" /> <i
					class="form-radio-button"></i> <span>여자</span>
				</label>
			</div>
			<div class="form-element form-select">
				<select class="form-element-field" id="year">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Year</label>
			</div>
			<div class="form-element form-select">
				<select class="form-element-field" id="month">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Month</label>
			</div>
			<div class="form-element form-select">
				<select class="form-element-field" id="day">
					<option disabled selected value="" class="form-select-placeholder"></option>
				</select>
				<div class="form-element-bar"></div>
				<label class="form-element-label">Day</label>
			</div>
			<div class="form-element form-input">
				<input class="form-element-field" placeholder="Please your Address"
					type="text" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Address</label>
			</div>
			<div class="form-element form-input">
				<input class="form-element-field"
					placeholder="Please your PhoneNumber" type="number" required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">PhoneNumber</label>
			</div>
			<div class="form-element form-input">
				<input class="form-element-field" placeholder=" " type="email"
					required />
				<div class="form-element-bar"></div>
				<label class="form-element-label">Email</label> <small
					class="form-element-hint">We will never spam you!</small>
			</div>
		</fieldset>
		<div class="form-actions">
			<button class="form-btn" type="submit">JOIN</button>
			<button class="form-btn-cancel -nooutline" type="reset">CANCEL</button>
		</div>

	</form>
</body>
</html>