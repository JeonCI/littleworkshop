<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
productList=[];
pickOption=[];
window.onload = function() {
	
};

let count=0;
function setOption(option){
	let optionClear = true;
	let optionList;
	Array.from(document.getElementsByClassName("option")).forEach(function(item,index){
		optionList = item.getElementsByTagName('option');
		
		if(Number(item.value) === 0)
			optionClear = false;
		else
			for(let option of optionList)
				if(item.value === option.value)
					pickOption[index] = option.innerText;
	
	});
	
	//모든 옵션이 선택됐다면
	if(optionClear){
		let html ="";
		Array.from(document.getElementsByClassName("option")).forEach(function(item,index){
			item.value = "0";
		});

 		div = document.createElement('div');
 		
 		code = location.href.split("view/")[1];
 		
 		//JS로 옮기면 수정하기!	
//		html = `<input name="productCode" type="hidden" value="${code}">`;
	  	html = "<input name='items[" + count + "].productCode' type='text'  hidden='hidden' value="+code+">";
 		div.innerHTML += html;
 		
		//옵션이름 시작
		optionSpan = document.createElement('span');
		let info = '';
 		for(optionName of pickOption){
 			info += optionName + "/";
 		}
		
 		optionSpan.className = "orderInfo";
 		optionSpan.append(info.substr(0, info.length-1));
 		div.append(optionSpan);
 		

 		html = "<input name='items[" + count + "].orderInfo' type='text' hidden='hidden' value="+info.substr(0, info.length-1)+">";
 		div.innerHTML += html;
 		//옵션이름 끝
 		
		 //수량바 시작
 		//수량바 시작
        amtDiv = document.createElement('div');
        countDiv = document.createElement('div');
        countInput = document.createElement('input');
        addBtn = document.createElement('button');
        removeBtn = document.createElement('button');

        addBtn.innerHTML = "add";
        removeBtn.innerHTML = "remove";
        addBtn.className = "material-symbols-outlined";
        addBtn.setAttribute("onclick", "addOptionAmount(this);");
        removeBtn.className = "material-symbols-outlined";
        removeBtn.setAttribute("onclick", "removeOptionAmount(this);");

        countInput.className = "productAmount";
        countInput.setAttribute("value", "1");
        countInput.setAttribute("type", "text");
        countInput.setAttribute("name", "items[" + count++ + "].productAmount");
        countInput.setAttribute("onclick", "setOptionAmount(this);");
        countDiv.append(removeBtn);
        countDiv.append(countInput)
        countDiv.append(addBtn);
        amtDiv.append(countDiv);
        //수량바 끝

        //금액 시작
        priceSpan = document.createElement('div');
        priceSpan.className = 'price';
        priceSpan.innerText = document.getElementById("productPrice").getAttribute("data-price") + "원";
        amtDiv.append(priceSpan);
        //금액 끝

       

        //삭제버튼 시작
        deleteSpan = document.createElement('span');
        deleteSpan.innerText = " x";
        deleteSpan.className = "deleteOption";
        deleteSpan.setAttribute("onClick", "deleteOption(this);");
        amtDiv.append(deleteSpan);
        //삭제버튼 끝

         div.append(amtDiv);
        
        document.getElementById("optionContiner").append(div);
        totalPrice();

    }
}
//삭제
function deleteOption(option){

	let deleteName = option.parentNode.querySelector("input").getAttribute("name").split(".")[0];
 	let deleteNameCount = parseInt(deleteName.substr(6,1));

 	Array.from(document.getElementById("optionContiner").childNodes).forEach(function(item,index){ // index =  각각 div , 
 		
 		if(index > deleteNameCount){ // 이 div가 내가 삭제할 div 뒤에 있다면 
 			console.log("숫자 하나 낮춥니다!");
 			Array.from(item.querySelectorAll("input")).forEach(function(item,index){
	  			item.setAttribute("name", replaceIndex(item.getAttribute("name")));
 			});
 		}

 	});
 	option.parentNode.remove();
 	count--;
}

function replaceIndex(originalStr){
	console.log("바꿀값:"+originalStr);
	let originalIndex = originalStr.split(".")[0];
	let index = parseInt(originalIndex.substr(-2,1))
	originalStr = originalStr.split(".")[1];
	
	console.log("바뀐값:"+originalIndex.replace(index,index-1)+originalStr);
	return originalIndex.replace(index,index-1)+"."+originalStr;
}

//수량변경
function setOptionAmount(option){
	const ch = /[0-9]+$/;
	
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
	};
};
	
//수량추가
function addOptionAmount(option){
	target = option.previousSibling;
	if(target.value < 999)
		target.value = parseInt(target.value) + 1;
	mulPrice(option.parentNode.parentNode.querySelector(".price"), target.value);
}
//수량빼기
function removeOptionAmount(option){
	target = option.nextSibling;
	if(target.value > 1)
 		target.value = parseInt(target.value) - 1;
	mulPrice(option.parentNode.parentNode.querySelector(".price"), target.value);
}

function mulPrice(loc, count){
	loc.innerText = parseInt(count) * parseInt(document.getElementById("productPrice").getAttribute("data-price"))+"원";
	totalPrice();
}

function totalPrice(){
	let total = 0;
	Array.from(document.getElementById("optionContiner").childNodes).forEach(function(item,index){
		total +=  parseInt(item.querySelector(".price").innerText);
	});
	
	document.getElementById("totalPrice").childNodes[1].innerText = total;
}

function basket(){
	let code =  location.href.split('/');
	code = code[code.length-1] 
	
	Array.from(document.getElementById("optionContiner").childNodes).forEach(function(item,index){
		productList.push({
			"productAmount" : item.querySelector(".productAmount").value,
 			"orderInfo" : item.querySelector(".orderInfo").innerText,
     		"productCode" : parseInt(code)
		});
	});

	$.ajax({
		type: "POST",
		url:"/basket/add",
        contentType: "application/json; utf-8",
		data: JSON.stringify(productList),
		success: function(result){
			alert("장바구니에 담았습니다");
			location.href= location.href;
		},error: function(){
			console.log("실패");
		}
	});
}

function order(){
	form = document.getElementById("paymentForm");
	form.submit();
}


</script>
<link rel="stylesheet" href="/css/view.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="main">
        <form name="items" id="paymentForm" action="/payment" method="post" onsubmit="return false">

            <div class="container productcontent">
                <div>
                    <div class="main_img">
                        <c:if test="${item.productImageList.size() > 0 }">
                            <c:forEach var="image" items="${item.productImageList }">
                                <p><img class="productImage" src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></p>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="sub_images">
                        <div class="sub_img"><img src="image/11.png"></div>
                        <div class="sub_img"><img src="image/11.png"></div>
                        <div class="sub_img"><img src="image/11.png"></div>
                        <div class="sub_img"><img src="image/11.png"></div>
                    </div>
                </div>
                <div class="product_detail">
                    <div class="product_deatil-1">
                        <div>${item.sellerId }</div>
                        <div class="bar"> ｜ </div>
                        <div>${item.productCategory }</div>
                    </div>
                    <div class="product_detail-2">
                        <div>${item.productName }</div>
                    </div>
                    <div class="product_price">
                        <div id="productPrice" data-price="${item.productPrice }"><span>${item.productPrice}</span></div>
                    </div>
                    <div class="shipping_fee">
                        <div class="shipping-1">배송비</div>
                        <div class="shipping-2">무료배송</div>
                    </div>
                    <div class="shipping_start">
                        <div class="shipping-1">배송 시작</div>
                        <div class="shipping-2">평균1일, 최대 5일이내</div>
                    </div>
                    <div class="amount">
                        <div class="shipping-1">수량</div>
                        <div class="shipping-2">n개남음</div>
                    </div>
                    <p>${item.productDescription }</p>
                    <fmt:formatDate value="${item.productRegDate }" pattern="YYYY/MM/dd" />
                    <p>${item.productLikeCount }</p>

                    <c:if test="${item.productOptionList.size() > 0 }">
                        <c:forEach var="option" items="${item.productOptionList }">
                            <select class="option" onchange="setOption(this);" data-option="${option.productOptionCode}" ${option.productNecessaryOption==1 ? 'required' : '' }>
                                <option selected="selected" value="0" disabled>${option.productOptionName}${option.productNecessaryOption == 1 ? '(필수)' : ''}</option>
                                <c:forEach var="detail" items="${option.productOptionDetail}">
                                    <option value="${detail.productOptionDetailCode }">${detail.productOptionDetailName}</option>
                                </c:forEach>
                            </select>
                        </c:forEach>
                    </c:if>




                
                <div id="optionContiner" name="items"></div>
                <div class="total_price">
                <div id="totalPrice">총 결제금액<span>0</span>원</div>
                </div>
                <div class="buttons">
                    <button  class="purchase_btn" type="button" onclick="order();">구매하기</button>
                    <button  class="cart_btn" type="button" onclick="basket();">장바구니</button>
                </div>
            </div>
            </div>
        </form>
        <div class="container maincontent">
        <div class="info_tab">
            <div class="product_info">작품상세</div>
            <div class="info_delivery">배송/교환/환불</div>
            <div class="pre-review">구매후기</div>
            <div class="question">문의사항</div>
        </div>
        <div class="product_img">
            <img src="image/image1.jpg">
        </div>
        <div class="catecategory">
            <div class="tag"><a href="#">#강아지 방석</a></div>
        </div>
        <div class="prd-review">
            <div class="title-style">
                <h3>구매 후기<span>()</span></h3>
                <div class="sort">
                    <div>최신순</div>
                    <div class="bar"> ｜ </div>
                    <div>별점순</div>
                </div>
            </div>
            <div class="review">
                <div class="reviewer-thumnail"><img src="image/deer-g379da77a8_1920.jpg"></div>
                <div class="review-1">
                    <div class="review-2">
                        <div class="writer">작성자</div>
                        <div class="order_detail">제품명/옵션1/옵션2</div>
                        <div class="score">★</div>
                    </div>
                    <div class="date">작성날짜</div>
                    <div class="comment">정말 좋아요~</div>
                </div>
            </div>

        </div>
    </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>