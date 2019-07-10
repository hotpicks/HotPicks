<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>


</script>

    <c:forEach var="article" items="${articleList}" varStatus="status">
    <c:if test="${article.wanna == 0}">
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%; height: 300px;"> <a href="#"><img src="${article.image1 != '-1' ? article.image1 : (article.image2 != '-1' ? article.image2 : '') }" alt="" /></a>
        <h4>${article.title}</h4>
         <p><input type="checkbox" name="check" class="check"></p>
         <input type="hidden" value="${article.contentsId}">
         <input type="hidden" value="${article.wanna}">
      </div>
     </c:if>
     <c:if test="${article.wanna == 1}">
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%; height: 300px;"> <a href="#"><img src="${article.image1 != '-1' ? article.image1 : (article.image2 != '-1' ? article.image2 : '') }" alt="" /></a>
        <h4>${article.title}</h4>
         <p><input type="checkbox" name="check" class="check"></p>
         <input type="hidden" value="${article.contentsId}">
         <input type="hidden" value="${article.wanna}">
      </div>
     </c:if>
     </c:forEach>
