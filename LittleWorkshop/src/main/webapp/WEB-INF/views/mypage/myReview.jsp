<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Little Workshop</title>
<!--공통 CD  N -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
<!--공통 폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<script>
window.onload = function() {
	let list = document.getElementsByName("reviewScore");
	let updateBtn = document.getElementById("updateBtn"); 
	let addBtn = document.getElementById("addBtn"); 
	let deleteBtn = document.getElementById("deleteBtn"); 
	 
	for (var i = 0, len = list.length; i < len; i++) {
		 if(list[i].checked){
		 	for(let j = 0; j < list[i].value; j++)
			 	list[j].previousElementSibling.classList.add("select"); 	
		 }
	 }
	

	 if(updateBtn != null)
		 updateBtn.addEventListener('click', function(){
			 updateBtn.setAttribute("hidden","hidden");
			 addBtn.removeAttribute("hidden");
			 document.getElementById("contents").readOnly = false;
			 for (var i = 0, len = list.length; i < len; i++) {
				 list[i].addEventListener('click', function(){
					 for(let j = 0; j < list.length; j++)
						 list[j].previousElementSibling.classList.remove("select");
					 
					 for(let j = 0; j < this.value; j++)
						 list[j].previousElementSibling.classList.add("select"); 
				 });	
			 }
			 
			 addBtn.addEventListener('click', function(){
				 document.getElementById("reviewForm").submit();
			 });
		 });
	 
	 if(deleteBtn != null)
		 deleteBtn.addEventListener('click', function(){
			 if(confirm("삭제 후 다시 작성이 불가능합니다. 정말 삭제하시겠습니까? ")){
				 let action = document.getElementById("reviewForm").getAttribute("action");
				 location.href = action.replace("myReview","myReview/delete");
			 }
		 });
	 
	 
	 
};


</script>
<style>
#wrap{
	width: 1200px;
	margin: auto;
}

.product_img > a > img{
    width: 160px;
    height: 160px;
}
.new_item{
	display: flex;
}
.new_item > div:last-child{
	margin-left: 20px;
}

#contents {
	width: 800px;
	height: 100px;
} 
.bi-star-fill::before {
    content: "\f586";
    font-size: 30px;
    color : #dddddd;
}
 #reviewScore{ 
 	display: flex; 
 } 
.select::before{
color: yellow;
}
</style>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="wrap">
		<div id="productContainer">
			<c:if test="${list.size() > 0 }">
				<ul>
				<c:forEach var="item" items="${list}">
					<li class="new_item">
					<c:forEach var="image" items="${item.productImageList}" end="0">
						<div class="product_img">
							<a href="/product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
						</div>
					</c:forEach>
						<div>
							<div id="productName"><a href="#">${item.productName} <span>(${item.orderInfo} ${item.orderAmount}개)</span></a></div>
							<div id="sellerId"><a href="/seller/${item.sellerId}">${item.sellerId}</a></div>
							<form id="reviewForm" method="post" action="./myReview/${item.reviewCode}">
								<div>
									<input type="hidden" name="productCode" value="${item.productCode}">
									<input type="hidden" name="orderCode" value="${item.orderCode}">
								</div>
								<div>
									<textarea id="contents" name="reviewContents" readonly>${item.reviewContents}</textarea>
								</div>
								<div id="reviewScore">
									<div>
										<label for="reviewScore_1" data-score="1">
											<i class="bi bi-star-fill"></i>
											<input type="radio" id="reviewScore_1" name="reviewScore" hidden value="1" ${item.reviewScore == 1? 'checked':''}>
										</label>
									</div>
									<div>
										<label for="reviewScore_2" data-score="2">
											<i class="bi bi-star-fill"></i>
											<input type="radio" id="reviewScore_2" name="reviewScore" hidden value="2" ${item.reviewScore == 2? 'checked':''}>
										</label>
									</div>
									<div>
										<label for="reviewScore_3" data-score="3">
											<i class="bi bi-star-fill"></i>
											<input type="radio" id="reviewScore_3" name="reviewScore" hidden value="3" ${item.reviewScore == 3? 'checked':''}>
										</label>
									</div>
									<div>
										<label for="reviewScore_4" data-score="4">
											<i class="bi bi-star-fill"></i>
											<input type="radio" id="reviewScore_4" name="reviewScore" hidden value="4" ${item.reviewScore == 4? 'checked':''}>
										</label>
									</div>
									<div>
										<label for="reviewScore_5" data-score="5">
											<i class="bi bi-star-fill"></i>
											<input type="radio" id="reviewScore_5" name="reviewScore" hidden value="5" ${item.reviewScore == 5? 'checked':''}>
										</label>
									</div>
									<div id="btnDiv">
										<button type="button" id="addBtn" hidden>확인</button>
										<button type="button" id="updateBtn">수정</button>
										<button type="button" id="deleteBtn">삭제</button>
									</div>
								</div>
							</form>
						</div>
					</li>
				</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>