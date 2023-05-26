<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="대전 문화 관광" />
<%@ include file="../common/head.jspf"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 슬라이드 효과자리 -->

<script>
  $(document).ready(function() {
    setInterval(function() {
      var current = $('.slider.fe .image input:checked');
      var next = current.next('input');
      var currentLabel = $('.slider.fe .label label[for="' + current.attr('id') + '"]');
      var nextLabel = currentLabel.next('label');

      if (next.length === 0) {
        next = $('.slider.fe .image input:first-child');
        nextLabel = $('.slider.fe .label label:first-child');
      }

      current.removeAttr('checked');
      next.prop('checked', true);

      currentLabel.removeClass('active');
      nextLabel.addClass('active');
    }, 3000); // 3초마다 다음 이미지로 전환 (원하는 시간 간격으로 변경 가능)
  });
</script>


<!-- 슬라이더2 js -->

<script>
$(document).ready(function() {
	  // 슬라이드 요소들을 변수에 할당
	  var options = $(".options .option");
	  var activeOptionIndex = 0; // 현재 활성화된 슬라이드의 인덱스

	  // 이미지 클릭 시 다음 이미지로 슬라이드
	  options.click(function() {
	    options.removeClass("active"); // 모든 슬라이드의 'active' 클래스 제거
	    $(this).addClass("active"); // 클릭한 슬라이드에 'active' 클래스 추가

	    activeOptionIndex = $(this).index(); // 클릭한 슬라이드의 인덱스를 가져옴
	  });

	  // 다음 이미지로 슬라이드하는 함수
	  function slideToNextImage() {
	    options.removeClass("active"); // 모든 슬라이드의 'active' 클래스 제거
	    activeOptionIndex = (activeOptionIndex + 1) % options.length; // 다음 슬라이드의 인덱스 계산
	    options.eq(activeOptionIndex).addClass("active"); // 다음 슬라이드에 'active' 클래스 추가
	  }

	  // 이미지 클릭 시 다음 이미지로 슬라이드되도록 이벤트 리스너 등록
	  options.on("click", slideToNextImage);

	  // 일정 시간마다 자동으로 다음 이미지로 슬라이드되도록 설정
	  setInterval(slideToNextImage, 5000); // 5초마다 슬라이드

	});

</script>


<hr />




<div>링크 주소 자리야</div>

<!-- 변경사항 -->

<div>레이아웃 자리야</div>


<div class="popup text-2xl inline">레이아웃 슬라이드쇼 할꺼야 클릭하면 이동함</div>
<div class="layer-bg"></div>
<div class="layer">
		<div class="flex justify-between">
				<div class="close-btn">
						
						<div></div>
				</div>
		</div>
		
	<!-- 	팝업 구현부 -->
		
		<div>
		
		
		</div>

</div>

<!-- 슬라이더 부  -->
    <div class="slider fe">
        <div class="image">
            <input type="radio" name="input" id="img1" checked>
            <input type="radio" name="input" id="img2">
            <input type="radio" name="input" id="img3">
            <input type="radio" name="input" id="img4">
           
             
            <img src="https://daejeontour.co.kr/ko/atch/atchFileStreamOut.do?atchId=1346&fileSeCode=MAIN_IMAGE_FILE" alt="" class="m1">
            <img src="https://daejeontour.co.kr/ko/atch/atchFileStreamOut.do?atchId=1344&fileSeCode=MAIN_IMAGE_FILE" alt="" class="m2">
            <img src="https://daejeontour.co.kr/ko/atch/atchFileStreamOut.do?atchId=1341&fileSeCode=MAIN_IMAGE_FILE" alt="" class="m3">
            <img src="https://daejeontour.co.kr/ko/atch/atchFileStreamOut.do?atchId=1339&fileSeCode=MAIN_IMAGE_FILE" alt="" class="m4">
        </div>
        <div class="label">
            <label for="img1"></label>
            <label for="img2"></label>
            <label for="img3"></label>
            <label for="img4"></label>
        </div>
    </div>
		
<style>	

.slider.fe .label label {
  display: inline-block;
  width: 10px;
  height: 10px;
  background-color: #ccc;
  border-radius: 50%;
  margin: 0 5px;
  cursor: pointer;
}

.slider.fe .label label:hover,
.slider.fe .label input:checked + label {
  background-color: #f00;
}

.slider {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Cairo', sans-serif;
}

.slider {
    width: 600px;
    height: 450px;
    margin: 100px auto;
    border-radius: 10px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -ms-border-radius: 10px;
    -o-border-radius: 10px;
}

.slider .image {
    position: relative;
}

.slider .image img {
    width: 100%;
    height: 500px;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    transition: .5s linear;
    -webkit-transition: .5s linear;
    -moz-transition: .5s linear;
    -ms-transition: .5s linear;
    -o-transition: .5s linear;
    border-radius: 10px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -ms-border-radius: 10px;
    -o-border-radius: 10px;
    animation-name: slider;
    animation-duration: 15s;
}

.slider .image input {
    display: none;
}

.label {
    display: flex;
    justify-content: center;
    height: 100%;
    align-items: flex-end;
  
}

.label label {
    width: 50px;
    height: 20px;
    border: 3px solid #222;
    margin: 5px;
    cursor: pointer;
    border-radius: 15%;
}

.label label:hover {
    background-color: #222;
}

#img1:checked~.m1 {
    opacity: 1;
}

#img2:checked~.m2 {
    opacity: 1;
}

#img3:checked~.m3 {
    opacity: 1;
}

#img4:checked~.m4 {
    opacity: 1;
}


</style>



				
				
				
<hr class="line">
				<div class="logo_2">
						<em class="blind">대전광역시</em>
				</div>
		</div>
</div>

<div class="container">

<div class="cslider"></div>
		

		<a href="/usr/home/APITest2" class="fa-solid fa-map-location-dot">일단지도</a>
		
		<a href="/usr/info/info" class="fa-solid fa-bowl-food">일단맛집</a>
		
		<a href="/usr/info/info3" class="fa-solid fa-car">일단 교통량</a>
		
		<a href="/usr/info/info4" class="fa-solid fa-bed">일단 숙박</a>
		
       

</div>
<hr class="line">

   
<hr class="line">

<!-- 슬라이드2 구현부 -->
<div class="main2">

<div class="options">
   <div class="option active" style="--optionBackground:url(https://66.media.tumblr.com/6fb397d822f4f9f4596dff2085b18f2e/tumblr_nzsvb4p6xS1qho82wo1_1280.jpg);">
      <div class="shadow"></div>
      <div class="label">
         <div class="icon">
            <i class="fas fa-walking"></i>
         </div>
         <div class="info">
            <div class="main">Blonkisoaz</div>
            <div class="sub">Omuke trughte a otufta</div>
         </div>
      </div>
   </div>
   <div class="option" style="--optionBackground:url(https://66.media.tumblr.com/8b69cdde47aa952e4176b4200052abf4/tumblr_o51p7mFFF21qho82wo1_1280.jpg);">
      <div class="shadow"></div>
      <div class="label">
         <div class="icon">
            <i class="fas fa-snowflake"></i>
         </div>
         <div class="info">
            <div class="main">Oretemauw</div>
            <div class="sub">Omuke trughte a otufta</div>
         </div>
      </div>
   </div>
   <div class="option" style="--optionBackground:url(https://66.media.tumblr.com/5af3f8303456e376ceda1517553ba786/tumblr_o4986gakjh1qho82wo1_1280.jpg);">
      <div class="shadow"></div>
      <div class="label">
         <div class="icon">
            <i class="fas fa-tree"></i>
         </div>
         <div class="info">
            <div class="main">Iteresuselle</div>
            <div class="sub">Omuke trughte a otufta</div>
         </div>
      </div>
   </div>
   <div class="option" style="--optionBackground:url(https://66.media.tumblr.com/5516a22e0cdacaa85311ec3f8fd1e9ef/tumblr_o45jwvdsL11qho82wo1_1280.jpg);">
      <div class="shadow"></div>
      <div class="label">
         <div class="icon">
            <i class="fas fa-tint"></i>
         </div>
         <div class="info">
            <div class="main">Idiefe</div>
            <div class="sub">Omuke trughte a otufta</div>
         </div>
      </div>
   </div>
   <div class="option" style="--optionBackground:url(https://66.media.tumblr.com/f19901f50b79604839ca761cd6d74748/tumblr_o65rohhkQL1qho82wo1_1280.jpg);">
      <div class="shadow"></div>
      <div class="label">
         <div class="icon">
            <i class="fas fa-sun"></i>
         </div>
         <div class="info">
            <div class="main">Inatethi</div>
            <div class="sub">Omuke trughte a otufta</div>
         </div>
      </div>
   </div>
</div>

</div>
<style>

/* 아이콘 구현부 */
.slider2 .container .fa-solid {
	
	flex-direction: row;
	font-size: 4rem;
}

.slider2 .container .fa-solid > * {
 
	margin-right: 20px; /* 원하는 간격 설정 */
}

.slider2 .container{
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
}
.slider2 .container a {
  display: flex justify-between;
  align-items: center; /* a 요소들을 세로 중앙 정렬 */
  margin-right: 20px; /* 간격 설정 */
}

.slider2 .container a:last-child {
  margin-right: 0; /* 마지막 a 요소에는 간격을 주지 않음 */
}


/* 슬라이드2 구현부 */
.main2 {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    height: 100vh;
    font-family: 'Roboto', sans-serif;
    transition: .25s;
}
.main2  .credit {
    position: absolute;
    bottom: 20px;
    left: 20px;
    color: inherit;
}
.main2  .options {
    display: flex;
    flex-direction: row;
    align-items: stretch;
    overflow: hidden;
    min-width: 600px;
    max-width: 900px;
    width: calc(100% - 100px);
    height: 400px;
}
@media screen and (max-width: 718px) {
    .main2  .options {
        min-width: 520px;
    }
    .main2  .options .option:nth-child(5) {
        display: none;
    }
}
@media screen and (max-width: 638px) {
    .main2  .options {
        min-width: 440px;
    }
    .main2  .options .option:nth-child(4) {
        display: none;
    }
}
@media screen and (max-width: 558px) {
    .main2  .options {
        min-width: 360px;
    }
    .main2  .options .option:nth-child(3) {
        display: none;
    }
}
@media screen and (max-width: 478px) {
    .main2  .options {
        min-width: 280px;
    }
    .main2  .options .option:nth-child(2) {
        display: none;
    }
}
.main2  .options .option {
    position: relative;
    overflow: hidden;
    min-width: 60px;
    margin: 10px;
    background: var(--optionBackground, var(--defaultBackground, #E6E9ED));
    background-size: auto 120%;
    background-position: center;
    cursor: pointer;
    transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}
.main2  .options .option:nth-child(1) {
    --defaultBackground:#ED5565;
}
.main2  .options .option:nth-child(2) {
    --defaultBackground:#FC6E51;
}
.main2  .options .option:nth-child(3) {
    --defaultBackground:#FFCE54;
}
.main2  .options .option:nth-child(4) {
    --defaultBackground:#2ECC71;
}
.main2  .options .option:nth-child(5) {
    --defaultBackground:#5D9CEC;
}
.main2  .options .option:nth-child(6) {
    --defaultBackground:#AC92EC;
}
.main2  .options .option.active {
    flex-grow: 10000;
    transform: scale(1);
    max-width: 600px;
    margin: 0px;
    border-radius: 40px;
    background-size: auto 100%;
}
.main2  .options .option.active .shadow {
    box-shadow: inset 0 -120px 120px -120px black, inset 0 -120px 120px -100px black;
}
.main2  .options .option.active .label {
    bottom: 20px;
    left: 20px;
}
.main2  .options .option.active .label .info > div {
    left: 0px;
    opacity: 1;
}
.main2  .options .option:not(.active) {
    flex-grow: 1;
    border-radius: 30px;
}
.main2  .options .option:not(.active) .shadow {
    bottom: -40px;
    box-shadow: inset 0 -120px 0px -120px black, inset 0 -120px 0px -100px black;
}
.main2  .options .option:not(.active) .label {
    bottom: 10px;
    left: 10px;
}
.main2  .options .option:not(.active) .label .info > div {
    left: 20px;
    opacity: 0;
}
.main2  .options .option .shadow {
    position: absolute;
    bottom: 0px;
    left: 0px;
    right: 0px;
    height: 120px;
    transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}
.main2  .options .option .label {
    display: flex;
    position: absolute;
    right: 0px;
    height: 40px;
    transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}
.main2  .options .option .label .icon {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    min-width: 40px;
    max-width: 40px;
    height: 40px;
    border-radius: 100%;
    background-color: white;
    color: var(--defaultBackground);
}
.main2  .options .option .label .info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 10px;
    color: white;
    white-space: pre;
}
.main2  .options .option .label .info > div {
    position: relative;
    transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95), opacity 0.5s ease-out;
}
.main2  .options .option .label .info .main {
    font-weight: bold;
    font-size: 1.2rem;
}
.main2  .options .option .label .info .sub {
    transition-delay: .1s;
}


</stlye>





/* 버튼 추가할꺼 주석

<div class="centerer">


  <div class="wrap">
    <a class="btn-0" href="#">Swipe</a>
  </div>
  
</div>

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400|Raleway:300);

:root {
  --btn-width: 250px;
  --btn-height: 80px;
  --btn-full: calc(var(--btn-height) + var(--btn-width));
  --btn-half: calc(var(--btn-full) / 2);
  --bg-color: #eeeeee;
}

html {
  padding-top: 50px;
  font-family: 'Open Sans', Helvetica, arial, sans-serif;
  text-align: center;
  background-color: var(--bg-color);
}

*,
*:before,
*:after {
  box-sizing: border-box;
  transition: 0.5s ease-in-out;
}

i,
em,
b,
strong,
span {
  transition: none;
}

*:before,
*:after {
  z-index: -1;
}

body {
  line-height: 1;
}

a {
  text-decoration: none;
  line-height: var(--btn-height);
  color: black;
}

.centerer {
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  padding: 0 1rem;
}

@media (min-width: 600px) {
  .wrap {
    width: 50%;
    float: left;
  }
}

[class^="btn-"] {
  position: relative;
  display: block;
  overflow: hidden;
  width: 100%;
  height: var(--btn-height);
  max-width: var(--btn-width);
  margin: 1rem auto;
  text-transform: uppercase;
  border: 1px solid currentColor;
}

.btn-0 {
  --btn-color: random-color($max: 200);
  --btn-color-dark: shade(var(--btn-color), 40%);
  color: tint(var(--btn-color));

  &:before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: var(--btn-color-dark);
    transform: translateX(-100%);
  }

  &:hover {
    color: tint(var(--btn-color), 75%);

    &:before {
      transform: translateX(0);
    }
  }
}




 */





<%@ include file="../common/foot.jspf"%>