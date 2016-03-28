<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 14.
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
<script language="javascript">
	$(document).ready( function() {
		for(var i=1; i<=11; i++) {
			(new Image).src = "/resources/img/map/map" + i + ".gif";
		}
		var arr_location_no = ['', '12', '14', '16', '72', '73', '74', '75', '77', '76', '15', '13'];
		$("map[name='MMap'] > area")
			.each( function() {
				if ($(this).attr("fa") < 4 || $(this).attr("fa") > 9 ) {
					$(this).attr("href", "/location/main.do?location_no=" + arr_location_no[$(this).attr("fa")]);	
				} else {
					$(this).attr("href", "/location/detail.do?location_no=" + arr_location_no[$(this).attr("fa")]);
				}
			})
			.mouseover( function() {
				$("#MMap").attr("src", "/resources/img/map/map" + $(this).attr("fa") + ".gif");
			})
			.mouseout( function(){
				$("#MMap").attr("src", "/resources/img/map/map0.gif"); 
			});
	});
	
	function goSubLocation(location_no) {
		location.href = "/location/detail.do?location_no="+location_no;
	}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>地区</li><li class="end">${headerInfo.name}</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="main.do?location_no=12"><li <c:if test="${location_no == '12'}">class="on"</c:if>>首尔</li></a>
            <a href="main.do?location_no=13"><li <c:if test="${location_no == '13'}">class="on"</c:if>>济州</li></a>
            <a href="main.do?location_no=14"><li <c:if test="${location_no == '14'}">class="on"</c:if>>京畿</li></a>
            <a href="main.do?location_no=15"><li <c:if test="${location_no == '15'}">class="on"</c:if>>釜山</li></a>
            <a href="main.do?location_no=16"><li <c:if test="${location_no == '16'}">class="on"</c:if>>江原</li></a>
            <a href="main.do?location_no=17"><li <c:if test="${location_no == '17'}">class="on"</c:if>>其他</li></a>
        </ul>
        <div class="area_detail"><!--지도, 지역리스트-->
        	<div class="map">
            	<div class="map_detail">${headerInfo.header_info}</div>
                <div class="map_korea">
					<img src="/resources/img/map/map0.gif" name="IMap" border="0" usemap="#MMap" id="MMap"/>
					<map name="MMap">
						<area shape="poly" fa="1" coords="64,97,66,96,68,92,72,90,74,91,76,93,78,96,78,97,77,101,75,105,72,105,67,103,64,102,62,100"  href="#" /><!--서울-->
						<area shape="poly" fa="2" coords="75,61,70,68,66,71,62,77,60,78,59,81,58,87,56,87,53,90,56,95,56,99,58,105,61,108,64,112,63,114,59,114,59,119,62,122,66,126,67,131,74,128,78,129,82,131,87,127,93,123,97,120,99,116,102,115,102,107,104,98,94,92,92,88,93,83,96,79,92,75,88,69,81,66,75,60" href="#" /><!--경기-->
						<area shape="poly" fa="3" coords="77,60,79,66,82,65,84,69,89,68,90,73,97,79,93,85,94,92,98,94,103,96,104,98,104,104,102,113,103,118,109,117,111,114,115,115,122,115,124,118,131,119,136,122,145,122,149,121,152,121,156,121,160,121,163,119,165,116,153,96,149,88,142,78,134,67,125,47,120,53,115,57,109,58,99,57,93,58,85,59,77,59" href="#" /><!--강원-->
						<area shape="poly" fa="4" coords="84,130,88,138,86,139,84,147,86,149,88,152,92,156,93,160,91,165,96,168,96,173,96,179,90,175,86,171,79,172,77,172,73,168,68,171,67,172,62,177,59,177,55,171,54,166,54,159,53,153,52,147,49,146,45,145,40,141,40,138,40,134,44,132,48,131,48,128,52,126,58,126,64,130,73,129,84,130" href="#" /><!--충청남도-->
						<area shape="poly" fa="5" coords="138,123,131,127,131,130,130,133,127,136,123,135,121,134,117,135,114,138,114,142,111,142,108,146,108,146,108,152,108,161,110,163,113,167,112,172,111,177,106,178,99,176,97,174,96,167,93,165,91,163,93,159,91,155,89,151,87,149,85,146,85,142,86,140,87,138,86,134,85,131,89,126,93,124,99,118,104,117,109,115,116,115,120,115,131,120,137,123" href="#" /><!--충청북도-->
						<area shape="poly" fa="6" coords="58,176,59,181,62,183,63,184,63,185,61,187,59,190,53,195,54,197,58,197,59,198,56,201,53,201,51,205,53,209,55,211,61,207,67,203,73,204,79,210,87,212,93,210,96,210,99,210,100,206,102,202,99,198,101,191,106,185,111,179,105,179,97,174,94,178,87,172,85,172,78,173,73,169,65,174,60,177" href="#" /><!--전라북도-->
						<area shape="poly" fa="7" coords="52,206,55,212,60,210,64,205,69,203,73,205,76,206,78,209,79,211,84,212,88,212,91,211,96,209,98,211,98,213,97,217,102,226,104,230,99,233,101,236,102,236,106,236,106,238,103,241,102,241,99,245,98,242,97,238,95,236,93,235,91,241,94,243,95,245,94,248,91,250,89,255,86,253,82,250,82,248,86,246,86,241,85,240,81,241,77,244,74,249,73,251,72,254,67,254,65,249,62,255,59,258,56,262,52,256,51,252,46,248,44,243,47,241,50,242,52,243,53,241,52,237,50,235,47,229,45,225,41,222,46,219,49,217,47,213,48,208" href="#" /><!--전라남도-->
						<area shape="poly" fa="8" coords="165,117,169,121,169,131,171,138,170,144,170,151,168,161,169,165,170,171,169,176,174,176,176,175,174,181,172,191,169,194,165,194,161,191,155,195,152,196,142,198,138,196,133,196,127,195,122,193,117,187,109,185,110,178,112,171,113,166,109,161,108,145,113,143,115,138,120,134,126,137,130,132,132,127,138,123,149,122,159,122" href="#" /><!--경상북도-->
						<area shape="poly" fa="9" coords="156,195,155,202,160,203,165,209,156,217,149,222,141,223,138,220,138,225,132,225,133,229,131,232,133,237,131,241,129,238,127,232,125,231,122,232,120,234,116,231,115,228,115,225,112,229,107,232,104,230,101,224,96,217,99,210,101,203,100,199,100,195,101,191,105,187,109,184,117,188,121,193,127,196,133,197,138,197,142,198,150,197" href="#" /><!--경상남도-->
						<area shape="poly" fa="10" coords="153,221,153,227,159,222,163,219,164,214,167,210,170,207,172,198,168,195,161,193,157,192,156,197,157,202,163,205,163,210,155,218,150,222" href="#" /><!--부산-->
						<area shape="poly" fa="11" coords="37,283,42,278,50,276,59,274,65,274,67,280,64,285,58,287,52,288,43,289,39,289,35,285" href="#" /><!--제주도-->
					</map>
               	</div>
            </div>
            <table class="area_list">
            	<caption>지역리스트</caption>
                <colgroup>
                	<col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                </colgroup>
                
                <c:choose>
                	<c:when test="${fn:length(subList) > 0 }">
                		<fmt:parseNumber var="line" integerOnly="true" value="${fn:length(subList)/4 }" />
                		<c:forEach items="${subList }" var="data" varStatus="status">
                 			<c:if test="${status.index % 4 == 0}"><tr></c:if>
                 				<c:choose>
                 					<c:when test="${status.index / 4 < line}">
                						<td><a href="/location/detail.do?location_no=${data.location_no }">${data.name }</a></td>
                					</c:when>
                					<c:otherwise>
                						<td class="end"><a href="/location/detail.do?location_no=${data.location_no }">${data.name }</a></td>
                					</c:otherwise>
                				</c:choose>
                			<c:if test="${status.index % 4 == 3 }"></tr></c:if>
                		</c:forEach>
                	</c:when>
                </c:choose>
           </table>
        </div>
        <div class="sub_tit">
        	<c:if test="${fn:length(hotPlace) > 0}">
            <div class="best1"></div><!--seoul hot place best1 아이콘 절대값-->
            <div class="best2"></div><!--seoul hot place best2 아이콘 절대값-->
            <div class="best3"></div><!--seoul hot place best3 아이콘 절대값-->
            </c:if>
            <c:choose>
            	<c:when test="${location_no == '12' }"><img src="/resources/img/title/seoul_hot_place.png" alt="Seoul Hot Place" /></c:when>
            	<c:when test="${location_no == '13' }"><img src="/resources/img/title/jeju_hot_place.png" alt="Seoul Hot Place" /></c:when>
            	<c:when test="${location_no == '14' }"><img src="/resources/img/title/gyeonggi_hot_place.png" alt="Seoul Hot Place" /></c:when>
            	<c:when test="${location_no == '15' }"><img src="/resources/img/title/busan_hot_place.png" alt="Seoul Hot Place" /></c:when>
            	<c:when test="${location_no == '16' }"><img src="/resources/img/title/gangwon_hot_place.png" alt="Seoul Hot Place" /></c:when>
            	<c:when test="${location_no == '17' }"><img src="/resources/img/title/others_hot_place.png" alt="Seoul Hot Place" /></c:when>
            </c:choose>
        </div>
		<table class="hot_list">
            <caption>서울 핫 플레이스</caption>
            <colgroup>
              	<col width="208px" />
                <col width="69px" />
              	<col width="208px" />
                <col width="69px" />
              	<col width="208px" />
            </colgroup>

            <c:choose>
            	<c:when test="${fn:length(hotPlace) > 0}">
            		<c:forEach var="data" items="${hotPlace}" varStatus="status">
            			<c:if test="${status.index % 3 == 0 }">
            				<tr>
            				<c:set value="0" var="i" />
            			</c:if>
            			
            			<c:if test="${i > 0 }"><td></td></c:if>

            			<c:choose>
            				<c:when test="${status.index < 3}">
	            				<td class="hand best" onclick="javascript:goSubLocation('${data.location_no}');">
				                	<div class="pic_best"><img src="http://www.wingkostory.com/upload/location/${data.image}" alt="" />${data.memo}</div>
				                </td>
            				</c:when>
            				<c:otherwise>
            					<td class="hand" onclick="javascript:goSubLocation('${data.location_no}');"><img src="http://www.wingkostory.com/upload/location/${data.image}" alt="" />${data.memo}</td>
            				</c:otherwise>
            			</c:choose>
            			
						<c:if test="${status.index % 3 == 2 }"></tr></c:if>
						<c:set value="${i+1}" var="i" />

            		</c:forEach>
            	</c:when>
            	<c:otherwise>데이터가 없습니다.</c:otherwise>
            </c:choose>
       </table>
        <c:if test="${ad != null}">
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" /></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
    
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
