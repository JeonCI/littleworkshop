<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Little Workshop</title>

<style>
span {
	font-weight: bold;
}

.addressDiv{
width:500px;
border : 1px solid #dddddd;
}

</style>
<script>
	function addAdress() {
		location.href = "./address/add";
	}
</script>
</head>
<body>
	<c:if test="${list.size() > 0 }">
		<div class="addressDiv">
			<c:forEach items="${list}" var="item">
				<div>
					<div><span>${item.addressName}</span></div>
					<div>${item.recipient} ｜[${item.postcode}] ${item.address} </div>
					<c:if test="${item.requestCode != 0 }">
						<c:if test="${item.requestCode == 6 }">
							<div>${item.requestText}</div>
						</c:if>
						<c:if test="${item.requestCode != 6 }">
							<div>${item.requestDetails}</div>
						</c:if>
					</c:if>
					<div><a href="./address/update/${item.addressCode}"><button>수정</button></a> <a href="./address/delete/${item.addressCode}"><button>삭제</button></a></div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<c:if test="${list.size() < 1 }">
		<div>
			<span>등록된 배송지가 없습니다.</span>
		</div>
	</c:if>

	<div>
		<button onclick="addAdress();">신규 배송지 추가</button>
	</div>

</body>
</html>