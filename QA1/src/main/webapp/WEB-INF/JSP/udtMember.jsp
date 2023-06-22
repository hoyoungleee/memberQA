<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 화면입니다.</title>
</head>
<body>
<%@include file="./header.jsp" %>
<h1 id="formFlag">정보수정을 위해 새롭게 입력하세요.</h1>
	<form name="update_info" id="update_info" onchange="btn()" onkeyup="btn()">
		 <h2>아이디</h2>
		<input value="${member.id}" id="id" readonly="readonly">
		<br>
		<br>
		<h2>이름</h2>
		<br>
		<input onchange="btn()" value="${member.name}" required="required" id="name" type="text">
		<br>
		<br>
		<h2>생년월일</h2>
		<input onchange="btn()" value="${member.birth}" required="required" id="birth" type="date">
		<br><br>
		<h2>성별선택</h2>
		<input onchange="btn()" type="radio" name="gender" value="M" checked="checked">남자
		<input onchange="btn()" type="radio" name="gender" value="W">여자
		<br>
		<h2>주소입력</h2>
		<br>
		<input onchange="btn()" type="text" id="address" placeholder="주소검색 버튼클릭바람" readonly="readonly" >
		<input onchange="btn()" type="button" onclick="addrSearch()" value="주소 검색"><br>
		<input onchange="btn()" type="text" id="dtlAddress" required="required" placeholder="상세주소 입력하기"/>
		<br>
		<div class="form_group">
            <label for="email1" >이메일 아이디</label>
            <input type="text" id="email1" name="email1" required="required" >
        </div>
        <div class="email_form"> @ </div>
        <div class="email_form">
            <label for="email2" class=>이메일 주소</label>
            <input type="text" id="email2" name="email2" required="required" >
        </div>
        <div class="email_form">
            <label for="email3" class=>이메일 선택</label>
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
		<input type="button" id="udtBtn"  onclick="return nullCheck()" value ="회원정보수정"/>
	</form>
</body>
</html>