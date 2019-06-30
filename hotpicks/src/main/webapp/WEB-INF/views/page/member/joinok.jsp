<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>

<script>

$(function(){
	
	// 가입한 계정으로 로그인 된 상태로, index로 이동
	$("#okBtn").click(function(){
		document.location.href("${root}/index.jsp");
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

 <div align="center" class="title">회원가입 완료</div>

 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3><font color="#f16e77">${userInfo.name}</font>님 환영합니다! &nbsp;<font color="#ff99bb"><i class="fas fa-handshake"></i></font></h3>
      <p>지금부터 Hot Picks를 자유롭게 이용할 수 있습니다.</p>
      <br>
      <div style="background-color: lightgray; padding:10px; margin:0 auto; width:300px;">
      	<h4>가입 정보</h4>
 	  	<p>id : ${userInfo.userId}</p>
      	<p>성명 : ${userInfo.name}</p>
      	<p>지역 : ${sidoName} / ${sigunguName}</p>
      </div>
      
      <div style="padding:10px; margin:30px auto; width:300px;">
          <a id="okBtn" class="button red btns" style="margin-left:100px; font-weight: 700;">확 인<span></span></a>
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