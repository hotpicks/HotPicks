<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<script>
$(function(){
		
	/* 전체 선택 및 해제 이벤트 */
	$(".allch").click(function(){
		var checked = $(this).is(":checked");
		if(checked){
			$(".ch").attr("checked", true);
		}else{
			$(".ch").attr("checked", false);			
		}
	});
	
	// 회원관리 접속 시, 기본 전체 회원 목록을 불러옴
	var selected = $("#memberType").val();
	getMember(selected);
	
	// 셀렉트 박스 변경 시마다, 맞는 회원 목록을 불러옴
	$("#memberType").change(function() {
		getMember($(this).val());
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
          		<td style="vertical-align: middle;">2019.06.28</td>
          		<td style="vertical-align: middle;">100</td>
          		<td style="vertical-align: middle;">3</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          
          <!-- ********** 회원 현황 그래프 ********** -->
          
          
          
          <!-- ********** 회원 관리 테이블 ********** -->
          	<a href="#" class="button red btns" style="margin-right:30px; font-weight: 700;">활동중지<span></span></a>
          	<a href="#" class="button red btns" style="font-weight: 700;">강제탈퇴<span></span></a>
          	<select id="memberType">
          		<option value="전체회원">전체 회원</option>
          		<option value="신고회원">신고 회원</option>
          	</select>
          	<div class="clear"></div>
 
          <div style="float:none; height: 600px; overflow-y:auto">
          
          <p class="list" id="memberList">
          	
          	<table>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>id</td>
          			<td>가입일</td>
          			<td>활동 상태</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>1</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>탈퇴</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>2</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>활동중지</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>3</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>활동</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>4</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>활동</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>5</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>탈퇴</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>6</td>
          			<td>회원id</td>
          			<td>회원 가입일</td>
          			<td>활동</td>
          		</tr>
   
          	</table>
			          
           </p>
           
           </div>
           
        </div>
      <!-- ***************************** [ tab 1 끝 ] ****************************** -->
        
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>