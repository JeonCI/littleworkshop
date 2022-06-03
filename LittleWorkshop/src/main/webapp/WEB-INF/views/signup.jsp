<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<!-- css -->
<link rel="stylesheet" href="/css/sign_up.css">

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js">
 </script>


<script>
	let checkId = false;	
	$(function() {
		
		$('#checkId').click(function(){
			$.ajax('/checkId', {
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify({"id" : $(".id").val()}),
				success : (result)=> {
					if (result  === "OK"){
						alert("사용 가능한 아이디 입니다");
						checkId = true;
					}else
						alert("사용중인 아이디 입니다");
				},
				error: xhr => {
		            alert(`오류 발생: ${xhr.statusText}`);
		        }
				
			})		
		})
	});
function signup() {
	const form = document.getElementById("signup_form");
	//const regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	if(!checkId) {
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
	<div class="logo">
        <a href=".."><img src="image/logogo.png"></a>
    </div>
    <div class="login_area">
    <div class="login"><a href="../login">로그인</a></div>
    <div class="sign_up"><a>회원가입</a></div>
    </div>
    <div class="input">
	<div>
		<form id="signup_form" method="post">
			<input type="hidden" name="checkId">
			<div class="textbox">
            <label>아이디 <span>*</span></label>
				<input type="text" name="id" class="id">
				<button type="button" id="checkId">중복확인</button>
			</div>
			
			<div class="textbox">
				<label>비밀번호 <span>*</span></label>
                <input type="password" name="passwd" placeholder=" 숫자,영문,특수문자 조합 8자 이상">
            </div>
			
			<div class="textbox" id="pwdbox">
                <input type="password" name="passwd_confirm" placeholder=" 비밀번호 확인">
            </div>
			
			<div class="textbox">
                 <label>이름 <span>*</span></label>
            <input  type="text" name="accountName" placeholder=" 이름을 입력해주세요">
            </div>
			<div class="textbox">
				<label>닉네임</label>
				<input type="text" name="nickName">
			</div>
			<div class="textbox">
				<label>전화번호</label>
				<input type="text" name="phone">
			</div>
			<div class="textbox">
                <label>이메일 <span>*</span></label>
            <div class="email_box">
            <input class="email" type="email" name="email" placeholder=" 이메일을 입력해주세요">
            <button class="email_auth">인증요청</button>
			</div>
			</div>
			<div class="check_area">
            <div class="check_option">
            <label><input type="checkbox" name="color" value="blue">만 14세 이상입니다.&nbsp;&nbsp;<span>(필수)</span></label>         
            </div>
            <div class="check_option">
            <label><input type="checkbox" name="color" value="blue">이용약관 필수 동의&nbsp;&nbsp;<span>(필수)</span></label>
            <div class="terms">약관 보기</div>         
            </div>
            <div class="check_option">
            <label><input type="checkbox" name="color" value="blue">개인정보 수집 및 이용 동의&nbsp;&nbsp;<span>(필수)</span></label>
            <div class="privacy">약관 보기</div>               
            </div>
            </div>
			
			<div class="signup">
				<button class="button_signup" type="button" onclick="signup()">회원가입</button>
			</div>
		</form>
		</div>
	</div>
</body>	
</html>