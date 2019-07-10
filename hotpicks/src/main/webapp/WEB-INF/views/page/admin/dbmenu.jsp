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
      
      <div class="tab-content">
      
      <!-- ***************************** [ 내용 시작 ] ****************************** -->
        <div class="tab show" style="display: block;">
          <h3>Contents DB 관리</h3>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 컨텐츠 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>갱신일자</td>
          		<td>전체 컨텐츠 수</td>
          		<td>유효 컨텐츠 수</td>
          	</tr>
          	<tr align="center" id="membercnt">
          		<td style="vertical-align: middle;">2019.07.02</td>
          		<td style="vertical-align: middle;">3000</td>
          		<td style="vertical-align: middle;">2800</td>
          	</tr>
          </table>
          
          <div class="divider"></div>
          <div class="clear"></div>
          
          
          <!-- ********** 컨텐츠 관리 테이블 ********** -->
          	<a href="#" class="button red btns" style="margin-right:30px; font-weight: 700;">삭 제<span></span></a>
          	<a href="#" class="button lime btns" style="margin-right:30px; font-weight: 700;">DB UPDATE<span></span></a>
          	<select>
          		<option value="전체">전체 컨텐츠</option>
          		<option value="1">축제</option>
          		<option value="2">공연</option>
          		<option value="3">행사</option>
          	</select>
          	<div class="clear"></div>


          <div style="float:none; height: 600px; overflow-y:auto">
          
          <p class="list">
          	
          	<table>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>카테고리</td>
          			<td>컨텐츠명</td>
          			<td>조회수</td>
          			<td>갱신일자</td>
          			<td>유효여부</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>1</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>2</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>3</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>4</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>5</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>6</td>
          			<td>공연</td>
          			<td>쉬어매드니스</td>
          			<td>1002</td>
          			<td>2019.07.02</td>
          			<td>유효</td>
          		</tr>
   
          	</table>
			          
           </p>
           
           </div>
           
        </div>
      <!-- ***************************** [ 내용 끝 ] ****************************** -->
        
		
      </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>