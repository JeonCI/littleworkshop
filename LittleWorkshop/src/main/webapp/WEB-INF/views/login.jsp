<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<!--공통dd CDN -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 

<!--공통 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/css/login.css">

</head>
<body>
	<div class="logo">
        <a href="."><img src="image/logogo.png"></a>
    </div>
    <div class="login_area">
	    <c:if test="${msg != null }">
			<h1>${msg }</h1>
		</c:if>
	    <div class="login"><a>로그인</a></div>
		<div class="sign_up"><a href="signup">회원가입</a></div>
    </div>
    <form method="post">
    <div class="textbox">
         <input class="login_box" type="text" name="id" placeholder=" 아이디">
         <input class="login_box" type="password" name="passwd" placeholder=" 비밀번호">        
        <div class="login_option">
            <label><input type="checkbox" name="color" value="blue"><span>아이디저장</span></label>
            <div id="find"><a href="#">아이디 찾기</a></div>
            <div>｜</div>
            <div><a href="#">비밀번호 찾기</a></div>
        </div>
    <button class="login-btn">로그인</button>
    <hr>
    <div class="login_sns">
        <button type="button" class="btn-sns"><img src="image/kakao_login.jpg"></button>
        <button type="button" class="btn-sns"><img src="image/naver_login.jpg"></button>
    </div>
    </div>
    </form>
</body>	
</html>