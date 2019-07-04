<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <!-- Begin Wrapper -->
 <div id="wrapper" style="margin-bottom: 20px;"> 
    <!-- Begin Intro -->
    <div class="intro">
      <h1>이런 곳은 어떠세요?<br><a style="color: red;">#서울</a>의 HOT한<a style="color: steelblue;">#공연</a></h1>
    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
<c:forEach var="list" items="${json}" varStatus="status"  end="3">
<c:choose>
	<c:when test="${ status.count%4 != 0 || status.last != false}">
	<div class="one-fourth"> 
	<a href="${root}/page/contents/sohyun_contentdetail.jsp">
	<img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" />
	</a>
        <h4>${list.title}</h4>
        <p>${list.title}</p>
      </div>
    </c:when>
    <c:otherwise>
      <div class="one-fourth last"> 
      <a href="${root}/page/contents/sohyun_contentdetail.jsp">
      <img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" />
      </a>
        <h4>${list.title}</h4>
 		 <p>${list.title}</p>
      </div>
    </c:otherwise>
</c:choose>
</c:forEach>
    </div>
 <!-- End About --> 

   </div> 
<!-- -------------------------------------------------------------------------- --> 
<!-- -------------------------------------------------------------------------- --> 
<!-- -------------------------------------------------------------------------- --> 
  <div id="wrapper" style="margin-bottom: 20px;">
   
    <!-- Begin Intro -->
    <div class="intro">
      <h1 style="float:left;">
      	<a href="#" style="color: purple;font-style: bold;">전체</a> |
      	<a href="#" style="color: purple;">공연</a> |
      	<a href="#" style="color: purple;">전시</a> |
      	<a href="#" style="color: purple;">행사</a>
      </h1>
      
     	<select>
			<c:forEach var="sido" items="${sidoList}">
     			<option value="${sido.sdCode}">${sido.sdName}</option>
   			</c:forEach>
     	</select>
     	
     	<select>
     		<option>gg</option>
     	</select>

    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
 <c:forEach var="list" items="${json}" varStatus="status">
<c:choose>
	<c:when test="${ status.count%4 != 0 || status.last != false}">
	<div class="one-fourth"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
	<img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" /></a>
        <h4>${list.title}</h4>
        <p>${list.title}</p>
      </div>
    </c:when>
    <c:otherwise>
      <div class="one-fourth last"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
      <img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" /></a>
        <h4>${list.title}</h4>
 		 <p>${list.title}</p>
      </div>
    </c:otherwise>
</c:choose>
</c:forEach>
    </div> 
    <!-- End About --> 
    
 </div>