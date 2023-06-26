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
<c:if test="${sessionScope.id == null }">
<h1>로그인 후 이용하세요.</h1>
<a href="/login.do">로그인하기</a>
<br>
<a href="/">홈으로</a>
</c:if>
<c:if test="${sessionScope.id != null }">
<h1 >정보수정을 위해 새롭게 입력하세요.</h1>
	<form name="update_info" id="update_info"  >
		 <h2>아이디</h2>
		<input value="${member.id}" id="id" name="id" readonly="readonly" style="background-color: lightgray;" >
		<br>
		<br>
		<h2>이름</h2>
		<br>
		<input value="${member.name}" required="required" id="name" name="name" type="text"  >
		<br>
<!-- 		<h2>수정할 비밀번호</h2>
		<br>
		<input required="required" id="pw" name="pw" type="password" placeholder="새롭게 입력해주세요.">
		<br>
		<h2>비밀번호 확인</h2>
		<br>
		<input required="required" id="confirmPw" name="confirmPw" type="password" placeholder="새롭게 입력해주세요." onkeyup="passCheck()">
		<p id ="passStatus"></p> -->
		<br>
		<h2>생년월일</h2>
		<input value="${member.birth}" required="required" id="birth" name="birth" type="date" >
		<br><br>
		<c:if test="${member.gender == 'M'}">
			<h2>성별선택</h2>
			<input type="radio" name="gender" value="M" checked="checked" >남자
			<input  type="radio" name="gender" value="W">여자
		</c:if>
		<c:if test="${member.gender == 'W'}">
			<h2>성별선택</h2>
			<input type="radio" name="gender" value="M" >남자
			<input type="radio" name="gender" value="W" checked="checked">여자
		</c:if>
		<br>
		<h2>주소입력</h2>
		<br>
		<input type="text" id="address" name="address" value="${member.address}" placeholder="주소검색 버튼클릭바람" readonly="readonly"  >
		<input type="button" onclick="addrSearch()" value="주소 검색"><br>
		<input type="text" id="dtlAddress" name="dtlAddress" value="${member.dtlAddress}" required="required" placeholder="상세주소 입력하기"  />
		<br>
		<div class="form_group">
            <label for="email1" >이메일 아이디</label>
            <input type="text" id="email1" name="email1" value="${email1}" required="required" >
        </div>
        <div class="email_form"> @ </div>
        <div class="email_form">
            <label for="email2" class=>이메일 주소</label>
            <input type="text" id="email2" name="email2" value="${email2}" required="required" >
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
		<input type="button" id="btn"  onclick="return updForm()" value ="회원정보수정"/>
	</form>
</c:if>

</body>
</html>