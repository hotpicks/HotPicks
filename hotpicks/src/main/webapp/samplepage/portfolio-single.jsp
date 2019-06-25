<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
  
  <!-- Begin Wrapper -->
  <div id="wrapper">
    <div id="portfolio-single">
      <div class="image"> <img src="${root}/resources/style/images/art/single1.jpg" alt="" /> <img src="${root}/resources/style/images/art/single2.jpg" alt="" /> </div>
      <div class="text">
        <h3>Sapien tortor vitae semil egestas, velit at dictum</h3>
        <p>Quisque adipiscing tortor ac eros pulvinar rutr. Praesent egestas, velit at dictum commodo, lorem dolor placerat lacus, nec tempus sapien tortor vitae sem. Fusce ac sapien odio, sit amet rhoncus urna. </p>
        <ul>
          <li>Nunc faucibus lacus vel sapieno.</li>
          <li>Sed eros diam, varius adipiscing.</li>
        </ul>
        <a href="#">http://project-name.com</a>
        <div class="divider3"></div>
        <a href="#" class="p-project">&laquo; Previous Project</a> <a href="#" class="n-project">Next Project &raquo;</a> </div>
    </div>
  </div>
  <!-- End Wrapper -->
 
<script type="text/javascript">
		$(document).ready(function(){
			$("#gallery a[rel^='prettyPhoto']").prettyPhoto({theme:'light_square',autoplay_slideshow: false});
		});
		
		
		
		$(function() {
            var offset = $(".text").offset();
            var topPadding = 15;
            $(window).scroll(function() {
                if ($(window).scrollTop() > offset.top) {
                    $(".text").stop().animate({
                        marginTop: $(window).scrollTop() - offset.top + topPadding
                    });
                } else {
                    $(".text").stop().animate({
                        marginTop: 0
                    });
                };
            });
        });
</script>

<%@ include file = "/template/footer.jsp" %>