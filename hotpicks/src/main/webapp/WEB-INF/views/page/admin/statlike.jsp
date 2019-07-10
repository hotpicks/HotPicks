<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<script>
$(function(){
		
	// 회원 선호도 분석 접속 시, 기본 해시태그 목록을 불러옴
	var selected = $("#hashtagType").val();
	console.log("초기 셀렉된 해시태그 타입 : " + selected);
	getHash(selected);
	
	// 기간 분류 선택 이벤트
	// : 셀렉트 박스 변경 시마다, 맞는 해시태그 목록을 불러옴
	$("#hashtagType").live("change", function() {
		getHash($(this).val());
	});
	
});

//기간분류에 따른 해시태그 목록 불러오기 메소드
function getHash(selected){
	$.ajax({
		type : 'GET',
		url : '${root}/admin/stlike/' + selected,
		success : function(result){
			$("#hashtagList").html(result);

		}
	});
}
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper">
      
    <div class="tab-wrapper">
      <ul id="tab-menu">
        <li><a href="${root}/admin/mgmember"><img src="${root}/resources/style/images/ad_menu1.png" alt="" /><strong>회원관리</strong></a></li>
        <li><a href="${root}/admin/mgreview"><img src="${root}/resources/style/images/ad_menu2.png" alt="" /><strong>게시글 관리</strong></a></li>
        <li><a href="${root}/admin/stlike"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong><font color="#287f56">회원 선호도 분석</font></strong></a></li>
        <li><a href="${root}/admin/stvisit"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong>회원 방문 통계</strong></a></li>
      </ul>
      
      <div class="tab-content">

      <!-- ***************************** [ tab 3 시작 ] ****************************** -->
        <div class="tab show">
          <h3>사용자 선호도 추이</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <p>
          	사용자가 선호하는 전시 카테고리, 공연 카테고리, 행사 카테고리
          	또는 선호하는 컨텐츠 카테고리
          	또는 선호하는 지역
          </p>
          
          <h3>해시태그 사용 순위</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <p>

				<select id="hashtagType" style="width:300px;">
        			 <option value="일주일">${statDate.WEEKDATE} - ${statDate.TODAY} (최근 1주)</option>
        			 <option value="한달">${statDate.MONTHDATE} - ${statDate.TODAY} (최근 1개월)</option>
        			 <option value="일년">${statDate.YEARDATE} - ${statDate.TODAY} (최근 1년)</option>
   				 </select>
          	
     <div id="hashtagList" class="clear">

          	<!-- 동적 페이지 구성 부분 -->
          	
     </div>

	 <div class="divider"></div>
     <div class="clear"></div>
          	
          </p>
          
        </div>
      <!-- ***************************** [ tab 3 끝 ] ****************************** -->
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>