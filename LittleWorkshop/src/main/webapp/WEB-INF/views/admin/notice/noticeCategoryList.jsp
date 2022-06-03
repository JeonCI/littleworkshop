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
		<h1>공지 카테고리 목록</h1>
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
					<c:if test="${noticeCateogryList.size() < 1 }">
						<tr>
							<td colspan="5">등록된 카테고리가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${noticeCateogryList.size() > 0 }">
					<c:forEach var="item" items="${noticeCateogryList}">
						<tr>
							<td>${item.noticeCategoryCode}</td>
							<td>${item.noticeCategory }</td>
							<td><a href="noticeCategoryUpdate/${item.noticeCategoryCode}">수정</a> / <a href="noticeCategoryDelete/${item.noticeCategoryCode }">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
			<form action="noticeCategoryAdd" method="post">
				<div>
					<label>카테고리 이름 : </label>
					<input type="text" name="noticeCategory">
					<button>등록</button>
				</div>
			</form>
		</div>
		<a href="../manage">이전 으로</a>
	</div>
</body>	
</html>