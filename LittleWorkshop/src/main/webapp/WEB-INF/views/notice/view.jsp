<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<p>${item.noticeCode}</p>
			<p>${item.noticeCategoryName}</p>
			<p>${item.noticeSubject}</p>
			<p>${item.noticeRegistrant}</p>
			<fmt:formatDate value="${item.noticeRegDate}" pattern="yyyy-MM-dd"/>
			<p>${item.noticeContents}</p>
		</div>
		<a href="../list">이전</a>
	</div>
</body>
</html>