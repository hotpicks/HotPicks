<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${userInfo == null}">
	<c:redirect url="${root}/index.jsp"/>
</c:if>