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
        <li><a href="${root}/WEB-INF/views/page/admin/managereview.jsp"><img src="${root}/resources/style/images/ad_menu2.png" alt="" /><strong><font color="#287f56">게시글 관리</font></strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/statlike.jsp"><img src="${root}/resources/style/images/ad_menu3.png" alt="" /><strong>회원 선호도 분석</strong></a></li>
        <li><a href="${root}/WEB-INF/views/page/admin/statvisit.jsp"><img src="${root}/resources/style/images/ad_menu4.png" alt="" /><strong>회원 방문 통계</strong></a></li>
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
          		<td>2019.06.28</td>
          		<td>500</td>
          		<td>3</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          
          <!-- ********** 게시글 현황 그래프 ********** -->
          
          
          
          <!-- ********** 게시글 관리 테이블 ********** -->
          	<a href="#" class="button red btns" style="margin-right:30px; font-weight: 700;">리뷰삭제<span></span></a>
          	<br>
 
          <div style="float:none; height: 850px; overflow-y:auto">
          
          <p class="list">
          	
          	<table>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>제목</td>
          			<td>작성자 id</td>
          			<td>작성일</td>
          			<td>조회수</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>1</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>2</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>3</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>4</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>5</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>6</td>
          			<td>리뷰 제목</td>
          			<td>작성자 id</td>
          			<td>2019.06.29</td>
          			<td>9</td>
          		</tr>
 
          	</table>
			          
           </p>
           
           </div>
          
		</div>
      <!-- ***************************** [ tab 2 끝 ] ****************************** -->

		
      </div>
    </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>