<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>

<script>

$(function(){
	
	// 회원가입 화면 이동 요청
	$("#okBtn").click(function(){
		
		$(this).attr("href", "${root}/member/join");
		
	});
	
});

</script>

<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<style>
.title{
font-weight: 900;
font-size: 40px;
padding-bottom: 50px;
}

#wrapper {
    line-height: 40px;
}

/* form 라벨 */
label{
margin-left:130px;
}


/* 버튼 */
.btns {
width: 75px;
}

/* 자식 요소를 가운데 정렬 */
.align-center {
text-align: center;
width: 300px;
height: auto;
margin-top: 50px;
}

/* 지역 선택 */
select {
width: 180px;
height: 30px;
}

</style>

 <div align="center" class="title">회원가입 실패</div>

 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3>회원가입에 실패하였습니다. &nbsp;<font color="#ff99bb"><i class="fas fa-exclamation-triangle"></i></font></h3>
      <p>서버 문제로 회원가입이 완료되지 않았습니다. 다시 시도해주세요.</p>
      <br>
      
      <div style="padding:10px; margin:30px auto; width:300px;">
          <a id="okBtn" class="button red btns" style="margin-left:100px; font-weight: 700;">회원가입<span></span></a>
 	  </div>
 
      <div class="contact-right">  
        <div class="clear"></div>
        <br />
      </div>
      <div class="clear"></div>
    </div>
    <!-- End Content --> 
    
  </div>
  <!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>