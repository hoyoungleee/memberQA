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
        

        // 제목과 내용이 모두 입력되었을 경우, form을 제출할 URL을 설정하고 submit() 함수를 호출
        if ($("#tp").val() == "write") {
            $("#formWrite").attr("action", "/boardnewwrite.do").submit();
        } else {
            $("#formWrite").attr("action", "/updateaction.do").submit();
        }
    }
    
    

    $(document).ready(function() {
        // 페이지가 로드될 때 실행되는 코드

        // 내용 textarea의 입력값이 변경될 때마다 실행되는 이벤트 리스너
        $('textarea[name="description"]').on('input', function() {
            // 내용 textarea의 값이 비어있을 경우 저장 버튼 비활성화
            if ($(this).val() === '') {
                $('#saveButton').prop('disabled', true);
            } else {
                $('#saveButton').prop('disabled', false);
            }
        });
    });
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
							<td><textarea rows="2" name="title" cols="90">${update.title}</textarea></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="5" name="description" cols="90">${update.description}</textarea></td>
						</tr>
						
						<c:if test="${sessionlv.sessionlv eq '1' or id eq 'jisang034'}">
						    <tr>
						        <th>답변</th>
						        <td>
						            <textarea rows="5" name="admin_answer" cols="90">${update.admin_answer}</textarea>
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
</html>
