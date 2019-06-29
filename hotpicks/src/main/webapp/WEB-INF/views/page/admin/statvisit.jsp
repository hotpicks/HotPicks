<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<style>
#wrapper{
line-height: 45px;
}

.title{
font-weight: 900;
font-size: 40px;
color: white;
}

.divider{
margin-top:0px;
padding-bottom: 0px;
margin-bottom: 10px;
}

.btns{
margin-bottom: 10px;
}

.tab .list{
background-color : lightgray;
}

ul#tab-menu {
    float: none;
    width: 100%;
}

#wrapper ul li {
    line-height: 60px;
    display: inline;
    margin-left: 35px;
    margin-right: 35px;
}

.tab-content{
	float:none;
	margin-top:10px;
	width : 98%;
	height: 1000px;
}

input[type=checkbox]{
width:20px;
height:20px;
}

table td {
padding:0px;
}

#membercnt {
height: 100px;
}

#membercnt td{
font-weight:700;
font-size:large;
}

.tab-content div.tab p {
	width: 100%;
}

</style>

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
        <li><a href="${root}/WEB-INF/views/page/admin/managemember.jsp"><img src="${root}/resources/style/images/ad_menu1.png" alt="" /><strong>회원관리</strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/managereview.jsp"><img src="${root}/resources/style/images/ad_menu2.png" alt="" /><strong>게시글 관리</strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/statlike.jsp"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong>회원 선호도 분석</strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/statvisit.jsp"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong><font color="#287f56">회원 방문 통계</font></strong></a></li>
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
          		<td>새 가입자 수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td>2019.06.28</td>
          		<td>50</td>
          		<td>3</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 방문자 현황 그래프 ********** -->
          <p>
        	2019.06.22 - 2019.06.28 (최근 1주) <br>
        	2019.05.28 - 2019.06.28 (최근 1개월) <br>
        	2018.06.28 - 2019.06.28 (최근 1년) <br>
        	방문 그래프 띄우기
          </p>

         </div>
      <!-- ***************************** [ tab 4 끝 ] ****************************** -->
		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>