<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>

<style>
#about .one-fourth img {
	-moz-box-shadow: 0px 1px 2px #656565;
	-webkit-box-shadow: 0px 1px 2px #656565;
	box-shadow: 0px 1px 2px #656565;
	display: block;
	margin-bottom: 20px;
	height: 160px;
	width: 100%;
}
</style>

<div id="wrapper">
<div class="content">
	<div>
	<h2>축제</h2>
	<hr style="height:5px; background: #000;">
	<div id="about">
   		<c:forEach var="list" items="${contentsList1}" varStatus="status" end="13">
		<c:choose>
			<c:when test="${status.last == true || status.count % 4 == 0}">
	   			<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
				
				<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
      			<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
			</c:when>
   			<c:otherwise>
				<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
		    	<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
	        	<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
	    	</c:otherwise>
		</c:choose>
		</c:forEach>
    </div>
	</div>

	<div>
	<h2>공연</h2>
	<hr style="height:5px; background: #000;">
	<div id="about">
 		<c:forEach var="list" items="${contentsList2}" varStatus="status" end="13">
		<c:choose>
			<c:when test="${status.last == true || status.count % 4 == 0}">
		   		<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
		   		<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
	        	<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
 			</c:when>
   			<c:otherwise>
				<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
			    <img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
	        	<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
	    	</c:otherwise>
		</c:choose>
		</c:forEach>
    </div> 
    </div>

	

	<div>
	<h2>행사</h2>
	<hr style="height:5px; background: #000;">
	<div id="about">
 		<c:forEach var="list" items="${contentsList3}" varStatus="status" end="13">
		<c:choose>
			<c:when test="${status.last == true || status.count % 4 == 0}">
   				<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
  				<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
	        	<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
  			</c:when>
   			<c:otherwise>
				<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
		    	<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
	        	<h4>${list.title}</h4>
	        	<p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt }</p>
	       		</a>
	      		</div>
	    	</c:otherwise>
		</c:choose>
		</c:forEach>
	</div>
	</div>

	<%-- <div>
	<h2>해시태그</h2>
	<hr style="height:5px; background: #000;">
	<div id="about">
	<div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
	</div>
	</div> --%>
</div>
</div>
<%@ include file = "/WEB-INF/views/page/template/footer.jsp"%>