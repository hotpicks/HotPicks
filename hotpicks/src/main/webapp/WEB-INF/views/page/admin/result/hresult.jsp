<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<c:if test="${tags.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>#해시태그가 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
	</div>
</c:if>

<c:if test="${tags.size() != 0}">
	<!-- ********** 해시태그 현황 테이블 ********** -->
    
	<table>
          	<tr align="center">
          		<td>순위</td>
          		<td>#해시태그</td>
          		<td>사용 횟수</td>
          	</tr>
          	
<c:forEach var="tag" items="${tags}" varStatus="i">
          	<tr align="center" id="membercnt">
         <c:choose>
	         <c:when test="${i.count == 1}">
          		<td style="font-size:30px;"><font color="#F2B705"><i class="fas fa-award"></i></font> ${tag.RANK}</td>
          		<td style="font-size:30px;"><font color="#858C7D"><i class="fab fa-slack-hash"></i></font>${tag.HASHTAG}</td>
          		<td style="font-size:30px;">${tag.CNT}</td>                  
	         </c:when>
	         <c:when test="${i.count == 2}">
          		<td style="font-size:30px;"><font color="#D2D2D2"><i class="fas fa-award"></i></font> ${tag.RANK}</td>
          		<td style="font-size:30px;"><font color="#858C7D"><i class="fab fa-slack-hash"></i></font>${tag.HASHTAG}</td>
          		<td style="font-size:30px;">${tag.CNT}</td>                  
	         </c:when>
	         <c:when test="${i.count == 3}">
          		<td style="font-size:30px;"><font color="#D3A885"><i class="fas fa-award"></i></font> ${tag.RANK}</td>
          		<td style="font-size:30px;"><font color="#858C7D"><i class="fab fa-slack-hash"></i></font>${tag.HASHTAG}</td>
          		<td style="font-size:30px;">${tag.CNT}</td>                  
	         </c:when>
	         <c:otherwise>
          		<td>${tag.RANK}</td>
          		<td><font color="#858C7D"><i class="fab fa-slack-hash"></i></font>${tag.HASHTAG}</td>
          		<td>${tag.CNT}</td>                  	         
	         </c:otherwise>
         </c:choose>
          	</tr>
</c:forEach>
          	
          </table>
</c:if>