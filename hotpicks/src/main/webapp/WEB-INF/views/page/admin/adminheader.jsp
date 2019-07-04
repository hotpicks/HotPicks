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

<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<style>
#search{
	float: left;
	position: absolute;
	bottom:17px;
	left:170px;
}
body{
	background-color: #527a7a;
}

#wrapper{
line-height: 45px;
}

.title{
font-weight: 900;
font-size: 40px;
color: white;
}

.divider{
margin-top:0px;
padding-bottom: 0px;
margin-bottom: 10px;
}

.btns{
margin-bottom: 10px;
}

.tab .list{
background-color : lightgray;
}

ul#tab-menu {
    float: none;
    width: 100%;
}

#wrapper ul li {
    line-height: 60px;
    display: inline;
    margin-left: 35px;
    margin-right: 35px;
}

.tab-content{
	float:none;
	margin-top:10px;
	width : 98%;
	height: 1000px;
}

input[type=checkbox]{
width:20px;
height:20px;
}

table td {
padding:0px;
}

#membercnt {
height: 100px;
}

#membercnt td{
font-weight:700;
font-size:large;
}

.tab-content div.tab p {
	width: 100%;
}

select{
float: right;
width:200px;
height:30px;
font-size: 15px;
font-weight: 700;
}

#membercnt {
    height: 100%;
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
        <div id="logo"><a href="${root}/index.jsp"><img width=:"$(root). }" src="${root}/resources/style/images/admin_logo.png" alt="HotPicks로고" /></a></div>
        <!-- Search -->
        <div id="search"">
        	<form id="searchform" method="get" action="${root}/WEB-INF/views/page/search/searchresult.jsp">
          	<input type="text" id="s" name="s" value="검색어를 입력해주세요." onfocus="this.value=''" onblur="this.value='검색어를 입력해주세요.'"/>
        </form>
        </div>
        
        <!-- Begin Menu -->
        <div id="menu-wrapper">        
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li>
              	<a href="${root}/index.jsp">Home</a>
              </li>
              <li>
              	<a href="${root}/admin/mgmember">Admin</a>
              </li>
              <li>
              	<a href="${root}/admin/db">DB</a>
              </li>
              <li>
              	<a href="${root}/member/logout">Logout</a>
              </li>
            </ul>
          </div>
        </div>
        <!-- End Menu -->
      </div>
      <!-- End Header --> 
    </div>
  </div>
  <!-- End Header Wrapper --> 