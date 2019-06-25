<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>

<script type="text/javascript">
jQuery(document).ready(function() {
    // Initialise the first and second carousel by class selector.
	// Note that they use both the same configuration options (none in this case).
	jQuery('.d-carousel .carousel').jcarousel({
        scroll: 1
    });
});
</script>
  
  <!-- Begin Wrapper -->
  <div id="wrapper">
  
  	<h2>Carousel with Details</h2>
  	<br />
    <div class="d-carousel">
      <ul class="carousel">
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-1.jpg" alt="" /></a>
          <h4><a href="#">1 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-2.jpg" alt="" /></a>
          <h4><a href="#">2 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-3.jpg" alt="" /></a>
          <h4><a href="#">3 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-4.jpg" alt="" /></a>
          <h4><a href="#">4 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-5.jpg" alt="" /></a>
          <h4><a href="#">5 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-6.jpg" alt="" /></a>
          <h4><a href="#">6 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-7.jpg" alt="" /></a>
          <h4><a href="#">7 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
        <li> <a href="#"><img src="${root}/resources/style/images/art/carousel-8.jpg" alt="" /></a>
          <h4><a href="#">8 Cras varius, sapien egetory sagittis</a></h4>
          <p>Suspendisse potenti. Nibh miry, ultricies ac molestie sit ameter vestibulum eget nunc. Vivamus vitae aliquam odio. Morbi sit amet odio tincidunt. </p>
        </li>
      </ul>
    </div>
    <div class="clear"></div>

    <br /><br />
    <h2>Carousel</h2>
    <br />
    <div class="d-carousel sgrid">
      <ul class="carousel">
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-9.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-10.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-11.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-12.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-13.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-14.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-15.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
        <li> 
          <!-- Begin Full Size Link and Description --> 
          <a href="#" title=""> <img src="${root}/resources/style/images/art/carousel-16.jpg" alt="" /><!-- Image Thumbnail --> 
          </a> </li>
      </ul>
    </div>
  </div>
  
  <!-- End Wrapper -->
  
<%@ include file = "/template/footer.jsp" %>