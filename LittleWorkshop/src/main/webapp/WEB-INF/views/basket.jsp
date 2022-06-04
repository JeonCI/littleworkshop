<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<style>
.productImage {
	width: 100px;
	height: 100px;
}
</style>

<script>
	// 상품명, 판매자 아이디, 가격, 옵션정보, 상품 갯수, 상품사진
</script>
</head>
<body>
	<div>
		<h1>장바구니</h1>
		<div>
			<c:if test="${list.size() < 1 }">
				<div>장바구니가 비어있습니다</div>
			</c:if>

			<c:if test="${list.size() > 0 }">
			
				<c:forEach var="item" items="${list}">
					<div>
						<span>${item.productName}</span>
						<span>${item.sellerId}</span>
						<span>${item.orderInfo}</span>
						<span>${item.productAmount}</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>