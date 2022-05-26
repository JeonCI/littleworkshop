<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>
</head>
<body>
	<div>
		<h1>상품 카테고리 목록</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>카테고리 번호</td>
						<td>카테고리 이름</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${productCateogryList.size() < 1 }">
						<tr>
							<td colspan="5">등록된 카테고리가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${productCateogryList.size() > 0 }">
					<c:forEach var="item" items="${productCateogryList}">
						<tr>
							<td>${item.productCategoryCode}</td>
							<td>${item.productCategory }</td>
							<td><a href="productCategoryUpdate/${item.productCategoryCode}">수정</a> / <a href="productCategoryDelete/${item.productCategoryCode }">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
			<form action="productCategoryAdd" method="post">
				<div>
					<label>카테고리 이름 : </label>
					<input type="text" name="productCategory">
					<button>등록</button>
				</div>
			</form>
		</div>
	</div>
</body>	
</html>