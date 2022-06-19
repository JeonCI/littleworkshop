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
<!--공통 CD  N -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!--공통 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<script>
window.onload = function() {
	
};
function heartPush(icon){
	
	var xhr = new XMLHttpRequest();

    let productCode = icon.dataset.product_code;
    let url = '/product/heartPushAction?productCode=' + productCode;
	
	xhr.open('GET', url, true);
	xhr.send();
	xhr.onload = () => {
		if (xhr.status == 200){
			
			if(xhr.response === "success")
				icon.classList.toggle("push");
			else{
				let login = confirm("로그인이 필요한 서비스입니다.");
				if(login)
					location.href= "/login";
				
			}
			
		}else
			console.log(xhr.statusText);

	}

}
</script>
<style>
#wrap{
	width: 1200px;
	margin: auto;
}
#productContainer{
	display: flex;
}
.item{
    width: 244px;
    height: 271px;
    margin-bottom: 19px;
    box-shadow: 0 0 0  1px #dddddd inset;
    float:left;
    cursor: pointer;
}
item>div>a>img{
    width: 240px;
    height: 168px;
    margin-left: 2px;
    margin-top: 1px;
}
.item>button{
    border: 0;
    background-color: #00ff0000;
    position: absolute;
    margin-left: 210px;
    margin-top: 5px;
    width: 24px;
    height: 24px;
    font-size: 20px;  
}
.new_item{
    width: 290px;
    height: 300px;
    float: left;
    box-shadow: 0 0 0 1px #dddddd inset;
    margin-right: 13px;
    margin-bottom: 14px;
    cursor: pointer;
}
.new_item:nth-child(4n){
    margin-right:0px;
}
.new_item>div>a>img{
    width: 286px;
    height: 190px;
    margin-left: 2px;
    margin-top: 2px;
}
.new_item>button{
    border: 0;
    background-color: #00ff0000;
    position: absolute;
    margin-left: 256px;
    margin-top: 5px;
    width: 24px;
    height: 24px;
    font-size: 20px;
    cursor: pointer;  
}
.bg{
    background-color: #fff;
}

button>.push {
	background-color: red;
}
</style>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="wrap">
		<h1>좋아요</h1>
		<div id="productContainer">
			<c:if test="${list.size() < 1 }">
				<div>찜한 작품이 없습니다</div>
			</c:if>
			
			<c:if test="${list.size() > 0 }">
				<ul>
				<c:forEach var="item" items="${list}">
					<li class="new_item">
						<button><i class="bi bi-heart ${item.likeState != 0 ? 'push':''}" onclick="heartPush(this)" data-product_code="${item.productCode}"></i></button>
							<c:forEach var="image" items="${item.productImageList}" end="0">
								<div class="product_img">
									<a href="product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
								</div>
							</c:forEach>
					<div class="pd-txt">
					<div><a href="#">${item.sellerId}</a></div>
						<div><a href="#">${item.productName}</a></div>
	 					<div><div><fmt:formatNumber value="${item.productPrice}"/>원</div></div>
					</div>
				</c:forEach>
				</ul>
			</c:if>

		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>