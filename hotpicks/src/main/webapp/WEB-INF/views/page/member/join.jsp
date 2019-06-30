<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp"%>

<script>

$(function(){
	
	//가입하기 요청
	$("#joinBtn").click(function(){
		
		$(".joinForm").attr("method", "POST").attr("action", "${root}/member/join").submit();
		
	});
	
	// TODO id 이멜 형식 & 중복체크, 비밀번호 확인 체크, 모든 항목 유효성 검사 추가
	
	// 지역 select 박스 값 관광 api 호출
	// x,y 값 다음 api 호출
	// 프로필 사진값 적용
	
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
              <p style="margin-bottom:15px;"><font id="idcheck" color="red" style="font-style: italic;"> </font></p>
              </p>
              <p>
                <label for="pass">비밀번호</label>
                <br />
                <!-- ******** pass ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="pass" id="pass" value="" />
              <!-- ******* 비밀번호 정규표현식 확인 메세지 ******* -->
                <p style="margin-bottom:15px;"><font id="passtypecheck" color="red" style="font-style: italic;">*비밀번호는 특수문자, 영문 소문자 포함하여 12글자 이상</font></p>
              </p>
              <p>
                <label for="passck">비밀번호 확인</label>
                <br />
                <!-- ******** passck ******** -->
                <input style="margin-bottom: 0px;" class="required inpt" type="password" name="passck" id="passck" value="" />
              <!-- ******* 비밀번호 일치 여부 확인 메세지 ******* -->
                <p style="margin-bottom:15px;"><font id="passsamecheck" color="red" style="font-style: italic;">*비밀번호가 일치하지 않습니다.</font></p>
              </p>
              <p>
                <label for="name">이름</label>
                <br />
                <!-- ******** name ******** -->
                <input class="required inpt" type="text" name="name" id="name" value="" />
              </p>
              <p>
                <label for="age">나이</label>
                <br />
                <!-- ******** age ******** -->
                <input class="required inpt" type="text" name="age" id="age" value="" />
              </p>
              <p>
                <label>성별</label>
                <br />
                <!-- ******** gender ******** -->
                	여성<input type="radio" name="gender" value="여" checked>
					남성<input type="radio" name="gender" value="남">	
              </p>
              <p>
              	<label for="region">지역</label>
              	<div id="region">
                <!-- ******** sidoCode ******** -->
              	<select id="sidoCode" name="sidoCode" style="margin-right:50px;">
              		<option value="0">시/도</option>
              		<option value="1">서울</option>
              		<option value="2">인천</option>
              		<option value="3">대전</option>
              		<option value="4">대구</option>
              	</select>
                <!-- ******** sigunguCode ******** -->
              	<select id="sigunguCode" name="sigunguCode">
              		<option value="00">시/군/구</option>
              		<option value="11">구로구</option>
              		<option value="22">강남구</option>
              		<option value="33">동대문구</option>
              		<option value="44">강동구</option>
              	</select>
              	</div>
              </p>
                <!-- ******** x ******** -->
              <input type="hidden" name="x" value="0.1">
                <!-- ******** y ******** -->
              <input type="hidden" name="y" value="0.2">
            </div>
            
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