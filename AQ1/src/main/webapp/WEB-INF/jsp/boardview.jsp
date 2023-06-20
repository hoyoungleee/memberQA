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
	margin-left: -200px;
}

td {
	border: 1px solid #DDA520;
}

.container {
	font-family: arial;
	font-size: 24px;
	margin: 25px;
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<div class="centered">
		<div style="margin-bottom: 20px; margin-left: 1px;">
			<div>
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상세
					페이지</h1>
			</div>
		</div>
		<div class="container">
			<div style="margin-left: -200px;">
				<div>
					<div>
						<div>
							<form method="post">
								<input type="hid den" name="p_id" value="${viewlist.p_id}" />
								<div style="text-align: center;">
									<table width="750">
										<colgroup>
											<col width="250px" />
											<col />
										</colgroup>
										<tbody>
											<th>작성자</th>
											<tr>
												</td>
											</tr>
											<th>제목</th>
											<tr>
												<td name="title">${viewlist.title }</td>
											</tr>
											<th>내용</th>
											<tr>
												<td name="description">${viewlist.description }</td>
											</tr>
											<th>답변</th>
											<tr>
												<td name="answer">${viewlist.answer }</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div style="margin-left: 1px;">
									<button type="button" onclick="location.href='/boardlist.do'">목록</button>
									<a href="/update.do?p_id=${viewlist.p_id}">수정</a>
									<a href="/delete.do?p_id=${viewlist.p_id}">삭제</a>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>