<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면입니다.</title>
</head>
<body>
<%@include file="./header.jsp" %>
<h1 >회원가입을 위해 정보를 입력하세요.</h1>
	<form name="member_info" id="member_info" onchange="btn()" onkeyup="btn()">
		<h2>아이디</h2>
		<br>
		<input onchange="btn()" readonly="readonly" required="required" id="id" name="id" type="text" placeholder="중복확인을 눌러주세요"><button onclick="return checkPop()">중복확인</button>
		<br>
		<h2>비밀번호</h2>
		<br>
		<input onchange="btn()" required="required" id="pw" name="pw" type="password" >
		<br>
		<h2>비밀번호 확인</h2>
		<br>
		<input onchange="btn()" required="required" id="confirmPw" name="confirmPw" type="password" onkeyup="passCheck()">
		<p id ="passStatus"></p>
		<br>
		<h2>이름</h2>
		<br>
		<input onchange="btn()" required="required" id="name" name="name" type="text">
		<br>
		<br>
		<h2>생년월일</h2>
		<input onchange="btn()" required="required" id="birth" name="birth" type="date">
		<br><br>
		<h2>성별선택</h2>
		<input onchange="btn()" type="radio" name="gender" value="M" checked="checked">남자
		<input onchange="btn()" type="radio" name="gender" value="W">여자
		<br>
		<h2>주소입력</h2>
		<br>
		<input onchange="btn()" type="text" id="address" name="address" placeholder="주소검색 버튼클릭바람" readonly="readonly" >
		<input onchange="btn()" type="button" onclick="addrSearch()" value="주소 검색"><br>
		<input onchange="btn()" type="text" id="dtlAddress" name="dtlAddress" required="required" placeholder="상세주소 입력하기"/>
		<br>
		<div class="form_group">
            <label for="email1" >이메일 아이디</label>
            <input type="text" id="email1" name="email1"  required="required" >
        </div>
        <div class="email_form"> @ </div>
        <div class="email_form">
            <label for="email2" >이메일 주소</label>
            <input type="text" id="email2" name="email2"  required="required" >
        </div>
        <div class="email_form">
            <label for="email3" >이메일 선택</label>
            <select id="email3" name="email3" title="이메일 주소 선택" onchange="selectMail()">
                <option value="">  이메일주소 직접입력  </option>
                <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="yahoo.com">yahoo.com</option>
                <option value="hanmail.net">hanmail.net</option>
            </select>
        </div>
		<br>
		<input type="button" id="btn"  onclick="return regForm()" value ="회원가입신청"/>
	</form>
</body>
</html>