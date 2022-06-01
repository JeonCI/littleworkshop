<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
	.option {
		border: 1px solid;
		padding: 5 5 5 5;
	}
</style>
</head>
<body>
	<div>
		<input type="number" value="${item.productOptionList.size() }" hidden="hidden" id="productOptionSize">
		<div>
			<form method="post">
				<div>
					<label>판매자 : </label>
					<input type="text" value="${item.sellerId }" readonly="readonly" name="sellerId">
				</div>
				<div>
					<label>카테고리 : </label>
					<select name="productCategoryCode">
						<c:forEach var="category" items="${productCategories }">
							<option value="${category.productCategoryCode}" selected="${item.productCategoryCode == category.productCategoryCode ? 'selected':'' }">${category.productCategory}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>제품 이름 : </label>
					<input type="text" name="productName" value="${item.productName }">
				</div>
				<div>
					<label>제품 가격 : </label>
					<input type="number" name="productPrice" value="${item.productPrice }">
				</div>
				<div>
					<label>제품 설명 : </label>
					<textarea name="productDescription">${item.productDescription }</textarea>
				</div>
				<div id="optionList">
					<input type="text" id="optionName">
					<button type="button" id="addOption">옵션 추가</button>
				</div>
				<div id=optionListDiv>
					<c:if test="${item.productOptionList.size() != 0 }">
					<c:forEach items="${item.productOptionList}" var="productOption" varStatus="status">
						<div id="optiondiv${status.index}">
							<div>
								<label>옵션 명 : </label>
								<input type="text" name="productOptionName" readonly value="${productOption.productOptionName }">
							</div>
							<div>
								<label>필수 사항</label>
								<select name="productNecessaryOption">
									<option value="0" selected="${productOption.productNecessaryOption == 0 ? 'selected':'' }">No</option>
									<option value="1" selected="${productOption.productNecessaryOption == 1 ? 'selected':'' }">Yes</option>
								</select>
							</div>
							<div>
								<label>상세 옵션 : </label>
								<input type="text" placeholder="상세 옵션을 입력하세요." class="detailOptionName">
								<button type="button" id="podAddBtn${status.index }" data-order="${status.index}">추가</button>
								<input type="number" hidden="hidden" value="${productOption.productOptionDetail.size() }" readonly name="optionCount" id="optionCount${status.index}">
							</div>
							<div id="detailOptionList${status.index}">
								<c:if test="${productOption.productOptionDetail.size() != 0 }">
									<c:forEach var="productOptionDetail" items="${productOption.productOptionDetail}">
										<div>
											<input type="text" name="productOptionDetailName" readonly value="${productOptionDetail.productOptionDetailName }">
											<label>품절 여부 : </label>
											<select name="productSoldOut">
												<option value="0" <c:if test="${productOptionDetail.productSoldOut == 0 }"> slected="selected"</c:if>>No</option>
												<option value="1" <c:if test="${productOptionDetail.productSoldOut == 1 }"> slected="selected"</c:if>>Yes</option>
											</select>
											<span data-order="${status.index}" class="podRemoveSpan${status.index }">x</span>
										</div>
									</c:forEach>
								</c:if>
							</div>
							<button type="button" id="poRemoveBtn${status.index }">옵션 삭제</button>
						</div>
					</c:forEach>
					</c:if>
				</div>
				<button>변경하기</button>
			</form>
			<a href="./list">뒤로가기</a>
		</div>
	</div>

	<div id="divForm" style="display: none;">
		<div>
			<label>옵션 명 : </label>
			<input type="text" name="productOptionName" readonly>
		</div>
		<div>
			<label>필수 사항</label>
			<select name="productNecessaryOption">
				<option value="0" selected="selected">No</option>
				<option value="1">Yes</option>
			</select>
		</div>
		<div>
			<label>상세 옵션 : </label>
			<input type="text" placeholder="상세 옵션을 입력하세요." class="detailOptionName">
			<button type="button">추가</button>
			<input type="number" hidden value="0" readonly name="optionCount">
		</div>
		<div>
		</div>
		<button type="button">옵션 삭제</button>
	</div>
	<div id="detailInput" style="display: none;">
		<input type="text" name="productOptionDetailName" readonly value="">
		<select name="productSoldOut">
			<option value="0" selected="selected">No</option>
			<option value="1">Yes</option>
		</select>
		<span>x</span>
	</div>
</body>
<script type="text/javascript">
	window.onload = function() {
		var optionList = document.getElementById("optionList");
		var optionSize = document.getElementById("productOptionSize").value;
		let index = optionSize;

		for (let i = 0; i < index; i++) {
			document.getElementById("podAddBtn" + i).addEventListener("click", function() {
				let value = this.parentElement.getElementsByTagName("input")[0].value;
				let targetIndex = this.dataset.order;
				
				var targetDiv = document.getElementById("detailOptionList" + targetIndex);

				var baseInputDiv = document.getElementById("detailInput");

				var detailInput = document.createElement("div");
				detailInput.innerHTML = baseInputDiv.innerHTML;

				detailInput.removeAttribute("style");
				detailInput.removeAttribute("id");

				detailInput.getElementsByTagName("input")[0].setAttribute("value", value);
				detailInput.getElementsByTagName("span")[0].setAttribute("data-order", targetIndex)
				detailInput.getElementsByTagName("span")[0].addEventListener("click", function() {
					let optionIndex = this.dataset.order;

					let nowCount = document.getElementById("optionCount" + optionIndex).value;

					nowCount--;

					document.getElementById("optionCount" + optionIndex).setAttribute("value", nowCount);

					this.parentElement.remove();
				});

				let nowCount = document.getElementById("optionCount" + targetIndex).value;

				nowCount++;

				document.getElementById("optionCount" + targetIndex).setAttribute("value", nowCount);

				this.parentElement.getElementsByTagName("input")[0].value = "";

				targetDiv.appendChild(detailInput);
			});

			document.getElementById("poRemoveBtn" + i).addEventListener("click", function() {
				this.parentElement.remove();
			});

			for(let k = 0; k < document.getElementsByClassName("podRemoveSpan" + i).length; k++) {
				document.getElementsByClassName("podRemoveSpan" + i)[k].addEventListener("click", function() {
				let optionIndex = this.dataset.order;

				let nowCount = document.getElementById("optionCount" + optionIndex).value;

				nowCount--;

				document.getElementById("optionCount" + optionIndex).setAttribute("value", nowCount);

				this.parentElement.remove();
				});
			};
		}
		
		//옵션 추가버튼 클릭시 Element추가하는 코드
		document.getElementById("addOption").addEventListener("click", function() {
			let optionName = document.getElementById("optionName").value;
			var divForm = document.getElementById("divForm");
			var divv = document.createElement("div");

			divv.innerHTML = divForm.innerHTML;

			divv.id = "optiondiv" + index;

			divv.getElementsByTagName("div")[0].getElementsByTagName("input")[0].setAttribute("value", optionName);
			divv.getElementsByTagName("div")[3].id = "detailOptionList" + index;
			divv.getElementsByTagName("div")[2].getElementsByTagName("input")[1].id = "optionCount" + index;
			divv.getElementsByTagName("div")[2].getElementsByTagName("button")[0].setAttribute("data-order", index);
			divv.getElementsByTagName("div")[2].getElementsByTagName("button")[0].addEventListener("click", function() {
				let value = this.parentElement.getElementsByTagName("input")[0].value;
				let targetIndex = this.dataset.order;
				
				var targetDiv = document.getElementById("detailOptionList" + targetIndex);

				var baseInputDiv = document.getElementById("detailInput");

				var detailInput = document.createElement("div");
				detailInput.innerHTML = baseInputDiv.innerHTML;

				detailInput.removeAttribute("style");
				detailInput.removeAttribute("id");

				detailInput.getElementsByTagName("input")[0].setAttribute("value", value);
				detailInput.getElementsByTagName("span")[0].setAttribute("data-order", targetIndex)
				detailInput.getElementsByTagName("span")[0].addEventListener("click", function() {
					let optionIndex = this.dataset.order;

					let nowCount = document.getElementById("optionCount" + optionIndex).value;

					nowCount--;

					document.getElementById("optionCount" + optionIndex).setAttribute("value", nowCount);

					this.parentElement.remove();
				});

				let nowCount = document.getElementById("optionCount" + targetIndex).value;

				nowCount++;

				document.getElementById("optionCount" + targetIndex).setAttribute("value", nowCount);

				this.parentElement.getElementsByTagName("input")[0].value = "";

				targetDiv.appendChild(detailInput);
			});

			divv.getElementsByTagName("button")[1].addEventListener("click", function() {
				this.parentElement.remove();
			});

			this.parentElement.getElementsByTagName("input")[0].value = "";

			index++;

			console.log(index);
			
			optionListDiv.appendChild(divv);
		});
	};
</script>
</html>