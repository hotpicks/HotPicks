<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<c:if test="${articles.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>게시글이 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
	</div>
</c:if>

<c:if test="${articles.size() != 0}">

<c:forEach var="article" items="${articles}">
여기에 넣자!
</c:forEach>

</c:if>