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
                <input class="required inpt" type="text" name="emailId" id="emailId" value="" />
              <div><font color="red">이미 사용중인 id입니다.</font></div>
              </p>
              <p>
                <label for="event">비밀번호</label>
                <br />
                <input class="required inpt" type="text" name="pass" id="pass" value="" />
              </p>
              <p>
                <label for="event">비밀번호 확인</label>
                <br />
                <input class="required inpt" type="text" name="passck" id="passck" value="" />
              </p>
              <p>
                <label for="name">이름</label>
                <br />
                <input class="required inpt" type="text" name="name" id="name" value="" />
              </p>
              <p>
              	<label for="region">지역</label>
              	<div id="region">
              	<select>
              		<option>시/도</option>
              		<option>서울</option>
              		<option>인천</option>
              		<option>대전</option>
              		<option>대구</option>
              	</select>
              	<select>
              		<option>시/군/구</option>
              		<option>구로구</option>
              		<option>강남구</option>
              		<option>동대문구</option>
              		<option>강동구</option>
              	</select>
              	</div>
              </p>
            </div>
            
	        <div class="divider"></div>
	        <div class="clear"></div>
            <label id="load" style="display:none"></label>
            <input id="submit-button" class="button red" type="submit" name="submit" value="Send Message" />
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