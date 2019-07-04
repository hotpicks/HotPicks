<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>

<script>
$(function(){
	
	// 가입 페이지 이동 요청
	$("#joinBtn").click(function(){
		
		$(this).attr("href", "${root}/member/join");
	
	});
	
	// 로그인 요청
	$("#loginBtn").click(function(){
		
		if($("#userId").val().trim().length == 0){
			alert("id를 입력해주세요.");
		} else if($("#pass").val().trim().length == 0){
			alert("비밀번호를 입력해주세요.");
		} else {
		
			$(".loginForm").attr("method", "POST").attr("action", "${root}/member/login").submit();
		}
	});
	
	
});
</script>

<!-- 카카오톡 로그인 API -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<style>
.title{
font-weight: 900;
font-size: 40px;
padding-bottom: 50px;
}

#wrapper {
    line-height: 20px;
}

/* form 라벨 */
label{
margin-left:150px;
}


/* 버튼 */
.btns {
width: 200px;
}

/* 자식 요소를 가운데 정렬 */
.align-center {
text-align: center;
width: 235px;
height: auto;
}

</style>

 <div align="center" class="title">로그인</div>
 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3>Hot Picks 계정으로 로그인하세요.&nbsp;<font color="#ff99bb"><i class="fas fa-key"></i></font></h3>
      <p>Hot Picks 계정이 없으시다면, 카카오톡 계정 로그인도 가능합니다.</p>
      <br/><br/>
      <!-- Begin Form -->
        <div id="contact-form"> 
          
          <!--begin:notice message block-->
          <div id="note"></div>
          <!--begin:notice message block-->
          
          <form class="loginForm" id="ajax-contact-form">
            <div class="labels">
              <p>
                <label for="userId" class="labels"">Email ID</label>
                <br />
                <!-- ******** userId ******** -->
                <input class="required inpt" type="text" name="userId" id="userId" value="" 
                		style="margin-bottom: 0px; height:30px;"/>
                		
<c:if test="${loginfail != null}">
                <!-- ******* 로그인 실패 메세지 ******* -->
              <p style="margin-bottom:15px;"><font color="red" style="font-style: italic;">*id 또는 비밀번호가 일치하지 않습니다.</font></p>
</c:if>
              </p>
              <p>
                <label for="event">비밀번호</label>
                <br />
                <!-- ******** pass ******** -->
                <input class="required inpt" type="password" name="pass" id="pass" value="" 
                		style="margin-top: 20px; height:30px;"/>
              </p>
            </div>
            
	        <div class="divider"></div>
	        <div class="clear"></div>
            <label id="load" style="display:none"></label>
            
            <div class="align-center">
                        	
            	<!-- *************************** 카카오톡 로그인 버튼 *************************** -->
            	<a id="kakao-login-btn"></a>
				<input type="button" value="로그아웃" onclick="ktout()"/>
				<script type='text/javascript'>
					var token;
				    // 사용할 앱의 JavaScript 키를 설정해 주세요.
				    Kakao.init('9735071d5888d9bfbab24b41f01958c2');
				    // 카카오 로그인 버튼을 생성합니다.
				    Kakao.Auth.createLoginButton({
				      container: '#kakao-login-btn',
				      
				      // 1 로그인 성공
				      success: function(authObj) {
				    	  
				          //token = JSON.stringify(authObj.access_token);
				    	  
				    	  // 1-1. 사용자 정보 요청 api 호출
				    	  Kakao.API.request({
				    		 url : '/v2/user/me',
				    		 success: function(res){
				    			 alert("정보 요청 성공")
				    			 console.log(res);
				    			 
				    			 var userId = res.id;
				    			 var userNickName = res.properties.nickname;
				    			 
				    			 var userEmail = "";
				    			 var profile_image = "";
				    			 var age = "";
				    			 var gender = "";
				    			 
				    			 // 값 존재 여부
				    			 var has_age_range = res.kakao_account.has_age_range;
				    			 var has_email = res.kakao_account.has_email;
				    			 var has_gender = res.kakao_account.has_gender;
				    			 
				    			 if(has_email){
				    				 userEmail = res.kakao_account.email;
				    			 }
				    			 if(has_age_range){
				    				 age = res.kakao_account.age_range;
				    				 var idx = age.lastIndexOf("~");
				    				 age = age.substring(0, idx);
				    			 }
				    			 if(has_gender){
				    				 gender = (res.kakao_account.gender == "female") ? "여" : "남";
				    			 }
				    			 if(profile_image != null){
				    				 profile_image = res.properties.profile_image;
				    			 }else{
				    				 profile_image = "user.png";
				    			 }
				    			 
				    			 console.log("아이디 : " + userId);
				    			 console.log("이름 : " + userNickName);
				    			 console.log("이메일 : " + userEmail);
				    			 console.log("연령 : " + age);
				    			 console.log("성별 : " + gender);
				    			 console.log("프로필 사진 : " + profile_image);
				    		 },
				    		 fail : function(error){
				    			 alert(JSON.stringify(error));
				    		 }
				    	  });
								        
				      },
				      // 2 로그인 실패
				      fail: function(err) {
				         alert("로그인 실패\n" + JSON.stringify(err));
				      }
				    });
				    
				    // 로그아웃
				    function ktout(){
				    	Kakao.Auth.logout(function(){
				    		setTimeout(function(){location.href="${root}/index.jsp"}, 1000);
				    	});
				    }
				    
			
				</script>
				
            	<!-- *************************** 카카오톡 로그인 버튼 *************************** -->
				
            	<a id="loginBtn" class="button red btns" style="font-weight: 700;">로그인<span></span></a>
            	<br><br><br>
            	<span>아직 계정이 없다면, <strong>회원가입</strong> 하세요.</span>
            	<a id="joinBtn" class="button light-teal btns" style="margin-bottom:20px; font-weight: 700;">회원가입<span></span></a>
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