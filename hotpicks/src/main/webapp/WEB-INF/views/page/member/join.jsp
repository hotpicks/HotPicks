<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp"%>

<script>

$(function(){
	
	//가입하기 요청
	$("#joinBtn").click(function(){
		if($("#userId").val().trim().length == 0){
			alert("id를 입력해주세요.");
		} else if($("#pass").val().trim().length == 0){
			alert("비밀번호를 입력해주세요.");
		} else if($("#passck").val().trim().length == 0){
			alert("비밀번호 확인란을 입력해주세요.");
		} else if($("#name").val().trim().length == 0){
			alert("이름을 입력해주세요.");
		} else if($("#age").val().trim().length == 0){
			alert("나이를 입력해주세요.");
		} else if(idcnt != 0) {
			alert("사용할 수 없는 id입니다. 다시 확인해주세요.");
		} else if(passtypecnt != 0) {
			alert("사용할 수 없는 비밀번호입니다. 다시 확인해주세요.");
		}else if(passsamecnt != 0) {
			alert("비밀번호 확인란이 일치하지 않습니다. 다시 확인해주세요.");
		}else {
		
			$(".joinForm").attr("method", "POST").attr("action", "${root}/member/join").submit();
		
		}
	});
	
	// id 형식 - 정규 표현식
	var idcnt = 1;
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	// id 이멜 형식 & 중복확인
	$("#userId").keyup(function(){
		var id = $(this).val();
		
		if(id.trim().length == 0){			
			$("#idcheck").css('color', 'tomato');
			$("#idcheck").text('*id를 입력해주세요.');
		} else if(!emailRule.test(id)){
			idcnt = 1;
			$("#idcheck").css('color', 'gray');
			$("#idcheck").html('*아이디가 이메일 형식에 맞지 않습니다.');
		} else {
		
			$.ajax({
				type: 'GET',
				url : '${root}/member/idcheck',
				dataType : 'json',
				data : {'checkid' : id},
				success : function(data){
					idcnt = parseInt(data.idcount);

					if(idcnt == 0){
						$("#idcheck").css('color', 'steelblue');
						$("#idcheck").html('<strong>*' + id + '</strong>는 사용가능합니다.');
					} else {
						$("#idcheck").css('color', 'tomato');
						$("#idcheck").html('<strong>*' + id + '</string>는 이미 사용 중인 id입니다.');
					}
				}
			});
		}
		
	});
	
	
	// password 형식 - 정규표현식
	// 숫자, 특수문자, 영문자 포함한 8~15자리 이내의 비밀번호만 허용
	var passtypecnt = 1;
	var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,14}$/;
	
	// password 형식 체크
	$("#pass").keyup(function(){
		var pass = $(this).val();
		
		if(pass.trim().length == 0){			
			$("#passtypecheck").css('color', 'tomato');
			$("#passtypecheck").text('*비밀번호를 입력해주세요.');
		} else if(!passwordRule.test(pass)){
			passtypecnt = 1;
			$("#passtypecheck").css('color', 'tomato');
			$("#passtypecheck").html('*비밀번호는 특수문자+영문+숫자를 포함한 8~15자리입니다.');
		} else{
			passtypecnt = 0;
			$("#passtypecheck").css('color', 'steelblue');
			$("#passtypecheck").html('*사용 가능한 비밀번호 입니다.');
		}
	});
	
	var passsamecnt = 1;
	
	// password확인 일치 여부
	$("#passck").keyup(function(){
		var pass = $("#pass").val();
		var passck = $(this).val();
		
		if(pass.trim().length == 0){			
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*비밀번호를 입력해주세요.');
		}else if(pass != passck){
			passsamecnt = 1;
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
		} else {
			passsamecnt = 0;
			$("#passsamecheck").css('color', 'steelblue');
			$("#passsamecheck").html('*비밀번호가 일치합니다.');			
		}
	});
	
	// TODO 프로필 사진값 적용
	
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

 <div align="center" class="title">회원가입</div>

 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3>Hot Picks에 오신 것을 환영합니다.&nbsp;<font color="#ff99bb"><i class="fas fa-smile-wink"></i></font></h3>
      <p>관심있는 공연/전시, 행사에 대한 정보를 제공받고 Picker가 되어 My Picks를 관리하고 공유하세요!</p>
      <br/><br/>
      <!-- Begin Form -->
        <div id="contact-form"> 
          
          <!--begin:notice message block-->
          <div id="note"></div>
          <!--begin:notice message block-->
          
          <form class="joinForm" id="ajax-contact-form">
            <div class="labels">
              
              <p>
                <label for="profile" style="margin-top:80px;">프로필 사진</label>
                <br />
                <!-- ******** profile ******** -->
                <div class="user">
                 <!-- ***************** 프로필 사진 **************** -->
              	<img alt="사용자프로필사진" src="${root}/resources/style/images/user.png" height="150px" width="150px"/>
              	<input type="hidden" name="profile" value="프로필사진확인용값"/>
              </div>
              </p>
              <p>
              	<a id="profileBtn" class="button red btns" style="margin-left:410px; font-weight: 700;">사진 설정<span></span></a>
              </p>
              <br><br>
              <p>
                <label for="userId" class="labels"">Email ID</label>
                <br />
                <!-- ******** userId ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="text" name="userId" id="userId" value="" placeholder="example@gmail.com" />
              <!-- ******* id 중복 확인 메세지 ******* -->
              <div style="margin-bottom:15px; color:tomato;" id="idcheck">*id를 입력해주세요.</div>
              </p>
              <p>
                <label for="pass">비밀번호</label>
                <br />
                <!-- ******** pass ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="pass" id="pass" value="" placeholder="특수문자+영문+숫자를 포함한 8~15자리"/>
              <!-- ******* 비밀번호 정규표현식 확인 메세지 ******* -->
                <div style="margin-bottom:15px; color:tomato;" id="passtypecheck">*비밀번호를 입력해주세요.</div>
              </p>
              <p>
                <label for="passck">비밀번호 확인</label>
                <br />
                <!-- ******** passck ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="passck" id="passck" value="" placeholder="비밀번호를 다시 입력해주세요."/>
              <!-- ******* 비밀번호 일치 여부 확인 메세지 ******* -->
                <div style="margin-bottom:15px;" id="passsamecheck">&nbsp;</div>
              </p>
              <p>
                <label for="name">이름</label>
                <br />
                <!-- ******** name ******** -->
                <input class="required inpt" type="text" name="name" id="name" value="" placeholder="이름을 입력해주세요."/>
              </p>
              <p>
                <label for="age">나이</label>
                <br />
                <!-- ******** age ******** -->
                <input class="required inpt" type="text" name="age" id="age" value="" placeholder="나이를 입력해주세요."/>
              </p>
              <p>
                <label>성별</label>
                <br />
                <!-- ******** gender ******** -->
                	여성<input type="radio" name="gender" value="여" checked>
					남성<input type="radio" name="gender" value="남">	
              </p>
             
	        <div class="divider"></div>
	        <div class="clear"></div>
            <label id="load" style="display:none"></label>
            
            <div class="align-center">
            	<a id="cancleBtn" class="button red btns" style="margin-right:100px; font-weight: 700;">취  소<span></span></a>
            	<a id="joinBtn" class="button red btns" style="font-weight: 700;">가  입<span></span></a>
            </div>
          </form>
        </div>
        <!-- End Form -->
 
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