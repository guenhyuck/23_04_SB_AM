<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="메인" />
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
		<div>여기 뜰꺼임</div>

</div>

<div class="topCon">
		<div class="test1">
				<div class="logo_1">
						<em class="blind">로고 백그라운드 사진 지나가고 누르면 링크가게끔</em>
				</div>
				<ul class="logoList">
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2022/03/18/17/38/pattern-7077094_960_720.png" alt="이미지1">
								</a>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2023/05/13/17/43/water-7991010_960_720.jpg" alt="이미지2">
								</a>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2016/03/04/19/36/beach-1236581_960_720.jpg" alt="이미지3">
								</a>
								<a href="">~~~~소개</a>
						</li>
				</ul>
				<ul class="logoList">
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg" alt="이미지4">
								</a>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2013/11/28/10/03/river-219972_960_720.jpg" alt="이미지5">
								</a>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">
										<img src="https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_960_720.jpg" alt="이미지6">
								</a>
								<a href="">~~~~소개</a>
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

		<a href="/usr/home/APITest4" class="fa-solid fa-map-location-dot">길찾기</a>
		
		<a href="/usr/info/info2" class="fa-solid fa-car">교통정보</a>
		
		<a href="/usr/info/info3" class="fa-solid fa-restroom">공중 화장실</a>
		
		<a href="/usr/info/info4" class="fa-solid fa-restroom">대충딴거</a>
		
       

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