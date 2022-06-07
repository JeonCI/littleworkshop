<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<style>
span{
	font-weight: bold; 
}
#buyerContent >div {
border-bottom : 1px solid #dddddd;
margin-bottom: 10px;
padding-bottom: 10px;
width: 300px;
}
</style>
</head>
<body>
	<div id="buyerContent">
		<div>
			<span>주문배송</span>
			<div><a href="./orderList">주문내역</a></div>
			<div><a>취소/환불내역</a></div>
		</div>

		<div>
			<span>알림/메세지</span>
			<div><a>알림</a></div>
			<div><a>메세지</a></div>
		</div>
		<div>
			<span>나의 후기</span>
			<div><a>후기목록</a></div>
			<div><a>후기쓰기</a></div>
		</div>
		<div>
			<span>관심리스트</span>
			<div><a>좋아요 목록</a></div>
		</div>
		<div>
			<span>내 정보</span>
			<div><a href="./accountInfo_Edit">회원정보 관리</a></div>
			<div><a href="./address">배송지 관리</a></div>
		</div>
	</div>

</body>
</html>