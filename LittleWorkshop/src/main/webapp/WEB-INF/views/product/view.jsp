<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
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

#optionContiner{  
    margin-top: 20px;
    display: block;
    }
    
#optionContiner > div {
 	background-color: #eeeeee;
	width: 300px;
	margin-bottom: 15px;
}
#optionContiner > div >div> butten {
    border: 1px solid #dddddd;
    border-radius: 5px;
    background-color: white;
    color : #888888;
    font-size: 22px;
    margin: auto;
    vertical-align: middle;
    cursor : pointer;
}
#optionContiner > div>div> input{
	line-height : 24px;
    width: 50px;
    text-align: center;
    color : #555555;
    border : none;
    font-size: 14px;
    vertical-align: middle;
}

#optionContiner > div > .deleteOption{
	width : 20px;
	float: right;
	cursor : pointer;
}
.productImage{
width: 100px;
height: 100px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
productList=[];
pickOption=[];
window.onload = function() {
	
};

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
// 		if()
		
		Array.from(document.getElementsByClassName("option")).forEach(function(item,index){
			item.value = "0";
		});
		
		
		
 		div = document.createElement('div');
		
		//옵션이름 시작
		optionSpan = document.createElement('span');
		let info = '';
 		for(optionName of pickOption){
 			info += optionName + "/";
 		}
 		optionSpan.className = "orderInfo";
 		optionSpan.append(info.substr(0, info.length-1));
 		div.append(optionSpan);
 		//옵션이름 끝
 		
		//수량바 시작
		countDiv = document.createElement('div');
		countInput = document.createElement('input');
		addBtn = document.createElement('butten');
		removeBtn = document.createElement('butten');
		
		addBtn.innerHTML="add";
		removeBtn.innerHTML= "remove";
		addBtn.className = "material-symbols-outlined";
		addBtn.setAttribute("onclick","addOptionAmount(this);");
		removeBtn.className  ="material-symbols-outlined";
		removeBtn.setAttribute("onclick","removeOptionAmount(this);");
		
		countInput.className = "productAmount";
		countInput.setAttribute("value","1");
		countInput.setAttribute("onclick","setOptionAmount(this);");
 		countDiv.append(removeBtn);
 		countDiv.append(countInput)
 		countDiv.append(addBtn);
 		
 		div.append(countDiv);
 		//수량바 끝
 		
		//금액 시작
		priceSpan = document.createElement('span');
 		priceSpan.innerText = document.getElementById("productPrice").getAttribute("data-price")+"원";
 		div.append(priceSpan);
 		//금액 끝
 		
 		//삭제버튼 시작
 		deleteSpan = document.createElement('span');
 		deleteSpan.innerText = " x";
 		deleteSpan.className = "deleteOption";
 		deleteSpan.setAttribute("onClick","deleteOption(this);");
 		div.append(deleteSpan);
 		//삭제버튼 끝
 		
 		document.getElementById("optionContiner").append(div);

	}
}
//삭제
function deleteOption(option){
	option.parentNode.remove();
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
			option.parentNode.parentNode.children[2].innerText = 1 * parseInt(document.getElementById("productPrice").getAttribute("data-price"))+"원";
		else
			option.parentNode.parentNode.children[2].innerText = parseInt(option.value) * parseInt(document.getElementById("productPrice").getAttribute("data-price"))+"원";
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
	option.parentNode.parentNode.children[2].innerText = parseInt(target.value) * parseInt(document.getElementById("productPrice").getAttribute("data-price"))+"원";
}
//수량빼기
function removeOptionAmount(option){
	target = option.nextSibling;
	if(target.value > 1)
 		target.value = parseInt(target.value) - 1;
	option.parentNode.parentNode.children[2].innerText = parseInt(target.value) * parseInt(document.getElementById("productPrice").getAttribute("data-price"))+"원";
}

function basket(){

	
	Array.from(document.getElementById("optionContiner").childNodes).forEach(function(item,index){
		productList.push({
			"productAmount" : item.childNodes[1].childNodes[1].value,
 			"orderInfo" : item.getElementsByClassName("orderInfo")[0].innerText
		});
	});
	console.log(productList);

	//console.log(productList);

// 	$.ajax({
// 		type: "post",
// 		url:"./add",
// 		enctype: 'multipart/form-data',
//         processData: false,
//         contentType: false,
// 		data: formData,
// 		success: function(result){
// 			location.href= "./list";
// 		},error: function(){
// 			console.log("실패");
// 		}
// 	});
}

function order(){
	product = (document.getElementById("productForm"));
	console.log("basket");

// 	$.ajax({
// 		type: "post",
// 		url:"./add",
// 		enctype: 'multipart/form-data',
//         processData: false,
//         contentType: false,
// 		data: formData,
// 		success: function(result){
// 			location.href= "./list";
// 		},error: function(){
// 			console.log("실패");
// 		}
// 	});
}


</script>
</head>
<body>
	<div>
		<div>
			<p>${item.sellerId }</p>
			<p>${item.productCategory }</p>
			<p>${item.productName }</p>
			<p id = "productPrice" data-price="${item.productPrice }">${item.productPrice }</p>
			<p>${item.productDescription }</p>
			<fmt:formatDate value="${item.productRegDate }" pattern="YYYY/MM/dd" />
			<p>${item.productLikeCount }</p>

			<c:if test="${item.productOptionList.size() > 0 }">
				<c:forEach var="option" items="${item.productOptionList }">
					<select class="option" onchange="setOption(this);" data-option="${option.productOptionCode}" 
						${option.productNecessaryOption == 1 ? 'required' : ''}>
						<option selected="selected" value="0" disabled>${option.productOptionName}${option.productNecessaryOption == 1 ? '(필수)' : ''}</option>
						<c:forEach var="detail" items="${option.productOptionDetail}">
							<option value="${detail.productOptionDetailCode }">${detail.productOptionDetailName}</option>
						</c:forEach>
					</select>
				</c:forEach>
			</c:if>

			<c:if test="${item.productImageList.size() > 0 }">
				<c:forEach var="image" items="${item.productImageList }">
					<p><img class="productImage" src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></p>
				</c:forEach>
			</c:if>


		</div>
		<div id="optionContiner"></div>
		<div>
			<button type="button" onclick="basket();">장바구니</button>
			<button type="button"  onclick="order();">구매하기</button>
		</div>
	</div>
</body>
</html>