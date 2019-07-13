<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<script>

$(function(){

	// 방문 통계 접속 시, 기본 방문 통계 목록을 불러옴
	var selected = $("#visitType").val();
	getVisit(selected);
	
	// 기간 분류 선택 이벤트
	// : 셀렉트 박스 변경 시마다, 맞는 방문 통계 목록을 불러옴
	$("#visitType").live("change", function() {
		getVisit($(this).val());
	});
	
	
	
	
	
	
});

//기간분류에 따른 방문 통계 목록목록 불러오기 메소드
function getVisit(selected){
	$.ajax({
		type : 'GET',
		url : '${root}/admin/stvisit/' + selected,
		success : function(result){
			$("#visitChartSpace").html(result);

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
        <li><a href="${root}/admin/stlike"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong>회원 선호도 분석</strong></a></li>
        <li><a href="${root}/admin/stvisit"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong><font color="#287f56">회원 방문 통계</font></strong></a></li>
      </ul>
      
      <div class="tab-content">
      
	  <!-- ***************************** [ tab 4 시작 ] ****************************** -->
        <div class="tab show">
          <h3>방문 통계</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 방문자 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>집계일자</td>
          		<td>방문 수</td>
          		<td>방문자 수</td>
          		<td>새 가입자 수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>${statDate.TODAY}</td>
<c:if test="${todayVisit==null}">
          		<td>0</td>
          		<td>0</td>
          		<td>0</td>
</c:if>
<c:if test="${todayVisit!=null}">
          		<td>${todayVisit.VISITCOUNT}</td>
          		<td>${todayVisit.VISITORCOUNT}</td>
          		<td>${todayVisit.TODAYNEWMEMBER}</td>
</c:if>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 방문자 현황 그래프 ********** -->
          <p>
        	<select id="visitType" style="width:300px;">
          		<option value="일주일">${statDate.WEEKDATE} - ${statDate.TODAY} (최근 1주)</option>
        			 <option value="한달">${statDate.MONTHDATE} - ${statDate.TODAY} (최근 1개월)</option>
        			 <option value="일년">${statDate.YEARDATE} - ${statDate.TODAY} (최근 1년)</option>
          	</select>
          	<div class="clear"></div>
          </p>
          
          <div id="visitChartSpace">
          
          <!-- 동적 페이지 구성 부분 -->
          
          </div>
          
          

         </div>
      <!-- ***************************** [ tab 4 끝 ] ****************************** -->
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>