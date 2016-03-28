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

	<div id="Content">
        <div class="area_detail"><!--지도, 지역리스트-->
        	<div class="map">
            	<div class="" id="st_map_view" style="width:80%; height:600px">상세지도</div><!--지도-->
            </div>
        	<div class="map">
                <div class=""><!--설명-->
                	${headerInfo.header_info}
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
