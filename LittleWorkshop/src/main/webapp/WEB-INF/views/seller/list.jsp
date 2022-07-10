<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<title>Little Workshop</title>
<style>
a {
	text-decoration: none;
}

#wrap {
	width: 1200px;
	margin: auto;
}
#sllerDiv{
display: flex;
margin: 50px auto;
}
.profileImg{
    margin-left: auto;
	display: block;
	width:250px;
	height:250px;
}
.sellerInfo{
	display: block;
}
#sellerInfoDiv{
    margin-left: 50px;
    margin-right: auto;
	display: block;
}
#productDiv{
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

#productDiv > form > input, select
{
	height: 30px;
	border: 1px solid #888888;
}
#productDiv > form > input{
	padding-left:10px;
	width: 212px;
	height: 28px;
}
</style>
<script>
	window.onload = function() {

	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="wrap">
	<div id="sllerDiv">
		<c:if test="${profileImage == null}">
			<img class="profileImg" src="/image/deer-g379da77a8_1920.jpg">
		</c:if>
		<c:if test="${profileImage != null}">
			<img class="profileImg" src="/upload/profileImg/${profileImage.id}/${profileImage.profileImageUuid}">
		</c:if>
		<div id="sellerInfoDiv">
			<span class="sellerInfo">${seller.id}</span>
			<span class="sellerInfo">작가 태그</span>
			<span class="sellerInfo">작가 프로필 설명</span>
			<div>
				<span>별점</span>
				<span>팔로워</span>
			</div>
			<div>
				<button>+ 팔로우</button>
				<button>주소 복사</button>
			</div>
			
			
		</div>

	</div>
	<div id="productDiv">
		<span>검색 총 갯수</span>
		<form>
			<input type="text" placeholder="작가님의 작품 검색">
			<select>
				<option>인기순</option>
				<option>최신순</option>
			</select>
		</form>
	</div>
	<ul class="items">
		<c:forEach var="item" items="${list}">
			<li class="new_item">
				<button>
					<i class="bi bi-heart ${item.likeState != 0 ? 'push':''}" onclick="heartPush(this)" data-product_code="${item.productCode}"></i>
				</button> <c:forEach var="image" items="${item.productImageList}" end="0">
					<div class="product_img">
						<a href="/product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
					</div>
				</c:forEach>
				<div class="pd-txt">
					<div><a href="#">${item.sellerId}</a></div>
					<div><a href="#">${item.productName}</a></div>
					<div><div><fmt:formatNumber value="${item.productPrice}" />원</div></div>
				</div>
		</c:forEach>
	</ul>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>