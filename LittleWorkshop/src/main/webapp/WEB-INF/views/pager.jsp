<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="pager">
        <div class="pagerArea">
            <a href="?page=${pager.prev }&${pager.query}"><span class="material-symbols-outlined">
                    arrow_back_ios
                </span></a>
            <c:forEach var="page" items="${pager.list }" varStatus="status">
               <div class="pagerBox ${pager.page== status.count?'clicks':''}"><a href="?page=${page }&${pager.query} ">${page}</a> </div>
            </c:forEach>
            <a href="?page=${pager.next }&${pager.query}"><span class="material-symbols-outlined">
                    arrow_forward_ios
                </span></a>
        </div>
    </div>
</body>
</html>