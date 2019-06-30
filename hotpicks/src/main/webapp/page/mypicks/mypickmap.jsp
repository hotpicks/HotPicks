<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
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
<script>
	$(document).ready(function() {
		
	});
	
</script>

  <!-- Begin Wrapper -->
  <div id="wrapper"> 
  <div class="content">
<div align="center" style="margin-bottom: 30px;">
	<div style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
		<a>전체	|</a>
		<a>공연	|</a>
		<a>전시	|</a>
		<a>행사</a>
	</div>
	<div>
			<a href="${root}/page/mypicks/mypicklist.jsp"><img src="${root}/resources/style/images/listpicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/page/mypicks/mypickmap.jsp"><img src="${root}/resources/style/images/mappicks.png"></a>
			<img src="${root}/resources/style/images/blank.png">
			<a href="${root}/page/mypicks/mypickcalendar.jsp"><img src="${root}/resources/style/images/calendarpicks.png"></a>
		</div>
</div>
      
      <h3></h3>
       <div class="container">
  <div class="row">
 		<div class="condition col-2" style="height:100%">CONDITION
 		<div class="sidenav">
						<button class="dropdown-btn">
							가봤니? <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<a href="#">전체</a> <a href="#">가고싶은 곳</a> <a href="#">다녀온 곳</a>
						</div>
						<button class="dropdown-btn">
							지역별 분류 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<a href="#">지역<br>(시/군/구)</a> 
							<a href="#"><div>반경</div></a> 
							<input type="range" class="range align-middle" id="customRange" name="range"
									min="0.5" max="3" step="0.5" value="2"> <label id="range">2</label><label>km</label>
						</div>
					</div>
 		</div>
 		<div  class="col-10">
 		<div class="hAddr">
			<span class="title"></span> <span id="clickAddr"></span>
			<span id="clickAddrDetail"></span>
			
		</div>
      <div id="map" class="map mx-auto">
      </div>
	</div>
	  </div>
</div>
	<div id="clickLatlng"></div>
    </div>
    <!-- End Content --> 
    
  </div>
  <!-- End Wrapper -->
  <script type="text/javascript">
	var loginClass = '${loginClass}';
	
	var arr = [];
	var markers = [];
	var selectMarkers = [];
	var container = document.getElementById('map');
	var options;
	if (loginClass =='s'){
		//var stu_x = '${id.stu_x}';
		//var stu_y = '${id.stu_y}';
	options = {
		center : new daum.maps.LatLng(stu_x, stu_y),
		level : 8
	};
	} else {
		options = {
				center : new daum.maps.LatLng(37.5028273473234, 126.9871525346085),
				level : 8};
	}
	var map = new daum.maps.Map(container, options);
	var imageSrc = '${root}/resources/style/images/marker2.png', // 마커이미지의 주소입니다    
	imageSize = new daum.maps.Size(32, 35), // 마커이미지의 크기입니다
	imageOption = {
		offset : new daum.maps.Point(15,35)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = new daum.maps.LatLng(37.54699,
			127.09598); // 마커가 표시될 위치입니다
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
		position : markerPosition,
		image : markerImage
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
	var imageSrc2 = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position, title) {
		// 마커를 생성합니다
		var marker2 = new daum.maps.Marker({
			position : position
		});
		marker2.setTitle(title);
		// 마커가 지도 위에 표시되도록 설정합니다
		marker2.setMap(map);
		// 생성된 마커를 배열에 추가합니다
		markers.push(marker2);
		var iwContent = '<div id="mtitle" class="mx-auto" style="width:5rem;">'
				+ marker2.getTitle() + '</div>';
		var infowindow = new daum.maps.InfoWindow({
			position : position,
			content : iwContent
		});
		daum.maps.event.addListener(marker2, 'mouseover', function() {
			infowindow.open(map, marker2);
		});
		daum.maps.event.addListener(marker2, 'mouseout', function() {
			infowindow.close();
		});
		daum.maps.event.addListener(marker2, 'click', function() {
			page_move("${root}/mainfront?sid=godetail", null ,marker2.getTitle());
			//$.post("${root}/mainfront?sid=godetail", {"loginId" : "test3", "no" : "00000003"},function(data));
			//location.href = '${root}/mainfront?sid=godetail&no=' + marker2.getTitle()+"&id="+id;
		});
	}

		var geocoder = new daum.maps.services.Geocoder();
	$(document).ready(function() {
		$('input[name=range]').change(function() {
			var jb = $('input[name=range]').val();
			$("label[id=range]").html(jb);
			circle.setRadius(jb * 1000);
		});
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			var latlng = mouseEvent.latLng;
			marker.setPosition(latlng);
			searchAddrFromCoords(latlng, displayCenterInfo);
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
					markerSet(mouseEvent.latLng.getLat(), mouseEvent.latLng
							.getLng());
					selectDistanceLesson(marker);
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
				console.log(result[i]);
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}
	}
	function markerSet(lat, lng) {
		marker.setPosition(new daum.maps.LatLng(lat, lng));
		circle.setPosition(new daum.maps.LatLng(lat, lng));
		console.log(new daum.maps.LatLng(lat, lng));
		marker.setMap(map);
		circle.setMap(map);
	}
	function selectDistanceLesson(marker) {
		arr = [];
		selectMarkers = [];
		var m1 = marker.getPosition();
		for (var i = 0; i < markers.length; i++) {
			var m2 = markers[i].getPosition();
			var linePath = new daum.maps.Polyline({
				map : map,
				path : [ m1, m2 ]
			});
			if (linePath.getLength() < $('input[name=range]').val() * 1000) {
				selectMarkers.push(markers[i]);
			}
			linePath.setMap(null);
		}
		for (var j = 0; j < selectMarkers.length; j++) {
			arr.push(selectMarkers[j].getTitle());
		}
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
<%@ include file = "/template/footer.jsp"%>