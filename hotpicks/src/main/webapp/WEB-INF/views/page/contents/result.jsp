<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="list" items="${json}" varStatus="status" >
<c:choose>
	<c:when test="${ status.count%4 != 0 || status.last == false}">
	<div class="one-fourth"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
	<img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : list.firstimage2) }" width="200" alt="" /></a>
        <h4>${list.title}</h4>
        <p>${list.title}</p>
      </div>
    </c:when>
    <c:otherwise>
      <div class="one-fourth last"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
      <img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : list.firstimage2) }" width="200" alt="" /></a>
        <h4>${list.title}</h4>
 		 <p>${list.title}</p>
      </div>
    </c:otherwise>
</c:choose>
</c:forEach>
