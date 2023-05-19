
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head data-theme="light">
<meta charset="UTF-8">
<title>문화의 도시 대전</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 노드SCSS 불러오기 -->
<link rel="stylesheet" href="output.css">

<link rel="shortcut icon" href="/resource/favicon.ico" />

<!-- 테일윈드 불러오기 -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" /> -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<div class="icon_bts">
		<a href="https://www.instagram.com/daejeon_official/">
				<i class="fab fa-instagram"></i>
				인스타
		</a>
		<a href="https://www.facebook.com/daejeonstory/?locale=ko_KR">
				<i class="fab fa-facebook"></i>
				페북
		</a>
		<a href="https://www.daejeon.go.kr/">
				<i class="fas fa-home"></i>
				공홈
		</a>
		<a href="https://www.youtube.com/channel/UCzIgmDjE0lFDu2IhEF_ewOA">
				<i class="fa-brands fa-youtube"></i>
				유튜브
		</a>
</div>


<div class="main">
		<a href="/" class="card_image">
				<img class="first_image" src="https://www.daejeon.go.kr/images/drh/sub07/disu_img01.png">
		</a>
		<ul class="cards">
				<li class="cards_item">
						<div class="card">
								<div class="flex card_image">
										<img
												src="https://www.wellnessnculture.co.kr/news/photo/202110/3989_6566_5950.jpg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 쉼터"</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://img.freepik.com/free-photo/rainbow-fountain-show-at-expo-bridge-in-south-korea_335224-491.jpg?w=1380&t=st=1684468890~exp=1684469490~hmac=570872144e073c8a2c8d4fbcf91eaabf8456474ae42cb46274dcafb13f962cb1">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 문화로 만나는 새로운 세상"</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://img.freepik.com/premium-vector/different-kinds-of-city-and-intercity-public-transport-set-transportation-illustration-car-bus-and-truck-icons_263016-380.jpg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 문화의 향연을 느끼다"</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://ak-d.tripcdn.com/images/1i61q2215as5snj2o8B1D.jpg?proc=source/trip">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전 문화, 맛으로 느끼기"</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://cdn.cctoday.co.kr/news/photo/202203/2159314_591447_2750.jpg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전 문화, 체험하며 즐기기"</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDlfMTkx/MDAxNjcwNTM3NjE3MzYz.49mbTxeEDY6aDt5b3X1gq_GSYBM1tf74y2YSzOujhlEg.Bn47zvOg1D5XP3T5irnP5whTAq1bTTU0RtEySR0ADSgg.JPEG.first_seogu/%EC%9E%A5%ED%83%9C%EC%82%B0%EC%9E%90%EC%97%B0%ED%9C%B4%EC%96%91%EB%A6%BC2.jpg?type=w800">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">대전문화</p>
										<a href="/" class="btn card_btn">~ 바로 가기</a>
								</div>
						</div>
				</li>
		</ul>
</div>


<style>
/* 커서 */
body {
  cursor: url("https://www.sungsimdangmall.co.kr/data/sungsimdang/goods/sungsimdang/other/IMG001.png"), auto;
}

/* Design */


}



*, *::before, *::after {
	box-sizing: border-box;
}

html {
	background-color: #ecf9ff;
}

body {
	color: #272727;
	font-family: 'Quicksand', serif;
	font-style: normal;
	font-weight: 400;
	letter-spacing: 0;
	padding: 1rem;
}

.main {
	max-width: 1200px;
	margin: 0 auto;
}

h1 {
	font-size: 24px;
	font-weight: 400;
	text-align: center;
}

img {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

.btn {
	color: #ffffff;
	padding: 0.8rem;
	font-size: 14px;
	text-transform: uppercase;
	border-radius: 4px;
	font-weight: 400;
	display: block;
	width: 100%;
	cursor: pointer;
	border: 1px solid rgba(255, 255, 255, 0.2);
	background: transparent;
}

.btn:hover {
	background-color: rgba(255, 255, 255, 0.12);
}

.cards {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	margin: 0;
	padding: 0;
}

.cards_item {
	display: flex;
	padding: 1rem;
}

@media ( min-width : 40rem) {
	.cards_item {
		width: 50%;
	}
}

@media ( min-width : 56rem) {
	.cards_item {
		width: 33.3333%;
	}
}

.card {
	background-color: white;
	border-radius: 0.25rem;
	box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.card_content {
	padding: 1rem;
	background: linear-gradient(to bottom left, #EF8D9C 40%, #FFC39E 100%);
}

.card_title {
	color: #ffffff;
	font-size: 1.1rem;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: capitalize;
	margin: 0px;
}

.card_text {
	color: #ffffff;
	font-size: 0.875rem;
	line-height: 1.5;
	margin-bottom: 1.25rem;
	font-weight: 400;
}

.card_image {
	display: flex;
	justify-content: center;
}

.made_by {
	font-weight: 400;
	font-size: 13px;
	margin-top: 35px;
	text-align: center;
}

.icon_bts div {
	display: flex;
	align-items: center;
}

.icon_bts i {
	margin-right: 5px;
}


	@keyframes blink {
		0% { color: red; }
		50% { color: black; }
		100% { color: red; }
	}

	.icon_bts a:hover {
		animation: blink 1s infinite;
	}
	.div .card_image>img{
	-webkit-animation: pulse 1.5s infinite;
	
	}
.main .card_image .first_image{
  border-radius: 45px;
  letter-spacing: 5px;
  font-weight: 500;
  transition: all 0.5s ease 0s;
  cursor: pointer;
  }

.main .card_image .first_image:hover{
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-14px);
}


</style>