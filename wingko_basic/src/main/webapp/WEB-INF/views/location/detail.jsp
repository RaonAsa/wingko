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
<script src="/resources/js/message.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-CN"></script>
<script>
	$(document).ready(function(){
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

		var parent_category_no = "${parent_category_no}";
		categoryChange(parent_category_no);
		
		var sub_menu = "${sub_menu}";
		subChange(sub_menu);

		var x = '${headerInfo.x}',
			y = '${headerInfo.y}';
		var mapOptions = {
				zoom: 15,
				center: new google.maps.LatLng(y, x),
				mapTypeId: google.maps.MapTypeId.ROADMAP
		};


		var map = new google.maps.Map(document.getElementById('st_map_view'), mapOptions);
/* 		var infoWindow = new google.maps.InfoWindow();
		var x = "${headerInfo.x}";
		var y = "${headerInfo.y}";
		var title = "${headerInfo.name}";

		google.maps.event.addListener(map, "click", function(){
			infoWindow.close();
		}); */

/* 		makeMarker({
			position: new google.maps.LatLng(y, x),
			title: title,
			icon: "/resources/img/icon/pin.png",
			content: "<table><tr><td rowspan='2'><img src='http://www.wingkostory.com/upload/${store.image_thumb}' class='map_image'/></td><td class='map_title'>${store.title}</td></tr><tr><td class='map_addr'>${store.address}</td></tr></table>"
		}); */

		function makeMarker(options){
			var pushPin = new google.maps.Marker({map:map});
			pushPin.setOptions(options);

			google.maps.event.addListener(pushPin, "click", function(){
				infoWindow.setOptions(options);
				infoWindow.open(map, pushPin);
				//if(this.sidebarButton)this.sidebarButton.button.focus();
			});
			//markerBounds.extend(options.position);
			//markerArray.push(pushPin);
		}
	});
	
	
	var categoryChange = function(parent_category_no) {
		if (parent_category_no == '8') {
			$("#category_8").addClass("sel");
			$("#category_9").addClass("no");
		} else if (parent_category_no == '9') {
			$("#category_9").addClass("sel");
			$("#category_10").addClass("no");
		} else if (parent_category_no == '10') {
			$("#category_10").addClass("sel");
			$("#category_11").addClass("no");
		} else if (parent_category_no == '11') {
			$("#category_11").addClass("sel");
			$("#category_12").addClass("no");
		} else if (parent_category_no == '12') {
			$("#category_12").addClass("sel");
		}
	};
	var subChange = function(sub_menu) {
		if (sub_menu == '1') {
			$("#sub_menu_1").addClass("sel");
			$("#sub_menu_2").addClass("no");
		} else if (sub_menu == '2') {
			$("#sub_menu_2").addClass("sel");
			$("#sub_menu_3").addClass("no");
		} else if (sub_menu == '3') {
			$("#sub_menu_3").addClass("sel");
			$("#sub_menu_4").addClass("no");
		} else if (sub_menu == '4') {
			$("#sub_menu_4").addClass("sel");
		}
	};
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page='+(startPageNum-1)+"&sub_menu=${sub_menu}&sub_page=${sub_page}#main";
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){

		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page='+(endPageNum)+"&sub_menu=${sub_menu}&sub_page=${sub_page}#main";
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page='+goPage+"&sub_menu=${sub_menu}&sub_page=${sub_page}#main";
	}
	
	function view(store_no) {
		//alert(travel_no);
		location.href = '/store/main.do?m=detail&location_no=${location_no}&parent_category_no=${parent_category_no}&store_no='+store_no+'&page=${list.page}&sub_menu=${sub_menu}&sub_page=${sub_page}';
	}	
	
	
	// 서브 이전 페이지
	function subPrevPage(){
		if( subCurrentBlock != 1 ){
			location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=${sub_menu}&sub_page='+(subStartPageNum-1)+'#sub';
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 서브 다음  페이지
	function subNextPage(){
		if( subCurrentBlock != subTotalBlock && subTotalBlock != 0 ){ 
			location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=${sub_menu}&sub_page='+(subEndPageNum)+'#sub';
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 서브 페이지 이동
	function subGoPage(goPage){
		location.href = '?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=${sub_menu}&sub_page='+goPage+'#sub';
	}
	
	// 서브 View
	function subView(subMenu, no){
		if (subMenu == '1') {
			location.href = '/news/view.do?news_no='+no;
		} else if (subMenu == '2') {
			location.href = '/travel/view.do?travel_no='+no;
		} else if (subMenu == '3') {
			location.href = '/community/community_view.do?no='+no;
		} else if (subMenu == '4') {
			location.href = '/news/view.do?news_no='+no;	
		}
		
	}
</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>地区</li><li class="end">${headerInfo.parent_location_name }</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="main.do?location_no=12"><li <c:if test="${headerInfo.parent_location_no == '12'}">class="on"</c:if>>首尔</li></a>
            <a href="main.do?location_no=13"><li <c:if test="${headerInfo.parent_location_no == '13'}">class="on"</c:if>>济州</li></a>
            <a href="main.do?location_no=14"><li <c:if test="${headerInfo.parent_location_no == '14'}">class="on"</c:if>>京畿</li></a>
            <a href="main.do?location_no=15"><li <c:if test="${headerInfo.parent_location_no == '15'}">class="on"</c:if>>釜山</li></a>
            <a href="main.do?location_no=16"><li <c:if test="${headerInfo.parent_location_no == '16'}">class="on"</c:if>>江原</li></a>
            <a href="main.do?location_no=17"><li <c:if test="${headerInfo.parent_location_no == '17'}">class="on"</c:if>>其他</li></a>
        </ul>
        <div class="area_detail"><!--지도, 지역리스트-->
        	<div class="map">
            	<div class="place_map" id="st_map_view">상세지도</div><!--지도-->
                <div class="place_txt"><!--설명-->
                	${headerInfo.header_info}
                </div>
            </div>
        </div>
        <ul class="tab_detail" id="main"><!--쇼핑, 호텔, 식당, 뷰티, 의료 탭-->
        	<a href="?location_no=${location_no}&parent_category_no=8&sub_menu=${sub_menu}&sub_page=${sub_page}#main"><li id="category_8"><img src="/resources/img/menu/tab_shopping<c:if test="${parent_category_no == '8'}">_on</c:if>.png" alt="Shopping" /></li></a><!--선택탭 클래스 sel-->
        	<a href="?location_no=${location_no}&parent_category_no=9&sub_menu=${sub_menu}&sub_page=${sub_page}#main"><li id="category_9"><img src="/resources/img/menu/tab_hotel<c:if test="${parent_category_no == '9'}">_on</c:if>.png" alt="Hotel" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="?location_no=${location_no}&parent_category_no=10&sub_menu=${sub_menu}&sub_page=${sub_page}#main"><li id="category_10"><img src="/resources/img/menu/tab_restorent<c:if test="${parent_category_no == '10'}">_on</c:if>.png" alt="Restorent" /></li></a>
        	<a href="?location_no=${location_no}&parent_category_no=11&sub_menu=${sub_menu}&sub_page=${sub_page}#main"><li id="category_11"><img src="/resources/img/menu/tab_beauty<c:if test="${parent_category_no == '11'}">_on</c:if>.png" alt="Beauty" /></li></a>
        	<a href="?location_no=${location_no}&parent_category_no=12&sub_menu=${sub_menu}&sub_page=${sub_page}#main"><li id="category_12" class="end"><img src="/resources/img/menu/tab_medical<c:if test="${parent_category_no == '12'}">_on</c:if>.png" alt="Medical" /></li></a>
        </ul>
        <table class="detail_c2">
        	<caption>쇼핑</caption>
            <colgroup>
            	<col width="22%" />
                <col width="28%" />
                <col width="22%" />
                <col width="28%" />
            </colgroup>
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach var="data" items="${list}" varStatus="status">
            			<c:if test="${status.index % 2 == 0 }">
            				<c:if test="${status.index > 0 }">
								<tr>
					            	<td colspan="4" class="space"></td><!--여백-->
					            </tr>
            				</c:if>
            				<tr>
            				<c:set value="0" var="i" />
            			</c:if>

		            	<th><a href="javascript:view('${data.store_no}');"><img src="http://www.wingkostory.com/upload/store/${data.image_thumb}" alt="" /></a></th>
		                <td>
		                	<div onclick="javascript:view('${data.store_no}');" class="hand">
		                	<span>${data.title}</span><br/>
		                    ${data.description}
		                    </div>
		                </td>
		                
						<c:if test="${status.index % 2 == 1 }"></tr></c:if>
						<c:set value="${i+1}" var="i" />
            		</c:forEach>
            		<c:forEach var="j" begin="1" end="2" step="1">
            			<c:if test="${i < j }"><th></th><td></td><c:set value="${i+1}" var="i" /></c:if>
            			<c:if test="${i == 2 }">
            				</tr>
							<tr>
				            	<td colspan="4" class="space"></td><!--여백-->
				            </tr>
            			</c:if>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
					<tr>
		            	<td colspan="4" class="space">单独联系获奖者</td>
		            </tr>
					<tr>
		            	<td colspan="4" class="space"></td><!--여백-->
		            </tr>
            	</c:otherwise>
            </c:choose>
        </table>

		<!-- page nav -->
        <ul class="page_number"><!--페이지번호-->
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

        <c:if test="${ad != null}">
	        <br/><br/>
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" /></a>
        </c:if>

        <br/><br/><br/><br/><!--IE6,7특성때문에 이 부분 꼭 삽입-->
        <ul class="tab_detail_c4" id="sub"><!--문화, 여행, 블로그, 픽업 탭-->
        	<a href="?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=1&sub_page=1#sub"><li id="sub_menu_1" ><img src="/resources/img/menu/tab_article<c:if test="${sub_menu == '1'}">_on</c:if>.png" alt="Article" /></li></a><!--선택탭 클래스 sel-->
        	<a href="?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=2&sub_page=1#sub"><li id="sub_menu_2" ><img src="/resources/img/menu/tab_tour<c:if test="${sub_menu == '2'}">_on</c:if>.png" alt="Tour spot" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=3&sub_page=1#sub"><li id="sub_menu_3" ><img src="/resources/img/menu/tab_blog<c:if test="${sub_menu == '3'}">_on</c:if>.png" alt="Blog" /></li></a>
        	<a href="?location_no=${location_no}&parent_category_no=${parent_category_no}&page=${list.page}&sub_menu=4&sub_page=1#sub"><li id="sub_menu_4" class="end"><img src="/resources/img/menu/tab_pickup<c:if test="${sub_menu == '4'}">_on</c:if>.png" alt="Pick up" /></li></a>
        </ul>
        <table class="detail_c3">
        	<caption>문화</caption>
            <colgroup>
            	<col width="13%" />
                <col width="20%" />
            	<col width="13%" />
                <col width="20%" />
            	<col width="13%" />
                <col width="21%" />
            </colgroup>
            <c:choose>
            	<c:when test="${fn:length(subList) > 0}">
            		<c:forEach var="data" items="${subList}" varStatus="status">
            			<c:if test="${status.index % 3 == 0 }">
            				<c:if test="${status.index > 0 }">
            					<tr><td colspan="6" class="space"></td><!--여백--></tr>
            				</c:if>
            				<tr>
            				<c:set value="0" var="i" />
            			</c:if>
            			
            			<c:choose>
            				<c:when test="${sub_menu == '1' }">
		       					<th onclick="javascript:subView('1', '${data.news_no}');" class="hand">
		       						<c:choose>
		       							<c:when test="${fn:length(data.thumb_image_location) > 0 && data.thumb_image_location != '' && data.thumb_image_location != 'null'}"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image_location}" style="width: 80px; height: 55px;" alt="news_image"  /></c:when>
		       							<c:otherwise><img src="/resources/img/print_img/defalt_img_80_55.gif"/></c:otherwise>
		       						</c:choose>
		       					</th>
		       					<td onclick="javascript:subView('1', '${data.news_no}');" class="hand">${data.title}</td>
            				</c:when>
            				<c:when test="${sub_menu == '2' }">
		       					<th onclick="javascript:subView('2', '${data.travel_no}');" class="hand">
		       						<c:choose>
		       							<c:when test="${fn:length(data.image) > 0 && data.image != '' && data.image != 'null'}"><img src="http://wingkostory.com/upload/travel/${data.image }" style="width: 80px; height: 55px;" alt="travel image" /></c:when>
		       							<c:otherwise><img src="/resources/img/print_img/defalt_img_80_55.gif"/></c:otherwise>
		       						</c:choose>
		       					</th>
		       					<td onclick="javascript:subView('2', '${data.travel_no}');" class="hand">${data.title}</td>
            				</c:when>
            				<c:when test="${sub_menu == '3' }">
		       					<th onclick="javascript:subView('3', '${data.no}');" class="hand">
		       						<c:choose>
		       							<c:when test="${fn:length(data.image_thumb) > 0 && data.image_thumb != '' && data.image_thumb != 'null'}"><img src="http://wingkostory.com/upload/community/${data.image_thumb}" style="width: 80px; height: 55px;" alt="travel image" /></c:when>
		       							<c:otherwise><img src="/resources/img/print_img/defalt_img_80_55.gif"/></c:otherwise>
		       						</c:choose>
		       					</th>
		       					<td onclick="javascript:subView('3', '${data.no}');" class="hand">${data.title}</td>
            				</c:when>
            				<c:when test="${sub_menu == '4' }">
		       					<th onclick="javascript:subView('4', '${data.news_no}');" class="hand">
		       						<c:choose>
		       							<c:when test="${fn:length(data.thumb_image_location) > 0 && data.thumb_image_location != '' && data.thumb_image_location != 'null'}"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image_location}" style="width: 80px; height: 55px;" alt="news_image"  /></c:when>
		       							<c:otherwise><img src="/resources/img/print_img/defalt_img_80_55.gif"/></c:otherwise>
		       						</c:choose>
		       					</th>
		       					<td onclick="javascript:subView('4', '${data.news_no}');" class="hand">${data.title}</td>
            				</c:when>
            			</c:choose>


						<c:if test="${status.index % 3 == 2 }">
							</tr>
						</c:if>
						<c:set value="${i+1}" var="i" />

            		</c:forEach>
            		
					<c:forEach var="j" begin="1" end="3" step="1">
            			<c:if test="${i < j }">
            				<td></td><td></td><c:set value="${i+1}" var="i" />
            				<c:if test="${i == 3 }"></tr></c:if>
            			</c:if>
            		</c:forEach>            		
            	</c:when>
            	<c:otherwise>单独联系获奖者</c:otherwise>
            </c:choose>
        </table>
		<!-- page nav -->
		<ul class="page_number"><!--페이지번호-->
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