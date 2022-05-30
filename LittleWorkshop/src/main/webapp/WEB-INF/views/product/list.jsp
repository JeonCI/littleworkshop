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
.click{
	color : blue;
}
</style>
<script>

window.onload = function(){


}

function setCategory(category){
// 	if(category.classList.contains("click"))
// 		document.getElementById("search").value = '';
// 	else
// 		document.getElementById("search").value = category.value;
	category.classList.toggle("click");

// 	document.getElementById("searchForm").submit();
}
</script>
</head>
<body>
	<div>
		<h1>상품 목록</h1>
		<form method="get" id="searchForm">
			<input type="hidden" id="search" name="search">
			<c:if test="${categoryList.size() > 0 }">
				<ul>
				<c:forEach var="category" items="${categoryList}">
					<li class="category ${category.productCategoryCode == pager.search?'click':''}" onclick="setCategory(this);" value="${category.productCategoryCode}">${category.productCategory}</label>
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
		<div>
			<ul>
				<li><a href="add">제품 등록</a></li>
			</ul>
		</div>
	</div>
</body>	
</html>