<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<script>
	function opUpdate() {
		console.log(this.dataset.code());
	}
	
	function formSub() {
		var form = document.getElementById("fdOpinion");
		
		form.submit();
	}
</script>

</head>
<body>
	<div>
		<h1>펀딩 목록</h1>
		<div>
			<form method="POST" action="../fdOpinionAdd" id="fdOpinion">
				<label>펀딩 의견</label>
				<textarea name="fdOpinion"></textarea>
				<button type="button" onclick="formSub()">게시하기</button>
			</form>
			<table border="1">
				<thead>
					<tr>
						<td>아이디</td>
						<td>내용</td>
						<td>추천 수</td>
						<td>등록일</td>
						<td>작가 채택 여부</td>
						<td>작가 의견</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="7">등록된 의견이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>${item.writerId}</td>
							<td><textarea readonly="readonly" id="fdOpinion${item.fdOpinionCode}">${item.fdOpinion}</textarea> </td>
							<td>${item.goodCount}</td>
							<td><fmt:formatDate value="${item.fdOpinionRegDate }" pattern="yyyy/MM/dd"/></td>
							<td>${item.selection}</td>
							<td>${item.fdOpinionAnswer != null ? 'item.fdOpinionAnswer':'' }</td>
							<td><button type="button" data-code="${item.fdOpinionCode}">수정하기</button> / <a href="delete/${item.fdOpinionCode }">삭제</a></td>
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