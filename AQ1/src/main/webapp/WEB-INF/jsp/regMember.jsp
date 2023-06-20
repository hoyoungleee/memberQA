<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면입니다.</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소검색관련
	function addrSearch() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        var addr = data.address; // 최종 주소 변수
	        // 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("address").value = addr;
	    }
	}).open();
	}
	//폼값관련
	function checkForm(){
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var name = document.getElementById("name");
		var birth = document.getElementById("birth");
		var address = document.getElementById("address");
		var gender = document.querySelector('input[name="gender"]:checked');
		console.log("id"+id.value+" pw"+pw.value+" name"+name.value+" birth"+birth.value+" address"+address.value+" gender"+gender.value);
		return false;
	}
	//아이디중복확인
	function idCheck(){
		
	}
</script>
</head>
<body>
<h1>회원가입을 위해 정보를 입력하세요.</h1>
<br><br><br>
	<form name="member_info" id="member_info">
		<h2>아이디</h2>
		<br>
		<input autofocus="autofocus" required="required" id="id" type="text"><button onclick="idCheck()">중복확인</button>
		<br>
		<h2>비밀번호</h2>
		<br>
		<input required="required" id="pw" type="password">
		<br>
		<h2>이름</h2>
		<br>
		<input required="required" id="name" type="text">
		<br>
		<br>
		<h2>생년월일</h2>
		<br>
		<input required="required" id="birth" type="date">
		<br><br>
		<h2>성별선택</h2>
		<br>
		<input type="radio" name="gender" value="M" checked="checked">남자
		<input type="radio" name="gender" value="W">여자
		<br>
		<h2>주소입력</h2>
		<br>
		<input type="text" id="address" placeholder="주소검색 버튼클릭바람" readonly="readonly" >
		<input type="button" onclick="addrSearch()" value="주소 검색"><br>
		<br>
		<button onclick="return checkForm(this)">회원가입신청</button>
	</form>
</body>
</html>