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
		<h1>펀딩 목록</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>펀딩 번호</td>
						<td>판매자</td>
						<td>카테고리</td>
						<td>펀딩 명</td>
						<td>펀딩 가격</td>
						<td>펀딩 진행 상태</td>
						<td>펀딩 등록일</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="8">등록된 펀딩이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>${item.fdCode}</td>
							<td>${item.fdSellerId}</td>
							<td>${item.fdCategory}</td>
							<td><a href="view/${item.fdCode}">${item.fdName}</a></td>
							<td>${item.fdPrice}</td>
							<td>${item.fdState}</td>
							<td><fmt:formatDate value="${item.fdRegDate }" pattern="yyyy/MM/dd"/></td>
							<td><a href="update/${item.fdCode }">수정</a> / <a href="delete/${item.fdCode }">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div>
			<ul>
				<li><a href="add">펀딩 등록</a></li>
			</ul>
		</div>
	</div>
</body>
</html>