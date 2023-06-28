<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
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
					<input type="hidden" name="p_id" value="${viewlist.p_id}" />
					<input type="hidden" name="lv" value="${viewlist.lv}" />
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="sessionlv" value="${sessionlv.sessionlv}" />
					<input type="hidden" name=user value="${viewlist.user}" />
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
						
						<c:if test="${viewlist.admin_answer==null or viewlist.admin_answer=='' or sessionlv.sessionlv=='1'}">
						<a href="#" onclick="myupdatepage()">수정</a>
						</c:if>
						<a href="#" onclick ="mydeletepage()">삭제</a>
						 <%-- <a href="/boardupdate.do?p_id=${viewlist.p_id}">답글달기</a> --%>
						<%-- <a href="/boarddelete.do?p_id=${viewlist.p_id}">삭제</a> --%>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	window.onload = function() {
		// 페이지 로드 시 실행되는 함수

		// "answer" 이름을 가진 요소를 찾아서 가져옴
		var answerElement = document.getElementsByName("answer")[0];

		// 요소의 내용이 비어있는지 확인
		if (answerElement.innerHTML.trim() === "") {
			// 내용이 비어있는 경우, "답변 준비중입니다"로 설정하고 두꺼운 글씨체로 표시
			answerElement.innerHTML = "<strong>답변 준비중입니다</strong>";
		}
	}
		
	 </script>
<script>
	 /* id값 같을때 수정하기  */
function myupdatepage() {
    var idValue = "${id}";
    var userValue = "${viewlist.user}";
    var p_id = "${viewlist.p_id}";

    if (idValue === userValue || idValue === "jisang034") {
        // id와 user 값이 같거나 idValue가 "jisang034"일 경우, 수정 페이지로 이동
        location.href = "/boardupdate.do?p_id=" + p_id;
    } else {
        // id와 user 값이 다를 경우 또는 idValue가 "jisang034"가 아닐 경우, 알림 창 띄우기
        alert("작성자만 수정 가능합니다.");
    }
}

	 
	 
	 
    /* id값 같을때 삭제하기  */
    function mydeletepage(){
    	 var idValue = "${id}";
         var userValue = "${viewlist.user}";
         var p_id = "${viewlist.p_id}";
         
         if (idValue === userValue) {
             // id와 user 값이 같을 경우, 수정 페이지로 이동
             location.href = "/boarddelete.do?p_id=" + p_id;
         } else {
             // id와 user 값이 다를 경우, 알림 창 띄우기
             alert("삭제 권한이 없습니다.");
         }
     }
	 
	 
	 
	 
	 
	 
</script>


	 
	 
</html>
