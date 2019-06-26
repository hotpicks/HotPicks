<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
<style>
.title{
font-weight: 900;
font-size: 40px;
padding-bottom: 50px;
}

#wrapper {
    line-height: 50px;
}

a {
width: 50px;
}



</style>


 <div align="center" class="title">회원가입</div>

 <!-- Begin Wrapper -->
  <div id="wrapper" align="center"> 
    <!-- Begin Content -->
    <div class="content" align="center">
      <br/>
      <h3>Hot Picks에 오신 것을 환영합니다.</h3>
      <p>관심있는 공연/전시, 행사에 대한 정보를 제공받고 Picker가 되어 My Picks를 관리하고 공유하세요!</p>
      <br/><br/>
      <!-- Begin Form -->
        <div id="contact-form"> 
          
          <!--begin:notice message block-->
          <div id="note"></div>
          <!--begin:notice message block-->
          
          <form id="ajax-contact-form" method="post" action="javascript:alert('success!');">
            <div class="labels">
              <p>
                <label for="emailId" class="labels">Email ID</label>
                <br />
                <!-- ******** userid ******** -->
                <input class="required inpt" type="text" name="userid" id="userid" value="" />
              <div><font color="red">이미 사용중인 id입니다.</font></div>
              </p>
              <p>
                <label for="event">비밀번호</label>
                <br />
                <!-- ******** pass ******** -->
                <input class="required inpt" type="text" name="pass" id="pass" value="" />
              </p>
              <p>
                <label for="event">비밀번호 확인</label>
                <br />
                <!-- ******** passck ******** -->
                <input class="required inpt" type="text" name="passck" id="passck" value="" />
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
                <label for="gender">성별</label>
                <br />
                <!-- ******** gender ******** -->
                <ul id="gender">
               		<li>
                		여성<input type="radio" name="gender" id="gender" value="여" checked>
						남성<input type="radio" name="gender" id="gender" value="남">               		
               		</li>
               	</ul>
              </p>
              <p>
              	<label for="region">지역</label>
              	<div id="region">
                <!-- ******** sidoCode ******** -->
              	<select id="sidoCode" name="sidoCode">
              		<option value="123">시/도</option>
              		<option value="123">서울</option>
              		<option value="123">인천</option>
              		<option value="123">대전</option>
              		<option value="123">대구</option>
              	</select>
                <!-- ******** sigunguCode ******** -->
              	<select id="sigunguCode" name="sigunguCode">
              		<option value="123">시/군/구</option>
              		<option value="123">구로구</option>
              		<option value="123">강남구</option>
              		<option value="123">동대문구</option>
              		<option value="123">강동구</option>
              	</select>
              	</div>
              </p>
                <!-- ******** x ******** -->
              <input type="hidden" name="x" value="">
                <!-- ******** y ******** -->
              <input type="hidden" name="y" value="">
            </div>
            
	        <div class="divider"></div>
	        <div class="clear"></div>
            <label id="load" style="display:none"></label>
            <a class="button light-purple" href="#">취  소</a>
            <a class="button light-purple" href="#">가  입</a>
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

<%@ include file = "/template/footer.jsp" %>