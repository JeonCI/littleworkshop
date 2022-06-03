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
.productImage{
width: 100px;
height: 100px;
}
</style>

<script>
//  상품명, 판매자 아이디, 가격, 옵션정보, 상품 갯수, 상품사진
</script>
</head>
<body>
	<div>
		<h1>장바구니</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>판매자</td>
						<td>상품명</td>
						<td>상품가격</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="3">등록된 제품이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>${item.sellerId}</td>
							<td><a href="view/${item.productCode}">${item.productName}</a></td>
							<td>${item.productPrice}</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>

	</div>
</body>	
</html>