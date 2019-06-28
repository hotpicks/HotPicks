<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<style>
.title{
font-weight: 900;
font-size: 40px;
padding-bottom: 50px;
color: white;
}
</style>

  <!-- Begin Wrapper -->
  <div id="wrapper">
	  <div align="left" class="title">HotPicks Admin</div>
    <div class="tab-wrapper">
      <ul id="tab-menu">
        <li class="selected"><img src="${root}/resources/style/images/icon-palette.png" alt="" /><strong>회원관리</strong></li>
        <li><img src="${root}/resources/style/images/icon-art.png" alt="" /><strong>회원 선호도 분석</strong></li>
        <li><img src="${root}/resources/style/images/icon-laptop.png" alt="" /><strong>회원 방문 통계</strong></li>
        <li><img src="${root}/resources/style/images/icon-camera.png" alt="" /><strong>신고 리뷰 관리</strong></li>
      </ul>
      <div class="tab-content">
        <div class="tab show">
          <h3>신고 회원 목록</h3>
          <p><img src="${root}/resources/style/images/art/portfolio12-th.jpg" alt="" class="right"/> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum consequat sem, nec tincidunt enim feugiat sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed egestas mattis tortor, quis auctor orci commodo id. In hac habitasse platea dictumst. Integer sed nisi nibh. Integer neque mi, pellentesque ut adipiscing ultrices, egestas vel ligula. Integer interdum ultrices turpis. Ut non est sed odio malesuada congue ac id ipsum. Duis mi tellus, porttitor a tristique eu, porttitor a odio. Curabitur accumsan cursus sollicitudin. Nullam quis ante ante, sed molestie elit. Morbi egestas est quis metus luctus accumsan. Duis interdum lectus eget est hendrerit mollis. Mauris vestibulum dictum porta. Praesent vel odio quis augue ultricies aliquam eget ut magna.</p>
          <p>Aliquam porttitor faucibus rhoncus. Aliquam erat volutpat. Vestibulum molestie fringilla mollis. Fusce eu neque arcu. Donec blandit imperdiet mollis. Etiam suscipit nisl eget libero aliquet tincidunt. Mauris euismod, tellus ac pellentesque malesuada, ligula tortor venenatis velit, at vehicula ligula lorem ac nisi. Maecenas et ligula arcu. Nullam vel accumsan felis. Vivamus venenatis diam vel magna ornare pellentesque. Pellentesque pharetra facilisis consectetur euismod mauris felis.</p>
         </div>
        
        <div class="tab">
          <h3>사용자 선호도 추이</h3>
          <p>
          	<img src="${root}/resources/style/images/art/portfolio11-th.jpg" alt="" class="right"/>
          	Vivamus mauris felis, egestas iaculis blandit vulputate, convallis sit amet justo.  Cras id orci felis. Duis lobortis blandit mollis. Donec in dignissim dui. Praesent vitae leo tempus turpis luctus convallis. Cras consectetur commodo ornare. Aliquam semper dignissim massa nec condimentum. Nunc tincidunt gravida velit, nec elementum erat aliquam aliquam. Fusce et risus orci. Aliquam at sapien in lacus interdum mattis nec at sem. Sed elit elit, vehicula a adipiscing vitae, dignissim in quam. Aliquam erat volutpat. Proin non massa nibh, sit amet placerat nibh. Aliquam posuere aliquam enim vitae euis. Morbi vestibulum porttitor pellentesque. Vestibulum ac pellentesque dolor.
          </p>
          <h3>해시태그 사용 순위</h3>
          <p>
          	<img src="${root}/resources/style/images/art/portfolio11-th.jpg" alt="" class="right"/>
          	Vivamus mauris felis, egestas iaculis blandit vulputate, convallis sit amet justo.  Cras id orci felis. Duis lobortis blandit mollis. Donec in dignissim dui. Praesent vitae leo tempus turpis luctus convallis. Cras consectetur commodo ornare. Aliquam semper dignissim massa nec condimentum. Nunc tincidunt gravida velit, nec elementum erat aliquam aliquam. Fusce et risus orci. Aliquam at sapien in lacus interdum mattis nec at sem. Sed elit elit, vehicula a adipiscing vitae, dignissim in quam. Aliquam erat volutpat. Proin non massa nibh, sit amet placerat nibh. Aliquam posuere aliquam enim vitae euis. Morbi vestibulum porttitor pellentesque. Vestibulum ac pellentesque dolor.
          </p>
        </div>
        
        <div class="tab">
          <h3>회원 방문 통계</h3>
          <p>
          	<img src="${root}/resources/style/images/art/portfolio11-th.jpg" alt="" class="right"/>
          	Vivamus mauris felis, egestas iaculis blandit vulputate, convallis sit amet justo.  Cras id orci felis. Duis lobortis blandit mollis. Donec in dignissim dui. Praesent vitae leo tempus turpis luctus convallis. Cras consectetur commodo ornare. Aliquam semper dignissim massa nec condimentum. Nunc tincidunt gravida velit, nec elementum erat aliquam aliquam. Fusce et risus orci. Aliquam at sapien in lacus interdum mattis nec at sem. Sed elit elit, vehicula a adipiscing vitae, dignissim in quam. Aliquam erat volutpat. Proin non massa nibh, sit amet placerat nibh. Aliquam posuere aliquam enim vitae euis. Morbi vestibulum porttitor pellentesque. Vestibulum ac pellentesque dolor.
          </p>
         </div>
        
        <div class="tab">
          <h3>신고 리뷰 목록</h3>
          <p>
          	<img src="${root}/resources/style/images/art/portfolio11-th.jpg" alt="" class="right"/>
          	Vivamus mauris felis, egestas iaculis blandit vulputate, convallis sit amet justo.  Cras id orci felis. Duis lobortis blandit mollis. Donec in dignissim dui. Praesent vitae leo tempus turpis luctus convallis. Cras consectetur commodo ornare. Aliquam semper dignissim massa nec condimentum. Nunc tincidunt gravida velit, nec elementum erat aliquam aliquam. Fusce et risus orci. Aliquam at sapien in lacus interdum mattis nec at sem. Sed elit elit, vehicula a adipiscing vitae, dignissim in quam. Aliquam erat volutpat. Proin non massa nibh, sit amet placerat nibh. Aliquam posuere aliquam enim vitae euis. Morbi vestibulum porttitor pellentesque. Vestibulum ac pellentesque dolor.
          </p>
		</div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <!-- End Wrapper -->

<script type="text/javascript">

$(document).ready(function() {	
  //Get all the LI from the #tabMenu UL
  $('#tab-menu > li').click(function(){
    //remove the selected class from all LI    
    $('#tab-menu > li').removeClass('selected');
    //Reassign the LI
    $(this).addClass('selected');
    //Hide all the DIV in .tab-content
    $('.tab-content div.tab').slideUp('slow');
    //Look for the right DIV in boxBody according to the Navigation UL index, therefore, the arrangement is very important.
    $('.tab-content div.tab:eq(' + $('#tab-menu > li').index(this) + ')').slideDown('slow');
  }).mouseover(function() {
    //Add and remove class, Personally I dont think this is the right way to do it, anyone please suggest    
    $(this).addClass('mouseover');
    $(this).removeClass('mouseout');   
  }).mouseout(function() {
    //Add and remove class
    $(this).addClass('mouseout');
    $(this).removeClass('mouseover');    
  });
});


$(function() {
            var offset = $("#tab-menu").offset();
            var topPadding = 15;
            $(window).scroll(function() {
                if ($(window).scrollTop() > offset.top) {
                    $("#tab-menu").stop().animate({
                        marginTop: $(window).scrollTop() - offset.top + topPadding
                    });
                } else {
                    $("#tab-menu").stop().animate({
                        marginTop: 0
                    });
                };
            });
});
</script>

<%@ include file = "/template/footer.jsp" %>