<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	<p class="list" id="reviewList">
          <input id="rCnt" type="hidden" value="${reviewCount.RCNT}">
          <input id="drCnt" type="hidden" value="${reviewCount.DRCNT}">

<c:if test="${articles.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>게시글이 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font></p>
	</div>
</c:if>

<c:if test="${articles.size() != 0}">

	<table>
          		<tr align="center" style="font-size:15px; font-weight: 700;">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>제목</td>
          			<td>작성자 id</td>
          			<td>작성일</td>
          			<td>신고내용</td>
          			<td>신고일자</td>
          		</tr>

<c:forEach var="article" items="${articles}" varStatus="i">

	<tr align="center">
          			<td>
          				<input type="checkbox" name="ch" class="ch">
          			</td>
          			<td>${i.count}</td>
           			<input type="hidden" class="rseq" value="${article.RSEQ}">
         			<td>${article.SUBJECT}</td>
          			<td>${article.USERID}</td>
          			<td>${article.LOGTIME}</td>
          			<td>${article.REPORTCONTENT}</td>
          			<td>${article.REPORTDATE}</td>
          		</tr>

</c:forEach>

	</table>

</c:if>
	          
    </p>
