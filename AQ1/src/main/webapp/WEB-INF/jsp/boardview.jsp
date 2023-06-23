<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
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

	th,
	td {
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

	a {
		text-decoration: none;
		color: #4CAF50;
		margin-right: 5px;
	}

</style>
</head>
<body>
	<div class="centered">
		<div class="container">
			<div>
				<h1>상세 페이지</h1>
			</div>
			<div>
				<form method="post">
					<input type="hid den" name="p_id" value="${viewlist.p_id}" /> 게시글 일련번호
					<input type="hid den" name="lv" value="${viewlist.lv}" /> 권한(게시글 작성자 권한이라서 접속자로 바꿔야함)
					<div>
						<table>
							<tr>
								<th>작성자</th>
								<td>${viewlist.user}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td name="title">${viewlist.title}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td name="description">${viewlist.description}</td>
							</tr>
							<tr>
								<th>답변</th>
								<td name="answer" >${viewlist.admin_answer}</td>
							</tr>
						</table>
					</div>
					<div>
						<button type="button" onclick="location.href='/boardlist.do'">목록</button>
						<a href="/update.do?p_id=${viewlist.p_id}">수정</a>
						<a href="/delete.do?p_id=${viewlist.p_id}">삭제</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>