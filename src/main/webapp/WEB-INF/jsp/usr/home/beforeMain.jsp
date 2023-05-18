
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
				유트브
		</a>
</div>


<div class="main">
		<a href="/" class="card_image">
				<img src="https://www.daejeon.go.kr/images/drh/sub07/disu_img01.png">
		</a>
		<ul class="cards">
				<li class="cards_item">
						<div class="card">
								<div class="flex card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 문화의 새로운 스테이지"</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 문화로 만나는 새로운 세상"</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전, 문화의 향연을 느끼다"</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전 문화, 세상과 소통하다"</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">"대전 문화, 그림 같은 순간을 만들다"</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
				<li class="cards_item">
						<div class="card">
								<div class="card_image">
										<img
												src="https://i.namu.wiki/i/O7Rd8b_LoQX4ufQbTmv2a_b0-OVHAa6Uz3FLfE_UE0rLJz-ruEvT_1l2rQpTFfTuaaOeOm12Fz8nKxzRvyW_iQ.svg">
								</div>
								<div class="card_content">
										<h2 class="card_title">틀잡기</h2>
										<p class="card_text">한줄 설명란</p>
										<a href="/" class="btn card_btn">~ 가기</a>
								</div>
						</div>
				</li>
		</ul>
</div>


<style>

/* Design */
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
</style>