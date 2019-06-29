<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Hot Picks | 나만의 핫픽 저장소</title>
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
        <div id="search"">
        	<form id="searchform" method="get" action="${root}/page/search/searchresult.jsp">
          	<input type="text" id="s" name="s" value="검색어를 입력해주세요." onfocus="this.value=''" onblur="this.value='검색어를 입력해주세요.'"/>
        </form>
        </div>
        
        <!-- Begin Menu -->
        <div id="menu-wrapper">        
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="${root}/index.jsp" class="selected">Home</a>
              </li>
              <li><a href="${root}/page/contents/tak_main.jsp">Contents</a>
                <ul>
                  <li><a href="${root}/page/contents/tak_main.jsp">공연</a></li>
                  <li><a href="${root}/page/contents/tak_main.jsp">전시</a></li>
                  <li><a href="${root}/page/contents/tak_main.jsp">행사</a></li>
                </ul>
              </li>
              <li><a href="${root}/page/mypicks/mypicklist.jsp">My Picks</a>
                <ul>
                  <li><a href="${root}/page/mypicks/mypicklist.jsp">Pick 목록</a></li>
                  <li><a href="${root}/mypickmap/mvmypickmap">Pick 지도</a></li>
                  <li><a href="${root}/page/mypicks/mypickcalendar.jsp">Pick 달력</a></li>
                </ul>
              </li>
              <li><a href="${root}/page/member/mypage.jsp">My Page</a></li>
              <li><a href="${root}/page/member/login.jsp">Login/Join</a></li>
            </ul>
          </div>
        </div>
        <!-- End Menu -->
      </div>
      <!-- End Header --> 
    </div>
  </div>
  <!-- End Header Wrapper --> 