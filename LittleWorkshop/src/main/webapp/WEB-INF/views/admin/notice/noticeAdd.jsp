<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<div>
		<div>
			<form method="post">
				<div>
					<label>등록자 : </label>
					<input type="text" value="소공방" readonly="readonly" name="noticeRegistrant">
				</div>
				<div>
					<label>카테고리 : </label>
					<select name="noticeCategoryCode">
						<option selected="selected" disabled="disabled">카테고리</option>
						<c:forEach var="category" items="${noticeCategoryList }">
							<option value="${category.noticeCategoryCode}">${category.noticeCategory}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>공지 제목 : </label>
					<input type="text" name="noticeSubject">
				</div>
				<div>
					<label>강조 : </label>
					<select name="noticeImportant">
						<option value="0" selected="selected">No</option>
						<option value="1">Yes</option>
					</select>
				</div>
				<div>
					<label>공지 내용 : </label>
					<textarea name="noticeContents"></textarea>
				</div>
				<button>등록하기</button>
			</form>
			<a href="./list">뒤로가기</a>
		</div>
	</div>
</body>
</html>