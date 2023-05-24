<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="대전 문화 관광" />
<%@ include file="../common/head.jspf"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<div class ="exam">

<div class ="exam2">

</div>

</div>

  <script src="https://replit.com/public/js/replit-badge-v2.js" theme="dark" position="bottom-right">

var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/6300000/eventDataService/eventDataListJson'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'	LoGiR/OBTqIJAVGIVOlUyeqKpNoHrBcwxk1uDmd72JiN4LdaqZBVCQcBp6qrgK3M6g+Sh/ZM0vWPEz3y3pgQOQ=='; /*Service Key*/
queryParams += '&' + encodeURIComponent('') + '=' + encodeURIComponent(''); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');

    
  </script>
<style>
.exam>.exam2{
 height: 300px;
 width: 300px;
 }
</style>


<%@ include file="../common/foot.jspf"%>
