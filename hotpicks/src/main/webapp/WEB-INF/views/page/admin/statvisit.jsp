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
          		<td>2019.06.28</td>
          		<td>50</td>
          		<td>30</td>
          		<td>3</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 방문자 현황 그래프 ********** -->
          <p>
        	<select style="width:300px;">
          		<option>2019.06.22 - 2019.06.28 (최근 1주)</option>
          		<option>2019.05.28 - 2019.06.28 (최근 1개월)</option>
          		<option>2018.06.28 - 2019.06.28 (최근 1년)</option>
          	</select>
          	<div class="clear"></div>
          </p>
          <canvas id="chart" width="100" height="100" class="chartjs-render-monitor" style="display: block; height: 256px; width: 392px;"></canvas>
<script>
var data
= {
	"labels":["06.22","06.23","06.24","06.25","06.26","06.27","06.28"],
	"datasets":[
				{
					"label":"방문 수",
					"data":[30,31,40,29,50,58,60],
					"fill":false,
					"backgroundColor" : "rgba(75, 192, 192, 0.3)",
					"borderColor":"rgb(75, 192, 192)",
					"lineTension":0.1
				}
				,
				{
					"label":"방문자 수",
					"data":[20,24,30,59,20,38,50],
					"fill":false,
					"backgroundColor" : "rgba(228, 142, 149, 0.3)",
					"borderColor":"rgb(228, 142, 149)",
					"lineTension":0.1
				}
				]
	};

var options
= {
	maintainAspectRatio: false,
	scales : {
		yAxes: [{
			ticks: {
				beginAtZero : true,
				showLabelBackdrop : true,
				max : 100
			}
		}]
	}
  };
		
var ctx = $("#chart");
var myChart = new Chart(ctx, {
	 type: 'line',
	 data: data,
	 options: options
});
</script>

         </div>
      <!-- ***************************** [ tab 4 끝 ] ****************************** -->
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>