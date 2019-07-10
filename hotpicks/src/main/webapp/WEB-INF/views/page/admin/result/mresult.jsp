<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

          <p class="list" id="memberList">
          <input id="mCnt" type="hidden" value="${memberCount.MCNT}">
          <input id="dmCnt" type="hidden" value="${memberCount.DMCNT}">

<c:if test="${members.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>회원이 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
	</div>
</c:if>

<c:if test="${members.size() != 0}">

	<table>

          		<tr align="center" style="font-size:15px; font-weight: 700;">
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

          				<input type="checkbox" name="ch" class="ch">
          			</td>
          			<td>${i.count}</td>
          			<td class="userId">${member.userId}</td>
          			<td>${member.joinDate}</td>
<c:if test="${member.enable==0}">
          			<td style="color:tomato; font-weight:700;">탈퇴</td>
</c:if>
<c:if test="${member.enable==1}">
          			<td style="color:navy; font-weight:700;">활동</td>
</c:if>
          		</tr>

</c:forEach>

          	</table>
</c:if>

           </p>
