<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<c:if test="${visits.size() == 0}">
	<div align="center" style="height: 300px; font-size: 20px; font-weight: 700;">
	<br><br><br><br><br>
		<p>통계결과가 존재하지 않습니다.&nbsp;<font color="#ff99bb"><i class="fas fa-sad-tear"></i></font>
	</div>
</c:if>

<c:if test="${visits.size() != 0}">

	<canvas id="chart" width="100" height="100" class="chartjs-render-monitor" style="display: block; height: 400px; width: 392px;"></canvas>
<script>

// 통계 일자
var statDateList = new Array();
// 방문 수
var visitCnt = new Array();
// 방문자 수
var visitorCnt = new Array();

<c:forEach items="${visits}" var="visit">
	statDateList.push("${visit.STATDATE}");
	visitCnt.push("${visit.VISITCNT}")
	visitorCnt.push("${visit.VISITORCNT}")
</c:forEach>



var data
= {
	"labels": statDateList,
	"datasets":[
				{
					"label":"방문 수",
					"data":visitCnt,
					"fill":false,
					"backgroundColor" : "rgba(75, 192, 192, 0.3)",
					"borderColor":"rgb(75, 192, 192)",
					"lineTension":0.1
				}
				,
				{
					"label":"방문자 수",
					"data":visitorCnt,
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

</c:if>
