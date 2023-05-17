<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<hr />
<div>링크 주소 자리야</div>

<div class="container">


		<br />

		<a href="/usr/home/APITest4" class="fa-solid fa-map-location-dot">길찾기</a>
		<br />
		<a href="/usr/info/info2" class="fa-solid fa-car">교통정보</a>
		<br />
		<a href="/usr/info/info3" class="fa-solid fa-restroom">공중 화장실</a>
		<br />
		<a href="/usr/info/info4" class="fa-solid fa-restroom">대충딴거</a>
		<br />


</div>


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
				<ul>
						<li>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">~~~~소개</a>
						</li>
						<li>
								<a href="">~~~~소개의</a>
						</li>
				</ul>
				<div class="logo_2">
						<em class="blind">대전광역시</em>
				</div>
		</div>

<%@ include file="../common/foot.jspf"%>