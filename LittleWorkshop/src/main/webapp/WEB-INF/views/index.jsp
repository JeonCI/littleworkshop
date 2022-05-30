<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
<!--공통 CD  N -->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 

<!--공통 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/css/index.css">

</head>
<body>
	<header>
        <div class="container login_area">
        	<c:if test="${account != null }">
				${account.nickName} 님
				<c:if test="${account.classify == 3 }">
					<ul class="bar">｜</ul>
					<ul><a href="admin/manage">관리자 페이지</a></ul>
				</c:if>
				<ul class="bar">｜</ul>
				<ul><a href="logout">로그아웃</a></ul>
			</c:if>
			<c:if test="${account == null }">
			<ul><a href="login">로그인</a></ul>
			<ul class="bar">｜</ul>
            <ul><a href="signup">회원가입</a></ul>
			</c:if>
        </div>
        <hr>
        <div class="container content_area">
            <div class="logo">
                <a href="./"><img src="/image/logo.png"></a>
            </div>
           <form class="search" method="get" action="/product/search" autocomplete >
               <input class="searchbox" type="text" name="keyword" placeholder="원하시는 물건을 찾아보세요! ">
                <i class="bi bi-search"></i>
           </form>
           <div class="icon">
            <i class="bi bi-person-circle"></i>
            <i class="bi bi-cart"  ></i>
            <i class="bi bi-heart" ></i>
            </div>
        </div>
        <hr>
        <div class="container menubar">
            <div class="category">카테고리</div>
            <div><a href="product/list">추천작품</a></div>
            <div><a href="#">최신작품</a></div>
            <div><a href="#">인기작품</a></div>
            <div><a href="#">인기작가</a></div>
            <div><a href="#">작가추천</a></div>
            <div><a href="#">할인작품</a></div>
            <div><a href="#">제품후기</a></div>
            <div><a href="#">기획/이벤트</a></div>
            <div><a href="notice/list">공지사항</a></div>
            <div id="shopmenu">
                <ul><a href="#">쇼핑샵</a></ul>
                <ul>｜</ul>
                <ul><a href="#">후원샵</a></ul>
            </div>
        </div>
    </header>
    <div class="container mainbanner">
            <img src="/image/main.png">
        </div>
    <div class="container maincontent">
    <div class="title"><span>ONLY YOU</span><span id="heart">♥</span> 이런 작품 어떠세요?</div>
    <div class="show_more"><a href="#">더보기</a></div>
     <div class="box_area">
                <div><a href="#"><img src="image/image1.jpg"></a></div>
                <div>
                    <div class="product_box">
                        <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                          <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr">판매자명</div>
                        <div class="product_name"> 제품명</div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                        <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                    </div>
                    <div class="product_box">
                          <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                          <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                          <div class="only-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="title"><span>NEW&nbsp;</span> 최신작품</div>
        <div class="box_area2">
            <div class="product_box">
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                       <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
            </div>
            <div class="new_product_box">
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
            </div>
        </div>
        
         <div class="title"><span>BEST PICK&nbsp;</span> 인기작품</div>
        <div class="box_area2">
            <div class="product_box">
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                       <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
            </div>
            <div class="new_product_box">
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                       <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
                  <div class="new-box">
                        <button><i class="bi bi-heart"></i></button>
                        <div class="product_img"><a href="#"><img src="image/11.png"></a></div>
                        <div class="sellr"><a href="#">판매자명</a></div>
                        <div class="product_name"><a href="#">제품명</a></div>
                        <div class="price">
                        <div>가격</div>
                        </div>
                        </div>
            </div>
        </div>
        
        <div class="title"><span>ON SALE&nbsp;</span> 할인작품</div>
        <div class="box_area3">
            <div class="discount-box">
                <div class="product_img"><a href="#"><img src="image/11.png"></a>
                <div>ddd</div>
                </div>
                <div></div>
                <div></div>
            </div>
            <div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        </div>
        
    <footer>
        <hr>
        <div class="container footer_area">
            <ul><a href="#">소공방 소개</a></ul>
            <ul class="footer_bar">｜</ul>
            <ul><a href="#">이용약관</a></ul>
            <ul class="footer_bar">｜</ul>
            <ul><a href="#">개인정보처리방침</a></ul>
            <ul class="footer_bar">｜</ul>
            <ul><a href="#">상품입점 문의</a></ul>
        </div>
        <hr>
        <div class="footer_detail">
            <div>
            <p>소공방 주식회사</p>
            <p>대표이사 : 전필송현  ｜  사업자등록번호 : 000-00-00000</p>
            <p>주소 : (00000) 대전광역시 동구 우암대로 327-2 2층 (한스타워)</p>
            <br> 
            <p>소공방은 통신판매중개자이며 통신판매의 당사자가 아닙니다.</p>
            <p>따라서 소공방은 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
            <br>
            <p>Copyright © 2022 Sogongbang All right reserved.</p></div>
            <div>
            <p>대전광역시 동구 가양동 우암로 352-21 (주 7일 오전 9시 ~ 저녁 10시)</p>
            <p>Tel : 0000-0000   ｜   판매자 전용 Tel : 0000-0000</p>
            <p>Mail : Sogongbang @gmail.com</p>
            <p>제휴문의 : moacat@gmail.com</p>
            </div>
            <div>
                <div class="footer_logo"><img src="image/logo.png"></div>
                <div class="footer_sns"><img src="image/pngwing.com%20(1).png">
                <img src="image/pngwing.com.png">
                <img src="image/blog.png">
                <img src="image/pngwing.com%20(2).png">
                </div>
            </div>
        </div>
    </footer>
</body>	
</html>