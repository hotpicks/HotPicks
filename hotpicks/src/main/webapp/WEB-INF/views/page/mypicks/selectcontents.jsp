<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.sh{
    margin-right: 3% !important;
    clear: right;
}
</style>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div style="padding-top: 30px;">
<div id="about">
<c:forEach var="selectcontents" items="${list}" >
      <div class="one-fourth sh"> <a href="#"><img src="${root}/resources/style/images/art/home-1.jpg" alt="" /></a>
        <h4>${selectcontents.subject}</h4>
        <p>contentsid = ${selectcontents.contentsid}</p>
      </div>
</c:forEach>
</div>
</div>