<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./header.jsp" %>
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
	         var count = 0; // 게시물 개수를 저장할 변수

	         $.each(data, function(index, obj) {
	            var answer = obj.admin_answer == "" ? 'N' : 'Y';
	            var answerClass = answer === 'Y' ? 'answer-y' : 'answer-n';

	            var html = "<tr>" +
	            "<td><a href='/boardview.do?p_id=" + obj.p_id + "'>" + obj.title + "</a></td>" +
	            "<td>" + obj.description + "</td>" +
	            "<td>" + obj.reg_dt + "</td>" +
	            "<td class='" + answerClass + "'>" + answer + "</td>" +
	            "<td>" + obj.user + "</td>" +
	            "<td>" + obj.text_open + "</td>" +
	            "</tr>";

	        $("#AjaxBoard").append(html);

	            count++; // 각각의 게시물이 추가될 때마다 count 증가
	         });

	         // 게시물 개수 출력 또는 활용
	         console.log("게시물 개수:", count);
	         

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
      <!-- <div class="button-group">
         <button onclick="loadBoardData(1)">1</button>
         <button onclick="loadBoardData(2)">2</button>
         <button onclick="loadBoardData(3)">3</button>
         <button onclick="loadBoardData(4)">4</button>
      </div>
 -->


      <div class="container">
         <input type="hidden" name="cnt" value="${cnt}" />
         <div class="search-group">
            <input type="text" id="search" name='search'onkeyup="if(window.event.keyCode==13){loadBoardData(1);}" placeholder="검색어를 입력하세요">
            <button type="button" onclick="javascript: loadBoardData(1);">검색</button>
            <br>
            <a href="/boardwrite.do" class="add-button">글쓰기</a>
         </div>
         <table class="table">
         
            <thead>
               <tr>
                  <th>제목</th>
                  <th>설명</th>
                  <th>작성일</th>
                  <th>답변여부</th>
                  <th>ID</th>
                  <th>개방여부</th>
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

function createPageButtons(totalPages) {
	   var buttonGroup = $(".button-group");
	   buttonGroup.empty();

	   var searchQuery = $('#search').val(); // 검색어 가져오기
	   var maxPageCount = 5; // 최대 페이지 수 설정

	   var pageCount = (searchQuery !== '') ? Math.min(totalPages, maxPageCount) : totalPages;

	   for (var i = 1; i <= pageCount; i++) {
	      var button = $("<button>").text(i); 
	      button.click(function() {
	         var page = $(this).text();
	         loadBoardData(page);
	         buttonGroup.find("button").removeClass("active");
	         $(this).addClass("active");
	      });
	      buttonGroup.append(button);
	   }
	}

	// 페이지 버튼 생성
	var searchQuery = $('#search').val(); // 검색어 가져오기

	if (searchQuery !== '') {
	   // 검색어가 있는 경우 검색 결과의 개수를 가져와서 페이징 처리
	   $.ajax({
	      url: "/getSearchCount.do",
	      data: { 'searchQuery': searchQuery },
	      type: "GET",
	      dataType: "json",
	      success: function(response) {
	         var cnt = response.count; // 검색 결과의 개수
	         var pageSize = 10; // 페이지당 보여줄 개수
	         var totalPages = Math.ceil(cnt / pageSize); // 전체 페이지 수 계산
	         createPageButtons(totalPages);
	      },
	      error: function() {
	         console.log("Error");
	      }
	   });
	} else {
	   // 검색어가 없는 경우 전체 게시글 수를 사용하여 페이징 처리
	   var cnt = ${cnt}; // 전체 게시글 수
	   var pageSize = 10; // 페이지당 보여줄 개수
	   var totalPages = Math.ceil(cnt / pageSize); // 전체 페이지 수 계산
	   createPageButtons(totalPages);
	}


</script>
</html>