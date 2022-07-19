<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<header>
        <div class="container login_area">
        	<c:if test="${account != null }">
				${account.nickName} 님
				<ul class="bar">｜</ul>
				<ul><a href="/logout">로그아웃</a></ul>
			</c:if>
			<c:if test="${account == null }">
			<ul><a href="/login">로그인</a></ul>
			<ul class="bar">｜</ul>
            <ul><a href="/signup">회원가입</a></ul>
			</c:if>
        </div>
        <hr>
        <div class="container content_area">
            <div class="logo">
                <a href="/"><img src="/image/logo.png"></a>
            </div>
           <form class="search" method="get" action="/product/search" autocomplete>
               <input class="searchbox" type="text" name="keyword" placeholder="원하시는 물건을 찾아보세요! ">
               <button><i class="bi bi-search"></i></button>
           </form>
           <div class="icon">
               <a href="/mypage/"><i class="bi bi-person-circle"></i></a>
               <a href="/basket"><i class="bi bi-cart"></i></a>
               <a href="/mypage/like"><i class="bi bi-heart"></i></a>
            </div>
        </div>
        <hr>
         <div class="container menubar">
           <div class="dropdown">
            <div class="category">카테고리</div>
            <div class="dropdown-content">
            <div><a href="/product/search?search=1">패션/잡화</a></div>
            <div><a href="/product/search?search=2">악세서리</a></div>
            <div><a href="/product/search?search=3">인테리어 소품</a></div>
            <div><a href="/product/search?search=4">반려동물</a></div>
            <div><a href="/product/search?search=5">전자기기</a></div>
            <div><a href="/product/search?search=6">뷰티/화장품</a></div>
            <div><a href="/product/search?search=7">가구</a></div>
            <div><a href="/product/search?search=8">식품</a></div>
            <div><a href="/product/search?search=9">문구/팬시</a></div>
            <div><a href="/product/search?search=10">공예</a></div>
        </div>
        	</div>
            <div><a href="/product/rcmndList">추천작품</a></div>
            <div><a href="/product/list?condition=lates">최신작품</a></div>
            <div><a href="/product/list?condition=best">인기작품</a></div>
            <div><a href="#">인기작가</a></div>
<!--             <div><a href="#">작가추천</a></div> -->
            <div><a href="#">할인작품</a></div>
            <div><a href="#">기획/이벤트</a></div>
            <div><a href="/notice/list">공지사항</a></div>
            <div id="shopmenu">
                <ul><a href="/">쇼핑샵</a></ul>
                <ul>｜</ul>
                <ul><a href="/fd/fdMain">후원샵</a></ul>
            </div>
        </div>
        <hr>
    </header>