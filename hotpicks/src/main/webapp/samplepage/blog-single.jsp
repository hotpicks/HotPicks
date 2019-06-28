<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
<style>
.detailimg {
	width: 600px;
	height: 300px;
}
.clearfix{
	margin-bottom: 0px;
}
</style>
<script type="text/javascript">
	$(function(){ $("label").inFieldLabels(); });
</script>
  
  <!-- Begin Wrapper -->
  <div id="wrapper">
    <div id="post-wrapper">
      <div class="post">
        <h2 class="title">부산 다함께 축제</h2>
        <div class="meta">
          <div class="top-border"></div>
          <span class="contentsType">축제</span> | <span class="picksCount">54</span> Picks | <span class="reviewCount">4</span> Reviews </div>
        <img class="detailimg" src="${root}/resources/style/images/sample/p1.jpg" alt="장소 제목!!!(부산 감천 문화마을)" />
        <div class="detail">
        	<div class="date">기간 | <span class="startD">2019.06.14</span> ~ <span class="endD">2019.08.20</span></div>
        	<div class="address">장소 | <span>부산 사하구 감내2로 203 감천문화마을안내센터</span></div>
        	<div class="contents">내용 | <span>부산 감천문화 마을에서 펼처지는 재밋는 놀이</span></div>
 			<p></p>
        </div>
        <div class="top-border"></div>
        <div class="tags"> Tags: <a href="#" title="">축제</a>, <a href="#" title="">부산</a>, <a href="#" title="">감천문화마을</a> </div>
      </div>
      
      <!-- Begin Comments -->
      
      <div id="comment-wrapper">
        <h3><span class="reviewCount">4</span> Reviews to "<span>부산 다함께 축제</span>"</h3>
        
        <!-- Begin Comments -->
        <div id="comments">
          <ol id="singlecomments" class="commentlist">
            <li class= "clearfix">
              <div class="user"><a href="#"><img alt="" src="${root}/resources/style/images/art/blog-th1.jpg" height="60" width="60" class="avatar" /></a> <a class="reply-link" href="#">Reply</a></div>
              <div class="message">
                <div class="info">
                  <h3><a href="#">부산축제 완전추천!!</a></h3>
                  <span class="date">- 2019.07.11</span> </div>
                <p>ales ac.</p>
              </div>
              <div class="clear"></div>
            </li>
            <li class= "clearfix">
              <div class="user"><a href="#"><img alt="" src="${root}/resources/style/images/art/blog-th1.jpg" height="60" width="60" class="avatar" /></a> <a class="reply-link" href="#">Reply</a></div>
              <div class="message">
                <div class="info">
                  <h3><a href="#">Jacqueline</a></h3>
                  <span class="date">- April 4, 2010</span> </div>
                <p>Quisque tristique tincidunt metus non aliquam. Quisque ac risus sit amet quam sollicitudin vestibulum vitae malesuada libero. Mauris magna elit, suscipit non ornare et, blandit a tellus. Pellentesque dignissim ornare elit, quis mattis eros sodales ac.</p>
              </div>
              <div class="clear"></div>
              <ul class="children">
                <li class= "clearfix">
                  <div class="user"><a href="#"><img alt="" src="${root}/resources/style/images/art/blog-th1.jpg" height="60" width="60" class="avatar" /></a> <a class="reply-link" href="#">Reply</a></div>
                  <div class="message">
                    <div class="info">
                      <h3><a href="#">Mathieu</a></h3>
                      <span class="date">- April 4, 2010</span> </div>
                    <p>Quisque ac risus sit amet quam sollicitudin vestibulum vitae malesuada libero. Mauris magna elit, suscipit non ornare et, blandit a tellus. Pellentesque dignissim ornare elit, quis mattis eros sodales ac.</p>
                  </div>
                  <div class="clear"></div>
                  <ul class="children">
                    <li class= "clearfix">
                      <div class="user"><a href="#"><img alt="" src="${root}/resources/style/images/art/blog-th1.jpg" height="60" width="60" class="avatar" /></a> <a class="reply-link" href="#">Reply</a></div>
                      <div class="message">
                        <div class="info">
                          <h3><a href="#">Charlene</a></h3>
                          <span class="date">- April 4, 2010</span> </div>
                        <p>Mauris magna elit, suscipit non ornare et, blandit a tellus. Pellentesque dignissim ornare elit, quis mattis eros.</p>
                      </div>
                      <div class="clear"></div>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ol>
        </div>
        <!-- End Comments --> 
        
        <!-- Begin Form -->
        <div id="comment-form" class="comment-form">
          <h3>후기 작성</h3>
          <form name="form_name" method="post">
            <div class="comment-input">
              <p>
                <label for="name">제목</label>
                <br />
                <input type="text" name="name" value="" id="name">
              </p>
              <p>
                <label for="email">별점</label>
                <br />
                <input type="text" name="email" value="" id="email">
              </p>
              <p>
                <label for="website">사진올리기</label>
                <br />
                <input type="text" name="website" value="" id="website">
              </p>
            </div>
            <div class="comment-textarea">
              <textarea name="textarea" id="textarea" rows="5" cols="30"></textarea>
            </div>
            <div class="clear"></div>
            <input id="submit-button" class="button gray stripe" type="submit" name="submit" value="후기 내용" />
          </form>
          <div class="clear"></div>
        </div>
        <!-- End Form --> 
        
      </div>
      
      <!-- End Comments --> 
      
    </div>
    <div id="sidebar">
      <div class="sidebox">
        <h3>다른 사진들</h3>
        <ul class="flickr">
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/flickr-6.jpg" alt="" /></a></li>
        </ul>
      </div>
      <div class="sidebox">
        <h3>지도</h3>
        <div style="height: 260px; background-color: lightgray;"></div>
      </div>
      <div class="sidebox">
        <h3>Hash Tags</h3>
        <ul class="tags">
          <li><a href="#" title="">축제</a></li>
          <li><a href="#" title="">핫픽</a></li>
          <li><a href="#" title="">부산</a></li>
          <li><a href="#" title="">감천문화마을</a></li>
          <li><a href="#" title="">부산축제</a></li>
          <li><a href="#" title="">핫픽스</a></li>
          <li><a href="#" title="">Fun</a></li>
          <li><a href="#" title="">Travel</a></li>
          <li><a href="#" title="">Inspiration</a></li>
        </ul>
      </div>
      <div class="sidebox">
        <h3>예매정보</h3>
        <ul class="post-list archive">
          <li><a href="#" title="">March 2011 (11)</a></li>
          <li><a href="#" title="">February 2011 (9)</a></li>
          <li><a href="#" title="">January 2011 (5)</a></li>
        </ul>
      </div>
      
      <div class="sidebox">
        <h3>Sponsors</h3>
        <ul class="ads">
          <li><a href="#"><img src="${root}/resources/style/images/art/ad-1.gif" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/ad-2.gif" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/ad-3.gif" alt="" /></a></li>
          <li><a href="#"><img src="${root}/resources/style/images/art/ad-4.gif" alt="" /></a></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- End Wrapper -->
  
<%@ include file = "/template/footer.jsp" %>