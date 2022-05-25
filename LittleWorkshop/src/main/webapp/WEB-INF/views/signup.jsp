<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
</head>
<body>
	<div>
		<form method="post">
			<div>
				<label>아이디 : </label>
				<input type="text" name="id">
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="text" name="passwd">
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
				<button>회원가입</button>
			</div>
		</form>
		
		<div>
			<div><a href="login">뒤로가기</a></div>
		</div>
	</div>
</body>	
</html>