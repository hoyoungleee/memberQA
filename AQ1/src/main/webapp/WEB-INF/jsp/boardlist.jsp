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
	//append 아래쪽에 붙임

	$(document).ready(function() {
		loadBoardData(1);
	});

	function loadBoardData(page) {
		
		$.ajax({
			url : "/boardAjax.do",
			data: {'search': $('#search').val(), 'page': ((page * 10)-10)},
			type : "get",
			dataType : "json",
			success : function(data) {
				$("#AjaxBoard").empty();
				$.each(data, function(index, obj) {
					var html = "";

					html += "<tr>";
					html += "<td>" + obj.p_id + "</td>";
					html += "<td>" + obj.title + "</td>";
					html += "<td>" + obj.description + "</td>";
					html += "<td>" + obj.reg_dt + "</td>";
					html += "<td>" + obj.answer + "</td>";
					html += "<td>" + obj.text_open + "</td>";
					html += "</tr>";
					$("#AjaxBoard").append(html);
				});
			},
			error : function() {
				alert("Error");
			}
		});
	}
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
	
			<!--
				게시물의 총 갯수 / 10 한 뒤 소수점을 올림 처리 = 총 페이지 갯수가 나와.
			 -->
			<button type="button" onclick="javascript: loadBoardData(1);">1</button>
			<button type="button" onclick="javascript: loadBoardData(2);">2</button>
			<button type="button" onclick="javascript: loadBoardData(3);">3</button>
			<button type="button" onclick="javascript: loadBoardData(4);">4</button>
				
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #DDA520">
				<br>
				<br>
				<br>
				<button type="button" onclick="javascript: loadBoardData();">검색</button>
				<input type="text" id="search" name='search' onkeyup="if(window.event.keyCode==13){loadBoardData();}">
				</br>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">설명</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">답변여부</th>
						<th style="background-color: #eeeeee; text-align: center;">ID
							지워야함</th>
					</tr>
				</thead>

				<tbody id='AjaxBoard'>

				</tbody>


				<%-- 
					<c:forEach var="k1" items="${sang1lists}">
						<input type="hidden" name="p_id" id="p_id" value="${k1.p_id}">
						<th><a href="/boardview.do?p_id=${k1.p_id }"> ${k1.title} </a></th>
						<th>${k1.description}</th>
						<th>${k1.reg_dt}</th>
						<th>${k1.answer}</th>
						<th>${k1.user}</th>
						</tr>
					</c:forEach>
				--%>
			</table>
			<a href="/boardwrite.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>
