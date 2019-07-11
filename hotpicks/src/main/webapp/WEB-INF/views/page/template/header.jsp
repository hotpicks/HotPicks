<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="userInfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Hot Picks | 나만의 핫픽 저장소</title>

<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/style.css" media="all" />
<link rel="stylesheet" media="all" href="${root}/resources/style/type/folks.css" />
<link rel="stylesheet" media="all" href="${root}/resources/style/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css" href="${root}/resources/contact/style.css" media="all" />

<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
<![endif]-->
<script type="text/javascript" src="${root}/resources/style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/scripts.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/jquery.infieldlabel.min.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/quicksand.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/portfolio.js"></script>
<script type="text/javascript" src="${root}/resources/scripts/swfobject/swfobject.js"></script>
<script type="text/javascript" src="${root}/resources/style/js/twitter.min.js"></script>

<!-- 카카오톡 로그인 API -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function(){
	var d = new Date();
	var day = parseInt(d.getTime()/(1000*60*60*24));
	var expireday = parseInt(d.getTime()/(1000*60*60*24))+1;
	var expireTime = d.getTime()+ expireday*(1000*60*60*24)-d.getTime();
	console.log('${userInfo}');
	if ('${userInfo}' == '') {
		var cookie = getCookie('visitCount');
		if (cookie == "") {
			setCookie('visitCount', 'no', expireTime);
			$(location).attr('href', '${root}/visit/nonvisitor');
		}
	} else {
		var x = document.cookie;
		console.log(x);
		var cookie = getCookie('visitor');
			if (cookie == '') {
				setCookie('visitor','${userInfo.name}', expireTime);
				$(location).attr('href', '${root}/visit/visitor');
			} else{
				if (cookie != '' && cookie != '${userInfo.name}') {
					setCookie('visitor','${userInfo.name}', expireTime);
					$(location).attr('href', '${root}/visit/newvisitor');
				}
			}
		} 
		
	
});
function checkCookie(expireTime) {
	var cookie = getCookie('visitor');
	if (cookie != null) {
		
		 setCookie("visitor", "no", expireTime);
	} /*  var userid = getCookie("visitor");
	  if (userid != "") {
	   alert("Welcome again " + userid);
	  } else {
	    if (userid != "" && userid != null) {
	      setCookie("visitor", "no", expireTime);
	    }
	  } */
	}
	
function getCookie(cname) {
	  var name = cname + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i <ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
}
function setCookie(cname, cvalue, exdays) {
	  var d = new Date();
	  d.setTime(d.getTime() + (exdays*24*60*60*1000));
	  var expires = "expires="+ d.toUTCString();
	  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}

</script>
<style>
#search{
	float: left;
	position: absolute;
	bottom:17px;
	left:170px;
}
</style>

</head>
<body>
<div id="container"> 
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper"> 
      <!-- Begin Header -->
      <div id="header">
        <!-- Logo --> 
        <div id="logo"><a href="${root}/index.jsp"><img src="${root}/resources/style/images/logo.png" alt="HotPicks로고" /></a></div>
        <!-- Search -->
        <div id="search">
        	<form id="searchform"><!-- ${root}/WEB-INF/views/page/search/searchresult.jsp -->
          	<input type="search" id="searchinput" name="search"  value="검색어를 입력해주세요."  onfocus="this.value=''" onblur="this.value='검색어를 입력해주세요.'"/>
     		</form>
        </div>
        
       
<script>


$('#searchinput').keypress(function(e) {
		console.log("press");
	
	if(e.keyCode == 13) {
		console.log("13");
		 $("#searchform").attr('method','GET').attr('action','${root}/contents/contentsbysearch').submit();
	} 
});

</script>
        
        <!-- Begin Menu -->
        <div id="menu-wrapper">        
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="${root}/index.jsp" class="selected">Home</a>
              </li>
              <li><a href="${root}/contents/contentdetail">Contents</a>
                <ul>
           <%--        <li><a href="${root}/WEB-INF/views/page/contents/tak_main.jsp">공연</a></li>
                  <li><a href="${root}/WEB-INF/views/page/contents/tak_main.jsp">전시</a></li>
                  <li><a href="${root}/WEB-INF/views/page/contents/tak_main.jsp">행사</a></li> 
                  <li><a href="${root}/contents/contentdetail">일정 상세</a></li>--%>
                </ul>
              </li>
<c:if test="${userInfo != null}">
              <li><a href="${root}/mypicklist/enter">My Picks</a>
                <ul>
                  <li><a href="${root}/mypicklist/enter">Pick 목록</a></li>
                  <li><a href="${root}/mypickmap/mvmypickmap">Pick 지도</a></li>
                  <li><a href="${root}/mypicklist/cal">Pick 달력</a></li>
                </ul>
              </li>
              <li><a href="${root}/member/mypage">My Page</a></li>
			  <li><a id="logoutBtn" data-pass="${userInfo.pass}" href="">Logout</a></li>
			   <script>
				  
	Kakao.init('9735071d5888d9bfbab24b41f01958c2');

	$("#logoutBtn").click(function(){
							
			var isKakao = $(this).attr("data-pass");
			if(isKakao == 'kakao'){
				Kakao.Auth.logout(function(data){
					location.href = "${root}/member/logout";
					
				});
			} else {
				$(this).attr("href", "${root}/member/logout");
			}
				
			return false;
	});

				
</script>
</c:if>
<c:if test="${userInfo == null}">
              	   <li><a href="${root}/member/login">Login/Join</a></li>
</c:if>
            </ul>
          </div>
        </div>
        <!-- End Menu -->
      </div>
      <!-- End Header --> 
    </div>
  </div>
  <!-- End Header Wrapper --> 