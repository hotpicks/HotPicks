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

	
});
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
          	<select style="width:300px;">
          		<option>2019.06.22 - 2019.06.28 (최근 1주)</option>
          		<option>2019.05.28 - 2019.06.28 (최근 1개월)</option>
          		<option>2018.06.28 - 2019.06.28 (최근 1년)</option>
          	</select>
          	<div class="clear"></div>
          	<!-- ********** 게시글 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>순위</td>
          		<td>#해시태그</td>
          		<td>사용 횟수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>1</td>
          		<td>#재미있다</td>
          		<td>1000</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>2</td>
          		<td>#휴식</td>
          		<td>900</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>3</td>
          		<td>#힐링</td>
          		<td>800</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>4</td>
          		<td>#서울전시회</td>
          		<td>766</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>5</td>
          		<td>#여가생활</td>
          		<td>456</td>
          	</tr>
          </table>
          
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