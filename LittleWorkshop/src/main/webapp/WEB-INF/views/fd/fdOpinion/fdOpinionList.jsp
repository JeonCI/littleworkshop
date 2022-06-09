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
	window.onload = function() {
		document.getElementById("addConfirmBtnForm").addEventListener("click", function() {
			let fdCode = this.dataset.code;
			let fdOpCode = this.dataset.foc;

			var target = this;

			addConfirm(fdCode, fdOpCode, target);
		});
		document.getElementById("removeConfirmBtnForm").addEventListener("click", function() {
			let fdCode = this.dataset.code;
			let fdOpCode = this.dataset.foc;

			var target = this;

			removeConfirm(fdCode, fdOpCode, target);
		});

		for (let i = 0; i < document.getElementsByClassName("fdOpUpdateBtn").length; i++) {
			document.getElementsByClassName("fdOpUpdateBtn")[i].addEventListener("click", function() {
				let fdOpinionCode = this.dataset.code;

				console.log(fdOpinionCode);
			});
		};

		for (let i = 0; i < document.getElementsByClassName("addConfirmBtn").length; i++) {
			document.getElementsByClassName("addConfirmBtn")[i].addEventListener("click", function() {
				let fdCode = this.dataset.code;
				let fdOpCode = this.dataset.foc;

				var target = this;

				addConfirm(fdCode, fdOpCode, target);
			});
		};

		for (let i = 0; i < document.getElementsByClassName("removeConfirmBtn").length; i++) {
			document.getElementsByClassName("removeConfirmBtn")[i].addEventListener("click", function() {
				let fdCode = this.dataset.code;
				let fdOpCode = this.dataset.foc;

				var target = this;

				removeConfirm(fdCode, fdOpCode, target);
			});
		}
	}

	function addConfirm(fdCode, fdOpCode, target) {
		var targetParent = target.parentNode;

		let url = "../confirm/" + fdCode + "/" + fdOpCode;

		console.log(fdCode, fdOpCode);
		console.log(url);

		var xhr = new XMLHttpRequest();

		xhr.open('GET', url, true);

		xhr.send();

		xhr.onload = () => {
			if (xhr.status == 200) {
				target.parentNode.innerText = "채택!!";
				target.remove;

				var removeBtnForm = document.getElementById("removeConfirmBtnForm");

				var removeBtn = document.createElement("button");

				removeBtn.innerHTML = removeBtnForm.innerHTML;

				removeBtn.removeAttribute("style");
				removeBtn.classList = "removeConfirmBtn";
				removeBtn.setAttribute("data-code", fdCode);
				removeBtn.setAttribute("data-foc", fdOpCode);
				removeBtn.addEventListener("click", function() {
					let fdCode = this.dataset.code;
					let fdOpCode = this.dataset.foc;

					var target = this;

					removeConfirm(fdCode, fdOpCode, target);
				});

				targetParent.append(removeBtn);
			} else {xhr.statusText}
		};
	}

	function removeConfirm(fdCode, fdOpCode, target) {
		var targetParent = target.parentNode;
		
		let url = "../removeConfirm/" + fdCode + "/" + fdOpCode;
		
		console.log(fdCode, fdOpCode);
		console.log(url);
		
		var xhr = new XMLHttpRequest();
		
		xhr.open('GET', url, true);

		xhr.send();

		xhr.onload = () => {
			if (xhr.status == 200) {
				target.parentNode.innerText = "";
				target.remove;

				var addBtnForm = document.getElementById("addConfirmBtnForm");

				var addBtn = document.createElement("button");

				addBtn.innerHTML = addBtnForm.innerHTML;

				addBtn.removeAttribute("style");
				addBtn.classList = "addConfirmBtn";
				addBtn.setAttribute("data-code", fdCode);
				addBtn.setAttribute("data-foc", fdOpCode);
				addBtn.addEventListener("click", function() {
					let fdCode = this.dataset.code;
					let fdOpCode = this.dataset.foc;

					var target = this;

					addConfirm(fdCode, fdOpCode, target);
				});

				targetParent.append(addBtn);
			} else {xhr.statusText}
		};
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
				<input type="number" hidden="hidden" value="${fdCode}" name="fdCode">
				<label>펀딩 의견</label>
				<textarea name="fdOpinion"></textarea>
				<button type="button" onclick="formSub()">게시하기</button>
			</form>
			<table border="1">
				<thead>
					<tr>
						<td>의견 번호</td>
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
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="8">등록된 의견이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${list.size() > 0 }">
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr>
							<td>${item.fdOpinionCode}</td>
							<td>${item.writerId}</td>
							<td><textarea readonly="readonly" id="fdOpinion${item.fdOpinionCode}">${item.fdOpinion}</textarea> </td>
							<td>${item.goodCount}</td>
							<td><fmt:formatDate value="${item.fdOpinionRegDate }" pattern="yyyy/MM/dd"/></td>
							<c:if test="${account.classify == 2 && item.fdSellerId == account.id}">
								<c:if test="${item.producerSelection == 0 }">
									<td><button type="button" class="addConfirmBtn" data-code="${fdCode}" data-foc="${item.fdOpinionCode}">채택하기</button></td>
								</c:if>
								<c:if test="${item.producerSelection == 1 }">
									<td>채택!! <button type="button" class="removeConfirmBtn" data-code="${fdCode}" data-foc="${item.fdOpinionCode}">채택취소</button></td>
								</c:if>
							</c:if>
							<c:if test="${item.producerSelection == 1 && account.classify == 1}">
								<td>채택!!</td>
							</c:if>
							<c:if test="${item.producerAnswer != null && account.classify == 1 }">
								<td>${item.producerAnswer}</td>
							</c:if>
							<c:if test="${item.producerAnswer == null && account.classify == 2 && item.fdSellerId == account.id}">
								<td></td>
							</c:if>
							<td><button type="button" class="fdOpUpdateBtn" data-code="${item.fdOpinionCode}">수정하기</button> / <a href="delete/${item.fdOpinionCode }">삭제</a></td>
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
	<button type="button" style="display: none;" id="addConfirmBtnForm">채택하기</button>
	<button type="button" style="display: none;" id="removeConfirmBtnForm">채택취소</button>
</body>
</html>