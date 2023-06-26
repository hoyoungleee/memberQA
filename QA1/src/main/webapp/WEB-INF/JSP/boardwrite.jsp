<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>List</title>
<%@include file="./header.jsp" %>
<style>
.centered {
	width: 400px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.container {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	text-align: center;
	margin-top: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #DDA520;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f9f9f9;
}

button {
	border: none;
	background-color: #4CAF50;
	color: #fff;
	padding: 8px 16px;
	cursor: pointer;
	border-radius: 3px;
	margin-right: 5px;
}

textarea {
	width: 100%;
	padding: 5px;
	border-radius: 3px;
	border: 1px solid #DDA520;
}

table tr th:first-child,
table tr td:first-child {
    height: 30px;
}


</style>

<script type="text/javascript">
	function formsubmit() {
		if ($("#tp").val() == "write") {
			$("#formWrite").attr("action", "/boardnewwrite.do").submit();
		} else {
			$("#formWrite").attr("action", "/updateaction.do").submit();
		}
	}
	
	
	
	
	$(document).ready(function() {
		  // 페이지가 로드될 때 실행되는 코드

		  // 라디오 버튼 그룹 상태 변경 이벤트 리스너
		  $('input[name="open"]').change(function() {
		    var selectedValue = $('input[name="open"]:checked').val();
		    $('#open').val(selectedValue);
		  });

		  $('input[name="open"][value="N"]').prop('checked', true);
		  $('#open').val('N');
		});


</script>
</head>
<body>
	<div class="centered">
		<div class="container">
			<h1>상세 페이지</h1>
			<form method="post" id="formWrite">
				<input type="hid den" name="tp" id="tp" value="${tp}">
				<input type="hid den" name="p_id" id="p_id" value="${update.p_id}">
				<input type="hid den" name="lv" id="lv" value="${update.lv}"> 
				<input type="hid den" name="open" id="open" value="${open}">
				<div>
					<table>
						<tr>
							<th>작성자</th>
							<td>${update.user}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><textarea rows="2" name="title" cols="90">${update.title}</textarea></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="5" name="description" cols="90">${update.description}</textarea></td>
						</tr>
						<tr>
							<th>답변</th>
							<td>
								<textarea rows="5" name="admin_answer" cols="90">${update.admin_answer}</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<button type="button" onclick="formsubmit()">저장</button>
					<button type="button" onclick="location.href='/boardlist.do'">목록</button>
					
					  <input type='radio' name='open' value='N' />공개
 					  <input type='radio' name='open' value='Y' />비공개
					<br>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
