<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>

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
  
  <!-- Begin Slider -->
  <div id="cycle-wrapper">
    <div id="sliderholder-cycle"> <img src="${root}/resources/style/images/art/slider-1.jpg" width="960" height="380" />
      <div>
        <iframe src="http://player.vimeo.com/video/4890208?title=0&amp;byline=0&amp;portrait=0" width="960" height="380" frameborder="0"></iframe>
      </div>
      <img src="${root}/resources/style/images/art/slider-2.jpg" width="960" height="380" /> </div>
    <ul class="slidernav">
    </ul>
    <div class="sliderdir"> <a href="#"><span class="sliderprev">Prev</span></a> <a href="#"><span class="slidernext">Next</span></a> </div>
  </div>
  <!-- End Slider -->
  
  <!-- Begin Wrapper -->
  <div id="wrapper"> 
    
    <!-- Begin Intro -->
    <div class="intro">
      <h1>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium. Praesent urna urna, venenatis at ultrices ac, viverra in turpis. Duis sceler isque mauri sut metus feugiat laoreet. </h1>
    </div>
    <!-- End Intro --> 
    
    <!-- Begin About -->
    <div class="one-half">
      <div class="one-sixth"><img src="${root}/resources/style/images/icon-big1.png" /></div>
      <div class="three-fourth last">
        <h4>Graphic Design</h4>
        <p>Nulla ipsum nunc, gravida tempus varius eu, eleifend non elit. Nam elementum iaculis lorem, et viverra magna tempus vitae. Phasellus pharetra luctus felis. Nullam turpis ante, fermentum vitae fermentum vitae, tempus ut libero.</p>
      </div>
    </div>
    <div class="one-half last">
      <div class="one-sixth"><img src="${root}/resources/style/images/icon-big2.png" /></div>
      <div class="three-fourth last">
        <h4>Illustration</h4>
        <p>Nulla ipsum nunc, gravida tempus varius eu, eleifend non elit. Nam elementum iaculis lorem, et viverra magna tempus vitae. Phasellus pharetra luctus felis. Nullam turpis ante, fermentum vitae fermentum vitae, tempus ut libero.</p>
      </div>
    </div>
    <div class="clearfix"></div>
    <br />
    <div class="one-half">
      <div class="one-sixth"><img src="${root}/resources/style/images/icon-big3.png" /></div>
      <div class="three-fourth last">
        <h4>Interior Design</h4>
        <p>Nulla ipsum nunc, gravida tempus varius eu, eleifend non elit. Nam elementum iaculis lorem, et viverra magna tempus vitae. Phasellus pharetra luctus felis. Nullam turpis ante, fermentum vitae fermentum vitae, tempus ut libero.</p>
      </div>
    </div>
    <div class="one-half last">
      <div class="one-sixth"><img src="${root}/resources/style/images/icon-big4.png" /></div>
      <div class="three-fourth last">
        <h4>3D Design</h4>
        <p>Nulla ipsum nunc, gravida tempus varius eu, eleifend non elit. Nam elementum iaculis lorem, et viverra magna tempus vitae. Phasellus pharetra luctus felis. Nullam turpis ante, fermentum vitae fermentum vitae, tempus ut libero.</p>
      </div>
    </div>
    <div class="clearfix"></div>
    <!-- End About --> 
    
  </div>
  
  <!-- End Wrapper -->
  
<%@ include file = "/template/footer.jsp" %>