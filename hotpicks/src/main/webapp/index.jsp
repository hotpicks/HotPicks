<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>

<script type="text/javascript">
$(function() {
			if ($('#sliderholder-cycle').length) {
			// timeouts per slide (in seconds) 
			var timeouts = [150,390,25]; d
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
    <div id="sliderholder-cycle"> <img src="resources/style/images/art/slider-1.jpg" width="960" height="380" />
      <div>
        <iframe src="http://player.vimeo.com/video/4890208?title=0&amp;byline=0&amp;portrait=0" width="960" height="380" frameborder="0"></iframe>
      </div>
      <img src="resources/style/images/art/slider-2.jpg" width="960" height="380" /> </div>
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
    <div id="about">
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/art/home-1.jpg" alt="" /></a>
        <h4>Elegant Style</h4>
        <p>Morbi non nunc nec ipsum tincidunt luctus aliquam vel nisi. Donec eu accumsan elit.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/art/home-2.jpg" alt="" /></a>
        <h4>Easily Customizable</h4>
        <p>Nulla facilisi. Aenean porttitor cursus aliquet. Praesent sit amet dictum lacus. Risus eget augue.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="resources/style/images/art/home-3.jpg" alt="" /></a>
        <h4>Dark and Light Layouts</h4>
        <p>Vivamus placerat viverra posuere. Duis quis luctus diam. Aliquam a mi id vel orci lectus.</p>
      </div>
      <div class="one-fourth last"> <a href="#"><img src="resources/style/images/art/home-4.jpg" alt="" /></a>
        <h4>jQuery Enhanced</h4>
        <p>Sed eu lorem sed lectus interdum vehicula. Praesent sit amet risus eget augue semper.</p>
      </div>
    </div>
    <!-- End About --> 
    
  </div>
  

  <%@ include file = "/template/footer.jsp" %>