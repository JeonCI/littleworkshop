<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
* {
	margin: 0px;
	padding: 0px;
}

#wrap {
	width: 1000px;
}

#buyerInfo>div:nth-child(2)>div {
	display: flex;
}

#buyerInfo>div:nth-child(2)>div>span:nth-child(2) {
	margin-left: auto;
	color: #888888;
	cursor: pointer;
	font-size: 13px;
}

#buyerInfo>div:nth-child(2)>div>span:nth-child(2)>span {
	vertical-align: middle;
	width: 30px;
	height: 26px;
}

#buyerInfo>div>div>span:nth-child(1) {
	width: 80px;
	display: flex;
}

#buyerInfo>div:nth-child(2)>div>span:nth-child(1) {
	width: 80px;
	display: flex;
	display: inline-block;
	margin-bottom: 20px;
	font-weight: 600;
}

#buyerInfo>div>span:nth-child(1) {
	margin-bottom: 20px;
	font-size: 18px;
	display: inline-block;
	font-weight: 600;
}

#buyerInfo>div>select {
	width: -webkit-fill-available;
	margin-bottom: 5px;
	display: flex;
}

#buyerInfo, #payChk, #paymentInfo {
	border: 1px solid #dddddd;
	margin-bottom: 30px;
	padding: 30px;
}

#buyerInfo>div {
	margin-bottom: 30px;
}

.productImage>a>img {
	width: 100px;
	height: 100px;
	margin-right: 20px;
}

.productBox {
	display: flex;
	padding-top: 10px;
	padding-bottom: 10px;
	border-top: 1px solid #dddddd;
}

#paymentList {
	border-bottom: 1px solid #555555;
	border-top: 1px solid #555555;
	margin-bottom: 30px;
}

.productBox:nth-child(1) {
	display: flex;
	padding-top: 10px;
	padding-bottom: 10px;
	border: none;
}

.productBox>div>.optionBoxList>.optionBox {
	display: flex;
	padding-top: 5px;
	width: 800px;
}

.productName {
	font-weight: bold;
	margin-bottom: 5px;
	font-size: 18px;
}

.productBox>div>.optionBoxList>.optionBox>span {
	width: 500px;
	line-height: 26px;
}

.productBox>div>.optionBoxList>.optionBox>.deleteOption {
	width: 100px;
	text-align: right;
	cursor: pointer;
}

.productBox>div>.optionBoxList>.optionBox>.orderPrice {
	width: 100px;
	text-align: right;
}

.productBox>div>.optionBoxList>.optionBox>div {
	width: 200px;
}

.productBox>div>.optionBoxList>.optionBox>div>span:nth-child(2) {
	line-height: 24px;
	width: 50px;
	text-align: center;
	color: #555555;
	border: none;
	font-size: 14px;
	vertical-align: middle;
}

.productBox>div>.optionBoxList>.optionBox:last-child {
	border: none;
}
</style>

<script>
	window.onload = function() {

	};
</script>
</head>
<body>
	<div id="wrap">
		<h1>주문내역</h1>
		<div id="buyerInfo">
			<div>
				<c:if test="${orderHistory.size() > 0}">
					<c:forEach var="item" items="${orderHistory}" varStatus="status">
						<div id="paymentList">
							<div>
								<span>주문날짜 : <fmt:formatDate value="${item.orderDate}" pattern="yyyy-MM-dd" /></span>
								<span>주문번호 : ${item.orderListCode}</span>
								<span>결제금액 : ${item.paymentPrice}</span>
								<span><a href="orderDetail/${item.orderListCode}">상세보기>></a></span>
							</div>
							<c:forEach var="product" items="${item.productList}">
								<div class="productBox">
									<c:forEach var="image" items="${product.productImageList}" end="0">
										<div class="productImage">
											<a href="/product/view/${product.productCode}"><img src="/upload/productimage/${product.sellerId}/${product.productCode}_${product.productName}/${image.productImageUuid}"></a>
										</div>
									</c:forEach>
									<div>
										<span class="productName">${product.productName}</span>
										<span>${item.orderStatusName}</span>
										<div class="optionBoxList">
											<c:forEach var="info" items="${item.orderDetailList}">
												<c:if test="${info.productCode == product.productCode}">
													<div class="optionBox">
														<span class="orderInfo">${info.orderInfo}</span>
														<span class="orderAmount">${info.orderAmount}</span>
														<span class="orderPrice" data-price="${info.orderPrice}">
														<fmt:formatNumber value="${info.orderAmount * info.orderPrice}"></fmt:formatNumber>원</span>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</c:if>

			</div>
		</div>
	</div>
</body>

</html>