<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function() {
	
// 	if(document.getElementById("editBtn").value){
// 		alert("정상적으로 변경되었습니다.");
// 	}

	document.getElementById("editBtn").onclick = function(){
		$.ajax({
			type: "post",
			url:"./accountInfo_Edit",
			data: $("#editForm").serialize(),
			success: function(result){
				if(result){
					alert("정상적으로 변경되었습니다.");
				}
			},error: function(){
				console.log("실패");
			}
			
		});
	};

};

</script>
</head>
<body>
	<div>
		<form id="editForm"  method="post">
			<div>
				<span>이름</span>
				<input name="accountName" type="text" value="${item.accountName}" readonly="readonly">
			</div>
			<div>
				<span>닉네임</span>
				<input name="nickName" type="text" value="${item.nickName}">
			</div>
			<div>
				<span>전화번호</span>
				<input name="phone" type="text" value="${item.phone}">
			</div>
			<div>
				<span>이메일</span>
				<input name="email" type="text" value="${item.email}">
			</div>
			<div>
				<button id="editBtn" value="${edit}" type="button">회원정보 수정하기</button>
			</div>
		</form>
	</div>
</body>
</html>