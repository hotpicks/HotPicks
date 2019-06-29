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
        <li><a href="${root}/WEB-INF/views/page/admin/statlike.jsp"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong><font color="#287f56">회원 선호도 분석</font></strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/statvisit.jsp"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong>회원 방문 통계</strong></a></li>
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
          	집계기준 : 2019.06.22 - 2019.06.28 (최근 1주)
          	<br/>
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