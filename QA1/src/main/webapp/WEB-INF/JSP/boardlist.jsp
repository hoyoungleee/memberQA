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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
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
	         var count = 0; // 게시물 개수를 저장할 변수

	         $.each(data, function(index, obj) {
	        	var answer = obj.admin_answer === null || obj.admin_answer === "" ? 'N' : 'Y';
	            var answerClass = answer === 'Y' ? 'answer-y' : 'answer-n';
	            var idValue = $('#id').val();
	            var count = obj.cnt;
	            
	            
	            var html = "<tr>" 
	            + "<td><a id = 'alert"+obj.p_id+"'  href='/boardview.do?p_id=" + obj.p_id + "'>" + obj.title + "</a></td>"
	                  + "<td>" + obj.description + "</td>" + "<td>"
	                  + obj.reg_dt + "</td>"
	                  + "<td class='" + answerClass + "'>" + answer
	                  + "</td>" 
	                  + "<td>"+ obj.user + "</td>" 
	                  + "<td>"+ obj.text_open + "</td>" 
	                  + "</tr>";

	            
	            $("#AjaxBoard").append(html);
	               console.log(count);
	               $("#countmax").val(count);
	            
	            //비밀글 ✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡ 형태 확인하기 ✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡✡
	            $('#alert'+obj.p_id).on('click', function(){
	            	if(idValue =='jisang034'){
	            		return true;
	            	}else{
	            		
	            	if(obj.text_open =='Y'&& obj.user!=idValue){
	            			alert("비밀글 입니다.");
	            			return false;
	            	}
	            	}
	            });
	         });

	         var cnt = $('#countmax').val(); // 게시글 수
	            console.log("cnt:"+cnt);
	            var pageSize = 10; // 페이지당 보여줄 개수
	            var totalPages = Math.ceil(cnt / pageSize); // 전체 페이지 수 계산
	            //$('#maxcount').val(count);
	            createPageButtons(totalPages);
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
      <div class="container">
         <input type="hidden" id = "id" name="id" value="${id}" />
         <div class="search-group">
            <input type="text" id="search" name='search'onkeyup="if(window.event.keyCode==13){loadBoardData(1);}" placeholder="검색어를 입력하세요">
            <button type="button" onclick="javascript: loadBoardData(1);">검색</button>
            <br>
            <a href="/boardwrite.do" class="add-button">글쓰기</a>
         </div>
         총 게시물 수 <input type="text" id="countmax" readonly style="outline:none;border-style: none;width:20px;font-size:18px"> 개
         <table class="table">
         
            <thead>
               <tr>
                  <th>제목</th>
                  <th>설명</th>
                  <th>작성일</th>
                  <th>답변여부</th>
                  <th>ID</th>
                  <th>비밀</th>
               </tr>
            </thead>
            <tbody id="AjaxBoard">
            </tbody>
         </table>
         <br>
         <div class="button-group"></div>
      </div> 
      
      
</body>
<script type="text/javascript">


//페이지 버튼
function createPageButtons(totalPages) {
	   // 버튼 그룹 요소를 가져
	   var buttonGroup = $(".button-group");
	   // buttonGroup 초기화 
	   buttonGroup.empty();

	   // totalPages 만큼 반복하여 페이지 버튼을 생성
	   for (var i = 1; i <= totalPages; i++) {
	      // 숫자 i를 텍스트로 갖는 버튼 요소를 생성
	      var button = $("<button>").text(i);
	      // 버튼 클릭 이벤트를 정의
	      button.click(function() {
	         // 클릭한 버튼의 텍스트 값을 가져와서 page 변수에 저장
	         var page = $(this).text();
	         // 해당 페이지의 게시물 데이터를 로드하는 함수를 호출
	         loadBoardData(page);
	         // 버튼 그룹 내의 모든 버튼에서 "active" 클래스를 제거
	         buttonGroup.find("button").removeClass("active");
	         //클릭한 버튼에 "active" 클래스를 추가
	         $(this).addClass("active");
	      });
	      // 버튼을 버튼 그룹에 추가(생성)
	      buttonGroup.append(button);
	   }
	}


// 페이지 버튼 생성
var cnt = $('#countmax').val(); // 게시글 수
console.log("cnt:"+cnt);
var pageSize = 10; // 페이지당 보여줄 개수
var totalPages = Math.ceil(cnt / pageSize); // 전체 페이지 수 계산

</script>
</html>