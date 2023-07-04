<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	padding: 10px;
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




<script type="text/javascript">
    function formsubmit() {
        var title = $('textarea[name="title"]').val();
        var description = $('textarea[name="description"]').val();

       
        // 제목이 비어있는 경우
        if (title === '') {
            alert('제목을 확인해주세요.');
            return;
        }

        // 내용이 비어있는 경우
        if (description === '') {
            alert('내용을 확인해주세요.');
            return;
        }
        
        
        if($("#tp").val() != "write" && $("#sessionlv").val()==='1'){
        //에디터 값 넣기
		oEditors.getById["admin_answer"].exec("UPDATE_CONTENTS_FIELD", []);
		var contents = document.getElementById("admin_answer").value;
        
        }

        // 제목과 내용이 모두 입력되었을 경우, form을 제출할 URL을 설정하고 submit() 함수를 호출
        if ($("#tp").val() == "write") {
            $("#formWrite").attr("action", "/boardnewwrite.do").submit();
        } else {
            $("#formWrite").attr("action", "/updateaction.do").submit();
          
        }
    }
    
</script>


</head>
<body>
	<div class="centered">
		<div class="container">
			<h1>상세 페이지</h1>
			<form method="post" id="formWrite">
				<input type="hidden" name="tp" id="tp" value="${tp}">
				<input type="hidden" name="id" id="id" value="${id}"> 
				<input type="hidden" name="p_id" id="p_id" value="${update.p_id}"> 
				<input type="hidden" name="open" id="open" value="${open}"> 
				<input type="hidden" name="sessionlv" id="sessionlv" value="${sessionlv.sessionlv}">
				<div>
					<table>
						<tr>
							<th>작성자</th>
							<td>
					 			<c:choose>
					                <c:when test="${tp eq 'write'}">${id}</c:when>
					                <c:when test="${tp eq 'modify'}">${update.user}</c:when>
					            </c:choose>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><textarea rows="1" name="title" cols="90">${update.title}</textarea></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="3" name="description" cols="90">${update.description}</textarea></td>
						</tr>
						
						<c:if test="${sessionlv.sessionlv eq '1'}">
						    <tr>
						        <th>답변</th>
						        <td>
						            <%-- <textarea rows="5" name="admin_answer" cols="90">${update.admin_answer}</textarea> --%>
						            <textarea id = "admin_answer" name="admin_answer" >${update.admin_answer}</textarea>
						        </td>
						    </tr>
						</c:if>
						
					</table>
				</div>
				<div>
					<button id ="saveButton" type="button" onclick="formsubmit()">저장</button>
					<button type="button" onclick="location.href='/boardlist.do'">목록</button>
					
					  <input type='radio' name='open' value='N' />공개
 					  <input type='radio' name='open' value='Y' />비공개
					<br>
				</div>
			</form>
		</div>
	</div>
</body>
<!--  에티터  Script Start-->
<script type="text/javascript" src="${pageContext.request.contextPath}/libs/smarteditor/js/HuskyEZCreator.js"charset="utf-8"></script>
<script type="text/javascript">

/*
- oAppRef: 에디터 객체를 저장할 배열
- elPlaceHolder: 에디터를 삽입할 텍스트 에어리어의 ID
- sSkinURI: 스마트 에디터 스킨 파일의 경로
- fCreator: 에디터를 생성할 함수 이름
*/


/* 
에디터 크기 변경시 아래 경로에 htDimension 부분 수정 
/QA1/src/main/resources/static/libs/smarteditor/js/SE2BasicCreator.js

 */
 //에디터 호풀
	//에디터 객체를 저장하는 배열
	var oEditors = [];
	window.onload = function(){
	nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "admin_answer", //에디터를 적용할 texterear ID
				sSkinURI : "${pageContext.request.contextPath}/libs/smarteditor/SmartEditor2Skin.html", //Editor HTML 경로
				fCreator : "createSEditor2"
			});
	}

	
	
	
	
</script>
</html>
