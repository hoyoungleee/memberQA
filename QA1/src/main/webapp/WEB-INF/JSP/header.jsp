<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 QA 게시판</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 비밀번호 암호화 등 -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<style type="text/css">
	header {
		background-color: lightgray;
		font-size: 30pt;
		text-align: right;
		height: 100px;
		padding: 10px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	header a {
		margin: 0 10px;
		text-decoration: none;
		color: #333;
		font-weight: bold;
	}

	header a:hover {
		color: #555;
	}

	header button {
		background-color: #007bff;
		border: none;
		color: #fff;
		padding: 8px 16px;
		border-radius: 4px;
		cursor: pointer;
		transition: background-color 0.3s;
	}

	header button:hover {
		background-color: #0056b3;
	}
</style>
<script type="text/javascript" src="../common/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<header>
	<c:if test="${sessionScope.id == null }">
		<div id="notLogin">
			<a href="/">홈버튼</a>
			<a href="/reg.do">회원가입</a>
			<a href="/login.do"><button>로그인</button></a>
		</div>
	</c:if>
	<c:if test="${sessionScope.id != null }">
		<div id="Login">
			<a href="/">홈버튼</a>
			<a href="/update.do">회원정보수정</a>
			<a href="/delete.do">탈퇴하기</a>
			<a href="logout.do"><button>로그아웃</button></a>
		</div>
	</c:if>
	</header>
</body>
</html>