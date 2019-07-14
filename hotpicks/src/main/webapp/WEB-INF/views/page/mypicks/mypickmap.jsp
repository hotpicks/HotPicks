<!-- webapp/resource/doc/mypickmap.txt 에서 function radian, function distance_grs80 을 순서대로 compile 하고 commit 해야함 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>
<%@ include file = "/WEB-INF/views/page/template/logincheck.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<style>
.sh > a{
	text-decoration: none;
	font-size:15px;
	color: black;
}
.sh > a:hover{
	text-decoration: none;
}
.selected{
	font-size : 25px!important;
}
#ipadd{
	display:none;	
}
#addressresult{
	margin: 20px;
}
/*infowindow*/
#iw-container {
	margin-bottom: 10px;
	width: 250px;
	
}
#iw-container .iw-content {
	font-size: 13px;
	line-height: 18px;
	font-weight: 400;
	margin-right: 1px;
	padding: 15px 5px 20px 15px;
	max-height: 140px;
	overflow-y: hidden;
	overflow-x: hidden;
}
.iw-content img {
	float: right;
	margin: 0 5px 5px 10px;	
}
.iw-subTitle {
	font-size: 16px;
	font-weight: 700;
	padding: 5px 0;
}
.iw-bottom-gradient {
	position: absolute;
	width: 326px;
	height: 25px;
	bottom: 10px;
	right: 18px;
	background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -webkit-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -moz-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
	background: -ms-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
}

/*infowindow*/
.range{
	width: 100px;
}
/* Fixed sidenav, full height */
.sidenav {
	overflow-x: hidden;
	padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
	font-size: 14px;
	font-weight: 600;
	color: rgba(0, 0, 0, 0.45);
	display: inline-block;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #f1f1f1;
}

/* Add an active class to the active dropdown button */
.active {
	color: #565656;
	font-weight: bold;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	padding-left: 2vh;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
.condition{
	padding-top: 50px;
}
.bAddr{
	color: gray;
	font-size: 2rem;
	
}
.content{
	padding-bottom: 50px;
}
.hAddr{
	height: 60px;
	padding: 10px;
}
body{
background-color: #f0f0f0;
!important;
}
.map{
	box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.175) !important;
	border: solid 1px gray;
	position: relative;
	width: 100%;
	height: 0;
	overflow: hidden;
	padding-bottom: 56.26%;
	
}

</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67cafe381089c40769059fbbedfa054e&libraries=services,clusterer,drawing"></script>

<script type="text/javascript">
	$(function(){ $("label").inFieldLabels(); });
</script>
<script type="text/javascript">
getTwitters('twitter', {
        id: 'elemisdesign', 
        count: 1, 
        enableLinks: true, 
        ignoreReplies: false,
        template: '<span class="twitterPrefix"><span class="twitterStatus">%text%</span>',
        newwindow: true
});
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper"> 
  <div class="content">
<div align="center" style="margin-bottom: 30px;">
	<div class="sh" style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
		<a href="#" class="selected" id="all">전체</a>&nbsp;
		<a href="#" id="perform">공연	</a>&nbsp;
		<a href="#" id="exhi">전시</a>&nbsp;
		<a href="#" id="event">행사</a>
	</div>
	<div>
		<a href="${root}/mypicklist/enter"><img src="${root}/resources/style/images/listpicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/mypickmap/mvmypickmap"><img src="${root}/resources/style/images/mappicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/mypicklist/cal"><img src="${root}/resources/style/images/calendarpicks.png"></a>
	</div>
</div>
      
      <h3></h3>
       <div class="container">
  <div style="padding-bottom:30px;" class="row">
 		<div class="condition col-2" style="height:100%">CONDITION
 		<div class="sidenav">
						<button class="dropdown-btn">
							HOTPICKS <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<a href="#" id="allpick">전체</a> <a href="#" id="pick">가고싶은 곳</a> <a href="#" id="done">다녀온 곳</a>
						</div>
						<button class="dropdown-btn">
							반경검색 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<div><a href="#">반경</a></div>
							<input type="range" class="range align-middle" id="customRange" name="range"
									min="3" max="9" step="1" value="3"> <label id="range">3</label><label>km</label>
						</div>
						<button class="dropdown-btn" id="location">
							LOCATION <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<div></div>
							
						</div>
					</div>
 		</div>
 		<div  class="col-10">
 		<div class="hAddr">
			<span class="title"></span> <span id="clickAddr"></span>
			<span id="clickAddrDetail"></span>
		</div>
		<input id="ipadd" type="text" class="form-control" placeholder="원하는 장소를 검색하세요!">
		<div id="addressresult" class="searchresult"></div>
      <div id="map" class="map mx-auto">
      </div>
	</div>
	  </div>
	  <hr>
	  <div id="selectcontents"></div>
</div>
    </div>
    <!-- End Content --> 
    
  </div>
  
  
  <!-- daum map api -->
  <!-- End Wrapper -->
  <script type="text/javascript">
  <!-- GeoLocation Api -->
	var user_x = 37.5028273473234;
	var user_y = 126.9871525346085;
	if ("geolocation" in navigator) {
			getLocation();
		} else {
		  alert('사용자의 위치를 가져올 수 없는 브라우저 입니다.');
		}
	
	function getLocation() {
		  if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(showPosition);
		  } 
		}
	
	function showPosition(position) {
		user_x = position.coords.latitude; 
		user_y = position.coords.longitude;
		map.setCenter(new daum.maps.LatLng(user_x, user_y));
		marker.setPosition(new daum.maps.LatLng(user_x, user_y));
		marker.setMap(map);
		//markerSet(user_x, user_y);
		/* selectDistance(user_x,user_y); */
		//selectedRangeContents(user_x, user_y); 
		console.log(user_x + " "+ user_y);
		/* searchDetailAddrFromCoords(new daum.maps.LatLng(user_x, user_y), function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div style="font-size:12px; color:gray;">'
						+ result[0].road_address.address_name + '(도로명주소)</div>' : '<div style="font-size:12px; color:gray;">' + result[0].address.address_name
						+ '</div>';
				
				var content = '<div class="bAddr"><' + detailAddr + '</div>';
				document.getElementById('clickAddrDetail').innerHTML = detailAddr;
			}
		}); */
	}
	var arr = [];
	var allMarkers= [];
	var doneMarkers = [];
	var pickMarkers = [];
	var selectMarkers = [];
	var container = document.getElementById('map');
	var options = {
			center : new daum.maps.LatLng(user_x, user_y),
			level : 8};
	var map = new daum.maps.Map(container, options);
	var imageSrc = '${root}/resources/style/images/marker/mylocation.png', // 마커이미지의 주소입니다    
	imageSize = new daum.maps.Size(43, 45), // 마커이미지의 크기입니다
	imageSize2 = new daum.maps.Size(28, 38), // 마커이미지의 크기입니다
	pickMarkerImageSize = new daum.maps.Size(35, 45), // 마커이미지의 크기입니다
	imageOption2 = {
		offset : new daum.maps.Point(14,38)
	}; 
	imageOption = {
		offset : new daum.maps.Point(23,45)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize2,
			imageOption2), markerPosition = new daum.maps.LatLng(37.54699,
			127.09598); // 마커가 표시될 위치입니다
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
		position : markerPosition,
		image : markerImage,
		zIndex : 1000
	// 마커이미지 설정 
	}), infowindow = new daum.maps.InfoWindow({
		zindex : 100
	});
	var circle = new daum.maps.Circle({
		center : new daum.maps.LatLng(37.54699, 127.09598), // 원의 중심좌표 입니다 
		radius : $('input[name=range]').val() * 1000, // 미터 단위의 원의 반지름입니다 
		strokeWeight : 4, // 선의 두께입니다 
		strokeColor : '#343a40', // 선의 색깔입니다
		strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'dashed', // 선의 스타일 입니다
		fillColor : '#f0f0f0', // 채우기 색깔입니다
		fillOpacity : 0.5
	// 채우기 불투명도 입니다   
	});
	var doneMarkerimagesrc = '${root}/resources/style/images/marker/done_mark1.png';
	var doneMarkerimage = new daum.maps.MarkerImage(doneMarkerimagesrc, imageSize,
			imageOption)
	var pickMarkerimagesrc = '${root}/resources/style/images/marker/pick_basic_mark.png';
	var pickMarkerimage = new daum.maps.MarkerImage(pickMarkerimagesrc, pickMarkerImageSize,
			imageOption)
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(cate, image ,position, subject, contentsid, ifsg, img, zc, ad1 , ad2) {
		
		// 마커를 생성합니다
		var mapMarker = new daum.maps.Marker({
			position : position,
			image : image,
		});
		mapMarker.setTitle(contentsid);
		// 마커가 지도 위에 표시되도록 설정합니다
		mapMarker.setMap(map);
		// 생성된 마커를 배열에 추가합니다
		allMarkers.push(mapMarker);
		console.log("add : "+ allMarkers);
		var iwContent="";
		iwContent += '<div id="iw-container">';
		iwContent += '<div class="iw-content">';
		iwContent +=  '<div class="iw-subTitle">'+subject+'</div>';
		if (img != '-1' && img !=''  ) {
			iwContent +=  '<img src="'+img+'" alt="" height="115" width="83">';
			}
		iwContent +=   '<p>'+ifsg+'</p>';
          if (zc !='' || zc != null) {
			  iwContent +=  '<div>주소</div>';
        	  iwContent +=  '<p>'+zc+', '+ad1+', ' +ad2 +'</p>';
			}
		iwContent += '</div>';
		iwContent += '</div>';
		var infowindow = new daum.maps.InfoWindow({
			position : position,
			 clickable: true,
			content : iwContent
		});
		daum.maps.event.addListener(mapMarker, 'click', function() {
			$('#iw-container').parent().css("border-radius" , 20);
			infowindow.open(map, mapMarker);
		});
		daum.maps.event.addListener(map, 'click', function() {
			infowindow.close();
		});
	}

	var geocoder = new daum.maps.services.Geocoder();

	$('#addressresult>span>a').live('click', function(e) {
		e.preventDefault();
		var a = $(this).data('y');
		var b = $(this).data('x');
		searchDetailAddrFromCoords(new daum.maps.LatLng(a, b), function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div style="font-size:12px; color:gray;">'
						+ result[0].road_address.address_name + '(도로명주소)</div>' : '<div style="font-size:12px; color:gray;">' + result[0].address.address_name
						+ '</div>';
				/* detailAddr += '<div>' + result[0].address.address_name
						+ '</div>'; */
				var content = '<div class="bAddr"><' + detailAddr + '</div>';
				document.getElementById('clickAddrDetail').innerHTML = detailAddr;
				markerSet(a, b);
				map.setCenter(new daum.maps.LatLng(a, b));
				selectDistance(marker);
				selectedRangeContents(a, b);
			}
		});
		
	});


	$(document).ready(function() {
	var catid = -1;
	var wanna = -1;
		/*category*/
		$('#all').click(function(e) {
			e.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			catid = -1;
			if (!$(this).hasClass("selected")) {
				$(this).addClass("selected");
				$('#perform').removeClass("selected");
				$('#exhi').removeClass("selected");
				$('#event').removeClass("selected");
			}
			getMarkers(wanna, catid);
		});
		$('#perform').click(function(e) {
			e.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			catid = 1;
			if (!$(this).hasClass("selected")) {
				$(this).addClass("selected");
				$('#all').removeClass("selected");
				$('#exhi').removeClass("selected");
				$('#event').removeClass("selected");
			}
			getMarkers(wanna, catid);
		});
		$('#exhi').click(function(e) {
			e.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			catid = 2;
			if (!$(this).hasClass("selected")) {
				$(this).addClass("selected");
				$('#perform').removeClass("selected");
				$('#all').removeClass("selected");
				$('#event').removeClass("selected");
			}
			getMarkers(wanna, catid);
		});
		$('#event').click(function(e) {
			e.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			catid = 3;
			if (!$(this).hasClass("selected")) {
				$(this).addClass("selected");
				$('#perform').removeClass("selected");
				$('#exhi').removeClass("selected");
				$('#all').removeClass("selected");
			}
			getMarkers(wanna, catid);
			console.log("add2 : "+ allMarkers);
			
		});
		
		/*wanna 구별*/
		
		getMarkers(wanna, catid);
		/*주소검색*/
		$('#location').click(function(event) {
			event.preventDefault();
			if ($('#ipadd').css('display') === "block") {
				$('#ipadd').val('');
				$('#addressresult').empty();
				$('#ipadd').css('display','none');
			} else {
				$('#ipadd').css('display','block');
			}
			
		});
		var searchadd = $("#ipadd");
		$(searchadd).keyup(function() {
			var sid = $(searchadd).val();
			if (sid.length != 0) {
				$.ajax({
						url : 'https://dapi.kakao.com/v2/local/search/address.json?query='+ sid,
						headers : {'Authorization' : 'KakaoAK a6462a6cb3e275f85632af19d7ec24cb'},
						type : 'GET'
						}).done(function(result) {
									var list = result.documents;
									if (list.length != 0) {
										var html = "<span><a href='#' id='a0' data-y='"+list[0].y+"' data-x='"+list[0].x+"'>"
												+ list[0].address_name
												+ "</a></span><br>";
										for (var i = 1; i < list.length; i++) {
											html += "<span><a href='#' id='a"+i+"' data-y='"+list[i].y+"' data-x='"+list[i].x+"'>"
													+ list[i].address_name + "</a></span><br>";
										}
										$("#addressresult").html(html);
							}
						});
			} else {
				$("#addressresult").html("");
			}
		});
		/*DB마커 가져오기*/
		function getMarkers(wn , ca){
			 $.ajax({
				url : "${root}/mypickmap/getmaplist",
				data: { 'wanna' : wn,
						'catid'	: ca},
				dataType : "JSON",
				success : function(result){
					for (var i = 0; i < result.length; i++) {
						
						var position = new daum.maps.LatLng(result[i].xpoint, result[i].ypoint);
					    if (result[i].wanna == 1) {
							addMarker(1, doneMarkerimage,position, result[i].title, result[i].contentsId, result[i].infosogae, result[i].image1, result[i].addr1, result[i].addr2);
							console.log("wanna=1")
							selectDistance(marker);
							selectedRangeContents(marker.getPosition().getLat(), marker.getPosition().getLng());
							//cate, image ,position, subject, contentsid, ifsg, img, zc, ad1 , ad2
						} else if(result[i].wanna == 2){
							addMarker(2, pickMarkerimage,position, result[i].title, result[i].contentsId, result[i].infosogae, result[i].image1, result[i].addr1, result[i].addr2);
							console.log("wanna=2")
							selectDistance(marker);
							selectedRangeContents(marker.getPosition().getLat(), marker.getPosition().getLng());
						}
					}
				}
			});
		}
	
		$('#allpick').click(function(event) {
			event.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			wanna = -1;
			getMarkers(wanna, catid);
		})
		$('#pick').click(function(event) {
			event.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			wanna = 1;
			getMarkers(wanna, catid);
			
		})
		$('#done').click(function(event) {
			event.preventDefault();
			setAllMarkers(null);
			allMarkers = [];
			wanna = 2;
			getMarkers(wanna, catid);
			
		})
		$('input[name=range]').change(function() {
			var jb = $('input[name=range]').val();
			$("label[id=range]").html(jb);
			circle.setRadius(jb * 1000);
			selectDistance(marker);
			selectedRangeContents(marker.getPosition().getLat(), marker.getPosition().getLng());
		});
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				if (status === daum.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div style="font-size:12px; color:gray;">'
							+ result[0].road_address.address_name + '(도로명주소)</div>' : '<div style="font-size:12px; color:gray;">' + result[0].address.address_name
							+ '</div>';
					/* detailAddr += '<div>' + result[0].address.address_name
							+ '</div>'; */
					var content = '<div class="bAddr"><' + detailAddr + '</div>';
					document.getElementById('clickAddrDetail').innerHTML = detailAddr;
					var x = mouseEvent.latLng.getLat();
					var y = mouseEvent.latLng.getLng();
					console.log("click" +x+" " +y);
					markerSet(x, y);
					selectDistance(marker);
					selectedRangeContents(x,y);
				}
			});
			
	});
		daum.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
	});
	
	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}
	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === daum.maps.services.Status.OK) {
			var infoDiv = document.getElementById('clickAddr');
			for (var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}
	}

	function setAllMarkers(map) {
	    for (var i = 0; i < allMarkers.length; i++) {
	    	allMarkers[i].setMap(map);
	    }            
	}
	function hideMarkers() {
	    setAllMarkers(null);    
	}
	function markerSet(lat, lng) {
		marker.setPosition(new daum.maps.LatLng(lat, lng));
		circle.setPosition(new daum.maps.LatLng(lat, lng));
		marker.setMap(map);
		circle.setMap(map);
	}
	function selectDistance(marker) {
		selectMarkers = [];
		var m1 = marker.getPosition();
		for (var i = 0; i < allMarkers.length; i++) {
			var m2 = allMarkers[i].getPosition();
			var linePath = new daum.maps.Polyline({
				map : map,
				path : [ m1, m2 ]
			});
			if (linePath.getLength() < $('input[name=range]').val() * 1000) {
				selectMarkers.push(allMarkers[i].getTitle());
			}
			linePath.setMap(null);
		}
	}
	function selectedRangeContents(lat,lng){
		var data = {
				"selectMarkers" : selectMarkers,
				"x" : lat,
				"y" : lng,
				"selectDistance" :  $('input[name=range]').val() * 1000
			}
		$.ajax({
			url : '${root}/mypickmap/getcontentslist',
			type : 'post',
			data : data,
			traditional : true,
			//dataType : "JSON",
			dataType : "html",
			success : function(result) {
				
				$('#selectcontents').html(result);
			}
		});
		
	}
	
</script>
<script>
			/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
			var dropdown = document.getElementsByClassName("dropdown-btn");
			var i;

			for (i = 0; i < dropdown.length; i++) {
				dropdown[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var dropdownContent = this.nextElementSibling;
					if (dropdownContent.style.display === "block") {
						dropdownContent.style.display = "none";
					} else {
						dropdownContent.style.display = "block";
					}
				});
			}
		</script>
<%@ include file = "/WEB-INF/views/page/template/footer.jsp"%>