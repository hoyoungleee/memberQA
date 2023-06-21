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
                     <form method="post" id="formWrite" >
                     <input type="hid den" name="tp" id="tp" value="${tp }"> 상태</br>
                     <input type="hid den" name="p_id" id="p_id" value="${update.p_id }">게시글 일련번호</br>
                     <input type="hid den" name="lv" id="lv" value="${update.lv }">권한</br>(게시글 작성자 권한이라서 접속자계정 세션으로 받아서 해야함)
                        <div style="text-align: center;">
                           <table>
                              <colgroup>
                                 <col width="250px" />
                                 <col />
                              </colgroup>
                              <tbody>
                                 <th>작성자</th>
                                 <tr>
                                    <td>asd</td>
                                 </tr>
                                 <th>제목</th>
                                 <tr>
                                    <td><textarea rows="5" name="title" cols="90">${update.title }</textarea></td>
                                 </tr>
                                 <th>내용</th>
                                 <tr>
                                    <td><textarea rows="10" name="description" cols="90">${update.description }</textarea></td>
                                 </tr>
                                 <th>답변</th>
                                 <tr>
                                    <td><textarea rows="10" name="admin_answer" cols="90">${update.admin_answer }</textarea></td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div style="margin-left: 1px;">
                           <button type="button" onclick="formsubmit()" >저장</button>
                           <button type="button" onclick="location.href='/boardlist.do'" >목록</button>
                           <br>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
<script type="text/javascript">
function formsubmit(){
    if($("#tp").val() == "write"){
       $("#formWrite").attr("action", "/write.do").submit();
    }else{
       $("#formWrite").attr("action","/updateaction.do").submit();
    }
}
</script>
</html>