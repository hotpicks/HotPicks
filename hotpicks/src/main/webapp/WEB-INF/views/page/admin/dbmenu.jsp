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
var cate = -1;
var aval = -1;
$(window).scroll(function() {
	var scrollHeight = $(document).height();
	var scrollPosition = $(window).height() + $(window).scrollTop();
	if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
		if ($('#list > tbody').children('tr').length != 0) {
			if ($('#nohave').length == 0) {
				getContents(page, cate, aval);
			}
		}
	}
});

	
 

$(function(){
	var cHeight = $('.tab-content').height() + $('#page-top').height();
	var wHeight = $(document).height();
	if (cHeight < wHeight) {
		getContents(page, cate, aval);
	}
	$(document).ajaxSuccess(function(event, req) {
		cHeight = $('.tab-content').height() + $('#page-top').height();
		console.log("c " +cHeight);
		console.log("w "+ wHeight);
		if (cHeight > wHeight || $('#nohave').length != 0 ) return; 
		else { 
			getContents(page, cate, aval);
		}
	});
	/* 전체 선택 및 해제 이벤트 */
	$(".allch").click(function(){
		var checked = $(this).is(":checked");
		if(checked){
			$(".ch").attr("checked", true);
		}else{
			$(".ch").attr("checked", false);			
		}
	});
	$('#endContents').click(function() {
		$('#nohave').remove();
		$( '#list > tbody').empty();
		page = 1;
		cate = -1
		aval = 1;	
		getContents(1, cate, aval);
	});
	
	$('#notEndContents').click(function() {
		$('#nohave').remove();
		$( '#list > tbody').empty();
		page = 1;
		cate = -1
		aval = 0;
		getContents(1, cate, aval);
	});
	$('#fullContents').click(function() {
		$('#nohave').remove();
		$( '#list > tbody').empty();
		page = 1;
		cate = -1
		aval = -1;
		getContents(1, cate, aval);
	});	
	/* 컨텐츠별 */
	$('select').live('change', function() {
		$('#nohave').remove();
		$( '#list > tbody').empty();
		page = 1;
		cate = $(this).val();
		getContents(page, cate , aval);
	});
	
});

function getContents(pg , ca, av) {
	console.log("pg  : "+pg+ ", cate : "+cate+", aval : "+aval);
	var str = "";
	$.ajax({
		url : '${root}/admin/gopage',
		type : 'get',
		data : {"page" : pg,
				"cate": ca,
				"aval" : av
				},
		dataType : 'json',
		success : function(result) {
			
			if (result.length < 3) {
				if ($('#nohave').length == 0) {
					var nohave = "<div id='nohave' class='mx-auto'><p>더이상 없습니다.</p></div>";
					$('#list').after(nohave);
				}
				
			}		
			if (result.length == 0) {
				if ($('#nohave').length == 0) {
					var nohave = "<div id='nohave' class='mx-auto'><p>더이상 없습니다.</p></div>";
					$('#list').after(nohave);
				}
				
			} else{
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
			str += "          			<td>"+result[i].isEnd+"</td>";
			str += "          		</tr>";
			}
			if ($('#list > tbody').children('tr').length == 0) {
				console.log($('#list > tbody').children('tr').length);
				$('#list > tbody').html(str);
			} else {
				$('#list > tbody > tr').last().after(str);
			}
			page = page + 1 ;
		}
		}
	});
}
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper">
      
      <div class="tab-content">
      
      <!-- ***************************** [ 내용 시작 ] ****************************** -->
        <div class="tab show" style="display: block;">
          <span style="font-size:22px; line-height: 26px; font-weight: 900;">Contents DB 관리</span>
          	<div style = "float:right;">
	          	<a href="#" class="button lime btns" style="margin-right:30px; font-weight: 700;">DBUPT CATEGORY<span></span></a>
	          	<a href="#" class="button lime btns" style="margin-right:30px; font-weight: 700;">DBUPT CONTENTS<span></span></a>
          	</div>
          <div class="divider"></div>
          <div class="clear"></div>
          
          <!-- ********** 컨텐츠 현황 테이블 ********** -->
          <table>
          	<tr align="center">
          		<td>최근 갱신일자</td>
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
          	<a href="#" id="fullContents" class="button lime btns" style="margin-right:30px; font-weight: 700;">전체<span></span></a>
          	<a href="#" id="endContents" class="button lime btns" style="margin-right:30px; font-weight: 700;">만료된 컨텐츠<span></span></a>
          	<a href="#" id="notEndContents" class="button lime btns" style="margin-right:30px; font-weight: 700;">유효 컨텐츠<span></span></a>
          	<select>
          		<option value="-1">전체 컨텐츠</option>
          		<option value="1">축제</option>
          		<option value="2">공연</option>
          		<option value="3">행사</option>
          	</select>
          	<div class="clear"></div>


          <div style="float:none; overflow-y:auto">
          
          <p class="list">
          	
          	<table id="list">
          	<thead>
          		<tr align="center">
          			<td>
          				<input type="checkbox" class="allch">
          			</td>
          			<td>no</td>
          			<td>카테고리</td>
          			<td>컨텐츠명</td>
          			<td>조회수</td>
          			<td>갱신일자</td>
          			<td>컨텐츠만료날짜</td>
          			<td>유효여부</td>
          		</tr>
          		</thead>
          		<tbody>
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
          			<td>${contents.isEnd}</td>
          		</tr>
          		</c:forEach>
          		</tbody>
          	</table>
			    <c:if test="${list.size() == 0 || list.size() < 3}">
          			<div id='nohave'><p>더이상 없습니다.</p></div>
          		</c:if>
           </p>
           
           </div>
           
        </div>
      <!-- ***************************** [ 내용 끝 ] ****************************** -->
        
		
      </div>
    
    
    <div class="clear"></div>
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>