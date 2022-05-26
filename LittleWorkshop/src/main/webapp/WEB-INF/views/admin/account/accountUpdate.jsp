<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LittleWorkshop</title>

</head>
<body>
	<div>
		<div>
			<form method="post">
				<div>
					<label>아이디 : </label>
					<input type="text" value="${item.id }" readonly="readonly">
				</div>
				<div>
					<label>이 름 : </label>
					<input type="text" value="${item.accountName }" readonly="readonly" name="accountName">
				</div>
				<div>
					<label>닉네임 : </label>
					<input type="text" value="${item.nickname }" readonly="readonly" name="nickname">
				</div>
				<div>
					<label>핸드폰 번호 : </label>
					<input type="text" name="phone" value="${item.phone}" readonly="readonly">
				</div>
				<div>
					<label>이메일 : </label>
					<input type="email" name="email" readonly="readonly" value="${item.email }">
				</div>
				<div>
					<label>회원 유형 : </label>
					<select name="noticeImportant">
						<option value="1" ${item.classify == 1 ? 'selected':''}>일반 회원</option>
						<option value="2" ${item.classify == 2 ? 'selected':''}>판매자</option>
						<option value="3" ${item.classify == 3 ? 'selected':''}>관리자</option>
					</select>
				</div>
				<button>변경하기</button>
			</form>
			<a href="../accountList">뒤로가기</a>
		</div>
	</div>
</body>
</html>