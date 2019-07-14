<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<style>
	.tab-content{
		height: 100%!Important;
	}
</style>
<script>
var page = 2;
$(window).scroll(function() {
	var scrollHeight = $(document).height();
	var scrollPosition = $(window).height() + $(window).scrollTop();
	if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
		var str = "";
		$.ajax({
			url : '${root}/admin/gopage',
			type : 'get',
			data : {"page" : page },
			dataType : 'json',
			success : function(result) {
				for (var i = 0; i < result.length; i++) {
					var catId = "";
					if (result[i].catId == 1) {
						catId = '축제';
					} else if (result[i].catId == 2) {
						catId = '공연';
					}else if (result[i].catId == 3) {
						catId = '행사';
					}		
				
				str += "			<tr align='center'>";
				str += "          			<td>";
				str += "          				<input type='checkbox' class='ch'>";
				str += "          			</td>";
				str += "          			<td>"+result[i].contentsId+"</td>";
				str += "          			<td>"+catId+"</td>";
				str += "          			<td>"+result[i].title+"</td>";
				str += "          			<td>"+result[i].hit+"</td>";
				str += "          			<td>"+result[i].updateDate+"</td>";
				str += "          			<td>"+result[i].eventEndDate+"</td>";
				str += "          		</tr>";
				}
				$('tr').last().after(str);
				page = page + 1 ;
			}
		});
	}
});
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
	/* var page = 2;
	var didScroll; 
	var lastScrollTop = 0; 
	var delta = 5; 

	$(window).scroll(function(event){ 
		didScroll = true;
	}); 
	
	setInterval(function() { 
		if (didScroll) { 
			hasScrolled(); didScroll = false; 
			} 
	}, 250); 
	
	function hasScrolled() {
		var st = $(this).scrollTop();
		if(Math.abs(lastScrollTop - st) <= delta) {
			return;
		};
		
		if (st > lastScrollTop && st > ($(document).height())-500){

	
			console.log(st);
			console.log(lastScrollTop);
			var str = "";
			$.ajax({
				url : '${root}/admin/gopage',
				type : 'get',
				data : {"page" : page },
				dataType : 'json',
				success : function(result) {
					for (var i = 0; i < result.length; i++) {
						var catId = "";
						if (result[i].catId == 1) {
							catId = '축제';
						} else if (result[i].catId == 2) {
							catId = '공연';
						}else if (result[i].catId == 3) {
							catId = '행사';
						}		
					
					str += "			<tr align='center'>";
					str += "          			<td>";
					str += "          				<input type='checkbox' class='ch'>";
					str += "          			</td>";
					str += "          			<td>"+result[i].contentsId+"</td>";
					str += "          			<td>"+catId+"</td>";
					str += "          			<td>"+result[i].title+"</td>";
					str += "          			<td>"+result[i].hit+"</td>";
					str += "          			<td>"+result[i].updateDate+"</td>";
					str += "          			<td>"+result[i].eventEndDate+"</td>";
					str += "          		</tr>";
						
					}
					$('tr').last().after(str);
					page = page + 1 ;
				}
			});
			
		} 
		lastScrollTop = st; 
	}
}); */
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
          	<a href="#" class="button lime btns" style="margin-right:30px; font-weight: 700;">DBUPT CATEGORY<span></span></a>
          	<a href="#" class="button lime btns" style="margin-right:30px; font-weight: 700;">DBUPT CONTENTS<span></span></a>
          	<select>
          		<option value="전체">전체 컨텐츠</option>
          		<option value="1">축제</option>
          		<option value="2">공연</option>
          		<option value="3">행사</option>
          	</select>
          	<div class="clear"></div>


          <div style="float:none; overflow-y:auto">
          
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
          		
          	<c:forEach var="contents" items="${list}">
          	
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="ch">
          			</td>
          			<td>${contents.contentsId}</td>
          			<c:choose>
          				<c:when test="${contents.catId == 1}">
          					<c:set var="catname" value="축제"></c:set>
          				</c:when>
          				<c:when test="${contents.catId == 2}">
          					<c:set var="catname" value="공연"></c:set>
          				</c:when>
          				<c:when test="${contents.catId == 3}">
          					<c:set var="catname" value="행사"></c:set>
          				</c:when>
          			</c:choose>
          			<td>${catname}</td>
          			<td>${contents.title}</td>
          			<td>${contents.hit}</td>
          			<td>${contents.updateDate}</td>
          			<td>${contents.eventEndDate}</td>
          		</tr>
          		</c:forEach>
          		
          	</table>
			          
           </p>
           
           </div>
           
        </div>
      <!-- ***************************** [ 내용 끝 ] ****************************** -->
        
		
      </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/admin/adminfooter.jsp" %>