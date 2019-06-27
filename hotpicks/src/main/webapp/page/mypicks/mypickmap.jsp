<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.map{
	box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.175) !important;
	border: solid 1px gray;
	position: relative;
	width: 100%;
	height: 0;
	overflow: hidden;
	padding-bottom: 56.26%;
	
}
.btn {
  border: none;
  background-color: inherit;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}

/* On mouse-over */
.btn:hover {background: #eee;}

.success {color: green;}
.info {color: dodgerblue;}
.warning {color: orange;}
.danger {color: red;}
.default {color: black;}


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
    
    <!-- Begin Content -->
    <div class="content">
      <div>
<div align="center" style="margin-bottom: 30px;">
	<div style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
		<a>전체	|</a>
		<a>공연	|</a>
		<a>전시	|</a>
		<a>행사</a>
	</div>
	<div>
		<a href="${root}/page/mypicks/mypicklist.jsp"><button>목록형사진</button></a>
		<a href="${root}/page/mypicks/mypickmap.jsp"><button>지도형사진</button></a>
		<a href="${root}/page/mypicks/mypickcalendar.jsp"><button>달력형사진</button></a>
	</div>
</div>
      <h3>지도댱!</h3>
      <table style="border: solid 1px;">
      	<tr>
      	 <td width="150">1</td>
      	 <td>1</td>
      	</tr>
      	<tr>
      	 <td>2</td>
      	 <td>2</td>
      	</tr>
      </table>
      <div id="map" class="map mx-auto">
		<div class="hAddr">
			<span class="title"></span> <span id="centerAddr"></span>
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
		strokeWeight : 5, // 선의 두께입니다 
		strokeColor : '#75B8FA', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'dashed', // 선의 스타일 입니다
		fillColor : '#CFE7FF', // 채우기 색깔입니다
		fillOpacity : 0.7
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
		});
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				if (status === daum.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>' : '';
					detailAddr += '<div>' + result[0].address.address_name
							+ '</div>';
					var content = '<div class="bAddr">' + detailAddr + '</div>';
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
			var infoDiv = document.getElementById('centerAddr');
			for (var i = 0; i < result.length; i++) {
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
<%@ include file = "/template/footer.jsp"%>