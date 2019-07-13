<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="userInfo" value="${sessionScope.userInfo}"/>
<c:if test="${userInfo == null }">
	<c:redirect url="/index.jsp"/>
</c:if>
<c:if test="${userInfo.userId != 'hotpicks'}">
	<c:redirect url="/index.jsp"/>
</c:if>