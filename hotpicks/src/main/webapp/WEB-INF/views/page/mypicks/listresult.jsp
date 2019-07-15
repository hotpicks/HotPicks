<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>



    <c:forEach var="article" items="${articleList}" varStatus="status">
    <c:if test="${article.wanna == 0}">
	      <div class="one-fourth rounded" style="margin:0 1% 3% 0; width:24%; height: 270px;">
	       <a href="${root}/contents/viewdetail?contentsId=${article.contentsId}"><img src="${article.image1 != '-1' ? article.image1 : (article.image2 != '-1' ? article.image2 : '') }" alt="" /></a>
	        <h4 style="height:40px; padding:10px; color:#ffffff;"><i class="fab fa-slack-hash" style="size: 5px;"></i>${article.title}</h4>
	         <p><label style=" width:100%; padding:0 0 10px 10px; text-align: center;"><input type="checkbox" name="check" class="check"></label></p>
	         <input type="hidden" value="${article.contentsId}">
	         <input type="hidden" value="${article.wanna}">
	      </div>
 	</c:if>
     <c:if test="${article.wanna == 1}">
		      <div class="one-fourth rounded" style="margin:0 1% 1% 0; width:24%; height: 270px; background-color: #3b8686;"> 
			      <a href="${root}/contents/viewdetail?contentsId=${article.contentsId}"><img src="${article.image1 != '-1' ? article.image1 : (article.image2 != '-1' ? article.image2 : '') }" alt="" /></a>
			        <h4 style="height:40px;">&#42341;${article.title}</h4>
			         <p><label style=" width:100%; padding:0 0 10px 10px; text-align: center;"><input type="checkbox" name="check" class="check"></label></p>
			         <input type="hidden" value="${article.contentsId}">
			         <input type="hidden" value="${article.wanna}">
		      </div>
     </c:if>
     </c:forEach>
     
