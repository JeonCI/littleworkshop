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
.productImage >a>img{
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
				<c:forEach var="seller" items="${sellerList}">
					<span>${seller}</span>
					<c:forEach var="item" items="${list}">
						<c:if test="${seller == item.sellerId}">
							<div>
								<c:forEach var="image" items="${item.productImageList}" end="0">
									<div class="productImage">
										<a href="product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
									</div>
								</c:forEach>

								<span>${item.productName}</span>
								<c:forEach var="info" items="${item.basketList}">
									<span>${info.orderInfo}</span>
									<span>${info.productAmount}</span>
								</c:forEach>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>

		</div>
	</div>
</body>
</html>