<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 15.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>

<script>
	var goInfo = function(menu, no) {
		location.href = '?menu='+menu+'&no='+no;
	};
</script>
</head>
<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>韩国旅游信息</li><li class="end">韩国交通信息</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="info.do?menu=info&no=1"><li class="small <c:if test="${travelInfo.menu=='info'}">on</c:if>">韩国旅游消息</li></a><!--한국여행정보--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="info.do?menu=traffic&no=7"><li <c:if test="${travelInfo.menu=='traffic'}">class="on"</c:if>>韩国交通信息</li></a><!--한국교통정보-->
            <a href="info.do?menu=communication&no=13"><li <c:if test="${travelInfo.menu=='communication'}">class="on"</c:if>>通信,无线网,接送</li></a><!--통신,와이파이,픽업-->
            <a href="list_location.do?no=16&location_no=12"><li>地区信息</li></a><!--지역별정보-->
            <a href="list.do?travel_category_no=9"><li>Rail Pass</li></a><!--Rail Pass-->
            <a href="list.do?travel_category_no=10"><li>其他信息</li></a><!--기타한국정보-->
        </ul>
        <c:choose>
        	<c:when test="${menu=='info'}">
		        <ul class="travel_tab">
		        <li <c:if test="${travelInfo.no==1}">class="on"</c:if> onclick="goInfo('info', '1');"><a href="?menu=info&no=1"><img src="/resources/img/menu/travel_icon01.png" alt="天气" /></a></li><!--날씨-->
		        <li <c:if test="${travelInfo.no==2}">class="on"</c:if> onclick="goInfo('info', '2');"><a href="?menu=info&no=2"><img src="/resources/img/menu/travel_icon02.png" alt="出入境方法" /></a></li><!--출입국방법-->
		        <li <c:if test="${travelInfo.no==3}">class="on"</c:if> onclick="goInfo('info', '3');"><a href="?menu=info&no=3"><img src="/resources/img/menu/travel_icon03.png" alt="汇率与兑换" /></a></li><!--환율환전-->
		        <li <c:if test="${travelInfo.no==4}">class="on"</c:if> onclick="goInfo('info', '4');"><a href="?menu=info&no=4"><img src="/resources/img/menu/travel_icon04.png" alt="韩国休息日" /></a></li><!--한국휴일-->
		        <li <c:if test="${travelInfo.no==5}">class="on"</c:if> onclick="goInfo('info', '5');"><a href="?menu=info&no=5"><img src="/resources/img/menu/travel_icon05.png" alt="紧急事项" /></a></li><!--다급한일-->
		        <li <c:if test="${travelInfo.no==6}">class="on"</c:if> onclick="goInfo('info', '6');"><a href="?menu=info&no=6"><img src="/resources/img/menu/travel_icon06.png" alt="其他旅行贴士" /></a></li><!--기타여행팁-->
		        </ul>
        	</c:when>
        	<c:when test="${menu=='traffic'}">
		        <ul class="travel_tab">
		        <li <c:if test="${travelInfo.no==7}">class="on"</c:if> onclick="goInfo('traffic', '7');"><a href="?menu=traffic&no=7"><img src="/resources/img/menu/traffic_icon01.png" alt="天气" /></a></li><!--공항-->
		        <li <c:if test="${travelInfo.no==8}">class="on"</c:if> onclick="goInfo('traffic', '8');"><a href="?menu=traffic&no=8"><img src="/resources/img/menu/traffic_icon02.png" alt="出入境方法" /></a></li><!--비행기-->
		        <li <c:if test="${travelInfo.no==9}">class="on"</c:if> onclick="goInfo('traffic', '9');"><a href="?menu=traffic&no=9"><img src="/resources/img/menu/traffic_icon03.png" alt="汇率与兑换" /></a></li><!--택시-->
		        <li <c:if test="${travelInfo.no==10}">class="on"</c:if> onclick="goInfo('traffic', '10');"><a href="?menu=traffic&no=10"><img src="/resources/img/menu/traffic_icon04.png" alt="韩国休息日" /></a></li><!--버스-->
		        <li <c:if test="${travelInfo.no==11}">class="on"</c:if> onclick="goInfo('traffic', '11');"><a href="?menu=traffic&no=11"><img src="/resources/img/menu/traffic_icon05.png" alt="紧急事项" /></a></li><!--지하철-->
		        <li <c:if test="${travelInfo.no==12}">class="on"</c:if> onclick="goInfo('traffic', '12');"><a href="?menu=traffic&no=12"><img src="/resources/img/menu/traffic_icon06.png" alt="其他旅行贴士" /></a></li><!--기차-->
		        </ul>
        	</c:when>
			<c:when test="${menu=='communication'}">
		        <ul class="travel_tab_big">
		        <li <c:if test="${travelInfo.no==13}">class="on"</c:if> onclick="goInfo('communication', '13');"><a href="?menu=communication&no=13"><img src="/resources/img/menu/communications_icon01.png" alt="天气" /></a></li><!--통신-->
		        <li <c:if test="${travelInfo.no==14}">class="on"</c:if> onclick="goInfo('communication', '14');"><a href="?menu=communication&no=14"><img src="/resources/img/menu/communications_icon02.png" alt="出入境方法" /></a></li><!--와이파이-->
		        <li <c:if test="${travelInfo.no==15}">class="on"</c:if> onclick="goInfo('communication', '15');"><a href="?menu=communication&no=15"><img src="/resources/img/menu/communications_icon03.png" alt="汇率与兑换" /></a></li><!--픽업-->
		        </ul>
        	</c:when>
        </c:choose>
        <div class="travel_content">
        	${travelInfo.content }
        </div>
        <div class="bt_right"><a href="#"><img src="/resources/img/button/bt_top.png" alt="top" /></a></div>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
	
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
