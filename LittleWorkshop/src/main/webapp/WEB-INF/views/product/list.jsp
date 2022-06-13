<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

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


}

function setCategory(category){
	
	category.classList.toggle("click");

}
</script>
<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div>
		<h1>상품 목록</h1>
		<form method="get" id="searchForm">
			<input type="hidden" id="search" name="search">
			<c:if test="${categoryList.size() > 0 }">
				<ul>
				<li class="category ${pager.search==0?'click':''}" onclick="setCategory(this);"><a href="./list?${pager.type}">전체</a></li>
				<c:forEach var="category" items="${categoryList}">
					<li class="category ${category.productCategoryCode == pager.search?'click':''}" onclick="setCategory(this);" value="${category.productCategoryCode}"><a href="./list?search=${category.productCategoryCode}${pager.query}">${category.productCategory}</a></li>
				</c:forEach>
				</ul>
			</c:if>
		</form>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>상품 번호</td>
						<td>판매자</td>
						<td>카테고리</td>
						<td>상품명</td>
						<td>상품가격</td>
						<td>상품 등록일</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="7">등록된 제품이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>${item.productCode}</td>
							<td>${item.sellerId}</td>
							<td>${item.productCategory}</td>
							<td><a href="view/${item.productCode}">${item.productName}</a></td>
							<td>${item.productPrice}</td>
							<td><fmt:formatDate value="${item.productRegDate }" pattern="yyyy/MM/dd"/></td>
							<td><a href="update/${item.productCode }">수정</a> / <a href="delete/${item.productCode }">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>

	</div>
	<div class="pager">
		<div>
			<a href="?page=${pager.prev }&${pager.query}">&lt; &nbsp;</a>
			<c:forEach var="page" items="${pager.list }">
				<a href="?page=${page }&${pager.query} ">${page }</a>
			</c:forEach>
			<a href="?page=${pager.next }&${pager.query}">&nbsp; &gt;</a>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>	
</html>