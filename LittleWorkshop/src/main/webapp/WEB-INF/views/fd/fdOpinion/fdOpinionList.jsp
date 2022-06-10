<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

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
		
		for (let i = 0; i < document.getElementsByClassName("addProducerAnswer").length; i++) {
			document.getElementsByClassName("addProducerAnswer")[i].addEventListener("click", function() {
				let fdOpCode = this.dataset.foc;
				let fdOpinion = document.getElementById("fdOpinion" + fdOpCode).value;
				
				console.log(fdOpinion);
				
				document.getElementById("addModalFdOpCode").value = fdOpCode;
				document.getElementById("addModalFdOpinion").value = fdOpinion;
			})
		}
		
		for (let i = 0; i < document.getElementsByClassName("updateProducerAnswer").length; i++) {
			document.getElementsByClassName("updateProducerAnswer")[i].addEventListener("click", function() {
				let fdOpCode = this.dataset.foc;
				let fdOpinion = document.getElementById("fdOpinion" + fdOpCode).value;
				
				var parentTd = this.parentNode;
				var td = document.createElement("td");
				
				td.innerHTML = parentTd.innerHTML;
				td.getElementsByClassName("updateProducerAnswer")[0].remove();
				
				console.log(td);
				
				document.getElementById("updateModalFdOpCode").value = fdOpCode;
				document.getElementById("updateModalFdOpinion").value = fdOpinion;
				document.getElementById("updateProducerAnswer").value = td.innerText;
			})
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
	
	function addProducerAnswer() {
		var form = document.getElementById("addProducerAnswerForm");
		
		let fdOpCode = document.getElementById("addModalFdOpCode").value;
		let producerAnswer = document.getElementById("addProducerAnswer").value;
		
		console.log(fdOpCode);
		console.log(producerAnswer);
		console.log("producerAnswer" + fdOpCode);
		
		var producerAnswerOrigin = document.getElementById("producerAnswer" + fdOpCode);
		
		console.log(producerAnswerOrigin);
		
		producerAnswerOrigin.getElementsByTagName("button")[0].remove();
		producerAnswerOrigin.innerText = producerAnswer;
		
		form.submit();
	}
	
	function updateProducerAnswer() {
		var form = document.getElementById("updateProducerAnswerForm");
		
		let fdOpCode = document.getElementById("updateModalFdOpCode").value;
		let producerAnswer = document.getElementById("updateProducerAnswer").value;
		
		console.log(fdOpCode);
		console.log(producerAnswer);
		console.log("producerAnswer" + fdOpCode);
		
		var producerAnswerOrigin = document.getElementById("producerAnswer" + fdOpCode);
		
		console.log(producerAnswerOrigin);
		
		producerAnswerOrigin.getElementsByTagName("button")[0].remove();
		producerAnswerOrigin.innerText = producerAnswer;
		
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
							<c:if test="${item.producerSelection != 0 && account.classify == 1}">
								<td>채택!!</td>
							</c:if>
							<c:if test="${account.classify == 1 }">
								<c:if test="${item.producerAnswer != null}">
									<td id="producerAnswer${item.fdOpinionCode }">${item.producerAnswer}</td>
								</c:if>
								<c:if test="${item.producerAnswer == null }">
									<td id="producerAnswer${item.fdOpinionCode }"></td>
								</c:if>
							</c:if>
							<c:if test="${account.classify == 2 && item.fdSellerId == account.id}">
								<c:if test="${item.producerAnswer == null}">
									<td id="producerAnswer${item.fdOpinionCode }"><button type="button" class="btn btn-primary addProducerAnswer" data-bs-toggle="modal" data-bs-target="#addProducerAnswerModal" data-foc="${item.fdOpinionCode }">답변 작성</button></td>
								</c:if>
								<c:if test="${item.producerAnswer != null }">
									<td id="producerAnswer${item.fdOpinionCode }">${item.producerAnswer}<button type="button" class="btn btn-primary updateProducerAnswer" data-bs-toggle="modal" data-bs-target="#updateProducerAnswerModal" data-foc="${item.fdOpinionCode }">답변 수정</button></td>
								</c:if>
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
	
	<!-- 작가 답변 등록 모달 -->
	<div class="modal fade" id="addProducerAnswerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">의견 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="../updateProducerAnswer" id="addProducerAnswerForm">
						<input type="number" name="fdCode" hidden="hidden" value="${fdCode }">
						<input type="number" name="fdOpinionCode" hidden="hidden" id="addModalFdOpCode">
					  <div class="mb-3">
					    <label for="recipient-name" class="col-form-label">의견 내용 :</label>
					    <input type="text" class="form-control" id="addModalFdOpinion" readonly="readonly">
					  </div>
					  <div class="mb-3">
					    <label for="message-text" class="col-form-label">답변 :</label>
					    <textarea class="form-control" id="addProducerAnswer" name="producerAnswer"></textarea>
					  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="addProducerAnswer()">작성 완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 끝 -->
	
	<!-- 작가 답변 수정 모달 -->
	<div class="modal fade" id="updateProducerAnswerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">의견 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="../updateProducerAnswer" id="updateProducerAnswerForm">
						<input type="number" name="fdCode" hidden="hidden" value="${fdCode }">
						<input type="number" name="fdOpinionCode" hidden="hidden" id="updateModalFdOpCode">
					  <div class="mb-3">
					    <label for="recipient-name" class="col-form-label">의견 내용 :</label>
					    <input type="text" class="form-control" id="updateModalFdOpinion" readonly="readonly">
					  </div>
					  <div class="mb-3">
					    <label for="message-text" class="col-form-label">답변 :</label>
					    <textarea class="form-control" id="updateProducerAnswer" name="producerAnswer"></textarea>
					  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="updateProducerAnswer()">작성 완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 끝 -->
</body>
</html>