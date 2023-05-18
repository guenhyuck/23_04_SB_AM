<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Test3" />

<%@ include file="../common/head.jspf"%>





<div id="googleMap" style="width: 100%;height: 700px;"></div>

<script>
   function myMap(){
      var mapOptions = { 
            center:new google.maps.LatLng(51.508742, -0.120850),
            zoom:5
      };
 
      var map = new google.maps.Map( 
             document.getElementById("googleMap") 
            , mapOptions );
   }
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq3dzxLVXjDuYYbkgoEC-xu7fejhiFd_ccallback=myMap"></script>

<%@ include file="../common/foot.jspf"%>