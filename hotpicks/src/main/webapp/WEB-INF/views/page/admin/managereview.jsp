<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<script>
$(function(){
		
	
	// 게시글 관리 접속 시, 기본 전체 리뷰 목록을 불러옴
	var selected = $("#reviewType").val();
	getReview(selected);
	
	// 리뷰 분류 선택 이벤트
	// : 셀렉트 박스 변경 시마다, 맞는 회원 목록을 불러옴
	$("#reviewType").change(function() {
		getReview($(this).val());
	});
	
	// 리뷰 전체 선택 및 해제 이벤트
	$(".allch").live("click",function(){
		var checked = $(this).is(":checked");
		if(checked){
			$(".ch").attr("checked", true);
		}else{
			$(".ch").attr("checked", false);			
		}
	});
	
	// 리뷰 삭제 버튼 클릭 이벤트
	   $("#deleteBtn").live("click",function(){
	      var checkedMember = $("input[name=ch]:checked");
	      var rseqArr = new Array();
	      
	      var tr =checkedMember.parent().parent();
	      for(var i = 0; i < tr.length; i++){
	    	  	rseqArr.push(tr.eq(i).children().eq(2).val());
	         }
	      
	      // ajax로 array배열을 넘기기 위한 세팅
	      jQuery.ajaxSettings.traditional = true;
	      	      
	      $.ajax({
	  		type : 'POST',
	  		url : '${root}/admin/modifyreview',
	  		data : { 
	  				'rseqs' : rseqArr
	  				} ,
	  		success : function(result){
	  			location.reload();
	  		}
	  	});
	      
	});
	
// 리뷰 분류에 따른 리뷰 목록 불러오기 메소드
function getReview(selected){
	$.ajax({
		type : 'GET',
		url : '${root}/admin/mgmember/' + selected,
		success : function(result){
			$("#memberList").html(result);
		}
	});
}
	
});
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper">
      
    <div class="tab-wrapper">
      <ul id="tab-menu">
        <li><a href="${root}/admin/mgmember"><img src="${root}/resources/style/images/ad_menu1.png" alt="" /><strong>회원관리</strong></a></li>
        <li><a href="${root}/admin/mgreview"><img src="${root}/resources/style/images/ad_menu2.png" alt="" /><strong><font color="#287f56">게시글 관리</font></strong></a></li>
        <li><a href="${root}/admin/stlike"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong>회원 선호도 분석</strong></a></li>
        <li><a href="${root}/admin/stvisit"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong>회원 방문 통계</strong></a></li>
      </ul>
      
      <div class="tab-content">
      
      <!-- ***************************** [ tab 2 시작 ] ****************************** -->   
        <div class="tab show">
          <h3>게시글 관리</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 게시글 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>집계일자</td>
          		<td>전체 리뷰 수</td>
          		<td>신고 리뷰 수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td style="vertical-align: middle;">${reviewCount.STATDATE}</td>
          		<td style="vertical-align: middle;">${reviewCount.RCNT}</td>
          		<td style="vertical-align: middle;">${reviewCount.DRCNT}</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          
          <!-- ********** 게시글 현황 그래프 ********** -->
          
          
          
          <!-- ********** 신고 게시글 관리 테이블 ********** -->
          	<a id="deleteBtn" class="button red btns" style="margin-right:30px; font-weight: 700;">리뷰삭제<span></span></a>
          	<select id="reviewType">
          		<option value="전체리뷰">전체 리뷰</option>
          		<option value="신고리뷰">신고 리뷰</option>
          	</select>
          	<div class="clear"></div>
 
          <div id="reviewList" style="float:none; height: 850px; overflow-y:auto">
          
          		<!-- 동적 페이지 구성 부분 -->
           
           </div>
          
		</div>
      <!-- ***************************** [ tab 2 끝 ] ****************************** -->

		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>