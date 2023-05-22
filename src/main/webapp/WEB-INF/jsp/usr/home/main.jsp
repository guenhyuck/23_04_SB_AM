<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="대전 문화 관광" />
<%@ include file="../common/head.jspf"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<hr />


<div>링크 주소 자리야</div>



<div>레이아웃 자리야</div>


<div class="popup text-2xl inline">레이아웃 슬라이드쇼 할꺼야</div>
<div class="layer-bg"></div>
<div class="layer">
		<div class="flex justify-between">
				<div class="text-2xl">POPUP</div>
				<div class="close-btn">
						<div></div>
						<div></div>
				</div>
		</div>
		
	<!-- 	팝업 구현부 -->
		
		<div>
		
		
		</div>

</div>

<div class="topCon">
		<div class="test1">
				<div class="logo_1">
						<em class="blind">로고 백그라운드 사진 지나가고 누르면 링크가게끔</em>
				</div>
				<ul class="logoList">
						<li>
								<a href="">
										<img src="https://www.wellnessnculture.co.kr/news/photo/202110/3989_6566_5950.jpg" alt="이미지1">
								</a>
								<a href="">쉼터 소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://img.freepik.com/free-photo/rainbow-fountain-show-at-expo-bridge-in-south-korea_335224-491.jpg?w=1380&t=st=1684468890~exp=1684469490~hmac=570872144e073c8a2c8d4fbcf91eaabf8456474ae42cb46274dcafb13f962cb1" alt="이미지2">
								</a>
								<a href="">전시회 소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://img.freepik.com/premium-vector/different-kinds-of-city-and-intercity-public-transport-set-transportation-illustration-car-bus-and-truck-icons_263016-380.jpg" alt="이미지3">
								</a>
								<a href="">대중교통 이용안내</a>
						</li>
				</ul>
				<ul class="logoList">
						<li>
								<a href="">
										<img src="https://ak-d.tripcdn.com/images/1i61q2215as5snj2o8B1D.jpg?proc=source/trip" alt="이미지4">
								</a>
								<a href="">맛집</a>
						</li>
						<li>
								<a href="">
										<img src="https://cdn.cctoday.co.kr/news/photo/202203/2159314_591447_2750.jpg" alt="이미지5">
								</a>
								<a href="">전통시장</a>
						</li>
						<li>
								<a href="">
										<img src="https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDlfMTkx/MDAxNjcwNTM3NjE3MzYz.49mbTxeEDY6aDt5b3X1gq_GSYBM1tf74y2YSzOujhlEg.Bn47zvOg1D5XP3T5irnP5whTAq1bTTU0RtEySR0ADSgg.JPEG.first_seogu/%EC%9E%A5%ED%83%9C%EC%82%B0%EC%9E%90%EC%97%B0%ED%9C%B4%EC%96%91%EB%A6%BC2.jpg?type=w800" alt="이미지6">
								</a>
								<a href="">휴양지</a>
						</li>
				</ul>
<hr class="line">
				<div class="logo_2">
						<em class="blind">대전광역시</em>
				</div>
		</div>
</div>

<div class="container">


		<a href="">얘네 크기 늘릴꺼야</a>

		<a href="/usr/home/APITest4" class="fa-solid fa-map-location-dot">일단지도</a>
		
		<a href="/usr/info/info" class="fa-solid fa-car">일단맛집</a>
		
		<a href="/usr/info/info3" class="fa-solid fa-restroom">일단 교통량</a>
		
		<a href="/usr/info/info4" class="fa-solid fa-restroom">일단 숙박</a>
		
       

</div>
<hr class="line">

   
<hr class="line">
<style>


.container .fa-solid {
	display: flex;
	flex-direction: row;
	font-size: 4rem;
}

.container .fa-solid > * {
	margin-right: 20px; /* 원하는 간격 설정 */
}

ul.logoList {
	display: flex;
	justify-content: center;
	gap: 20px; /* 원하는 간격 설정 */
}

ul.logoList li {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.logoList img {
	width: 400px; /* 원하는 크기로 조정 */
	height: 400px; /* 원하는 크기로 조정 */
}
</style>
<%@ include file="../common/foot.jspf"%>