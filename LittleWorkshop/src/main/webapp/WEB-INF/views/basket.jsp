<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Little Workshop</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
let paymentList;
window.onload = function() {
	totalPrice();
	
};
function deleteOption(option){
	let code = option.parentNode.getAttribute("data-code");
	
 	if(option.parentNode.parentNode.childElementCount <= 1){
		if(option.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByClassName("productBox").length <= 1)
			option.parentNode.parentNode.parentNode.parentNode.parentNode.remove();
		else
 			option.parentNode.parentNode.parentNode.parentNode.remove();
 	}else
 		option.parentNode.remove();
 	
 	if(document.querySelectorAll(".sellerBox").length === 0){
 		document.querySelector("#paymentInfo").remove();
 		document.querySelector("#spanDiv").remove();
 		document.querySelector("#guideText").innerHTML = "<div>장바구니가 비어있습니다</div>";
 	}
 		
	$.ajax({
		type: "GET",
		url:"/basket/delete/"+code,
        contentType: "application/json; utf-8",
		success: function(result){
			totalPrice();
		},error: function(){
			console.log("실패");
		}
	});
	
}

//수량변경
function setOptionAmount(option){
	const ch = /[0-9]+$/;
	
	let code = option.parentNode.parentNode.getAttribute("data-code");
	
	option.onkeyup = e => {
		if(!ch.test(option.value)) 
			option.value = 1;
		else{
			if(option.value > 999) 
				option.value = 999;
			else if(option.value < 1 ) 
				option.value = 1;
			else
				option.value = option.value;
		}
		
		if(option.value == '')
			mulPrice(option.parentNode.parentNode.children[2], 1);
		else
			mulPrice(option.parentNode.parentNode.children[2], option.value);
	};
	
	option.onchange = e => {
		if(option.value == '' || !ch.test(option.value)) //공백이거나 1 아래면
			option.value = 1;
		else
			option.value = option.value;

		console.log("값 변경");
		$.ajax({
			type: "GET",
			url:"/basket/update/"+code,
			contentType: "application/json; utf-8",
			data: { "amount" : parseInt(option.value)},
			success: function(result){
			},error: function(){
				console.log("실패");
			}
		});
		
	};
};
	
//수량추가
function addOptionAmount(option){

	let code = option.parentNode.parentNode.getAttribute("data-code");

	target = option.previousSibling;
	
	if(target.value < 999)
		target.value = parseInt(target.value) + 1;
	mulPrice(option.parentNode.parentNode.children[2], target.value);

	$.ajax({
		type: "GET",
		url:"/basket/update/"+code,
		contentType: "application/json; utf-8",
		data: { "amount" : parseInt(target.value)},
		success: function(result){
		},error: function(){
			console.log("실패");
		}
	});
}
//수량빼기
function removeOptionAmount(option){
	let code = option.parentNode.parentNode.getAttribute("data-code");

	
	target = option.nextSibling;
	
	if(target.value < 1)
		target.value = 1
	else if(target.value > 1)
		target.value = parseInt(target.value) - 1;
	mulPrice(option.parentNode.parentNode.children[2], target.value);

	$.ajax({
		type: "GET",
		url:"/basket/update/"+code,
		contentType: "application/json; utf-8",
        data: { "amount" : parseInt(target.value)},
		success: function(result){
		},error: function(){
			console.log("실패");
		}
	});
}

function mulPrice(loc, count){
	loc.innerText = (parseInt(count) * parseInt(loc.getAttribute("data-price"))).toLocaleString() +" 원";
	totalPrice();
}


function totalPrice(){

	Array.from(document.querySelectorAll(".sellerBox")).forEach(function(item,index){
		let total = 0;
		
		for(let i =0; i < item.querySelectorAll(".productCheck:checked").length; i++)
			for(let j =0; j < item.querySelectorAll(".productCheck:checked")[i].closest(".productBox").getElementsByClassName("productPrice").length; j++)
 				total += parseInt(item.querySelectorAll(".productCheck:checked")[i].closest(".productBox").getElementsByClassName("productPrice")[j].innerHTML.replace(/,/gi, ""));
		
		
		item.querySelector("#productTotalPrice").innerText = total.toLocaleString() + " 원";
		item.querySelector("#orderPrice").innerText = (parseInt(item.querySelector("#deliveryPrice").innerText) + total).toLocaleString() + " 원";
	});
	
	totalPayment();
	
}



function totalPayment(){
	paymentList = [];
	totalPaymentPrice = 0;
	Array.from(document.querySelectorAll('.productCheck')).forEach(function(item,index){
		if(item.checked){ 
			Array.from(item.closest(".productBox").querySelectorAll(".optionBox")).forEach(function(item,index){
	 			paymentList.push(parseInt(item.getAttribute("data-code")));
	 			totalPaymentPrice += parseInt(item.querySelector(".productPrice").innerHTML.replace(/,/gi, ""));
			});
		}
	});

	document.querySelector("#paymentDelivery").innerHTML = 0+"원";
	document.querySelector("#paymentAmount").innerHTML = paymentList.length+"개";
	document.querySelector("#paymentPrice").innerHTML = totalPaymentPrice.toLocaleString() + "원";
	document.querySelector("#totalPayment").innerHTML = (totalPaymentPrice + 0).toLocaleString() + "원";


}


function sellerCheck(seleter){
	
	if(seleter.checked){ 
		Array.from(seleter.closest(".sellerBox").querySelectorAll(".productCheck")).forEach(function(item,index){
			$(item).prop("checked","true"); 
			
		});
	}else {
		Array.from(seleter.closest(".sellerBox").querySelectorAll(".productCheck")).forEach(function(item,index){
			$(item).removeProp("checked");
		});
	}
	
	totalPrice();
}

function productCheck(seleter){
	checkAll = seleter.closest(".sellerBox").querySelector('.sellerCheck');
	
	if(!seleter.checked)
		$(checkAll).removeProp("checked");
	else
		if(seleter.closest(".sellerBox").querySelectorAll(".productCheck").length === seleter.closest(".sellerBox").querySelectorAll(".productCheck:checked").length)
			$(checkAll).prop("checked","true");
	
	
	totalPrice();
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
	
	totalPrice();
}


function partialDeletion(){
	deleteList = [];
	Array.from(document.querySelectorAll('.productCheck')).forEach(function(item,index){

		if(item.checked){
			deleteList.push(parseInt(item.value));
			if(item.closest(".sellerBox").querySelectorAll(".productCheck").length <=1)  // 같은 작가의 상품 갯수가 1개 아래라면?
					item.closest(".sellerBox").remove();
			else  // 같은 작가의 상품 갯수가 1개 이상이라면?  
				item.closest(".productBox").remove();
		}

	});
	
	if(document.querySelectorAll(".sellerBox").length === 0){
 		document.querySelector("#paymentInfo").remove();
 		document.querySelector("#spanDiv").remove();
 		document.querySelector("#guideText").innerHTML = "<div>장바구니가 비어있습니다</div>";
 		
 	}
	
	$.ajax({
		type: "POST",
		url:"/basket/partialDeletion",
        contentType: "application/json; utf-8",
        data : JSON.stringify(deleteList),
		success: function(result){
			totalPrice();
		},error: function(){
			console.log("실패");
		}
	});
}

function paymentBtn(){
	let form = document.getElementById("paymentForm");
	form.submit();
}


</script>
<link rel="stylesheet" href="/css/basket.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div>
		<h1>장바구니</h1>
		<div id="guideText">
			<c:if test="${list.size() < 1 }">
				<div>장바구니가 비어있습니다</div>
			</c:if>

			<c:if test="${list.size() > 0 }">
				<div id="spanDiv"><span onclick="selectAll();">전체선택</span> ｜ <span onclick="partialDeletion();">선택삭제</span></div>
				<form id="paymentForm" action="/payment" method="post" onsubmit="return false">
				
				
				
				<div id="sellerArea">
				<c:forEach var="seller" items="${sellerList}">
					<div class="sellerBox">
						<input type="checkbox" class="sellerCheck checkbox" onclick="sellerCheck(this);" checked>
						<span>${seller}</span>
						<c:forEach var="item" items="${list}">
							<c:if test="${seller == item.sellerId}">
								<div class="productBox">
									<input type="checkbox" value="${item.productCode}" name="productCode" class="productCheck checkbox" onclick="productCheck(this);" checked>
									<c:forEach var="image" items="${item.productImageList}" end="0">
										<div class="productImage">
											<a href="product/view/${item.productCode}">
											<img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
										</div>
									</c:forEach>
									<div>
										<span class="productName">${item.productName}</span>
										<div class="optionBoxList">
										<c:forEach var="info" items="${item.basketList}">
											<div class="optionBox" data-code="${info.basketCode}">
												<span>${info.orderInfo}</span>
												<div>
													<button type="button" class="material-symbols-outlined" onclick="removeOptionAmount(this);">remove</button><input value="${info.productAmount}" onselect="setOptionAmount(this)" onclick="setOptionAmount(this);"><button  type="button" class="material-symbols-outlined" onclick="addOptionAmount(this);">add</button>
												</div>
												<span class="productPrice" data-price="${item.productPrice}"><fmt:formatNumber value="${info.productAmount * item.productPrice}"></fmt:formatNumber> 원</span>
												<span class="deleteOption" onclick="deleteOption(this);">x</span>
											</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div id = "price">
							<div>
								<span>상품금액</span>
								<span id="productTotalPrice"></span>
							</div>
							<div>
								<span>+</span>
							</div>
							<div>
								<span>배송비</span>
								<span id="deliveryPrice">0 원</span>
							</div>
							<div>
								<span>=</span>
							</div>
							<div>
								<span>주문 금액</span>
								<span id="orderPrice"></span>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				
				
				
				<div id="paymentInfo">
					<div class="txt1">결제정보</div>
					<div class="txt2">
                        <div><div>상품수</div><div id="paymentAmount"></div></div>
                        <div><div>상품금액</div><div id="paymentPrice"></div></div>
                        <div><div>배송비</div><div id="paymentDelivery"></div></div>
					</div>
					<div class="txt3">
						<div>총 결제금액</div><div id="totalPayment"></div>
					</div>
					<button class="purchase_btn" type="button" onclick="paymentBtn();">결제하기</button>
				</div>
				</form>
			</c:if>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>