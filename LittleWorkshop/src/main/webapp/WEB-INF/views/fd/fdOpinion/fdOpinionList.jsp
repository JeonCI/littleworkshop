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
		console.log(this.dataset.code);
	}
	
	function formSub() {
		var form = document.getElementById("fdOpinion");
		
		form.submit();
	}
	
	function confirm() {
		let fdCode = this.dataset.fdcode;
		let foc = this.dataset.foc;
		
		var xhr = new XMLHttpRequest();
		
		xhr.open('GET', `../confirm?fdCode=${fdCode}&fdOpinionCode=${item.foc}`, true);

		xhr.send();
		
		xhr.onload = () => {
			if (xhr.status == 200) {
				var td = document.createElement("td");

				td.innerText = "채택!!";

				this.parrent.appendChild(td);
				this.remove;
			} else {xhr.statusText}
		}
	}
</script>

</head>
<body>
	<div>
		<h1>펀딩 목록</h1>
		<div>
			<form method="POST" action="../fdOpinionAdd" id="fdOpinion">
				<input type="number" hidden="hidden" value="${fdCode}" name="fdCode">
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
							<c:if test="${account.classify == 2 && item.selection == '' && item.fdSellerId == account.id}">
								<td><button type="button" onclick="confirm()" data-fdCode="${fdCode}" data-foc="${item.fdOpinionCode}">채택하기</button></td>
							</c:if>
							<td>${item.selection}</td>
							<td>${item.producerAnswer != null ? 'item.producerAnswer':'' }</td>
							<td><button type="button" onclick="opUpdate()" data-code="${item.fdOpinionCode}">수정하기</button> / <a href="delete/${item.fdOpinionCode }">삭제</a></td>
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