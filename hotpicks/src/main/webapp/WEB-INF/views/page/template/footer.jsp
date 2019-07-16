<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- End Wrapper -->
<div class="clearfix"></div>
<div class="push"></div>
</div>

<!-- Begin Footer -->
<div id="footer-wrapper" class="sh">
  <div id="footer">
    <div id="footer-content"> 
      
      <!-- Begin Copyright -->
      <div id="copyright">
        <p style="float:left;">© Copyright 2011 Delphic | Team3 - Web Application Project 'Hot Picks'</p>
        <!--  <button id="locationInsert">LoactionInsert</button>
         <button id="contentsInsert">ContentsInsert</button> -->
      </div>
      <!-- End Copyright --> 
      
<c:if test="${userInfo.userId == 'hotpicks'}">
      <!-- Begin Social Icons -->
      <div id="socials">
        <ul>
          <li>
          	<a href="${root}/admin/mgmember">
          		<span>Admin Page</span>
          		<img src="${root}/resources/style/images/icon-dribble.png" alt="관리자 페이지 이동 버튼" />
          	</a>
          </li>
        </ul>
      </div>
      <!-- End Social Icons --> 
</c:if>
      
    </div>
  </div>
</div>
<!-- End Footer -->
</body>
</html>