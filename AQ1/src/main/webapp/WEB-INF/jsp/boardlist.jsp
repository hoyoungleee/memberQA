<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	/*     $(document).ready(function() {
	 loadBoardData();
	 });

	 function loadBoardData() {
	 $.ajax({
	 url: "/boardlist.do",
	 type: "get",
	 dataType: "json",
	 success: function(data) {
	 var html = "";
	 $.each(data, function(index, obj) {
	 html += "<tr>";
	 html += "<td>" + obj.p_id + "</td>";
	 html += "<td>" + obj.title + "</td>";
	 html += "<td>" + obj.description + "</td>";
	 html += "<td>" + obj.reg_dt + "</td>";
	 html += "<td>" + obj.answer + "</td>";
	 html += "<td>" + obj.text_open + "</td>";
	 html += "</tr>";
	 });
	 $("#jisang").html(html);
	 },
	 error: function() {
	 alert("Error");
	 }
	 });
	 } */
</script>

<title>List</title>
<style>
.centered {
	width: 300px;
	position: absolute;
	left: 50%;
	margin-left: -200px;
}

td {
	border: 1px solid #DDA520;
}

.shorttitle {
	width: 380px; /* 가로 길이 고정*/
	text-overflow: ellipsis; /* 생략 처리 ( ... )*/
	white-space: nowrap; /* 줄바꿈 하지 않고 잘림*/
	overflow: hidden; /* 스크롤 처리 하지 않음*/
}
</style>
</head>
<body>
	<div class="centered">
		<br> <br> <br> <br> <br>
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #DDA520">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">설명</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">답변여부</th>
						<th style="background-color: #eeeeee; text-align: center;">개방여부</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="k1" items="${sang1lists}">
						<input type="hidden" name="p_id" id="p_id" value="${k1.p_id}">
						<th><a href="/boardview.do?p_id=${k1.p_id }"> ${k1.title} </a></th>
						<th> ${k1.description}</th>
						<th>${k1.reg_dt}</th>
						<th>${k1.answer}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/boardwrite.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>
