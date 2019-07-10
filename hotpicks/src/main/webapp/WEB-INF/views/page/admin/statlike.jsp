<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){

	// 회원 선호도 분석 접속 시, 기본 해시태그 목록을 불러옴
	var selected = $("#hashtagType").val();
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
          
          <br>
          
          <div align="center" style="float:left; width:50%; height:250px;">
          	<canvas id="chart1" width="50" height="50" class="chartjs-render-monitor" style="height: 50px; width: 50px;"></canvas>
          	<span style="font-size:15px; font-weight: 700;">&lt;리뷰 수 기준 선호 콘텐츠&gt;</span>
		  </div>
		  <div align="center" style="float:left; width:50%; height:250px;">
          	<canvas id="chart2" width="50" height="50" class="chartjs-render-monitor" style="height: 50px; width: 50px;"></canvas>
          	<span style="font-size:15px; font-weight: 700;">&lt;pick 기준 선호 콘텐츠&gt;</span>
		  </div>
<script>

var rPER1 = '<c:out value="${rCateStat[0].PER}"/>';
var rPER2 = '<c:out value="${rCateStat[1].PER}"/>';
var rPER3 = '<c:out value="${rCateStat[2].PER}"/>';

var pPER1 = '<c:out value="${pCateStat[0].PER}"/>';
var pPER2 = '<c:out value="${pCateStat[1].PER}"/>';
var pPER3 = '<c:out value="${pCateStat[2].PER}"/>';

var data = {
	    datasets: [{
	    	data: [rPER1, rPER2, rPER3],
            backgroundColor: [
				'#C06C84',
				'#F8B195',
				'#355C7D'
           ]
	    }],

	    labels: [
	        '축제',
	        '행사',
	        '공연'
	    ]
};
	
var options
= {
	 maintainAspectRatio: false,
     cutoutPercentage: 50,
     legend: {
               display: true,
               position: 'top',
               labels: {
                         fontSize: 12,
                         fontFamily: 'sans-serif',
                         fontColor: '#000000',
                         fontStyle: 'bold'
                       }
              }
  };


var ctx = $("#chart1");
var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options
});

var data2 = {
	    datasets: [{
	    	data: [pPER1, pPER2, pPER3],
            backgroundColor: [
            	'#C06C84',
				'#F8B195',
				'#355C7D'
           ]
	    }],

	    labels: [
	        '축제',
	        '행사',
	        '공연'
	    ]
};
	
var options2
= {
	 maintainAspectRatio: false,
     cutoutPercentage: 50,
     legend: {
               display: true,
               position: 'top',
               labels: {
                         fontSize: 12,
                         fontFamily: 'sans-serif',
                         fontColor: '#000000',
                         fontStyle: 'bold'
                       }
              }
  };


var ctx = $("#chart2");
var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: data2,
    options: options2
});

</script>
         <div class="clear"></div>
         
          <br><br>
          <h3>해시태그 사용 순위</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <p>

				<select id="hashtagType" style="width:300px;">
        			 <option value="일주일">${statDate.WEEKDATE} - ${statDate.TODAY} (최근 1주)</option>
        			 <option value="한달">${statDate.MONTHDATE} - ${statDate.TODAY} (최근 1개월)</option>
        			 <option value="일년">${statDate.YEARDATE} - ${statDate.TODAY} (최근 1년)</option>
   				 </select>
          	
     <div class="clear"></div>

	<div id="hashtagList">
         
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