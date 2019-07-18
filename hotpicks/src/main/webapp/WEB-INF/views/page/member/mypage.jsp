<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>
<%@ include file = "/WEB-INF/views/page/template/logincheck.jsp" %>

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
    width: 8%px;
    height: auto;
    margin-left: 21%;
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

<script>

$(function(){
	
	// 메인페이지 실행 시, 기본 축제 카테고리 리뷰들 불러옴
	var selected = $("#category").val();
	getReview(selected);
	
	$("#category").change(function(){
		getReview($(this).val());
	});
	
});

function getReview(selected){
	$.ajax({
	    type: 'GET',
	    url : '${root}/member/mypage/'+selected,
	    success : function(result){
	        $("#newslist").html(result);
	        $(".cate").text(selected);
	    }
	});
}

</script>

        <!-- Begin Profile -->
        <div id="comments">
          <ol id="singlecomments" class="commentlist">
            <li class= "clearfix">
              <div class="user">
                 <!-- ***************** 프로필 사진 **************** -->
<c:choose>
	<c:when test="${userInfo.pass!='kakao'}">
		<img alt="사용자프로필사진" src="${root}/profile/${userInfo.profile}" height="150px;" width="150px;"/>
	</c:when>
	
	<c:when test="${userInfo.pass=='kakao'&&userInfo.profile.substring(0,4)=='http'}">
		<img alt="사용자프로필사진" src="${userInfo.profile}" height="150px" width="150px"/>		
	</c:when>
	
	<c:otherwise>
		<img alt="사용자프로필사진" src="${root}/profile/${userInfo.profile}" height="150px" width="150px"/>
	</c:otherwise>

</c:choose>

              </div>
              <div class="message">
                <div class="info">
                 <!-- ***************** 이름 (id) **************** -->
                  <h3 style="font-weight:700; font-size:30px;">${userInfo.name}님 (${userInfo.userId})</h3>
                 </div>
                 <br><br><br>
                 <!-- ***************** 리뷰 개수 **************** -->
<c:if test="${reviewCnt != null}">
                <p style="font-weight:700; font-size:15px; margin-top: 10px;">리뷰 개수 :${reviewCnt}
</c:if>
<c:if test="${reviewCnt == null}">
                <p style="font-weight:700; font-size:15px; margin-top: 10px;">리뷰 개수 : 0
</c:if>
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
             <option value="축제" selected>축제</option>
             <option value="공연">공연</option>
             <option value="행사">행사</option>
          </select>
          </div>
          
          <div style="clear:both;"></div>
          
        <div id="news"> 
	      <!-- Begin News Navigation -->
	      <div id="newslist" style="float:none; height: 650px; overflow-y:auto">
	        
	        <!-- 동적 리뷰 페이지 -->
	        
	      </div>
	      
	      <div class="clearfix"></div>
	      
    	</div>
        
        <!-- End My Review 목록 -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>