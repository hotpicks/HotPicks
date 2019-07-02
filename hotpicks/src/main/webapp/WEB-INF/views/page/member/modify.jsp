<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>
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

<script>
$(function(){
	
	// input type = file 의 파일값 읽어서, 프로필 사진 이미지 부분에 적용 (미리보기)
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
				$("#profileImg").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//파일 변경 이벤트 (프로필 사진 썸네일 미리보기)
	$("#profileBtn").change(function(){
		readURL(this);
	});
	
	var curpassright = 1;
	// 현재 비번 일치 여부 체크
	$("#pass").keyup(function(){
		var curpass = $(this).attr("data-pass");
		var inputpass = $(this).val();
		if(curpass != inputpass) {
			curpassright = 1;
			$("#passrightcheck").css('color', 'tomato');
			$("#passrightcheck").text('*비밀번호가 일치하지 않습니다.');
		}else {			
			curpassright = 0;
			$("#passrightcheck").css('color', 'steelblue');
			$("#passrightcheck").text('*비밀번호가 일치합니다.');
		}
	});
	
	// 새 비번 적합 여부 체크
	// password 형식 - 정규표현식
	// 숫자, 특수문자, 영문자 포함한 8~15자리 이내의 비밀번호만 허용
	var passtypecnt = 1;
	var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,14}$/;
	
	// 새 비번 형식 체크
	$("#newpass").keyup(function(){
		var newpass = $(this).val();
		
		if(newpass.trim().length == 0){			
			$("#passtypecheck").css('color', 'gray');
			$("#passtypecheck").text('*비밀번호 변경을 원할 경우, 입력해주세요.');
		} else if(!passwordRule.test(newpass)){
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
	var istherenewpass = 0;
	
	// 새 비번 확인 일치 여부
	$("#newpassck").keyup(function(){
		var newpass = $("#newpass").val();
		var passck = $(this).val();
		
		if(newpass.trim().length == 0){		
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*새 비밀번호를 입력해주세요.');
		}else if(newpass != passck){
			passsamecnt = 1;
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
		} else {
			passsamecnt = 0;
			istherenewpass = 1;
			$("#passsamecheck").css('color', 'steelblue');
			$("#passsamecheck").html('*비밀번호가 일치합니다.');			
		}
	});
	
		
	// 수정 요청
	$("#modifyBtn").click(function(){
		if($("#pass").val().trim().length == 0){
			alert("현재 비밀번호를 입력해주세요.");
		} else if(curpassright != 0){
			alert("현재 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		} else if($("#age").val().trim().length == 0){
			alert("나이를 입력해주세요.");
		} else if(passtypecnt != 0 && istherenewpass != 0) {
			alert("사용할 수 없는 새 비밀번호입니다. 다시 확인해주세요.");
		}else if(passsamecnt != 0 && istherenewpass != 0) {
			alert("새 비밀번호 확인란이 일치하지 않습니다. 다시 확인해주세요.");
		}else {
		
			$(".modifyForm").attr("action", "${root}/member/modify").submit();
		}
	});
	
	// 탈퇴 요청
	$("#exitBtn").click(function(){
		var userInput = prompt('탈퇴를 위해 현재 비밀번호를 입력해주세요.');
		var pass = $(this).attr("data-pass");
		if(userInput != pass){
			alert("비밀번호가 일치하지 않습니다.");
		} else{
			var result = confirm('정말 탈퇴하시겠습니까?');
			
			if(result){
				alert("탈퇴가 완료되었습니다.");		
				$(this).attr("href", "${root}/member/exit");
			}
		}
		
		
	});
	
});

</script>

 <div align="center" class="title">내 정보 수정</div>

 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3>회원님의 정보를 수정하세요.&nbsp;<font color="#ff99bb"><i class="fas fa-user-edit"></i></font></h3>
      <p><font color="gray">*수정 시, <strong>현재 비밀번호</strong>를 반드시 입력해주세요.</font></p>
      <br/><br/>
      <!-- Begin Form -->
        <div id="contact-form"> 
          
          <!--begin:notice message block-->
          <div id="note"></div>
          <!--begin:notice message block-->
          
          <form class="modifyForm" id="ajax-contact-form" method="POST"
             enctype="multipart/form-data">
            <div class="labels">
            
            <p>
                <label for="profile" style="margin-top:80px;">프로필 사진</label>
                <br />
                <!-- ******** profile ******** -->
                <div class="user">
                 <!-- ***************** 프로필 사진 **************** -->
              	<img id="profileImg" alt="사용자프로필사진" src="${root}/upload/member/${userInfo.profile}" height="150px" width="150px"/>
              	<input type="file" id="profileBtn" name="profile_file" style="width:200px; background-color: white"/>
              	</div>
              </p>
              <br><br>
            
              <p>
                <label for="userId" class="labels"">Email ID</label>
                <br />
                <!-- ******** userid ******** -->
                <input style="font-weight: 700;" class="required inpt" type="text" name="userId" id="userId" value="${userInfo.userId}" readonly/>
              </p>
              <p>
                <label for="pass">현재 비밀번호</label>
                <br />
                <!-- ******** pass ******** -->
                <input data-pass="${userInfo.pass}" style="margin-bottom: 0px;" class="required inpt" type="password" name="pass" id="pass" value="" placeholder="현재 비밀번호를 입력해주세요."/>
              <!-- ******* 비밀번호 부합 여부 확인 메세지 ******* -->
                <div style="margin-bottom:15px; color:tomato;" id="passrightcheck">*현재 비밀번호를 입력해주세요.</div>
              </p>
              <p>
                <label for="newpass">새 비밀번호</label>
                <br />
                <!-- ******** newpass ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="newpass" id="newpass" value="" placeholder="특수문자+영문+숫자를 포함한 8~15자리"/>
              <!-- ******* 새 비밀번호 정규표현식 확인 메세지******* -->
                <div style="margin-bottom:15px;" id="passtypecheck">&nbsp;</div>
              </p>
              <p>
                <label for="newpassck">새 비밀번호 확인</label>
                <br />
                <!-- ******** newpassck ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="newpassck" id="newpassck" value="" placeholder="새 비밀번호를 다시 입력해주세요."/>
              <!-- ******* 새 비밀번호 일치 여부 확인 메세지******* -->
                <div style="margin-bottom:15px;" id="passsamecheck">&nbsp;</div>
              </p>
              <p>
                <label for="name">이름</label>
                <br />
                <!-- ******** name ******** -->
                <input style="font-weight: 700;" class="required inpt" type="text" name="name" id="name" value="${userInfo.name}" readonly/>
              </p>
              <p>
                <label for="age">나이</label>
                <br />
                <!-- ******** age ******** -->
                <input class="required inpt" type="text" name="age" id="age" value="${userInfo.age}" />
              </p>
              <p>
                <label>성별</label>
                <br />
                <!-- ******** gender ******** -->
                
<c:if test="${userInfo.gender == '여'}">
                	여성<input type="radio" name="gender" value="여" checked>
					남성<input type="radio" name="gender" value="남">	
</c:if>
<c:if test="${userInfo.gender == '남' }">
                	여성<input type="radio" name="gender" value="여">
					남성<input type="radio" name="gender" value="남" checked>	
</c:if>
              </p>
            
	        <div class="divider"></div>
	        <div class="clear"></div>
            <label id="load" style="display:none"></label>
            
            <div class="align-center">
            	<a id="cancelBtn" class="button red btns" style="margin-right:100px; font-weight: 700;">취  소<span></span></a>
            	<a id="modifyBtn" class="button red btns" style="font-weight: 700;">수 정<span></span></a>
            </div>
            <div class="clear"></div>
            <br>
            <p>
            	<span>
            		<font color="gray">회원 탈퇴를 원하시면, <a id="exitBtn" href="" data-pass="${userInfo.pass}"><strong>여기</strong></a>를 눌러주세요.</font>
            	</span>
            </p>
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