<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

          <p class="list" id="memberList">

<c:if test="${members.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br><br><br>
		<p>회원이 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
	</div>
</c:if>

<c:if test="${members.size() != 0}">

	<table>

          		<tr align="center">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>id</td>
          			<td>가입일</td>
          			<td>활동 상태</td>
          		</tr>

<c:forEach var="member" items="${members}" varStatus="i">

          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>${i.count}</td>
          			<td class="userId">${member.userId}</td>
          			<td>${member.joinDate}</td>
          			<td>${(member.enable == 0 ? '탈퇴' : '활동')}</td>
          		</tr>

</c:forEach>

          	</table>
</c:if>

           </p>
