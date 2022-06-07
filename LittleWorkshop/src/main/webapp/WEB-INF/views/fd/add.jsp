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
	
	#imageContainer > img{
		width: 70px;
		height: 70px;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		let imageList = [];
		var optionList = document.getElementById("optionList");
		let index = 0;
		
		//태그 추가버튼 클릭시 Element 추가
		document.getElementById("addTag").addEventListener("click", function() {
			let value = document.getElementById("tagName").value;
			
			var targetDiv = document.getElementById("tagListDiv");

			var baseTagInputDiv = document.getElementById("tagInput");

			var tagInputDiv = document.createElement("div");
			tagInputDiv.innerHTML = baseTagInputDiv.innerHTML;

			tagInputDiv.removeAttribute("style");
			tagInputDiv.removeAttribute("id");

			tagInputDiv.getElementsByTagName("input")[0].setAttribute("value", value);
			tagInputDiv.getElementsByTagName("span")[0].addEventListener("click", function() {
				this.parentElement.remove();
			});

			targetDiv.appendChild(tagInputDiv);
			document.getElementById("tagName").value = "";
		});
		
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
	
	
	function imageChange(event){
		
		//파일 등록 부분
		let formData = new FormData(document.getElementById("fdForm"));
		let item = document.getElementById("fdImage");
		
		for(let i = 0; i < item.files.length; i++)
			fileList[item.files[i].name] = item.files[i];

		// 미리보기 부분
	    let i = event.target.files.length-1;
	    for(let image of event.target.files){
	        let img = document.createElement("img");
		  	const reader = new FileReader();
			reader.onload = function(event){
				img.setAttribute("src", event.target.result);
			}
			reader.readAsDataURL(event.target.files[i--]);	
			document.querySelector("#imageContainer").appendChild(img);
		}
	}

function but(){
	var formData = new FormData(document.getElementById("fdForm"));
	formData.delete("fdImage");
	let name = Object.keys(fileList);
	
	for(let i =0; i < name.length; i++){
		formData.append("fdImage", fileList[name[i]]);
	}
	

	$.ajax({
		type: "post",
		url:"./add",
		enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
		data: formData,
		success: function(result){
			location.href= "./list";
		},error: function(){
			console.log("실패");
		}
	});
}

function asdf() {
	console.log(document.getElementById("asdf").value);
}
</script>

</head>
<body>
	<div>
		<div>
			<form method="post" enctype="multipart/form-data" id = "fdForm">
				<div>
					<label>판매자 : </label>
					<input type="text" value="${account.id }" readonly="readonly" name="fdSellerId">
				</div>
				<div>
					<label>카테고리 : </label>
					<select name="productCategoryCode">
						<option selected="selected" disabled="disabled">카테고리</option>
						<c:forEach var="category" items="${fdCategories }">
							<option value="${category.productCategoryCode}">${category.productCategory}</option>
						</c:forEach>
					</select>
				</div>
				<div id="imageContainer">
					<label>펀딩 사진 : </label>
					<input type="file" name="fdImage" accept="image/*" accept="image/*" multiple onchange="imageChange(event);">
				</div>
				<div>
					<label>펀딩 이름 : </label>
					<input type="text" name="fdName">
				</div>
				<div>
					<label>펀딩 가격 : </label>
					<input type="number" name="fdPrice">
				</div>
				<div>
					<label>펀딩 최소 인원 : </label>
					<input type="number" name="fdMinimumUser">
				</div>
				<div>
					<label>펀딩 모집 기간 : </label>
					<input type="Date" name="htmlFdRecruitmentPeriod" id="asdf">
				</div>
				<div>
					<label>펀딩 설명 : </label>
					<textarea name="fdDescription"></textarea>
				</div>
				<div id="tagList">
					<input type="text" id="tagName">
					<button type="button" id="addTag">태그 추가</button>
				</div>
				<div id="tagListDiv">
				</div>
				<div id="optionList">
					<input type="text" id="optionName">
					<button type="button" id="addOption">옵션 추가</button>
				</div>
				<div id=optionListDiv>
				</div>
				<button onclick="but()">등록하기</button>
			</form>
			<a href="./list">뒤로가기</a>
		</div>
		<button onclick="asdf()">check</button>
	</div>

	<div id="divForm" style="display: none;">
		<div>
			<label>옵션 명 : </label>
			<input type="text" name="fdOptionName" readonly>
		</div>
		<div>
			<label>필수 사항</label>
			<select name="fdNecessaryOption">
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
		<input type="text" name="fdOptionDetailName" readonly value="">
		<span>x</span>
	</div>
	<div id="tagInput" style="display: none;">
		<input type="text" name="tagNameList" readonly value="">
		<span>x</span>
	</div>
</body>
</html>