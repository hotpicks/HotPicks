<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/page/template/header.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
#about .one-fourth img {
	-moz-box-shadow: 0px 1px 2px #656565;
	-webkit-box-shadow: 0px 1px 2px #656565;
	box-shadow: 0px 1px 2px #656565;
	display: block;
	margin-bottom: 20px;
	height: 160px;
	width: 100%;
}

</style>
<script>
$(function(){

			loading("0");
	
			
			/* 가보고싶은곳, 다녀온곳클릭*/
			$(".went").click(function(){
				var a = $(this).attr("data-a");
				loading(a);
			});

			
			// 삭제 버튼 클릭 이벤트
			   $(".delete").live("click",function(){
			      var checkedMember = $("input[name=check]:checked");
			      var tdArr = new Array();
			      var tr =checkedMember.parent().parent();
			      for(var i = 0; i < tr.length; i++){
						tdArr.push(tr.eq(i).children().eq(3).attr("value"));
			         }
			      
			      // ajax로 array배열을 넘기기 위한 세팅
			      jQuery.ajaxSettings.traditional = true;
			      	      
			      $.ajax({
			  		type : 'get',
			  		url : '${root}/mypicklist/delete',
			  		data : { 
			  				'contentsId' : tdArr
			  				} ,
			  		success : function(result){
			  			location.reload();
			  		}
			  	});
			      
			});
			
			// 저장 버튼 클릭 이벤트
			   $(".save").live("click",function(){
			      var checkedMember = $("input[name=check]:checked");
			      var tdArr = new Array();
			      var tr =checkedMember.parent().parent();
			      for(var i = 0; i < tr.length; i++){
						tdArr.push(tr.eq(i).children().eq(4).attr("value"));
						console.log(tdArr.push(tr.eq(i).children().eq(4).attr("value").text()));
			         }
			      
			      // ajax로 array배열을 넘기기 위한 세팅
			      jQuery.ajaxSettings.traditional = true;
			      	      
			      $.ajax({
			  		type : 'get',
			  		url : '${root}/mypicklist/modify',
			  		data : { 
			  				'wanna' : tdArr
			  				} ,
			  		success : function(result){
			  			location.reload();
			  		}
			  	});
			      
			});
});
	
function loading(a){
	$.ajax({
		url : "${root}/mypicklist/list/"+a,
		type : "get",
		success :function(result){
			console.log("넘어옴");
			$("#about").html(result);
			return;
			}
	});
	
}


	
</script>


<%-- <c:set var="title" value="${parameter.title}" />
<c:set var="info" value="${parameter.infoName}" />
<c:set var="image" value="${parameter.image1}" />
<c:set var="seq" value="${parameter.pg}" />
<c:set var="catid" value="${parameter.catId}" /> --%>
<div id="wrapper"> 
<div class="content">
<div>
	<div align="center" style="margin-bottom: 20px;">
		<div
			style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
			<a>전체 |</a> <a>공연 |</a> <a>전시 |</a> <a>행사</a>
		</div>
		<div style="margin-bottom: 20px;">
			<a href="${root}/mypicklist/list"><img src="${root}/resources/style/images/listpicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/mypickmap/mvmypickmap"><img src="${root}/resources/style/images/mappicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/mypicklist/cal"><img src="${root}/resources/style/images/calendarpicks.png"></a>
		</div>
		
		<div style="margin-bottom: 10px; font-size: 15px;">
			<div style="float: right;">
			<input type="radio" value="가고싶은곳" name="wanna" checked="checked" data-w="0">가고싶은곳
			<input type="radio" value="다녀온곳" name="wanna" data-w="1">다녀온곳
				<button class= "save" name="save">저장</button>
				<button class= "delete" name="delete">삭제</button>
			</div>
			<div style="float: left;">
				<a href="#none" class="went" data-a="0">가고싶은 곳</a><img src="${root}/resources/style/images/blank.png"> 
				<a href="#none" class="went" data-a="1">다녀온 곳</a>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>

    <div id="about">
   
     
    </div>
     </div>
     
     </div>
     </div>







<%@ include file="/WEB-INF/views/page/template/footer.jsp"%>