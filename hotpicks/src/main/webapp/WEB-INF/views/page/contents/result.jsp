<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(function() {
	var sigunguList = 
	

	 $("#sido").change(function(){
			var sdcode = $('#sido').val();
				alert(sdcode);
		 	$.ajax({
				url: '${root}/contents/changesgg',
				type: 'GET',
				data: {"sdcode" : sdcode},
				success: function(result){
					alert("돌아옴");

					var sigunguStr = "";
					sigunguStr += "<c:forEach var='sigungu' items='${sigunguList}'>";
					sigunguStr += "<option value='${sigungu.sggCode}'>${sigungu.sggName}</option>";
					sigunguStr += "</c:forEach>";
					
					//$('#sigungu').html(sigunguStr);
					}
				
				}); 
		

			
		});
			
 
 	
 	
 	
});
</script>


 <%--   <!-- Begin Wrapper -->
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

   </div>  --%>
<!-- -------------------------------------------------------------------------- --> 
<!-- -------------------------------------------------------------------------- --> 
<!-- -------------------------------------------------------------------------- --> 

	


  <div id="wrapper" style="margin-bottom: 20px;">
   
    <!-- Begin Intro -->
    <div class="intro" align="center">
      <h1 >
      	<a href="#" style="color: purple;font-style: bold;">전체</a> |
      	<a href="#" style="color: purple;">공연</a> |
      	<a href="#" style="color: purple;">전시</a> |
      	<a href="#" style="color: purple;">행사</a>
      </h1>
      
     	<select id="sido">
			 <c:forEach var="sido" items="${sidoList}">
     			<option value="${sido.sdCode}">${sido.sdName}</option>
   			</c:forEach> 
     	</select>
     	
     	<select id="sigungu">
     	
		<c:set var="sigunguList" value="${sigunguMap.get(1)}"/>
		</div>
     	<%-- <c:forEach var="sigungu" items="${sigunguList}">
     			<option value="${sigungu.sggCode}">${sigungu.sggName}</option>
     			
		</c:forEach> --%>
		<div>
     	</select>

    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
 <c:forEach var="list" items="${dbContentsList}" varStatus="status" end="13">
<c:choose>
		<c:when test="${status.last == true || status.count % 4 == 0}">
	    	<div class="one-fourth last"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
	    </c:when>
	    <c:otherwise>
			<div class="one-fourth"> <a href="${root}/page/contents/sohyun_contentdetail.jsp">
	    </c:otherwise>
</c:choose>
		<img src="${list.image1 != 'x' ? list.image1 : (list.image2 != 'x' ? list.image2 : '') }" width="200" alt="" /></a>
        <h4>${list.title}</h4>
        <p>${list.title}</p>
      </div>
</c:forEach>
    </div> 
    <!-- End About --> 
    
 </div>