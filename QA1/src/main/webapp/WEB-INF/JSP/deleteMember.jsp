<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../common/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>정말 탈퇴하시겠습니까?</h1>
	<input type="hidden" value="${sessionScope.id}" id="id">
	<button id="delBtn" onclick="return delMember()">탈퇴하기</button>
</c:if>
</body>
</html>