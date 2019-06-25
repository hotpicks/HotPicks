<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>

<script type="text/javascript">
  var flashvars = {};
  flashvars.cssSource = "piecemaker.css";
  flashvars.xmlSource = "piecemaker.xml";
	
  var params = {};
  params.play = "true";
  params.menu = "false";
  params.scale = "showall";
  params.wmode = "transparent";
  params.allowfullscreen = "true";
  params.allowscriptaccess = "always";
  params.allownetworking = "all";
  
  swfobject.embedSWF('piecemaker.swf', 'piecemaker', '960', '450', '10', null, flashvars,    
  params, null);

</script>
  
  <!-- Begin Slider -->
  <div id="piecemaker-container">
    <div id="piecemaker">
      <p>Put your alternative Non Flash content here.</p>
    </div>
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
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/art/home-1.jpg" alt="" /></a>
        <h4>Elegant Style</h4>
        <p>Morbi non nunc nec ipsum tincidunt luctus aliquam vel nisi. Donec eu accumsan elit.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/art/home-2.jpg" alt="" /></a>
        <h4>Easily Customizable</h4>
        <p>Nulla facilisi. Aenean porttitor cursus aliquet. Praesent sit amet dictum lacus. Risus eget augue.</p>
      </div>
      <div class="one-fourth"> <a href="#"><img src="${root}/resources/style/images/art/home-3.jpg" alt="" /></a>
        <h4>Dark and Light Layouts</h4>
        <p>Vivamus placerat viverra posuere. Duis quis luctus diam. Aliquam a mi id vel orci lectus.</p>
      </div>
      <div class="one-fourth last"> <a href="#"><img src="${root}/resources/style/images/art/home-4.jpg" alt="" /></a>
        <h4>jQuery Enhanced</h4>
        <p>Sed eu lorem sed lectus interdum vehicula. Praesent sit amet risus eget augue semper.</p>
      </div>
    </div>
    <!-- End About --> 
    
  </div>
  
  <!-- End Wrapper -->
  
<%@ include file = "/template/footer.jsp" %>