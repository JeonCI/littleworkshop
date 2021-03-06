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
a { text-decoration: none; }
a:visited { text-decoration: none; }
a:hover { text-decoration: none; }
a:focus { text-decoration: none; }
a:hover, a:active { text-decoration: none; }


.click > a{
	color : blue;
	font-weight: 700;
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


#buyerInfo>div:nth-child(2)>div>span:nth-child(1) {
	width: 80px;
	display: flex;
	display: inline-block;
	margin-bottom: 20px;
	font-weight: 600;
}

/* #buyerInfo>div>span:nth-child(1) { */
/* 	margin-bottom: 20px; */
/* 	font-size: 18px; */
/* 	display: inline-block; */
/* 	font-weight: 600; */
/* } */

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

#status {
    display: flex;
    list-style: none;
    padding: 30px;
    padding-top: 10px;
	
	
}

#status > li { 
margin-right: 30px;
	
	
}

#orderSelectDiv{
    display: flex;
}

#orderSelectDiv > input{
width:16px;
height: 22px;
margin-right: 10px;
}

#spanDiv{
display: flex;
margin-bottom: 20px;
}
</style>

<script>
	window.onload = function() {

	};
	
	function setStatus(status){
		status.classList.toggle("click");
	}
	
	function selectAll(){
		select = true;
		Array.from(document.querySelectorAll('.checkbox')).forEach(function(item,index){
			if(!item.checked)
				select = false;
		});
		
		if(select === true){
			Array.from(document.querySelectorAll('.checkbox')).forEach(function(item,index){
				$(item).removeProp("checked");
			});
		}else{
			Array.from(document.querySelectorAll('.checkbox')).forEach(function(item,index){
				$(item).prop("checked","true"); 

			});
		}
	}
	
	function partialSelect(){
		orderCodeList = [];
		Array.from(document.querySelectorAll('.checkbox')).forEach(function(item,index){
			if(item.checked)
				orderCodeList.push(parseInt(item.value));
		});
		
		
		
		
// 		if(document.querySelectorAll(".paymentList").length === 0){
// 	 		document.querySelector("#buyerInfo").remove();
// 	 		document.querySelector("#spanDiv").remove();
// 	 		document.querySelector("#guideText").innerHTML = "<div>??????????????? ??????????????????</div>";
	 		
// 	 	}
		
// 		$.ajax({
// 			type: "POST",
// 			url:"/basket/partialDeletion",
// 	        contentType: "application/json; utf-8",
// 	        data : JSON.stringify(deleteList),
// 			success: function(result){
// 				totalPrice();
// 			},error: function(){
// 				console.log("??????");
// 			}
// 		});
	}
	
	function receptionBtn(orderCode, self){
		let addWaybillNumber = true;
		
//      ????????? ?????? ?????? ?????????
// 		if(orderCode == 3){
// 			addWaybillNumber = false;
// 			var ret = window.open("./orderMngmn/addWaybillNumber", "_blank", "width=500,height=600", false);
// 		};
		
		if(addWaybillNumber){
			let productCode = [];
			
			Array.from(self.closest("#paymentList").querySelectorAll(".productBox")).forEach(function(item,index){
				productCode.push(parseInt(item.getAttribute("data-product")));
			});
			
			$.ajax({
				type: "POST",
				url:"orderMngmn/update",
		        data : {"orderCode" : parseInt(orderCode), "productCode" : productCode},
				success: function(result){
					self.closest("#paymentList").remove();
			 		if(document.querySelectorAll("#paymentList").length === 0){
			 	 		document.querySelector("#spanDiv").remove();
		 	 		}
				},error: function(){
					console.log("??????");
				}
			});
		}

	}
	
</script>
</head>
<body>
	<div id="wrap">
		<h1>????????????</h1>
		<ul id ="status">
			<li class="status ${pager.status==1?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=1">???????????? ??????</a></li>
<%-- 			<li class="status ${pager.status==0?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=0">???????????? ??????</a></li> --%>
			<li class="status ${pager.status==2?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=2">?????? ???????????? ??????</a></li>
			<li class="status ${pager.status==3?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=3">???????????? ??????</a></li>
			<li class="status ${pager.status==4?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=4">????????? ??????</a></li>
			<li class="status ${pager.status==5?'click':''}" onclick="setStatus(this);"><a href="./orderMngmn?status=5">???????????? ??????</a></li>
		</ul>

		
		<div id="buyerInfo">
				<c:if test="${orderHistory.size() > 0}">
					<c:if test="${pager.status < 5 }">
							<div id="spanDiv"><span onclick="selectAll();">????????????</span>
							??? 
							<span onclick="partialSelect();">
								<c:if test="${pager.status == 1 }">?????? ??????</c:if>
								<c:if test="${pager.status == 2 }">?????? ????????????</c:if>									
								<c:if test="${pager.status == 3 }">?????? ????????????</c:if>
								<c:if test="${pager.status == 4 }">?????? ????????????</c:if>	
							</span>
							</div>
					</c:if>
					<c:forEach var="item" items="${orderHistory}" varStatus="status">

						<div id="paymentList">
							<div id="orderSelectDiv">

								<c:if test="${item.orderStatus < 5 }">
									<input class="checkbox" type="checkbox" value="${item.orderListCode}">
								</c:if>
								<div>
									<span>???????????? : <fmt:formatDate value="${item.orderDate}" pattern="yyyy-MM-dd" /></span>
									<span data-code="${item.orderListCode}">???????????? : ${item.orderListCode}</span>
									<span>???????????? : ${item.paymentPrice}</span>
									<span><a href="orderDetail/${item.orderListCode}">????????????>></a></span>
									<c:if test="${item.orderStatus < 5 }">
										<button type="button" onclick="receptionBtn(${item.orderListCode}, this);">
											<c:if test="${item.orderStatus == 1 }">????????????</c:if>
											<c:if test="${item.orderStatus == 2 }">??????????????????</c:if>									
											<c:if test="${item.orderStatus == 3 }">????????????</c:if>
											<c:if test="${item.orderStatus == 4 }">????????????</c:if>								
										</button>
									</c:if>
								</div>
<!-- 							</form> -->
							</div>
							<c:forEach var="product" items="${item.productList}">
								<div class="productBox" data-product = "${product.productCode}">
									<c:forEach var="image" items="${product.productImageList}" end="0">
										<div class="productImage">
											<a href="/product/view/${product.productCode}"><img src="/upload/productimage/${product.sellerId}/${product.productCode}_${product.productName}/${image.productImageUuid}"></a>
										</div>
									</c:forEach>
									<div>
										<span class="productName">${product.productName}</span>
										<div class="optionBoxList">
											<c:forEach var="info" items="${item.orderDetailList}">
												<c:if test="${info.productCode == product.productCode}">
													<div class="optionBox">
														<span class="orderInfo">${info.orderInfo}</span>
														<span class="orderAmount">${info.orderAmount}</span>
														<span class="orderPrice" data-price="${info.orderPrice}">
														<fmt:formatNumber value="${info.orderAmount * info.orderPrice}"></fmt:formatNumber>???</span>
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
</body>

</html>