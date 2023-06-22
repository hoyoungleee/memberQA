<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리의 최신 버전을 가져옴 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

   textarea {
      width: 100%;
      padding: 5px;
      border-radius: 3px;
      border: 1px solid #DDA520;
   }

</style>

<script type="text/javascript">
   function formsubmit() {
      if ($("#tp").val() == "write") {
         $("#formWrite").attr("action", "/write.do").submit();
      } else {
         $("#formWrite").attr("action", "/updateaction.do").submit();
      }
   }
</script>
</head>
<body>
   <div class="centered">
      <div class="container">
         <div>
            <h1>상세 페이지</h1>
         </div>
         <div>
            <form method="post" id="formWrite">
               <input type="hid den" name="tp" id="tp" value="${tp}"> 상태</br>
               <input type="hid den" name="p_id" id="p_id" value="${update.p_id}">게시글 일련번호</br>
               <input type="hid den" name="lv" id="lv" value="${update.lv}">권한</br>(게시글 작성자 권한이라서 접속자계정 세션으로 받아서 해야함)
               <div>
                  <table>
                     <tr>
                        <th>작성자</th>
                        <td>${update.user}</td>
                     </tr>
                     <tr>
                        <th>제목</th>
                        <td><textarea rows="5" name="title" cols="90">${update.title}</textarea></td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td><textarea rows="10" name="description" cols="90">${update.description}</textarea></td>
                     </tr>
                     <tr>
                        <th>답변</th>
                        <td><textarea rows="10" name="admin_answer" cols="90">${update.admin_answer}</textarea></td>
                     </tr>
                  </table>
               </div>
               <div>
                  <button type="button" onclick="formsubmit()">저장</button>
                  <button type="button" onclick="location.href='/boardlist.do'">목록</button>
                  <br>
               </div>
            </form>
         </div>
      </div>
   </div>
</body>

</html>