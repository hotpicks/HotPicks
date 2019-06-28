<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
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
<script type="text/javascript">
$(function() {
			if ($('#sliderholder-cycle').length) {
			// timeouts per slide (in seconds) 
			var timeouts = [150,390,25]; 
			function calculateTimeout(currElement, nextElement, opts, isForward) { 
			    var index = opts.currSlide; 
			    return timeouts[index] * 1000;
			}
			jQuery('#sliderholder-cycle').cycle({
				fx: 'fade',
				pager: '.slidernav',
				prev:    '.sliderprev',
        		next:    '.slidernext',
				speed: 1000,
				timeoutFn: calculateTimeout,
				pagerEvent: 'click',
    			pauseOnPagerHover: true,
    			cleartype: 1
});
			jQuery('#sliderholder-cycle').css("display", "block");
			jQuery('.slidernav').css("display", "block");
			
			}
}); 
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper" style="margin-bottom: 20px;"> 
    
    <!-- Begin Intro -->
    <div class="intro">
      <h1>이런 곳은 어떠세요?<br><a style="color: red;">#서울</a>의 HOT한<a style="color: steelblue;">#공연</a></h1>
    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>board1</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/img_dog/008.jpg" alt="" /></a>
        <h4>board2</h4>
	  <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/img_dog/003.jpg" alt="" /></a>
        <h4>board3</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth last"> <a href="#"><img src="${root}/resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
    </div>
    <!-- End About --> 
    
  </div>
  
   <div id="wrapper" style="margin-bottom: 20px;"> 
   
    <!-- Begin Intro -->
    <div class="intro">
    
    <div>
      <h1>
      	<a href="#" style="color: purple;font-style: bold;">전체</a> |
      	<a href="#" style="color: purple;">공연</a> |
      	<a href="#" style="color: purple;">전시</a> |
      	<a href="#" style="color: purple;">행사</a>
      </h1>
     </div>
     <div align="right">
     	<select>
     		<option>시도</option>
     	</select>
     	
     	<select>
     		<option>시도</option>
     	</select>
     </div>
    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/001.jpg" alt="" /></a>
        <h4>board1</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/008.jpg" alt="" /></a>
        <h4>board2</h4>
	  <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>board3</h4>
        <p>content.</p>
      </div>
      <div class="one-fourth last"> <a href="#"><img src="resources/style/images/img_dog/006.jpg" alt="" /></a>
        <h4>board4</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/005.jpg" alt="" /></a>
        <h4>board5</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/004.jpg" alt="" /></a>
        <h4>board6</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/img_dog/003.jpg" alt="" /></a>
        <h4>board7</h4>
 		 <p>content.</p>
      </div>
      <div class="one-fourth last"> <a href="#"><img src="resources/style/images/img_dog/002.jpg" alt="" /></a>
        <h4>board8</h4>
 		 <p>content.</p>
      </div>
    </div>
    <!-- End About --> 
    
  </div>
  

<%@ include file = "/template/footer.jsp" %>