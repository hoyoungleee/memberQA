<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<title>방문을 환영합니다.</title>
</head>
<body>
	<h1>문의를 남기시려면 로그인을 해주시기 바랍니다.</h1>
	<br>
	<hr>
	<br>
	<form action="" name="login_info" method="post">
		<h2>아이디</h2>
		<br>
		<input autofocus="autofocus" required="required">
		<h2>비밀번호</h2>
		<br>
		<input required="required">
		<input type="submit" value="로그인하기"/>
	</form>
	
	<hr>
	<br>
	<strong>아직 회원이 아니시라면<strong> <a href="/reg.do">회원가입하기</a>
</body>
</html>