<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<!--공통 CD  N -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!--공통 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">


<!-- css -->
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<script>

	function heartPush(icon){
		
		
	
		
			var xhr = new XMLHttpRequest();
	
	        let productCode = icon.dataset.product_code;
	        let url = 'product/heartPushAction?productCode=' + productCode;
			
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="mainbanner">
            <img src="/image/main.png">
        </div>
    <div class="container maincontent">
    <div class="txt">
    <div class="title"><span>ONLY YOU</span><span id="heart">♥</span> 이런 작품 어떠세요?</div>
    <div class="show_more">
        <a class="more" href="#">더보기</a><a href="#"><span class="material-symbols-outlined">add_box</span></a>
   </div>
    </div>
            
        <ul class="items">
          <li class="item1">
              <div><a href="#"><img src="image/image1.jpg"></a></div>
          </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
               <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li> 
       </ul>
		<div class="txt">
        <div class="title"><span>NEW&nbsp;</span>최신작품</div>
        <div class="show_more">
            <a class="more" href="#">더보기</a><a href="#"><span class="material-symbols-outlined">add_box</span></a>
            </div>
        </div>
		<ul class="items">
				<c:forEach var="latesItem" items="${latestList}" end="7">
					<li class="new_item">
						<button><i class="bi bi-heart ${latesItem.likeState != 0 ? 'push':''}" onclick="heartPush(this)" data-product_code="${latesItem.productCode}"></i></button>
							<c:forEach var="image" items="${latesItem.productImageList}" end="0">
								<div class="product_img">
									<a href="product/view/${latesItem.productCode}"><img src="/upload/productimage/${latesItem.sellerId}/${latesItem.productCode}_${latesItem.productName}/${image.productImageUuid}"></a>
								</div>
							</c:forEach>
					<div class="pd-txt">
					<div><a href="#">${latesItem.sellerId}</a></div>
						<div><a href="#">${latesItem.productName}</a></div>
	 					<div><div><fmt:formatNumber value="${latesItem.productPrice}"/>원</div></div>
					</div>
				</c:forEach>
			</ul>

	
        <div class="txt">
            <div class="title"><span>BEST PICK&nbsp;</span> 인기작품</div>
            <div class="show_more">
                <a class="more" href="#">더보기</a><a href="#"><span class="material-symbols-outlined">add_box</span></a>
            </div>
       </div>
        <ul class="items">
            <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
               <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
               <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
               <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
               <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li>
           <li class="new_item">
               <button><i class="bi bi-heart"></i></button>
               <div><a href="#"><img src="image/11.png"></a></div>
                <div class="pd-txt">
                   <div><a href="#">판매자</a></div>
                   <div>제품명</div>
                   <div>100000원</div>
               </div>
           </li> 
       </ul>
       </div>
        <jsp:include page="footer.jsp"></jsp:include>
    
</body>	
</html>