<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<script>
$(function(){
		
	// 회원관리 접속 시, 기본 전체 회원 목록을 불러옴
	var selected = $("#memberType").val();
	getMember(selected);
	
	// 회원 분류 선택 이벤트
	// : 셀렉트 박스 변경 시마다, 맞는 회원 목록을 불러옴
	$("#memberType").change(function() {
		getMember($(this).val());
	});
	
	// 회원 전체 선택 및 해제 이벤트
	$(".allch").live("click",function(){
		var checked = $(this).is(":checked");
		if(checked){
			$(".ch").attr("checked", true);
		}else{
			$(".ch").attr("checked", false);			
		}
	});
	
	// 회원 강제 탈퇴 버튼 클릭 이벤트
	   $("#getOutBtn").live("click",function(){
	      var checkedMember = $("input[name=ch]:checked");
	      var tdArr = new Array();

	      var tr =checkedMember.parent().parent();
	      for(var i = 0; i < tr.length; i++){
				tdArr.push(tr.eq(i).children().eq(2).text());
	         }
	      
	      // ajax로 array배열을 넘기기 위한 세팅
	      jQuery.ajaxSettings.traditional = true;
	      	      
	      $.ajax({
	  		type : 'POST',
	  		url : '${root}/admin/modifymember',
	  		data : { 
	  				'userIds' : tdArr
	  				} ,
	  		success : function(result){
	  			location.reload();
	  		}
	  	});
	      
	});
	

// 회원분류에 따른 회원 목록 불러오기 메소드
function getMember(selected){
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
        <li><a href="${root}/admin/mgmember"><img src="${root}/resources/style/images/ad_menu1.png" alt="" /><strong><font color="#287f56">회원관리</font></strong></a></li>
        <li><a href="${root}/admin/mgreview"><img src="${root}/resources/style/images/ad_menu2.png" alt="" /><strong>게시글 관리</strong></a></li>
        <li><a href="${root}/admin/stlike"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong>회원 선호도 분석</strong></a></li>
        <li><a href="${root}/admin/stvisit"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong>회원 방문 통계</strong></a></li>
      </ul>
      
      <div class="tab-content">
      
      <!-- ***************************** [ tab 1 시작 ] ****************************** -->
        <div class="tab show" style="display: block;">
          <h3>회원 관리</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 회원 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>집계일자</td>
          		<td>전체 회원 수</td>
          		<td>탈퇴 회원 수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td style="vertical-align: middle;">${memberCount.STATDATE}</td>
          		<td style="vertical-align: middle;">${memberCount.MCNT}</td>
          		<td style="vertical-align: middle;">${memberCount.DMCNT}</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          
          <!-- ********** 회원 현황 그래프 ********** -->
          
          
          
          <!-- ********** 회원 관리 테이블 ********** -->
          	<a id="getOutBtn" class="button red btns" style="margin-right:30px; font-weight: 700;">강제탈퇴<span></span></a>
          	<select id="memberType">
          		<option value="전체회원">전체 회원</option>
          		<option value="신고회원">신고 회원</option>
          	</select>
          	<div class="clear"></div>
 
          <div id="memberList" style="float:none; height: 600px; overflow-y:auto">
          
          	
          	<!-- 동적 페이지 구성 부분 -->
			   
			                    
           </div>
           
        </div>
      <!-- ***************************** [ tab 1 끝 ] ****************************** -->
        
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>