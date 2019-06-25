<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>Delphic | Creative Portfolio Template</title>
<link rel="stylesheet" type="text/css" href="resources/style.css" media="all" />
<link rel="stylesheet" media="all" href="resources/style/type/folks.css" />
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
<![endif]-->
<script type="text/javascript" src="resources/style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="resources/style/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="resources/style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="resources/style/js/scripts.js"></script>
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
</head>
<body>
<div id="container"> 
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper"> 
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="index.jsp"><img src="resources/style/images/logo.png" alt="Delphic" /></a></div>
        <!-- Logo --> 
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="index.jsp" class="selected">Home</a>
                <ul>
                  <li><a href="index.jsp">Home with Cycle</a></li>
                  <li><a href="index-2.jsp">Home with Columns</a></li>
                  <li><a href="index-3.jsp">Home with Services</a></li>
                  <li><a href="index-4.jsp">Home with Piecemaker</a></li>
                </ul>
              </li>
              <li><a href="blog-1.jsp">Blog</a>
                <ul>
                  <li><a href="blog-1.jsp">Blog</a></li>
                  <li><a href="blog-2.jsp">News</a></li>
                  <li><a href="blog-single.jsp">Single Blog Post</a></li>
                </ul>
              </li>
              <li><a href="portfolio-1.jsp">Portfolio</a>
                <ul>
                  <li><a href="portfolio-1.jsp">Portfolio with Lightbox</a></li>
                  <li><a href="portfolio-2.jsp">Portfolio with Details</a></li>
                  <li><a href="portfolio-single.jsp">Single Portfolio Post</a></li>
                </ul>
              </li>
              <li><a href="services.jsp">Services</a></li>
              <li><a href="page-tabs-toggle.jsp">Features</a>
                <ul>
                  <li><a href="page-tabs-toggle.jsp">Tabs &amp; Toggle</a></li>
                  <li><a href="page-carousel.jsp">Carousel</a></li>
                  <li><a href="blog-2.jsp">News</a></li>
                  <li><a href="services.jsp">Services</a></li>
                  <li><a href="page-custom.jsp">Custom Page</a></li>
                  <li><a href="page-buttons.jsp">Buttons</a></li>
                  <li><a href="styles.jsp">Columns &amp; Tables</a></li>
                </ul>
              </li>
              <li><a href="contact.jsp">Contact</a></li>
            </ul>
          </div>
        </div>
        <!-- End Menu --> 
      </div>
      <!-- End Header --> 
    </div>
  </div>
  <!-- End Header Wrapper --> 
  
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
  
  <!-- End Wrapper -->
  <div class="clearfix"></div>
  <div class="push"></div>
</div>

<!-- Begin Footer -->
<div id="footer-wrapper">
  <div id="footer">
    <div id="footer-content"> 
      
      <!-- Begin Copyright -->
      <div id="copyright">
        <p>© Copyright 2011 Delphic | Creative Portfolio Template</p>
      </div>
      <!-- End Copyright --> 
      
      <!-- Begin Social Icons -->
      <div id="socials">
        <ul>
          <li><a href="#"><img src="resources/style/images/icon-rss.png" alt="" /></a></li>
          <li><a href="#"><img src="resources/style/images/icon-twitter.png" alt="" /></a></li>
          <li><a href="#"><img src="resources/style/images/icon-dribble.png" alt="" /></a></li>
          <li><a href="#"><img src="resources/style/images/icon-tumblr.png" alt="" /></a></li>
          <li><a href="#"><img src="resources/style/images/icon-flickr.png" alt="" /></a></li>
          <li><a href="#"><img src="resources/style/images/icon-facebook.png" alt="" /></a></li>
        </ul>
      </div>
      <!-- End Social Icons --> 
      
    </div>
  </div>
</div>
<!-- End Footer -->
</body>
</html>