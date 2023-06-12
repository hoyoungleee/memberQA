<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면입니다.</title>
<script type="text/javascript">
	function checkForm(){
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		console.log("id"+id.value+" pw"+pw.value);
		return false;
	}
</script>
</head>
<body>
<h1>로그인을 위해 정보를 입력해주세요</h1>
	<form id="loginInfo">
		<input id ="id" required="required"/>
		<br>
		<input id ="pw" required="required"/>
		<button onclick="return checkForm()">로그인</button>
	</form>
</body>
</html>