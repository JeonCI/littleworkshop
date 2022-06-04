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
<style>
{
    margin: 0px;
    padding: 0px;
}
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 100,
  'GRAD' -25,
  'opsz' 12
}

.material-symbols-outlined {
      font-variation-settings:
      'FILL' 0,
      'wght' 100,
      'GRAD' 25,
      'opsz' 12,
    }  


.optionBoxList{
}
.sellerBox{
margin-bottom: 80px;
width: 1200px;
}
.productImage>a>img {
	width: 100px;
	height: 100px;
	margin-right: 20px;
}
.productBox{
display: flex;
margin-bottom: 30px;

padding-top: 10px;

border-bottom: 1px solid #dddddd;
border-top: 1px solid #dddddd;
}

.productBox > div > .optionBoxList> .optionBox {
display: flex;
padding-top: 10px;
padding-bottom: 10px;
border-bottom : 1px solid #dddddd;
}


.productName{
	font-weight:bold;
	margin-bottom: 5px;
	font-size: 18px;
}
.productBox > div >.optionBoxList > .optionBox  > span{
	width: 400px;
	line-height: 26px;
} 

.productBox > div >.optionBoxList > .optionBox  > .deleteOption{
	width: 100px;
	text-align: right;
	cursor : pointer;
	
}
.productBox > div >.optionBoxList > .optionBox  > .productPrice{
	width: 100px;
	text-align: right;
} 

.productBox > div > .optionBoxList>.optionBox > div {
	width: 200px;

}
.productBox > div > .optionBoxList>.optionBox > div > button{
    border: 1px solid #dddddd;
    border-radius: 5px;
    background-color: white;
    color : #888888;
    font-size: 20px;
    margin: auto;
    vertical-align: middle;
    cursor : pointer;
}
.productBox > div > .optionBoxList> .optionBox > div > input{
	line-height : 24px;
    width: 50px;
    text-align: center;
    color : #555555;
    border : none;
    font-size: 14px;
    vertical-align: middle;
}
.productBox > div > .optionBoxList>.optionBox:last-child  {
border:none;
}

</style>

<script>
function deleteOption(option){
	let code = option.parentNode.getAttribute("data-code");
	
 	if(option.parentNode.parentNode.childElementCount <= 1){
		if(option.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByClassName("productBox").length <= 1)
			option.parentNode.parentNode.parentNode.parentNode.parentNode.remove();
		else
 			option.parentNode.parentNode.parentNode.parentNode.remove();
 	}else
 		option.parentNode.remove();
 	
 	
 	
	$.ajax({
		type: "GET",
		url:"/basket/delete/"+code,
        contentType: "application/json; utf-8",
		success: function(result){
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
// 	totalPrice();
}

// function totalPrice(){
// 	let total = 0;
// 	console.log();
// 	Array.from(document.getElementById("optionContiner").childNodes).forEach(function(item,index){
// 		total +=  parseInt(item.childNodes[2].innerText);
// 	});
	
// 	document.getElementById("totalPrice").childNodes[1].innerText = total;
// }
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
					<div class="sellerBox">
						<span>${seller}</span>
						<c:forEach var="item" items="${list}">
							<c:if test="${seller == item.sellerId}">
								<div class="productBox">
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
													<button class="material-symbols-outlined" onclick="removeOptionAmount(this);">remove</button><input value="${info.productAmount}" onselect="setOptionAmount(this)" onclick="setOptionAmount(this);"><button class="material-symbols-outlined" onclick="addOptionAmount(this);">add</button>
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
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>
</body>
</html>