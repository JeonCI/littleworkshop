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
			<p>${item.fdCode }</p>
			<p>${item.fdSellerId }</p>
			<p>${item.productCategory }</p>
			<p>${item.fdName }</p>
			<p>${item.fdPrice }</p>
			<p>${item.fdDescription }</p>
			<fmt:formatDate value="${item.fdRegDate }" pattern="YYYY/MM/dd"/>
			<p>${item.fdViewCount }</p>
			
			<c:if test="${item.fdOptionList.size() > 0 }">
				<c:forEach var="option" items="${item.fdOptionList }">
					<select data-option="${option.fdOptionCode}" ${option.fdNecessaryOption == 1 ? 'required' : ''}>
						<option selected="selected" disabled >${option.fdOptionName}${option.fdNecessaryOption == 1 ? '(필수)' : ''}</option>
						<c:forEach var="detail" items="${option.fdOptionDetail}">
							<option value="${detail.fdOptionDetailCode }">${detail.fdOptionDetailName}</option>
						</c:forEach>
					</select>
				</c:forEach>
			</c:if>
		</div>
		<div>
			<form action="participateFd/${item.fdCode}" method="get">
				<div>
					<label>후원 금액 : </label>
					<input type="number" name="participationPrice" min="1000">
				</div>		
				<button>참여하기</button>
			</form>
		</div>
	</div>
</body>
</html>