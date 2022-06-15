<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<!--공통 CD  N -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>

a {
  text-decoration: none;
}

.click{
	color : blue;
}
</style>
<script>

window.onload = function(){
	
	let url = location.href.split('?')[0].split('/');
	url = url[url.length-1];
	
// 	if(url === "list")
// 		 Array.from(document.querySelectorAll('.searchCategory')).forEach(function(item, index) {
// 			 item.setAttribute("href", item.getAttribute("href").replace("list","list"));
// 			 console.log(item);
//          }); 
	if(url === "search")
		 Array.from(document.querySelectorAll('.searchCategory')).forEach(function(item, index) {
			 item.setAttribute("href", item.getAttribute("href").replace("list","search"));
			 console.log(item);
         }); 
}

// function setCategory(category){
// 	category.classList.toggle("click");
// }

</script>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/list.css">
<link rel="stylesheet" href="/css/pager.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="banner">
       	<div><img src="/image/deer-g379da77a8_1920.jpg"></div>
        <div class="txt">최신작품</div>
        <div class="txt2"> 소공방이 찜해버린 트렌디 <span>NEW</span> 아이템!</div>
    </div>
    <div class="container maincontent">
    	<form method="get" id="searchForm">
			<input type="hidden" id="search" name="search">
			<div class="categoryMenu">
				<div>카테고리</div>
				<c:if test="${categoryList.size() > 0 }">
					<div class="categorys ${pager.search==0?'click':''}"><a href="./list?condition=${pager.condition}">전체</a></div>
					<c:forEach var="category" items="${categoryList}">
						<div class="categorys ${category.productCategoryCode == pager.search?'click':''}" onclick="setCategory(this);"><a class="searchCategory" href="./list?search=${category.productCategoryCode}${pager.type}">${category.productCategory}</a></div>
					</c:forEach>
				</c:if>
			</div>
		</form>
		<ul class="items">
			<c:if test="${list.size() < 1 }">
				<div>등록된 제품이 없습니다.</div>
			</c:if>
			<c:if test="${list.size() > 0 }">
				<c:forEach var="item" items="${list }">
					<li class="item">
						<c:forEach var="image" items="${item.productImageList}" end="0">
								<div>
									<a href="/product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
								</div>
							</c:forEach>
						<div class="pd-sellr"><a href="#">${item.sellerId}</a></div>
						<div class="pd-name"><a href="view/${item.productCode}">${item.productName}</a></div>
						<div class="pd-price"><a href="#"><fmt:formatNumber value="${item.productPrice}"/>원</a></div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
		<jsp:include page="../pager.jsp"></jsp:include>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>	
</html>