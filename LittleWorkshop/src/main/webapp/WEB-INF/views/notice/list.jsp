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
						<td>공지 번호</td>
						<td>공지 제목</td>
						<td>등록일</td>
						<td>등록자</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="5">등록된 공지가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.noticeCode}</td>
							<td><a href="view/${item.noticeCode}">[${item.noticeCategoryName}] ${item.noticeSubject }</a></td>
							<td><fmt:formatDate value="${item.noticeRegDate}" pattern="yyyy-MM-dd"/></td>
							<td>${item.noticeRegistrant}</td>
							<td><a href="update/${item.noticeCode}">수정</a> / <a href="delete/${item.noticeCode }">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div>
			<ul>
				<li><a href="add">공지 등록</a></li>
				<li><a href="../">이전 으로</a></li>
			</ul>
		</div>
	</div>
</body>	
</html>