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
<script src="/resources/js/message.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-CN"></script>
<script>
	$(document).ready(function() {
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		subPage = Number("${subList.page}");
		subPageSize = Number("${subList.pageSize}");
		subCurrentBlock = Number("${subList.currentBlock}");
		subTotalBlock = Number("${subList.totalBlock}");
		subStartPageNum = Number("${subList.startPageNum}");
		subEndPageNum = Number("${subList.endPageNum}");

		var travel_category_no = "${travel_category_no}";
		firstTapChange(travel_category_no);

		var travel_category_no2 = "${travel_category_no2}";
		secondTapChange(travel_category_no2);


		if (location_no != "17") {
			var x = '${headerInfo.x}',
				y = '${headerInfo.y}';

			var mapOptions = {
					zoom: 9, //원래10
					center: new google.maps.LatLng(y, x),
					mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById('st_map_view'), mapOptions);
		}
		
		$("#menu_1").click(function() {
			location.href = '?travel_category_no=5&location_no=${location_no}&page=1&travel_category_no2=${travel_category_no2}&page2='+subPage;
		});
		$("#menu_2").click(function() {
			location.href = '?travel_category_no=6&location_no=${location_no}&page=1&travel_category_no2=${travel_category_no2}&page2='+subPage;
		});
		$("#menu_3").click(function() {
			location.href = '?travel_category_no=${travel_category_no}&page='+page+'&travel_category_no2=7&location_no=${location_no}&page2=1';
		});
		$("#menu_4").click(function() {
			location.href = '?travel_category_no=${travel_category_no}&page='+page+'&travel_category_no2=8&location_no=${location_no}&page2=1';
		});

	});
	
	var location_no = '${location_no}',
		no = '${no}';

	var img = {
		on: [ "/resources/img/menu/travel_area_tab01_on.png", "/resources/img/menu/travel_area_tab02_on.png", "/resources/img/menu/travel_area_tab03_on.png", "/resources/img/menu/travel_area_tab04_on.png" ],
		off: [ "/resources/img/menu/travel_area_tab01.png", "/resources/img/menu/travel_area_tab02.png", "/resources/img/menu/travel_area_tab03.png", "/resources/img/menu/travel_area_tab04.png" ]
	};

	var firstTapChange = function(travel_category_no) {
		if (travel_category_no == '5') {
			$("#menu_1").addClass("sel");
			$("#menu_2").removeClass("sel");
			$("#menu_1 > img").attr("src", img.on[0]);
			$("#menu_2 > img").attr("src", img.off[1]);
		} else if (travel_category_no == '6') {
			$("#menu_1").removeClass("sel");
			$("#menu_2").addClass("sel");
			$("#menu_1 > img").attr("src", img.off[0]);
			$("#menu_2 > img").attr("src", img.on[1]);
		}
	};
	var secondTapChange = function(travel_category_no) {
		if (travel_category_no == '7') {
			$("#menu_3").addClass("sel");
			$("#menu_4").removeClass("sel");
			$("#menu_3 > img").attr("src", img.on[2]);
			$("#menu_4 > img").attr("src", img.off[3]);
		} else if (travel_category_no == '8') {
			$("#menu_3").removeClass("sel");
			$("#menu_4").addClass("sel");
			$("#menu_3 > img").attr("src", img.off[2]);
			$("#menu_4 > img").attr("src", img.on[3]);
		}
	};

	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+(startPageNum-1)+'&travel_category_no2=${travel_category_no2}&page2='+subPage;
		}else{
			alert(m.bbs.prev);
		}
	}
	// 다음  페이지
	function nextPage(){
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+(endPageNum)+'&travel_category_no2=${travel_category_no2}&page2='+subPage;
		}else{
			alert(m.bbs.next);
		}
	}
	function goPage(goPage){
		location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+goPage+'&travel_category_no2=${travel_category_no2}&page2='+subPage;
	}
	function view(travel_no) {
		location.href = 'view.do?travel_category_no=${travel_category_no}&travel_no='+travel_no+'&location_no='+location_no+'&no='+no;
	}
	
	
	
	// 서브 이전 페이지
	function subPrevPage(){
		if( subCurrentBlock != 1 ){
			location.href = '?travel_category_no=${travel_category_no}&page='+page+'&travel_category_no2=${travel_category_no2}&location_no=${location_no}&page2='+(subStartPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}
	// 서브 다음  페이지
	function subNextPage(){
		if( subCurrentBlock != subTotalBlock && subTotalBlock != 0 ){ 
			location.href = '?travel_category_no=${travel_category_no}&page='+page+'&travel_category_no2=${travel_category_no2}&location_no=${location_no}&page2='+(subEndPageNum);
		}else{
			alert(m.bbs.next);
		}
	}
	function subGoPage(goPage){
		location.href = '?travel_category_no=${travel_category_no}&page='+page+'&travel_category_no2=${travel_category_no2}&location_no=${location_no}&page2='+goPage;
	}
	function subView(travel_no) {
		location.href = 'view.do?travel_category_no=${travel_category_no2}&travel_no='+travel_no+'&location_no='+location_no+'&no='+no;
	}
</script>
</head>


<body>

<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
        	<li>韩国旅游信息</li>
        	<li>地区信息</li>
        	<li class="end">
        		<c:if test="${location_no == 12 }">首尔</c:if>
        		<c:if test="${location_no == 13 }">济州</c:if>
        		<c:if test="${location_no == 14 }">京畿</c:if>
        		<c:if test="${location_no == 15 }">釜山</c:if>
        		<c:if test="${location_no == 16 }">江原</c:if>
        		<c:if test="${location_no == 17 }">其他地区</c:if>
        	</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="info.do?menu=info&no=1"><li class="small">韩国旅游消息</li></a><!--한국여행정보--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="info.do?menu=traffic&no=7"><li>韩国交通信息</li></a><!--한국교통정보-->
            <a href="info.do?menu=communication&no=13"><li>通信,无线网,接送</li></a><!--통신,와이파이,픽업-->
            <a href="list_location.do?no=16&location_no=12"><li class="on">地区信息</li></a><!--지역별정보-->
            <a href="list.do?travel_category_no=9"><li>Rail Pass</li></a><!--Rail Pass-->
            <a href="list.do?travel_category_no=10"><li>其他信息</li></a><!--기타한국정보-->
        </ul>
        <br/>
        <ul class="board_tab">
        	<a href="list_location.do?no=16&location_no=12"><li <c:if test="${travelInfo.no == 16 }">class="on"</c:if>>首尔</li></a>| <!--서울-->
            <a href="list_location.do?no=17&location_no=13"><li <c:if test="${travelInfo.no == 17 }">class="on"</c:if>>济州</li></a>| <!--제주-->
            <a href="list_location.do?no=18&location_no=14"><li <c:if test="${travelInfo.no == 18 }">class="on"</c:if>>京畿</li></a>| <!--경기-->
            <a href="list_location.do?no=19&location_no=15"><li <c:if test="${travelInfo.no == 19 }">class="on"</c:if>>釜山</li></a>| <!--부산-->
            <a href="list_location.do?no=20&location_no=16"><li <c:if test="${travelInfo.no == 20 }">class="on"</c:if>>江原</li></a>| <!--강원-->
            <a href="list_location.do?no=21&location_no=17"><li <c:if test="${travelInfo.no == 21 }">class="on"</c:if>>其他地区</li></a> <!--기타지역-->
        </ul>
        <div class="map" style="margin-top:30px;">
           	<div class="place_map" id="st_map_view"><c:if test="${location_no == 17 }">${mapInfo.content}</c:if></div><!--지도-->
            <div class="place_txt"><!--설명-->
            	${travelInfo.content}
            </div>
        </div>
        <!---------------------------------------로드맵, 추천여행지----------------------------------------->
        <ul class="tab_detail_c2" style="margin-top:50px;">
            <li class="sel hand" id="menu_2"><img src="/resources/img/menu/travel_area_tab02_on.png" alt="推荐旅游地点" /></li><!--추천여행지-->
        	<li class="end hand" id="menu_1"><img src="/resources/img/menu/travel_area_tab01.png" alt="路线图" /></li><!--로드맵-->
        </ul>
		<%-- <iframe style="width: 762px;" src="/travel/list_location_iframe.do?travel_category_no=6&location_no=${location_no}" onload="autoResize(this)" scrolling="no" frameborder="0"></iframe> --%>
		<table class="travel_area_list" id="travel_area_list">
		<colgroup>
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
		</colgroup>
           <c:choose>
           	<c:when test="${fn:length(list) > 0 }">
           		<c:forEach items="${list}" var="data" varStatus="status">
           			<fmt:parseNumber var="nowline" integerOnly="true" value="${(status.index)/3}" />
           			<c:if test="${status.index % 3 == 0 }"><c:set value="0" var="i" /><tr></c:if>
					<c:if test="${status.index % 3 > 0 }"><td></td></c:if>
					<td onclick="javascript:view('${data.travel_no}')" class="hand">
						<c:choose>
							<c:when test="${data.image != ''}">
								<img src="http://www.wingkostory.com/upload/travel/${data.image}" alt="" class="travel_image" /><br /><c:out value="${fn:substring(data.title, 0, 14)}" escapeXml="false" /><%-- (${data.ripple_count}) --%>
							</c:when>
							<c:otherwise>
								<img src="/resources/img/defalt_img_208_130.gif" alt="" class="travel_image" /><br /><c:out value="${fn:substring(data.title, 0, 14)}" escapeXml="false" /><%-- (${data.ripple_count}) --%>
							</c:otherwise>
						</c:choose>
					</td>
           			<c:if test="${status.index % 3 == 2 }"></tr></c:if>
           			<c:set value="${i+1}" var="i" />
           		</c:forEach>
           		<c:forEach var="j" begin="1" end="3" step="1">
           			<c:if test="${i < j }"><td></td><td></td><c:set value="${i+1}" var="i" /></c:if>
           			<c:if test="${i == 3 }"></tr></c:if>
           		</c:forEach>
           	</c:when>
           	<c:otherwise>
           		<tr><th colspan="5">데이터가 없습니다.</th></tr>
           	</c:otherwise>
           </c:choose>
       </table>

	<!-- page nav -->
       <ul class="page_number" style="margin-top:0;"><!--페이지번호-->
		<li onclick="javascript:prevPage();"><img src="/resources/img/menu/page_prev.png" alt="prev" /></li>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="i" begin="${list.startPageNum}" end="${list.endPageNum}" step="1">
					<c:if test="${!(i > list.totalPage) && !(i==list.endPageNum)}">
						<c:choose>
			    			<c:when test="${i == list.page}">
			    				<li onclick="javascript:goPage(${i})" class="on">${i}</li>
							</c:when>
				    		<c:otherwise>
				    			<li onclick="javascript:goPage(${i})">${i}</li>
				    		</c:otherwise>
			    		</c:choose>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise><li class="on">1</li></c:otherwise>
		</c:choose>
		 <li class="end" onclick="javascript:nextPage();"><img src="/resources/img/menu/page_next.png" alt="next" /></li>
	</ul>

        <!---------------------------------------주요명소, 추천명소----------------------------------------->
        <ul class="tab_detail_c2" style="margin-top:50px;">
        	<li class="sel hand" id="menu_3"><img src="/resources/img/menu/travel_area_tab03_on.png" alt="主要景点" /></li><!--주요명소-->
            <li class="end hand" id="menu_4"><img src="/resources/img/menu/travel_area_tab04.png" alt="推荐景点" /></li><!--추천명소-->
        </ul>
        <%-- <iframe style="width: 762px;" src="/travel/list_location_iframe.do?travel_category_no=7&location_no=${location_no}" onload="autoResize(this)" scrolling="no" frameborder="0"></iframe> --%>
        <table class="travel_area_list" id="travel_area_list">
		<colgroup>
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
		</colgroup>
           <c:choose>
           	<c:when test="${fn:length(subList) > 0 }">
           		<c:forEach items="${subList}" var="data" varStatus="status">
           			<fmt:parseNumber var="nowline" integerOnly="true" value="${(status.index)/3}" />
           			<c:if test="${status.index % 3 == 0 }"><c:set value="0" var="i" /><tr></c:if>
					<c:if test="${status.index % 3 > 0 }"><td></td></c:if>
					<td onclick="javascript:subView('${data.travel_no}')" class="hand">
						<c:choose>
							<c:when test="${data.image != ''}">
								<img src="http://www.wingkostory.com/upload/travel/${data.image}" alt="" class="travel_image" /><br /><c:out value="${fn:substring(data.title, 0, 14)}" escapeXml="false" /><%-- (${data.ripple_count}) --%>
							</c:when>
							<c:otherwise>
								<img src="/resources/img/defalt_img_208_130.gif" alt="" class="travel_image" /><br /><c:out value="${fn:substring(data.title, 0, 14)}" escapeXml="false" /><%-- (${data.ripple_count}) --%>
							</c:otherwise>
						</c:choose>
					</td>
           			<c:if test="${status.index % 3 == 2 }"></tr></c:if>
           			<c:set value="${i+1}" var="i" />
           		</c:forEach>
           		<c:forEach var="j" begin="1" end="3" step="1">
           			<c:if test="${i < j }"><td></td><td></td><c:set value="${i+1}" var="i" /></c:if>
           			<c:if test="${i == 3 }"></tr></c:if>
           		</c:forEach>
           	</c:when>
           	<c:otherwise>
           		<tr><th colspan="5">데이터가 없습니다.</th></tr>
           	</c:otherwise>
           </c:choose>
       </table>

	<!-- page nav -->
       <ul class="page_number" style="margin-top:0;"><!--페이지번호-->
		<li onclick="javascript:subPrevPage();"><img src="/resources/img/menu/page_prev.png" alt="prev" /></li>
		<c:choose>
			<c:when test="${fn:length(subList) > 0}">
				<c:forEach var="i" begin="${subList.startPageNum}" end="${subList.endPageNum}" step="1">
					<c:if test="${!(i > subList.totalPage) && !(i==subList.endPageNum)}">
						<c:choose>
			    			<c:when test="${i == subList.page}">
			    				<li onclick="javascript:subGoPage(${i})" class="on">${i}</li>
							</c:when>
				    		<c:otherwise>
				    			<li onclick="javascript:subGoPage(${i})">${i}</li>
				    		</c:otherwise>
			    		</c:choose>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise><li class="on">1</li></c:otherwise>
		</c:choose>
		 <li class="end" onclick="javascript:subNextPage();"><img src="/resources/img/menu/page_next.png" alt="next" /></li>
	</ul>

    </div>


    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />

</div>

	<!-- BOTTOM Include -->
	<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
