<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.table th, .table td {
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

/* Y일 때 스타일 */
.answer-y {
	background-color: green;
	color: white;
}

/* N일 때 스타일 */
.answer-n {
	background-color: red;
	color: white;
}

/* 수정된 스타일 시작 */
.container {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	background-color: #fff;
}

.button-group {
	text-align: center;
}

.button-group button {
	border-radius: 5px;
	margin: 0 5px;
}

.search-group {
	text-align: center;
}

.search-group input[type="text"] {
	width: 300px;
	border-radius: 5px;
}

.add-button {
	border-radius: 5px;
}

.table {
	margin-top: 20px;
}

.table th, .table td {
	padding: 10px;
}

.add-button {
	margin-top: 20px;
}

.shorttitle {
	width: 380px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
/* 수정된 스타일 끝 */
</style>
<!-- SJ    -->
<!-- <script type = "text/javascript" src = "../js/board.js"></script> -->

<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		loadBoardData(1);
	});
	function loadBoardData(page) {
		$.ajax({
			url : "/boardAjax.do",
			data : {
				'search' : $('#search').val(),
				'page' : ((page * 10) - 10),
			},
			type : "get",
			dataType : "json",
			success : function(data) {
				$("#AjaxBoard").empty();
				$.each(data, function(index, obj) {
					var count = 0;
					var answer = obj.admin_answer == "" ? 'N' : 'Y';

					// answer 값에 따라 클래스를 동적으로 지정
					var answerClass = answer === 'Y' ? 'answer-y' : 'answer-n';

					var html = "<tr>" + "<td><a href='/boardview.do?p_id="
							+ obj.p_id + "'>" + obj.title + "</a></td>"
							+ "<td>" + obj.description + "</td>" + "<td>"
							+ obj.reg_dt + "</td>"
							+ "<td class='" + answerClass + "'>" + answer
							+ "</td>" + "<td>" + obj.p_id + "</td>" + "<td>"
							+ obj.user + "</td>" + "</tr>";
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
</head>
<body>
		<!--
		
		 <div class="button-group">
			<button onclick="loadBoardData(1)">1</button>
			<button onclick="loadBoardData(2)">2</button>
			<button onclick="loadBoardData(3)">3</button>
			<button onclick="loadBoardData(4)">4</button>
		</div>
 -->


		<div class="container">
			<div class="button-group"></div>

			<div class="search-group">
				<input type="text" id="search" name='search'onkeyup="if(window.event.keyCode==13){loadBoardData(1);}" placeholder="검색어를 입력하세요">
				<button type="button" onclick="javascript: loadBoardData(1);">검색</button>
			</div>
			<input type="hid den" name="cnt" value="${cnt}" />
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
</body>


<script type="text/javascript">
/* 페이징 처리 주석  */
for (var i = 1; i <= totalPages; i++) {
	var button = $("<button>").text(i); // 새로운 버튼 엘리먼트 생성하고 텍스트로 현재 페이지 번호 설정

	button.click(function() {
		var page = $(this).text(); // 클릭된 버튼의 텍스트인 페이지 번호 저장
		loadBoardData(page); // 해당 페이지의 데이터를 불러오기 위해 loadBoardData 함수 호출

		buttonGroup.find("button").removeClass("active"); // 버튼 그룹 내의 모든 버튼에서 active 클래스 제거
		$(this).addClass("active"); // 클릭된 버튼에 active 클래스 추가하여 활성화 상태로 표시
	});

	buttonGroup.append(button); // 버튼을 버튼 그룹에 추가
}

}

// 페이지 버튼 생성
var cnt = ${cnt}; // 게시글 수
var pageSize = 10; // 페이지당 보여줄 개수
var totalPages = Math.ceil(cnt / pageSize); // 전체 페이지 수 계산
createPageButtons(totalPages);

</script>
</html>
