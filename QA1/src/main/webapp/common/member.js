//아이디중복확인
function idCheck() {
	var checkingId = document.getElementById("idCheck").value;
	var idInput = document.getElementById("idCheck");
	if (checkingId.length == 0) {
		alert("아이디를 입력하세요.")
		idInput.focus();
		return false;
	}
	$.ajax({
		anyne: true,
		type: "POST",
		url: "/checkId.do" + "?id=" + checkingId,
		contnetType: 'text',
		dataType: "text",
		success: function(result) {
			if (result == "0") {
				var useYn = confirm("사용가능한 아이디 입니다. 쓰시려면 확인을 눌러주세요.")
				if (useYn) {
					//부모창에서 자식창 넘길때는 openWin
					opener.document.getElementById("id").value = checkingId;
					opener.btn();
					window.close();
				}
				else {
					alert("아이디를 다시입력 후 중복확인을 눌러주세요")
				}
			}
			else {
				alert("중복입니다. 다른아이디를 골라주세요.")
			}
		}
	});
}
function checkPop() {
	var url = "./idCheck.do";
	var name = "idCheck popup";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	window.open(url, name, option);
	return false;
}
//주소검색관련
function addrSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = data.address; // 최종 주소 변수
			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("address1").value = addr;
		}
	}).open();
	opener.btn();
	window.close();
}
//폼값관련
function form() {

/*	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	var name = document.getElementById("name").value;
	var birth = document.getElementById("birth").value;
	var gender = document.querySelector('input[name="gender"]:checked').value;*/
	
	var address = addr(document.getElementById("address1").value, document.getElementById("dtlAddress").value);
	var email = document.getElementById("email1").value + "@" + document.getElementById("email2").value;
	
	var data = $("#member_info").serialize();
	
	data += "&address="+address+"&email="+email;
	

	$.ajax({
		anyne: true,
		type: "POST",
		//url: "/join.do" + "?id=" + id + "&&pw=" + pw + "&&name=" + name + "&&birth=" + birth + "&&gender=" + gender + "&&email=" + email + "&&address=" + address,
		url: "/join.do",
		contnetType: 'text',
		data : data,
		dataType: "text",
		success: function(result) {
			if (result == "1") {
				alert("회원가입 성공! 로그인 해주세요.");
				location.replace("/login.do");
			}
			else {
				alert("회원가입 실패");
			}
		}
	});
	return false;
}

function addr(addr1, addr2) {
	var addr = addr1 + " " + addr2;
	return addr;
}

function passCheck() {
	var pw = document.getElementById("pw").value;
	var confirmPw = document.getElementById("confirmPw").value;

	if (pw === confirmPw) {

		document.getElementById("passStatus").innerHTML = "비밀번호가 확인 되었습니다.";
	}
	else {
		document.getElementById("passStatus").innerHTML = "비밀번호가 위와 다릅니다.";
		document.getElementById("confirmPw").focus();
	}
}

function selectMail() {
	var selMail = document.getElementById("email3").value;

	document.getElementById("email2").value = selMail;

}

function nullCheck() {
	var id = document.getElementById("id").value;
	var idInput = document.getElementById("id");
	var pw = document.getElementById("pw").value;
	var pwInput = document.getElementById("pw").value;
	var confirmPw = document.getElementById("confirmPw").value;
	var confirmPwInput = document.getElementById("confirmPw");
	var name = document.getElementById("name").value;
	var nameInput = document.getElementById("name");
	var birth = document.getElementById("birth").value;
	var birthInput = document.getElementById("birth");
	var address = document.getElementById("address1").value;
	var addressInput = document.getElementById("address1")
	var dtladderess = document.getElementById("dtlAddress").value;
	var dtladderessInput = document.getElementById("dtlAddress");
	var email1 = document.getElementById("email1").value;
	var email1Input = document.getElementById("email1");
	var email2 = document.getElementById("email2").value;
	var email2Input = document.getElementById("email2");


	if (id.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("아이디를 입력해주세요.");
		idInput.focus();
		return false;
	}
	if (pw.trim() == "" || pw == null) {
		document.getElementById("joinBtn").disabled = true;
		alert("비밀번호를 입력해주세요.");
		pwInput.focus();
		return false;
	}
	if (confirmPw == "" || confirmPw == null) {
		document.getElementById("joinBtn").disabled = true;
		alert("비밀번호를 확인해주세요.");
		confirmPwInput.focus();
		return false;
	}
	if (name.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("이름을 입력해주세요.");
		nameInput.focus();
		return false;
	}
	if (birth.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("생년월일을 입력해주세요.");
		birthInput.focus();
		return false;
	}
	if (address.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("주소를 입력해주세요.");
		addressInput.focus();
		return false;
	}
	if (dtladderess.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("상세주소를 입력해주세요.");
		dtladderessInput.focus();
		return false;
	}
	if (email1.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("이메일 아이디를 입력해주세요.");
		email1Input.focus();
		return false;
	}
	if (email2.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("이메일주소를 입력해주세요.");
		email2Input.focus();
		return false;
	}
	if (pw !== confirmPw) {
		document.getElementById("joinBtn").disabled = true;
		alert("비밀번호를 다시 확인해 주세요.");
		confirmPwInput.focus();
		return false;
	}
	else {
			form();
	}
}
function btn() {
	document.getElementById("joinBtn").disabled = false;
}

function loginForm(){
	
	var id = document.getElementById("id").value;
	var idInput = document.getElementById("id");
	var pw = document.getElementById("pw").value;
	var pwInput = document.getElementById("pw").value;
	
	if (id.trim().length == 0) {
		document.getElementById("joinBtn").disabled = true;
		alert("아이디를 입력해주세요.");
		idInput.focus();
		return false;
	}
	if (pw.trim() == "" || pw == null) {
		document.getElementById("joinBtn").disabled = true;
		alert("비밀번호를 입력해주세요.");
		pwInput.focus();
		return false;
	}
	else{
		$.ajax({
		anyne: true,
		type: "POST",
		url: "/checkMember.do" + "?id=" + id + "&&pw=" + pw,
		contnetType: 'text',
		dataType: "text",
		success: function(result) {
			if (result == "1") {
				
				
				alert("로그인 성공! 환영합니다.");
			}
			else {
				alert("저장된 회원정보가 없습니다.");
			}
		}
	});
	return false;
	}
}