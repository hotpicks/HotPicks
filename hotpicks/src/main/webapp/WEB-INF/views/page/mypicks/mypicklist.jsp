<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/page/template/header.jsp"%>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
#about .one-fourth img {
	-moz-box-shadow: 0px 1px 2px #656565;
	-webkit-box-shadow: 0px 1px 2px #656565;
	box-shadow: 0px 1px 2px #656565;
	display: block;
	margin-bottom: 10px;
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
				if(a == 1){
					$(".c1").attr("checked","checked:checked");
				}else{
					$(".c2").attr("checked","checked:checked");
				}
				loading(a);
			});

			
			// 삭제 버튼 클릭 이벤트
			   $("#delete").live("click",function(){
			      var checkedMember = $("input[name=check]:checked");
			      var tdArr = new Array();
			      var tr =checkedMember.parent().parent().parent();
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
			      var tr =checkedMember.parent().parent().parent();
 			      var wanna = tr.children().eq(4).attr("value");
			      for(var i = 0; i < tr.length; i++){
					tdArr.push(tr.eq(i).children().eq(3).attr("value"));
			      } 
			     	
			      // ajax로 array배열을 넘기기 위한 세팅
			      jQuery.ajaxSettings.traditional = true;
			      $.ajax({
			  		type : 'get',
			  		url : '${root}/mypicklist/modify',
			  		data : { "contentsId" : tdArr,
			  				"wanna" : wanna
					  		},
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
			if(a == 0){
				$(".c2").attr("checked","checked:checked");
			}
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
<style>
input[type=checkbox] {
	display: inline-block;
	width: 35px;
	height: 35px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
input[type=radio] {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
 #test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            margin-right:-4px;
        }
        #test_btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            margin-left:-3px;
            
        }
        #btn_group button{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            width:55px;
        }
        #btn_group button:hover{
            color:white;
            background-color: skyblue;
        }

</style>
<div id="wrapper"> 
<div class="content">
<div>
	<div align="center" style="margin-bottom: 20px;">
		<div
			style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
			<!-- <a>전체 |</a> <a>공연 |</a> <a>전시 |</a> <a>행사</a> -->
		</div>
		<div style="margin-bottom: 10px; font-size: 15px; " id="btn_group">
			<div style="float: right; margin-top:20px;">
			<label><input type="radio" value="가고싶은곳" name="wanna" checked="checked" disabled="disabled" class="c1" data-w="0">가고싶은곳</label>
			<label><input type="radio" value="다녀온곳" name="wanna" class="c2 " data-w="1" disabled="disabled">다녀온곳</label>
				<button class= "save" name="save" id="#test_btn1">저장</button>
				<button id= "delete" name="delete" id="#test_btn2">삭제</button>
			</div>
			<div style="float: right; margin-right: 30px;">
				<a href="${root}/mypicklist/enter"><i class="fas fa-list" style="font-size: 4em;"></i></a>
				<img src="${root}/resources/style/images/blank.png">
				<a href="${root}/mypickmap/mvmypickmap"><i class="fas fa-map-marked-alt" style="font-size: 4em;"></i></a>
				<img src="${root}/resources/style/images/blank.png">
				<a href="${root}/mypicklist/cal"><i class="fas fa-calendar-alt" style="font-size: 4em;"></i></a>
			</div>
		
			<div style="float: left; margin-top:20px;">
				<a href="#none" class="went btn blue" data-a="0" >가고싶은 곳</a><img src="${root}/resources/style/images/blank.png"> 
				<a href="#none" class="went btn red" data-a="1">다녀온 곳</a>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>

    <div id="about" style="height: 850px;">
   
    </div>
     </div>
     
     </div>
     </div>







<%@ include file="/WEB-INF/views/page/template/footer.jsp"%>