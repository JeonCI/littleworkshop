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
			<p>${item.productCode }</p>
			<p>${item.sellerId }</p>
			<p>${item.productCategory }</p>
			<p>${item.productName }</p>
			<p>${item.productPrice }</p>
			<p>${item.productDescription }</p>
			<fmt:formatDate value="${item.productRegDate }" pattern="YYYY/MM/dd"/>
			<p>${item.productLikeCount }</p>
			
			<c:if test="${item.productOptionList.size() > 0 }">
				<c:forEach var="option" items="${item.productOptionList }">
					<select data-option="${option.productOptionCode}" ${option.productNecessaryOption == 1 ? 'required' : ''}>
						<option selected="selected" disabled >${option.productOptionName}${option.productNecessaryOption == 1 ? '(필수)' : ''}</option>
						<c:forEach var="detail" items="${option.productOptionDetail}">
							<option value="${detail.productOptionDetailCode }">${detail.productOptionDetailName}</option>
						</c:forEach>
					</select>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>