<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<title>회원가입 화면입니다.</title>
</head>
<body>
<h1>회원가입을 위해 정보를 입력하세요.</h1>
<form action="" name="login_info" method="post">
		<h2>아이디</h2>
		<br>
		<input autofocus="autofocus" required="required" name="id">
		<h2>비밀번호</h2>
		<br>
		<input required="required" name="pw">
		<h2>이름</h2>
		<br>
		<input required="required" name="name">
		<h2>생년월일</h2>
		<br>
		<input required="required" name="birth" type="date">
		<br>
		<br>
		<input type="submit" value="회원가입신청"/>
	</form>
</body>
</html>