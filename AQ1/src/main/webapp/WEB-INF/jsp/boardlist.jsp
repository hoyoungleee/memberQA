<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
	}

	.container {
		max-width: 960px;
		margin: 0 auto;
		padding: 20px;
	}

	.table {
		width: 100%;
		border-collapse: collapse;
	}

	.table th,
	.table td {
		border: 1px solid #ddd;
		padding: 8px;
	}

	.table th {
		background-color: #f9f9f9;
		text-align: center;
	}

	.table td {
		text-align: left;
	}

	.button-group {
		margin-bottom: 20px;
	}

	.button-group button {
		border: none;
		background-color: #4CAF50;
		color: #fff;
		padding: 10px 16px;
		cursor: pointer;
		margin-right: 5px;
	}

	.button-group button:hover {
		background-color: #45a049;
	}

	.search-group {
		margin-bottom: 20px;
	}

	.search-group input[type="text"] {
		padding: 8px;
		border: 1px solid #ddd;
	}

	.add-button {
		float: right;
		background-color: #4CAF50;
		border: none;
		color: #fff;
		padding: 10px 16px;
		text-decoration: none;
	}

	.add-button:hover {
		background-color: #45a049;
	}

	.error-message {
		color: red;
		font-weight: bold;
	}

	.success-message {
		color: green;
		font-weight: bold;
	}
</style>
<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			loadBoardData(1);
		});

		function loadBoardData(page) {
			$.ajax({
				url: "/boardAjax.do",
				data: {
					'search': $('#search').val(),
					'page': ((page * 10) - 10),
					/* 'p_id' : &('p_id').val() */
				},
				type: "get",
				dataType: "json",
				success: function(data) {
					$("#AjaxBoard").empty();
					$.each(data, function(index, obj) {
						var count = 0;
						var html = "<tr>" +
							"<td><a href='/boardview.do?p_id=" + obj.p_id + "'>" + obj.title + "</a></td>" +
							"<td>" + obj.description + "</td>" +
							"<td>" + obj.reg_dt + "</td>" +
							"<td>" + obj.answer + "</td>" +
							"<td>" + obj.text_open + "</td>" +
							"<td>" + obj.p_id + "</td>" +
							"</tr>";
						$("#AjaxBoard").append(html);
					});
				},
				error: function() {
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
	width: 380px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<div class="button-group">
			<button onclick="loadBoardData(1)">1</button>
			<button onclick="loadBoardData(2)">2</button>
			<button onclick="loadBoardData(3)">3</button>
			<button onclick="loadBoardData(4)">4</button>
		</div>

		<div class="search-group">
			
			<button type="button" onclick="javascript: loadBoardData(1);"  >검색</button>
				<input type="text" id="search" name='search' onkeyup="if(window.event.keyCode==13){loadBoardData();}" placeholder="검색어를 입력하세요">
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>설명</th>
					<th>작성일</th>
					<th>답변여부</th>
					<th>ID</th>
				</tr>
			</thead>
			<tbody id="AjaxBoard">
			</tbody>
		</table>

		<a href="/boardwrite.do" class="add-button">글쓰기</a>
	</div>
</html>
