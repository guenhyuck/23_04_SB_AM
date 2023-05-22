<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="대전 문화 관광" />
<%@ include file="../common/head.jspf"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 슬라이드 효과자리 -->
 
<script>
/* Overflow toggle */
const hideOverflow = document.getElementById("overflow");

hideOverflow.addEventListener("click", () => {
  document.querySelector(".container").style.overflow = hideOverflow.checked
    ? "hidden"
    : "visible";
});

/* Carousel */
const items = document.querySelector(".items");
const dots = document.querySelectorAll(".dot");
const prev = document.querySelector(".prev");
const next = document.querySelector(".next");
const total = items.children.length - 1;
const active = "active";
let current = 0;

const setActiveDot = () => {
  dots.forEach((button, i) => {
    i === current
      ? button.classList.add(active)
      : button.classList.remove(active);
  });
};

const scrollToCurrent = () => {
  items.style.transform = `translateX(${current * -100}%`;
  setActiveDot();
};

const scrollPrev = () => {
  if (current === 0) return;
  current--;
  scrollToCurrent();
};

const scrollNext = () => {
  if (current === total) return;
  current++;
  scrollToCurrent();
};

prev.addEventListener("click", scrollPrev);
next.addEventListener("click", scrollNext);
  </script>



<hr />




<div>링크 주소 자리야</div>



<div>레이아웃 자리야</div>


<div class="popup text-2xl inline">레이아웃 슬라이드쇼 할꺼야 클릭하면 이동함</div>
<div class="layer-bg"></div>
<div class="layer">
		<div class="flex justify-between">
				<div class="text-2xl">POPUP</div>
				<div class="close-btn">
						
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
						<label class="checkbox">
    <input type="checkbox" id="overflow" checked /> Hide image overflow
  </label>
  
  <div class="container">
    <h2 class="title">Welcome to the Snuggle Zone</h2>
    <div class="carousel-viewport">
      <ul class="items">
        <li class="item">
          <img src='https://www.wellnessnculture.co.kr/news/photo/202110/3989_6566_5950.jpg' width="1200" height="675" alt=''>
          <a href="">쉼터 소개</a>
        </li>
        <li class="item">
          <img src='https://img.freepik.com/free-photo/rainbow-fountain-show-at-expo-bridge-in-south-korea_335224-491.jpg?w=1380&t=st=1684468890~exp=1684469490~hmac=570872144e073c8a2c8d4fbcf91eaabf8456474ae42cb46274dcafb13f962cb1' width="1200" height="675" alt=''>
        </li>
        <li class="item">
          <img src='https://img.freepik.com/premium-vector/different-kinds-of-city-and-intercity-public-transport-set-transportation-illustration-car-bus-and-truck-icons_263016-380.jpg' width="1200" height="675" alt=''>
        </li>
        <li class="item">
          <img src='https://ak-d.tripcdn.com/images/1i61q2215as5snj2o8B1D.jpg?proc=source/trip' width="1200" height="675" alt=''>
        </li>
        <li class="item">
            <img src='https://cdn.cctoday.co.kr/news/photo/202203/2159314_591447_2750.jpg0' width="1200" height="675" alt=''>
          </li>
          <li class="item">
            <img src='https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDlfMTkx/MDAxNjcwNTM3NjE3MzYz.49mbTxeEDY6aDt5b3X1gq_GSYBM1tf74y2YSzOujhlEg.Bn47zvOg1D5XP3T5irnP5whTAq1bTTU0RtEySR0ADSgg.JPEG.first_seogu/%EC%9E%A5%ED%83%9C%EC%82%B0%EC%9E%90%EC%97%B0%ED%9C%B4%EC%96%91%EB%A6%BC2.jpg?type=w800' width="1200" height="675" alt=''>
          </li>

      </ul>
    </div>
    <button class="carousel-control prev" title="Go to previous item">
      <svg viewBox="0 0 256 512">
        <path d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z" />
      </svg>
    </button>
    <button class="carousel-control next" title="Go to next item">
      <svg viewBox="0 0 256 512">
        <path d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z" />
      </svg>
    </button>
    <ol class="carousel-dots">
      <li class="dot active">1</li>
      <li class="dot">2</li>
      <li class="dot">3</li>
      <li class="dot">4</li>
    </ol>
  </div>
				
				
				
<hr class="line">
				<div class="logo_2">
						<em class="blind">대전광역시</em>
				</div>
		</div>
</div>

<div class="container">

<div class="cslider"></div>
		<a href="">얘네 크기 늘리고 슬라이드쇼 해</a>

		<a href="/usr/home/APITest4" class="fa-solid fa-map-location-dot">일단지도</a>
		
		<a href="/usr/info/info" class="fa-solid fa-bowl-food">일단맛집</a>
		
		<a href="/usr/info/info3" class="fa-solid fa-car">일단 교통량</a>
		
		<a href="/usr/info/info4" class="fa-solid fa-bed">일단 숙박</a>
		
       

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






/* 슬라이더 부 */
/* bgi */

@import url("https://fonts.googleapis.com/css2?family=Gorditas&display=swap");

.topCon .test1 .container {
  display: grid;
  grid-template: "container" 1fr;
  place-items: center;
  place-content: center;
  overflow: hidden;
  max-height: clamp(450px, 50vh, 600px);
}

.topCon .test1 .container > * {
  grid-area: container;
  max-width: 1000px;
}

.title {
  place-self: start center;
}

.carousel-control.prev {
  place-self: center left;
}

.carousel-control.next {
  place-self: center right;
}

.carousel-dots {
  place-self: end center;
}

/* Other element styles */

.topCon .test1 * {
  box-sizing: border-box;
}

.topCon .test1 body {
  --space: 6rem;
  --bg-color: papayawhip;
  display: grid;
  place-items: center;
  padding: var(--space) 0;
  grid-gap: var(--space);
  background-color: var(--bg-color);
  font-family: "Helvetica", sans-serif;
  line-height: 1.2;
}

.topCon .test1 .checkbox {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1;
  cursor: pointer;
  user-select: none;
  background-color: inherit;
  padding: 1rem;
  opacity: 0.9;
}

.topCon .test1 .container {
  position: relative;
  border-top: var(--border);
  border-bottom: var(--border);
  margin: 0 auto;
  width: 100%;
  color: white;
}

.title {
  position: relative;
  font-family: "Gorditas", sans-serif;
  font-size: clamp(1rem, 4vw, 2.5rem);
  padding: 1rem;
  text-align: center;
  z-index: 1;
}

.carousel-viewport {
  position: relative;
  overflow: hidden;
  margin: 0 auto;
  z-index: -1;
}

.carousel-viewport .items {
  position: relative;
  display: flex;
  transition: transform 500ms cubic-bezier(0.25, 1, 0.5, 1);
}

.carousel-viewport .item {
  position: relative;
  overflow: hidden;
  aspect-ratio: 16 / 9;
  min-width: 100%;
  transform: translateZ(0);
}

.carousel-viewport img {
  object-fit: cover;
  width: 100%;
  height: 100%;
  user-select: none;
}

.carousel-control {
  --size: clamp(2.5rem, 8vw, 4rem);

  position: relative;
  cursor: pointer;
  display: flex;
  align-content: center;
  justify-content: center;
  color: white;
  fill: currentcolor;
  background: dodgerblue;
  border: none;
  width: var(--size);
  height: var(--size);
  padding: 0.25rem;
  touch-action: manipulation;
  transform: translateY(0);
}

.carousel-control:active {
  transform: translateY(1px);
}

.carousel-control svg {
  width: 100%;
  height: 100%;
  pointer-events: none;
}

.carousel-dots {
  display: flex;
  gap: 1rem;
  padding: 1rem;
}

.carousel-dots .dot {
  --size: 1rem;
  padding: 0;
  font-size: 0;
  color: transparent;
  border: 3px solid white;
  background-color: white;
  border-radius: 50%;
  width: var(--size);
  height: var(--size);
}

.carousel-dots .dot.active {
  background-color: dodgerblue;
}

/* aspect-ratio fallback */
@supports not (aspect-ratio: 16 / 9) {
  .carousel-viewport .item::before {
    content: "";
    float: left;
    padding-top: 56.25%;
  }

  .carousel-viewport .item::after {
    content: "";
    display: block;
    clear: both;
  }
}
</style>
<%@ include file="../common/foot.jspf"%>