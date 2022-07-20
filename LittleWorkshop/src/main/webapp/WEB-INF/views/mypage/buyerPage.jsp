<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<!--공통 CD  N -->  
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!--공통 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
* {
	list-style: none;
}
#wrap{
    width: 1200px;
    margin: auto;
    margin-top: 50px;
}
span{
	font-weight: bold; 
}
#buyerContent >div, #sellerContent > div {
border-bottom : 1px solid #dddddd;
margin-bottom: 10px;
padding-bottom: 10px;
width: 300px;
}
body > div{
	display: flex;
}
#orders{
	border : 1px solid #dddddd;
	width: 800px;
	height: 72px;
}
#orders > ul{
	display: flex;
}
#orders > ul > li{
	list-style: none;
	margin-right: 20px;
}
#orders > ul > li{
	display: grid;
}

#buyerInfo>div:nth-child(2)>div {
	display: flex;
}

#buyerInfo{
	border: 1px solid #dddddd;
	margin-bottom: 30px;
	padding: 30px;
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
	display: flex;
}

#paymentList > div:nth-child(2){
	display: flex;
}
#profile{
	border: 1px solid #dddddd;
	margin-bottom: 15px;
}
.profileImg{
	display: block;
	width:100px;
	height:100px;
	border-radius: 10%;
}
</style>
<script>
window.onload = function() {
	
	let input = document.getElementById("img");
	input.addEventListener('change', function(){
		let profileImg = new FormData(document.getElementById("profileImg_form"));
		// 변경
		$.ajax({
			type: "post",
			url:"./profileImg",
			enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
			data: profileImg,
			success: function(result){
				console.log("dd");
			},error: function(){
				console.log("실패");
			}
		});
		
		// 미리보기
	    for(let image of event.target.files){
	        let img = document.getElementById("profileImg");
		  	const reader = new FileReader();
			reader.onload = function(event){
				img.setAttribute("src", event.target.result);
			}
			reader.readAsDataURL(event.target.files[0]);	
		}
	});
}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="wrap">
	<div>
		<div id="profile">
			<div>
				<form id="profileImg_form" method="post" action="./profileImg" enctype="multipart/form-data">
					<label class="profileImg" for="img">
						<c:if test="${profileImage == null}">
							<img id="profileImg" class="profileImg" src="/image/deer-g379da77a8_1920.jpg">
						</c:if>
						<c:if test="${profileImage != null}">
							<img id="profileImg" class="profileImg" src="/upload/profileImg/${profileImage.id}/${profileImage.profileImageUuid}">
						</c:if>
					</label>
					<input id="img" type="file" accept="image/*" hidden="hidden" name="profileImg">
				</form>
			</div>
			<span>${account.nickName} 님 환영합니다</span>
		</div>
		<div id="buyerContent">
			<div>
				<span>내 정보</span>
				<div><a href="./accountInfo_Edit">회원정보 관리</a></div>
				<div><a href="./address">배송지 관리</a></div>
			</div>
			<div>
				<span>주문배송</span>
				<div><a href="./orderList">주문내역</a></div>
				<div><a>취소/환불내역</a></div>
			</div>
	
			<div>
				<span>알림/메세지</span>
				<div><a>알림</a></div>
				<div><a>메세지</a></div>
			</div>
			<div>
				<span>나의 후기</span>
				<div><a href="./reviewList">후기쓰기</a></div>
				<div><a href=".">후기목록</a></div>
			</div>
			<div>
				<span>관심리스트</span>
				<div><a href="./like">좋아요 목록</a></div>
			</div>
		</div>
	</div>
	<div>
		<div id="orders">
			<ul>
				<li><span>준비중 작품</span> <span>${status.preparation}</span></li>
				<li><span>배송중 작품</span> <span>${status.delivery}</span></li>
				<li><span>배송 완료</span> <span>${status.completed}</span></li>
				<li><span>취소/환불완료</span> <span>${status.refund}</span></li>
			</ul>
		</div>
		<div id="order">
			<div id="buyerInfo">
				<h3>최근 주문 작품</h3>
				<div>
					<c:if test="${orderHistory.size() > 0}">
					<div id="paymentList">
						<c:forEach var="item" items="${orderHistory}" varStatus="status"  end="5">
								<div>
								<div class="productBox">
									<c:forEach var="product" items="${item.productList}">
											<c:forEach var="image" items="${product.productImageList}" end="0">
												<div class="productImage">
													<a href="/product/view/${product.productCode}"><img src="/upload/productimage/${product.sellerId}/${product.productCode}_${product.productName}/${image.productImageUuid}"></a>
												</div>
											</c:forEach>
									</c:forEach>
									</div>
								</div>
						</c:forEach>
						</div>
					</c:if>
				</div>
				<a href="./orderList"><button>주문 작품 더보기</button></a>
			</div>
		</div>
		<div id="like">
			<div id="buyerInfo">
				<h3>좋아요 작품</h3>
				<div>
					<c:if test="${orderHistory.size() > 0}">
					<div id="paymentList">
						<c:forEach var="item" items="${likeList}" varStatus="status"  end="5">
								<div>
								<div class="productBox">
											<c:forEach var="image" items="${item.productImageList}" end="0">
												<div class="productImage">
													<a href="/product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
												</div>
											</c:forEach>
									</div>
								</div>
						</c:forEach>
						</div>
					</c:if>
				</div>
				<a href="./like"><button>좋아요 작품 더보기</button></a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>