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
                     <input type="hid den" name="tp" id="tp" value="${tp }">
                     <input type="hid den" name="p_id" id="p_id" value="${update.p_id }">
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
                                    <td><textarea rows="5" name="title" cols="100">${update.title }</textarea></td>
                                 </tr>
                                 <th>내용</th>
                                 <tr>
                                    <td><textarea rows="20" name="description" cols="100">${update.description }</textarea></td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div style="margin-left: 1px;">
                           <button type="button" onclick="formsubmit()" >저장</button>
                           <button type="button" onclick="location.href='/boardlist.do'" >목록</button>
                           <br>
                           광장에는 QnA 등록하면 삭제 기능이 없음
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