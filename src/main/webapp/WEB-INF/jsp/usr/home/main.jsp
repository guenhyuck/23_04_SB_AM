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





<hr />




<div>링크 주소 자리야</div>

<!-- 변경사항11 -->

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
		<a href="">얘네 크기 늘리고 슬라이드쇼 해</a>

		<a href="/usr/home/APITest2" class="fa-solid fa-map-location-dot">일단지도</a>
		
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


</stlye>




<%@ include file="../common/foot.jspf"%>