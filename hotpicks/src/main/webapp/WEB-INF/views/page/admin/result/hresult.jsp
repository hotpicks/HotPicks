<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
          	
<c:forEach var="tag" items="${tags}">
          	<tr align="center" id="membercnt">
          		<td>${tag.RANK}</td>
          		<td style="color:rgb(82, 122, 122)">#${tag.HASHTAG}</td>
          		<td>${tag.CNT}</td>
          	</tr>
</c:forEach>
          	
          </table>
</c:if>