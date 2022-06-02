<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js">
 </script>


<script>
	let checkId = true;	
	$(function() {
		//success와 error사이에 먼가없음
		$('#checkId').click(function(){
			$.ajax('/checkId', {
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify({"id" : $(".id").val()}),
				success : (result)=> {
					if (result  === "OK")
						alert("사용 가능한 아이디 입니다");
					else
						alert("사용중인 아이디 입니다");
				},
				error: xhr => {
		            alert(`오류 발생: ${xhr.statusText}`);
		        }
				
			})		
		})
	});

	/*function check_id_Async() {	
		
			
	console.log("왜 안돼");
		
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();
		
		console.log(xhr.readyState);
		
		
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			if(xhr.readyState == XMLHttpRequest.DONE) {
				if(xhr.status == 200) {
					const result = xhr.responseText;
				
					if(result == "OK"){
						alert(`\${form.id.value}는 사용 가능한 아이디 입니다`);
						form.checkId.value = form.id.value;
					}
					else
						alert(`${form.id.value}는 이미 사용중인 아이디 입니다`);
				}
			}
		}
		
		xhr.open("GET",`checkId?id=\${form.id.value}`,true);
		
		xhr.send();	*/
		
		
// }
function signup() {
	const form = document.getElementById("signup_form");
	//const regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	if(form.checkId.value != form.id.value) {
		alert("아이디를 중복 검사를 해 주세요");
		return;
	}
	
	if(form.id.value == "") {
		alert("아이디를 입력 해 주세요");
		form.id.focus();
		return;
	}
	

	if(form.passwd.value == "") {
		alert("비밀번호를 입력 해 주세요");
		form.passwd.focus();
		return;
	}
	


	if(form.passwd_confirm.value == "") {
		alert("비밀번호를 확인 해 주세요");
		form.passwd_confirm.focus();
		return;
	}
	
	if(form.passwd_confirm.value != form.passwd.value) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		form.passwd.value = "";
		form.passwd_confirm.value = "";
		form.passwd.focus();
		return;
	}
	

	if(form.accountName.value == "") {
		alert("이름를 입력 해 주세요");
		form.accountName.focus();
		return;
	}
	

	if(form.nickName.value == "") {
		alert("닉네임을 입력 해 주세요");
		form.nickName.focus();
		return;
	}
	
	if(form.phone.value == "") {
		alert("전화번호를 입력 해 주세요");
		form.phone.focus();
		return;
	}
	
	if(form.email.value == "") {
		alert("이메일을 입력 해 주세요");
		form.email.focus();
		return;
	}

	form.submit();
}
</script>
</head>
<body>
	<div>
		<form id="signup_form" method="post">
			<input type="hidden" name="checkId">
			<div>
				<label>아이디 : </label>
				<input type="text" name="id" class="id">
				<button type="button" id="checkId">중복확인</button>
			</div>
			
			<div>
				<label>비밀번호 : </label>
				<input type="password" name="passwd">
			</div>
			
			<div>
	            <label>비밀번호 확인:</label> 
	            <input type="password" name="passwd_confirm">
         	</div>
			
			<div>
				<label>성명 : </label>
				<input type="text" name="accountName">
			</div>
			<div>
				<label>닉네임 : </label>
				<input type="text" name="nickName">
			</div>
			<div>
				<label>전화번호 : </label>
				<input type="text" name="phone">
			</div>
			<div>
				<label>이메일 : </label>
				<input type="email" name="email">
			</div>
			
			<div>
				<button type="button" onclick="signup()">회원가입</button>
			</div>
		</form>
		
		<div>
			<div><a href="login">뒤로가기</a></div>
		</div>
	</div>
</body>	
</html>