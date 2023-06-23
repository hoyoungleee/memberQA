<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 비밀번호 암호화 등 -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<style type="text/css">
	header{
		background-color: Lightgray;
		font-size:30pt;
		text-align : right;
		height: 70px;
	}
</style>
<script type="text/javascript" src="../common/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@include file="./header.jsp" %>
<c:if test="${sessionScope.id == null }">
	<h1>로그인 후 이용하세요.</h1>
</c:if>
<c:if test="${sessionScope.id != null }">
	<h1>탈퇴를 하시려면 비밀번호를 한번 더 입력해주세요.</h1>
	<input type="hidden" value="${sessionScope.id}">
	<input type="password" id="pw"/> 
	<button>탈퇴하기</button>
</c:if>
</body>
</html>