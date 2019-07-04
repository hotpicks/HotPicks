<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>

<style>

.subtitle{
font-weight: 700;
font-size: 25px;
margin-top: 50px;
}

.divider{
margin: 10px;
margin-bottom: 20px;

}

/* 프로필 사진 */
#comments .user {
    width: 150px;
    height: auto;
    margin-left: 260px;
}
/* 아이디 */
#comments .message {
    width: 70%;
    font-size: 165px;
    height: 150px;
}

select {
width: 180px;
height: 30px;
margin-bottom: 20px;
}

</style>

        <!-- Begin Profile -->
        <div id="comments">
          <ol id="singlecomments" class="commentlist">
            <li class= "clearfix">
              <div class="user">
                 <!-- ***************** 프로필 사진 **************** -->
              	<img alt="사용자프로필사진" src="${root}/profile/${userInfo.profile}" height="150px" width="150px"/>
              </div>
              <div class="message">
                <div class="info">
                 <!-- ***************** 이메일 id **************** -->
                  <h3 style="font-weight:700; font-size:30px;">${userInfo.userId}</h3>
                 </div>
                 <br><br><br>
                 <!-- ***************** 리뷰 개수 **************** -->
                <p style="font-weight:700; font-size:15px; margin-top: 10px;">리뷰 개수 : 10
                <br>
                <a href="${root}/member/modify" style="font-size:10px; margin-top: 5px;" class="button light-teal btns">정보 수정<span></span></a></p>
              </div>
              </li>
              </ol>
              </div>
        <!-- End Profile -->
        
        
        
        <!-- Begin My Review 목록 -->
	  <!-- Begin Wrapper -->
 	 <div id="wrapper">
          
          <div align="left" class="subtitle">나의 리뷰 목록</div>
          
          <div class="divider"></div>
          
          <div style="float:right">
          <select id="category" name="category">
             <option value="123" selected>공연</option>
             <option value="123">전시</option>
             <option value="123">행사</option>
          </select>
          </div>
          
          <div style="clear:both;"></div>
          
        <div id="news"> 
	      <!-- Begin News Navigation -->
	      <div id="newslist">
	        <ul>
	          <!-- Begin 리뷰 글 -->
	          <li><img src="${root}/resources/style/images/art/blog-th1.jpg" alt="" class="left" />
	            <h4 class="title"><a href="">[공연] - 쉬어매드니스</a><span>- January 29, 2011</span></h4>
	            <p>정말 인생 공연...<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	          <!-- End 리뷰 글--> 
	          
	          <!-- Begin 리뷰 글 -->
	          <li><img src="${root}/resources/style/images/art/blog-th1.jpg" alt="" class="left" />
	            <h4 class="title"><a href="">[공연] - 쉬어매드니스</a><span>- January 29, 2011</span></h4>
	            <p>정말 인생 공연...<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	          <!-- End 리뷰 글-->
	          
	          <!-- Begin 리뷰 글 -->
	          <li><img src="${root}/resources/style/images/art/blog-th1.jpg" alt="" class="left" />
	            <h4 class="title"><a href="">[공연] - 쉬어매드니스</a><span>- January 29, 2011</span></h4>
	            <p>정말 인생 공연...<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	          <!-- End 리뷰 글-->  
	          
	          <!-- Begin 리뷰 글 -->
	          <li><img src="${root}/resources/style/images/art/blog-th1.jpg" alt="" class="left" />
	            <h4 class="title"><a href="">[공연] - 쉬어매드니스</a><span>- January 29, 2011</span></h4>
	            <p>정말 인생 공연...<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	          <!-- End 리뷰 글-->  
	          
	          <!-- Begin 리뷰 글 -->
	          <li><img src="${root}/resources/style/images/art/blog-th1.jpg" alt="" class="left" />
	            <h4 class="title"><a href="">[공연] - 쉬어매드니스</a><span>- January 29, 2011</span></h4>
	            <p>정말 인생 공연...<br>
	            <a href="" class="more">내용 보기 &raquo;</a> </p>
	          </li>
	          <!-- End 리뷰 글-->  
	          
	        </ul>
	      </div>
	      <div class="clearfix"></div>
	      <div id="scroll"> <a href="#" id="newslist-prev" class="jbutton"></a> <a href="#" id="newslist-next" class="jbutton"></a> </div>
	      <div class="clearfix"></div>
    	</div>
        
        <!-- End My Review 목록 -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>