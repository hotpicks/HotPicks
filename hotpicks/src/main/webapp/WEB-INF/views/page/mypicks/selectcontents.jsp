<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<style>
.sh{
    margin-right: 3% !important;
    clear: right;
}
/* .swiper-container {
	height:420px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
} */
.swiper-slide {
	
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
.swiper-wrapper{
padding-top: 30px;
}
.swiper-button-prev{
	left:0;!important;
	height: 30px;
}
.swiper-button-next{
height: 30px;
}
</style>
<script>
var len = '${fn:length(list)}';
if(len > 3){
	len = 3;
}
new Swiper('.swiper-container', {
	slidesPerView : len, // 동시에 보여줄 슬라이드 갯수
	spaceBetween :0, // 슬라이드간 간격
	slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : false, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<c:forEach var="selectcontents" items="${list}" >
		<div class="swiper-slide">
			 <div class="sh"><div style="font-size:12px; color:gray;"> 
			<c:set var="distance" value="${selectcontents.distance}"></c:set>
			<c:choose>
				<c:when test="${distance <= 0.9999}">
				<c:set var="distance" value="${(distance*10)+(1-(distance*10)%1)%1}"></c:set>
				<fmt:parseNumber var="test" value="${distance}" integerOnly="true"/>${test}00m이내
				</c:when>
				<c:otherwise>
				<c:set var="distance" value="${(distance)+(0.1-((distance*10)%1/10))%1}"></c:set>
				<fmt:formatNumber var="test" value="${distance}" pattern=".0"/>
				${test}km이내
				</c:otherwise>
			</c:choose>
			   </div> <img src="${root}/resources/style/images/art/home-1.jpg" alt="" />
			        <h4>${selectcontents.subject}</h4>
			        <p>contentsid = ${selectcontents.contentsid}</p>
			      </div>
			      </div>
			</c:forEach>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<!-- <div class="swiper-pagination"></div> -->
</div>
</div>

