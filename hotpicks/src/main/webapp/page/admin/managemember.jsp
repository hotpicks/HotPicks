<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<style>
.title{
font-weight: 900;
font-size: 40px;
color: white;
}

.divider{
margin-top:0px;
padding-bottom: 30px;
margin-bottom: 60px;
}

.tab .list{
background-color : lightgray;
}

</style>

  <!-- Begin Wrapper -->
  <div id="wrapper">
	  <div align="left" class="title">HotPicks Admin</div>
	  <div class="divider"></div>
	  <div class="clear"></div>
      
    <div class="tab-wrapper">
      <ul id="tab-menu">
        <li class="selected"><img src="${root}/resources/style/images/icon-palette.png" alt="" /><strong>회원관리</strong></li>
        <li><img src="${root}/resources/style/images/icon-art.png" alt="" /><strong>회원 선호도 분석</strong></li>
        <li><img src="${root}/resources/style/images/icon-laptop.png" alt="" /><strong>회원 방문 통계</strong></li>
        <li><img src="${root}/resources/style/images/icon-camera.png" alt="" /><strong>신고 리뷰 관리</strong></li>
      </ul>
      
      <div class="tab-content">
        <div class="tab show" style="display: block;">
          <h3>신고 회원 목록</h3>
          <p class="list">
          	<table>
          		<tr>
          			<td>1열 1행</td>
          			<td>1열 2행</td>
          			<td>1열 3행</td>
          			<td>1열 4행</td>
          			<td>1열 5행</td>
          			<td>1열 6행</td>
          		</tr>
          		<tr>
          			<td>2열 1행</td>
          			<td>2열 2행</td>
          			<td>2열 3행</td>
          			<td>2열 4행</td>
          			<td>2열 5행</td>
          			<td>2열 6행</td>
          		</tr>
          	</table>
			          
          </p>
        </div>
        
        <div class="tab" style="display: none;">
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