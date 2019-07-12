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
	
	 $("#sido").change(function(){
		 setSigungu();
		//selectcontents
			sdCode = $('#sido').val();
			sggCode = $('#sigungu').val();
			catId = $("#curruntcat").attr("value");
			//console.log(catId + '/' + sdCode + '/' + sggCode);
			reSelectcontentsList(sdCode, sggCode, catId);
		});
	 
	 $("#sigungu").change(function(){
		//selectcontents
			sdCode = $('#sido').val();
			sggCode = $('#sigungu').val();
			catId = $("#curruntcat").attr("value");
			//console.log(catId + '/' + sdCode + '/' + sggCode);
			reSelectcontentsList(sdCode, sggCode, catId); 
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
		reSelectcontentsList(sdCode, sggCode, catId);
	 });
	 

 	
});

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
function reSelectcontentsList(sdCode, sggCode, catId){
 	$.ajax({
		url: '${root}/contents/contentsbylocation',
		type: 'GET',
		dataType: 'json',
		data: {"sdCode" : sdCode, "sggCode" : sggCode , "catId" : catId},
		success: function(result){
			var contentsStr = "";
			var contents = result;
			var len = contents.length;
			//console.log(contents);
			if(len == 0){
				contentsStr += '<div align="center"><p style="text-align:center;">검색 결과가 없습니다.</p></div>'
			}else{
			for(var i = 0 ; i<len ;i++){
				
				if((i+1)%4 == 0 || len-1 == 1){
					contentsStr += '<div class="one-fourth last"> <a href="${root}/contents/viewdetail?contentsId='+contents[i].contentsId+'">';
				}else{
					contentsStr += '<div class="one-fourth"> <a href="${root}/contents/viewdetail?contentsId='+contents[i].contentsId+'">';
				}
					contentsStr += '<img src=' + (contents[i].image1 == '-1' ? (contents[i].image2 == '-1' ? 
							'noImage_list.png' : contents[i].image2) : contents[i].image1 ) +' width="200" alt=""/>';
					contentsStr += '<h4>' + contents[i].title + '</h4>';
					contentsStr += '        <p>조회수 : ' + contents[i].hit + ' 리뷰 수 : </p>';
					contentsStr += '</a></div>';
				}
			}
					$("#about").html(contentsStr); 
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


 <%--   <!-- Begin Wrapper -->
 <div id="wrapper" style="margin-bottom: 20px;"> 
    <!-- Begin Intro -->
    <div class="intro">
      <h1>이런 곳은 어떠세요?<br><a style="color: red;">#서울</a>의 HOT한<a style="color: steelblue;">#공연</a></h1>
    </div>
    <!-- End Intro --> 
    
    <!-- favorite -->
    <div id="about">
<c:forEach var="list" items="${json}" varStatus="status"  end="3">
<c:choose>
	<c:when test="${ status.count%4 != 0 || status.last != false}">
	<div class="one-fourth"> 
	<a href="${root}/page/contents/sohyun_contentdetail.jsp">
	<img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" />
	</a>
        <h4>${list.title}</h4>
        <p>${list.title}</p>
      </div>
    </c:when>
    <c:otherwise>
      <div class="one-fourth last"> 
      <a href="${root}/page/contents/sohyun_contentdetail.jsp">
      <img src="${list.firstimage1 != 'x' ? list.firstimage1 : (list.firstimage2 != 'x' ? list.firstimage2 : '') }" width="200" alt="" />
      </a>
        <h4>${list.title}</h4>
 		 <p>${list.title}</p>
      </div>
    </c:otherwise>
</c:choose>
</c:forEach>
    </div>
 <!-- End About --> 

   </div>  --%>

	


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
 <c:forEach var="list" items="${contentsList}" varStatus="status" end="13">
<c:choose>
		<c:when test="${status.last == true || status.count % 4 == 0}">
	    	<div class="one-fourth last" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:when>
	    <c:otherwise>
			<div class="one-fourth" style="height: 300px;"> <a href="${root}/contents/viewdetail?contentsId=${list.contentsId}">
	    </c:otherwise>
</c:choose>
		
		<img class="viewdetailbtn" src="${(list.image2 == 'noImage_list.png' ? '/hotpicks/resources/style/images/noImage_list.png' : list.image2)}" width="200" alt="" />
		<%-- <img class="viewdetailbtn" src="${list.image1 != '-1' ? list.image1 : (list.image2 != '-1' ? list.image2 : '') }" width="200" alt="" /> --%>
        <h4>${list.title}</h4>
        <p>조회수 : ${list.hit} 리뷰 수 : </p>
        </a>
      </div>
      
</c:forEach>
    </div> 
    <!-- End About --> 
    
