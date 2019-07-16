<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script type="text/javascript">
$(function() {
	setSigungu();
	var sdCode;
	var sggCode;
	var catId;
	var cPage;
	var isScroll = true;

	/* var didScroll; 
	var lastScrollTop = 0; 
	var delta = lastScrollTop+500;
	var navbarHeight = $('header').outerHeight();
	 
	$(window).scroll(function(event){ 
		didScroll = true; 
	}); 
	setInterval(function() { 
		if (didScroll) { 
			hasScrolled(); 
			didScroll = false; } }, 250); 
	function hasScrolled() { var st = $(this).scrollTop(); 
	// Make sure they scroll more than delta 
	if(Math.abs(lastScrollTop - st) <= delta) return; 
	// If they scrolled down and are past the navbar, add class .nav-up. 
	// This is necessary so you never see what is "behind" the navbar. 
	if (st > lastScrollTop){ 
	// Scroll Down 
		console.log("st : "+ st);
		console.log("lastScrollTop : "+ lastScrollTop);
		console.log("delta : "+ delta);
		cPage = parseInt($("#cPage").val()) + 1;
		console.log(cPage);
		
		checkIsScroll(sdCode, sggCode, catId, cPage);
		
	} else { 
		// Scroll Up 
		if(st + $(window).height() < $(document).height()) {
			} 
		} 
		lastScrollTop = st; 
	} 
	 */
 $(this).scroll(function(){
		if(isScroll){
		var maxHeight = $(this).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
			
			if((maxHeight - currentScroll) / maxHeight === 0){
				
				setTimeout(() => {
					cPage = parseInt($("#cPage").val()) + 1;
					console.log(cPage);
					
					checkIsScroll(sdCode, sggCode, catId, cPage);
				}, 250);
			}
		}
		});
	
	
	
	 $("#sido").change(function(){
		 setSigungu();
		//selectcontents
			sdCode = $('#sido').val();
			sggCode = $('#sigungu').val();
			catId = $("#curruntcat").attr("value");
			//console.log(catId + '/' + sdCode + '/' + sggCode);
			reSelectcontentsList(sdCode, sggCode, catId, 1);
		});
	 
	 $("#sigungu").change(function(){
		//selectcontents
			sdCode = $('#sido').val();
			sggCode = $('#sigungu').val();
			catId = $("#curruntcat").attr("value");
			//console.log(catId + '/' + sdCode + '/' + sggCode);
			reSelectcontentsList(sdCode, sggCode, catId, 1); 
	 });
	 
			
	 var tArr = $(".catsearch");
	 $(tArr).click(function(){
		$('#sido').val("0").attr("selected", true);
		$('#sigungu').html('<option value="0">전체지역</option>');
		//selectcontents
		sdCode = $('#sido').val();
		sggCode = $('#sigungu').val();
		$("#curruntcat").attr("value", $(this).attr("data-catid"));
		catId = $("#curruntcat").attr("value");
		//console.log(catId + '/' + sdCode + '/' + sggCode);
		reSelectcontentsList(sdCode, sggCode, catId, 1);
	 });
	 

 	
});

function checkIsScroll(sdCode, sggCode, catId, cPage){
	isScroll = false;
	reSelectcontentsList(sdCode, sggCode, catId, cPage);
	setTimeout(function(){isScroll = true},500);
}


function setSigungu(){
	var sdCode = $('#sido').val();
	$.ajax({
		url: '${root}/contents/changesgg',
		type: 'GET',
		dataType: 'json',
		data: {"sdCode" : sdCode},
		success: function(result){
			//console.log(result);
			var sigunguStr = "";
			var sigunguJson = result.sigunguJson;
			var len = sigunguJson.length;
			for(var i = 0 ; i < len ; i++){
			sigunguStr += '<option value="'+ sigunguJson[i].sggCode +'">'+sigunguJson[i].sggName +'</option>';
			}
			$('#sigungu').html(sigunguStr);
			
		}
	}); 	
}

//call contents to using a type
function reSelectcontentsList(sdCode, sggCode, catId, cPage){
 	$.ajax({
		url: '${root}/contents/contentsbylocation',
		type: 'GET',
		dataType: 'json',
		data: {"sdCode" : sdCode, "sggCode" : sggCode , "catId" : catId, "cPage" : cPage},
		success: function(result){
			var contentsStr = "";
			var contents = result;
			var len = contents.length;
			
			
			
			var index = $('.one-fourth').length;
			var d;
			if(index%4 == 0){
				d = 0;
			}else{
				d = index%4;
				//var lastCnt = $('.last').length;
				//$('.last').index(lastCnt).removeClass('last');
			}
		
			if(len == 0){
				contentsStr += '<div align="center"><p style="text-align:center;">검색 결과가 없습니다.</p></div>';
			}else{
			for(var i = 0 ; i<len ;i++){				

				if((i+1+d)%4 == 0 || i == len-1){

					contentsStr += '<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId='+contents[i].contentsId+'">';
				}else{
					contentsStr += '<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId='+contents[i].contentsId+'">';
				}
					contentsStr += '<img src=' + (contents[i].image2 == 'noImage_list.png' ? 
							'/hotpicks/resources/style/images/noImage_list.png' : contents[i].image2)+' width="200" alt=""/>';
					contentsStr += '<h4>' + contents[i].title + '</h4>';
					contentsStr += '        <p>조회수 : ' + contents[i].hit + ' 리뷰 수 : </p>';
					contentsStr += '</a></div>';
				}
			}
			if( cPage == 1){
				contentsStr += '<input type="hidden" id="cPage" value="' + cPage + '">';
					$("#about").html(contentsStr); 
			}else{
				$("#cPage").attr("value",cPage+1);
				
					$("#about").append(contentsStr); 
			}
			
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	    

	}); 
 	
 	//소현 : detail page로 넘어가기
 	/* $(".viewdetailbtn").click(function() {
 		 <a href="${root }/${board.control }/list?bcode=${board.bcode}&pg=1&key=&word=">
         ${board.bname}
      </a>
 	}); */

 
	 
}
</script>

<c:if test="${rContents != null}">
<div style="clear:both;">
 <!-- Begin Wrapper -->
 <div id="wrapper" style="margin-bottom: 20px;"> 
    <!-- Begin Intro -->
    <div class="intro">
      <h1>이런 곳은 어떠세요?<br>요즘 뜨고있는 <a style="color: red;">HOT</a>한 <a style="color: steelblue;">#${rContents.rTag }</a></h1>
    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="Rabout">
<c:forEach var="list" items="${rContents.rContentsList}" varStatus="status">
<c:choose>
		<c:when test="${status.last == true || status.count % 4 == 0}">
	    	<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:when>
	    <c:otherwise>
			<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:otherwise>
</c:choose>
		
		<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
        <h4>${list.title}</h4>
        <p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt}</p>
        </a>
      </div>
      
</c:forEach>
    </div>
   </div>  
 <!-- End About --> 
 </div>
</c:if>




  <div id="wrapper" style="margin-bottom: 20px;">
   
    <!-- Begin Intro -->
    <div class="intro" align="center">
      <h1 >
      	<label class="catsearch" data-catid="0" style="color: purple;font-style: bold;">전체</label> |
      	<label class="catsearch" data-catid="1" style="color: purple;">축제</label> |
      	<label class="catsearch" data-catid="2" style="color: purple;">공연</label> |
      	<label class="catsearch" data-catid="3" style="color: purple;">행사</label>
      	<input id="curruntcat" type="hidden" value="">
      </h1>
      
     	<select id="sido">
			 <c:forEach var="sido" items="${sidoList}">
     			<option value="${sido.sdCode}">${sido.sdName}</option>
   			</c:forEach> 
     	</select>
     	
     	<select id="sigungu">
     	<%-- <c:forEach var="sigungu" items="${sigunguList}">
     			<option value="${sigungu.sggCode}">${sigungu.sggName}</option>
     			
		</c:forEach> --%>
     	</select>
	</div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
    <input type="hidden" id="cPage" value="1">
 <c:forEach var="list" items="${contentsList}" varStatus="status">
<c:choose>
		<c:when test="${status.last == true || status.count % 4 == 0}">
	    	<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:when>
	    <c:otherwise>
			<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:otherwise>
</c:choose>
		
		<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
        <h4>${list.title}</h4>
        <p>조회수 : ${list.hit} 리뷰 수 : ${list.rvCnt}</p>
        </a>
      </div>
      
</c:forEach>
    </div> 
    <!-- End About --> 
    
