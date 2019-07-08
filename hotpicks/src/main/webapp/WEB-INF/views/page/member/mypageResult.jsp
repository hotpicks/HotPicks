<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<c:if test="${reviews.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>리뷰가 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
		<br><br>
		새 리뷰를 작성해주세요!</p>
	</div>
</c:if>

<c:if test="${reviews.size() != 0}">

<ul>
<c:forEach var="review" items="${reviews}">
	<!-- Begin 리뷰 글 -->
<c:if test="${review.IMGDIR2 == null}">
	          <li><img src="/hotpicks/resources/style/images/noImage_list.png" alt="" class="left" style="width : 60px; height: 60px;" />
</c:if>
<c:if test="${review.IMGDIR2 != null}">
	          <li><img src="/hotpicks/review/${review.IMGDIR1}/${review.IMGDIR2}" alt="" class="left" style="width : 60px; height: 60px;" />
</c:if>
	            <h4 class="title"><a href="">[<span class="cate" style="font-style:normal;"></span>] - ${review.TITLE}</a><span>- ${review.LOGTIME}</span></h4>
	            <p>${review.SUBJECT}<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	<!-- End 리뷰 글--> 
</c:forEach>
</ul>

</c:if>