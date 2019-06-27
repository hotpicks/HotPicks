<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/template/header.jsp"%>
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
<c:set var="root" value="${pageContext.request.contextPath}" />
<div id="wrapper"> 
<div class="content">
<div>
	<div align="center" style="margin-bottom: 30px;">
		<div
			style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
			<a>전체 |</a> <a>공연 |</a> <a>전시 |</a> <a>행사</a>
		</div>
		<div>
			<a href="${root}/page/mypicks/mypicklist.jsp"><button>목록형사진</button></a>
			<a href="${root}/page/mypicks/mypickmap.jsp"><button>지도형사진</button></a>
			<a href="${root}/page/mypicks/mypickcalendar.jsp"><button>달력형사진</button></a>
		</div>
	</div>

    <div id="about">
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>board1</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/008.jpg" alt="" /></a>
        <h4>board2</h4>
	  <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/003.jpg" alt="" /></a>
        <h4>board3</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth last" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>board1</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/008.jpg" alt="" /></a>
        <h4>board2</h4>
	  <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/003.jpg" alt="" /></a>
        <h4>board3</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth last" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>board1</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/008.jpg" alt="" /></a>
        <h4>board2</h4>
	  <p>content.</p>
      </div>
      <div class="one-fourth" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/003.jpg" alt="" /></a>
        <h4>board3</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth last" style="margin:0 1% 1% 0; width:24%;"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
     
    </div>
    
</div>

</div>


</div>



















<%@ include file="/template/footer.jsp"%>