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
		<h1>공지 목록</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>아이디</td>
						<td>회원명</td>
						<td>닉네임</td>
						<td>가입일</td>
						<td>회원유형</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${accountList.size() < 1 }">
						<tr>
							<td colspan="6">등록된 계정이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${accountList.size() > 0 }">
					<c:forEach var="item" items="${accountList}">
						<tr>
							<td>${item.id}</td>
							<td>${item.accountName }</td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.accountRegDate}" pattern="yyyy-MM-dd"/></td>
							<td>${item.classifyStr}</td>
							<td><a href="accountUpdate/${item.id}">회원 수정</a> / <a href="accountDelete/${item.id }">회원 삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div>
			<ul>
				<li><a href="../manage">이전 으로</a></li>
			</ul>
		</div>
	</div>
</body>	
</html>