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
		<h1>상품 카테고리 변경</h1>
		<form method="post">
			<div>
				<label>카테고리 이름 : </label>
				<input type="text" name="noticeCategory" value="${item.noticeCategory }">
				<button>변경</button>
			</div>
		</form>
		<a href="../noticeCategoryList">이전으로</a>
	</div>
</body>	
</html>