<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

.material-symbols-rounded {
  font-variation-settings:
  'FILL' 0,
  'wght' 200,
  'GRAD' 0,
  'opsz' 20
}


*{
margin
:
0px

;
padding
:
0px
;
}

#wrap{
	width: 1000px;
}

#buyerInfo > div:nth-child(1) > div {
display: flex;
}
#buyerInfo > div:nth-child(2) > div {
display: flex;
}

#buyerInfo > div:nth-child(2) > div > span:nth-child(2){
margin-left: auto;
color: #888888;
cursor: pointer;
font-size: 13px;
}
#buyerInfo > div:nth-child(2) > div > span:nth-child(2) > span{
    vertical-align: middle;
    width: 30px;
    height: 26px;
}

#buyerInfo > div > div> span:nth-child(1) {
    width: 80px;
    display: flex;
}

#buyerInfo > div:nth-child(2) > div > span:nth-child(1){
    width: 80px;
    display: flex;
    display: inline-block;
    margin-bottom: 20px;
    font-weight: 600;
}
#buyerInfo > div > span:nth-child(1) {
    margin-bottom: 20px;
    font-size: 18px;
    display: inline-block;
    font-weight: 600;
}

#buyerInfo > div > select {
	width: -webkit-fill-available;
    margin-bottom: 5px;
    display: flex;
}

#buyerInfo, #payChk, #paymentInfo{
border: 1px solid #dddddd;
margin-bottom: 30px;
padding: 30px;
}
#buyerInfo > div{
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
		totalPayment();

	};

	function totalPayment() {
		let paymentList = [];
		totalPaymentPrice = 0;
		Array.from(document.querySelectorAll('.optionBox')).forEach(function(item, index) {
			paymentList.push(parseInt(item.getAttribute("data-code")));
			totalPaymentPrice += parseInt(item.querySelector(".orderPrice").innerHTML.replace(/,/gi, ""));
		});

		document.querySelector("#paymentDelivery").innerHTML = 0 + "???";
		document.querySelector("#paymentAmount").innerHTML = paymentList.length + "???";
		document.querySelector("#paymentPrice").innerHTML = totalPaymentPrice.toLocaleString()+ "???";
		document.querySelector("#totalPayment").innerHTML = (totalPaymentPrice + 0).toLocaleString()+ "???";

	}

	function paymentBtn() {
		order = {};  
		orderDetaile = []; 
		basketList = [];
		
		// [?????? ??????] ??????
		order['addressCode'] = parseInt(document.querySelector("#addressList").value);

		// [?????? ??????] ????????????
		Array.from(document.querySelectorAll("input[name='pay_chk']")).forEach(function(item, index) {
			if(item.checked)
				order['orderPayment'] = item.value;
		});
		// [?????? ??????] ????????????
		order['paymentPrice'] = parseInt(document.querySelector("#totalPayment").innerHTML.replace(/,/gi, ""));

		// [?????? ??????] ?????? ?????? (????????????, ?????????????????? ??????)
		Array.from(document.querySelectorAll('.optionBox')).forEach(function(item, index) {
			if(parseInt(item.getAttribute("data-code")) != 0)
				basketList.push(item.getAttribute("data-code"));
		});

		
		
		// [?????? ????????? ??????] ????????????, ????????????, ????????????, ????????????
		Array.from(document.querySelectorAll(".productBox")).forEach(function(item, index) {
			let productCode = item.getAttribute("data-productcode");
			Array.from(item.querySelectorAll(".optionBox")).forEach(function(item, index) {
				orderDetaile.push({
					"productCode" : productCode,
					"orderPrice" : item.querySelector(".orderPrice").getAttribute("data-price"),
					"orderInfo" : item.querySelector(".orderInfo").innerHTML,
					"orderAmount" : item.querySelector(".orderAmount").innerHTML
				});
			});
		});
		order['orderDetailList'] = orderDetaile;
		order['basketList'] = basketList;
		
		$.ajax({
			type: "POST",
			url:"/payment/orderRequest",
	        contentType: "application/json; utf-8",
	        data : JSON.stringify(order),
			success: function(result){
				location.href = "/";
			},error: function(){
				console.log("??????");
			}
		});

	}
	
</script>
</head>
<body>
	<div id="wrap">
		<h1>????????????</h1>
		<div id="buyerInfo">
			<div>
				<span>????????? ??????</span>
				<div><span>??????</span><span>${sessionScope.account.accountName}</span></div>
				<div><span>????????????</span><span>${sessionScope.account.phone}</span></div>
				<div><span>?????????</span><span>${sessionScope.account.email}</span></div>
			</div>
			<div>
				<div>
					<span>?????????</span>
					<span><span class="material-symbols-rounded">add_circle</span>????????? ??????</span>
				</div>
				<c:if test="${addressList.size() > 0}">
					<select id="addressList">
						<c:forEach items="${addressList}" var="item">
							<option value="${item.addressCode}">[${item.addressName}] ${item.postcode} ${item.address} </option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${addressList.size() < 1 }">
					<p>???????????? ??????????????????.</p>
				</c:if>
			</div>
			<div>
		<c:if test="${paymentItems.size() > 0}">
			<span>?????? ??????</span>
			<div id="paymentList">
				<c:forEach var="item" items="${paymentItems}">
					<div class="productBox" data-productcode="${item.productCode}">
						<c:forEach var="image" items="${item.productImageList}" end="0">
							<div class="productImage">
								<a href="product/view/${item.productCode}"><img
									src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
							</div>
						</c:forEach>
						<div>
							<span class="productName">${item.productName}</span>
							<div class="optionBoxList">
								<c:forEach var="info" items="${item.basketList}">
									<div class="optionBox" data-code="${info.basketCode}">
										<span  class= "orderInfo">${info.orderInfo}</span>
										<span class= "orderAmount">${info.productAmount}</span>
										<span class="orderPrice" data-price="${item.productPrice}"><fmt:formatNumber
												value="${info.productAmount * item.productPrice}"></fmt:formatNumber>???</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			</c:if>
			</div>
			</div>
			<div id="payChk">
				<span>????????????</span>
				<div>
				<input type="radio" name="pay_chk" value="card" checked><label>??????/????????????</label>
				<input type="radio" name="pay_chk" value="bankbook"><label>????????????</label>
				<input type="radio" name="pay_chk" value="phone"><label>???????????????</label>
			</div>
		</div> 
			

			<div id="paymentInfo">
				<span>????????????</span>
				<div>
					<div>
						<span>?????????</span><span id="paymentAmount"></span>
					</div>
					<div>
						<span>????????????</span><span id="paymentPrice"></span>
					</div>
					<div>
						<span>?????????</span><span id="paymentDelivery"></span>
					</div>
				</div>
				<div>
					<span>??? ????????????</span><span id="totalPayment"></span>
				</div>
				<button type="button" onclick="paymentBtn();">????????????</button>
			</div>
	</div>
</body>

</html>