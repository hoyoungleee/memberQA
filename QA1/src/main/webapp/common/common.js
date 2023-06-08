/**
 * 
 */
$.ajax({

        // 요청할 url을 입력합니다.
        url : requestUrl,

        // 통신 타입을 설정합니다. POST 또는 GET을 사용할 수 있습니다.
        type : 'POST',

        // 비동기 호출 전송 설정 값으로 true/false 를 선택하고 기본값은 true입니다.
        async : true,

        // 서버에 요청 시 전송할 파라미터를 기입합니다. (key / value 형식의 객체)
        data : {name : "홍길동"},

        // 응답 받을 데이터의 타입을 선택합니다. (xml / html / json / jsonp / script / text)
        // 선언하지 않으면 default는 서버가 주는 응답의 mimetype을 기본으로 합니다.
        dataType : "json",

        // 요청에 대한 응답 제한 시간으로 단위는 millisecond 입니다.
        timeout : 10000,    

        // 서버에 데이터를 보낼 때 형식을 지정합니다.  기본값은 "application/x-www-form-urlencoded"입니다.
        contentType : "application/json",

        // HTTP 요청 전에 발생하는 이벤트 핸들러 입니다.
        beforeSend : function() {        

        },


        // HTTP 요청 성공 시 이벤트 핸들러 입니다.
        success : function(data) {            

        },


        // HTTP 요청 실패 시 이벤트 핸들러 입니다.
        error : function(request,status,error) {

        },


        // HTTP 요청 완료 시 이벤트 핸들러 입니다.
        complete : function() {

        }


});