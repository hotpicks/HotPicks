<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="userInfo" value="${sessionScope.userInfo}"/>
<script>
	console.log("!");
</script>
<c:if test="${userInfo == null }">
</c:if>