<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<style>
</style>
<script>
function selectRequest(selecter){
	
	
	if(selecter.value == "6"){
		
		let html = `<input id ='requestText' name='requestText' type='text' placeholder='요청사항을 입력해주세요'>`;
		let div = document.createElement('div');
		div.innerHTML = html;
		selecter.closest("div").append(div);
		
	}else{
		if(document.querySelector("#requestText")){
			document.querySelector("#requestText").parentNode.remove();
		}
	}
}
</script>
</head>
<body>
	<div>
		<form method="post">
			<div>
				<label>배송지 이름</label> <input name="addressName" type="text">
			</div>
			<div>
				<label>우편번호</label> <input name="postcode" type="text">
			</div>
			<div>
				<label>주소</label> <input name="address" type="text">
			</div>
			<div>
				<label>수령인</label> <input name="recipient" type="text">
			</div>
			<div>
				<label>배송 요청사항</label>
				<select name="requestCode" onchange="selectRequest(this);">
					<c:forEach items="${requestList}" var="item">
						<option value="${item.requestCode}">${item.requestDetails}</option>
					</c:forEach>
				</select>
			</div>
			<button>등록</button>
		</form>
	</div>
</body>
</html>