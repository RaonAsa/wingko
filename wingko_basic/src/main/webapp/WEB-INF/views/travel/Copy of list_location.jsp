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
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-CN"></script>
<script>
	var location_no = '${location_no}';
	var no = '${no}';
	
	var pageInfo_1 = {};
	var pageInfo_2 = {};
	var pageInfo_3 = {};
	var pageInfo_4 = {};
	var img = {
		on: [ "/resources/img/menu/travel_area_tab01_on.png", "/resources/img/menu/travel_area_tab02_on.png", "/resources/img/menu/travel_area_tab03_on.png", "/resources/img/menu/travel_area_tab04_on.png" ],
		off: [ "/resources/img/menu/travel_area_tab01.png", "/resources/img/menu/travel_area_tab02.png", "/resources/img/menu/travel_area_tab03.png", "/resources/img/menu/travel_area_tab04.png" ]
	};
	$(document).ready(function() {
		$("#menu_1").click(function() {
			$("#menu_1").addClass("sel");
			$("#menu_2").removeClass("sel");
			$("#menu_1 > img").attr("src", img.on[0]);
			$("#menu_2 > img").attr("src", img.off[1]);
			$("#travel_list_1").show();
			$("#travel_list_2").hide();
			$("#travel_page_1").show();			
			$("#travel_page_2").hide();
		});
		$("#menu_2").click(function() {
			$("#menu_1").removeClass("sel");
			$("#menu_2").addClass("sel");
			$("#menu_1 > img").attr("src", img.off[0]);
			$("#menu_2 > img").attr("src", img.on[1]);
			$("#travel_list_1").hide();
			$("#travel_list_2").show();
			$("#travel_page_1").hide();
			$("#travel_page_2").show();
		});
		$("#menu_3").click(function() {
			$("#menu_3").addClass("sel");
			$("#menu_4").removeClass("sel");
			$("#menu_3 > img").attr("src", img.on[2]);
			$("#menu_4 > img").attr("src", img.off[3]);
			$("#travel_list_3").show();
			$("#travel_list_4").hide();
			$("#travel_page_3").show();
			$("#travel_page_4").hide();
		});
		$("#menu_4").click(function() {
			$("#menu_3").removeClass("sel");
			$("#menu_4").addClass("sel");
			$("#menu_3 > img").attr("src", img.off[2]);
			$("#menu_4 > img").attr("src", img.on[3]);
			$("#travel_list_3").hide();
			$("#travel_list_4").show();
			$("#travel_page_3").hide();
			$("#travel_page_4").show();
		});
	
		if(document.location.hash) {
			var t = "", p = "";
			var HashLocationName = document.location.hash;
			HashLocationName = HashLocationName.replace("#","");
			var arr = HashLocationName.split("^");
			for ( var i= 0; i< arr.length; i++) {
				var temp = arr[i].split("=");
				if (temp.length == 2) {
					if (temp[0] == "t") { t = temp[1]; }
					if (temp[0] == "p") { p = temp[1]; }
				}
				if (t != "" && p != "") {
					getTravelList(t, location_no, p);
					$("#menu_"+(t-4)).trigger('click');
				}
			}
		}

		getTravelList(5, location_no, 1);
		getTravelList(6, location_no, 1);
		getTravelList(7, location_no, 1);
		getTravelList(8, location_no, 1);
		
		

		if (location_no != "17") {
			var x = '${headerInfo.x}',
				y = '${headerInfo.y}';

			var mapOptions = {
					zoom: 10,
					center: new google.maps.LatLng(y, x),
					mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById('st_map_view'), mapOptions);
		}

	});

	var getTravelList = function(travel_category_no, location_no, page) {
		$.ajax({
			url: "/travel/travel_list.do",
			data: "travel_category_no="+travel_category_no+"&location_no="+location_no+"&page="+page,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText),
					travel_category_no = obj.travel_category_no,
					list = obj.list,
					i = 0,
					listHtml = "",
					pageHtml = "",
					pageInfo = {
						page : obj.page,
						pageSize : obj.pageSize,
						currentBlock : obj.currentBlock,
						totalBlock : obj.totalBlock,
						totalPage : obj.totalPage,
						startPageNum : obj.startPageNum,
						endPageNum : obj.endPageNum
					};

				// 리스트 html
				if (list.length == 0) {
					listHtml += "<tr><td colspan='5'>데이터가 없습니다.</td></tr>"
				} else {
					for ( var j = 0; j < list.length; j++) {
						var travel = list[j];

						if (j % 3 == 0) { listHtml += '<tr>'; i=0;}
						if (j % 3 > 0) { listHtml += '<td></td>'; }
						listHtml += "<td onclick=\"javascript:view('"+ travel_category_no+"', '"+travel.travel_no+"', '"+pageInfo.page+"');\" class='hand'>";
						if (travel.image.length > 0) {
							listHtml += "<img src='http://www.wingkostory.com/upload/travel/"+travel.image+"' alt='' class='travel_image'><br />"+travel.title+"</td>";	// 리플수 숨김 +"("+travel.ripple_count+")"  
						} else {
							listHtml += "<img src='/resources/img/defalt_img_208_130.gif' alt='' class='travel_image'><br />"+travel.title+"</td>";	// 리플수 숨김 +"("+travel.ripple_count+")" 
						}

						if (j % 3 == 2) { listHtml += '</tr>'; }
						i++;
					}
					for ( var j = 1; j <= 3; j++) {
						if (i < j) { listHtml += '<td></td><td></td>'; i++; }
						if ( i == 3) { listHtml += '</tr>'; }
					}
				}

				// 페이징 html
				pageHtml += "<li onclick='javascript:prevPage("+travel_category_no+", "+pageInfo.currentBlock+", "+pageInfo.startPageNum+");'><img src='/resources/img/menu/page_prev.png' alt='prev' /></li>";
				for ( var i = pageInfo.startPageNum; i < pageInfo.endPageNum; i++) {
					if (pageInfo.totalPage == 0) {
						pageHtml += "<li class='on'>"+i+"</li>";
					}
					if (i > pageInfo.totalPage || i == pageInfo.endPageNum) {
						break;
					} else {
						if (i == page) {
							pageHtml += "<li onclick='javascript:goPage("+i+", "+travel_category_no+");' class='on'>"+i+"</li>";
						} else {
							pageHtml += "<li onclick='javascript:goPage("+i+", "+travel_category_no+");'>"+i+"</li>";
						}
					}
				}
				pageHtml += "<li class='end' onclick='javascript:nextPage("+travel_category_no+", "+pageInfo.currentBlock+", "+pageInfo.totalBlock+", "+pageInfo.endPageNum+");'><img src='/resources/img/menu/page_next.png' alt='next' /></li>";

				if (travel_category_no == "5") {
					$("#travel_list_body_1").html(listHtml);
					$("#travel_page_1").html(pageHtml);
					pageInfo_1 = pageInfo;
				} else if (travel_category_no == "6") {
					$("#travel_list_body_2").html(listHtml);
					$("#travel_page_2").html(pageHtml);
					pageInfo_2 = pageInfo;
				} else if (travel_category_no == "7") {
					$("#travel_list_body_3").html(listHtml);
					$("#travel_page_3").html(pageHtml);
					pageInfo_3 = pageInfo;
				} else if (travel_category_no == "8") {
					$("#travel_list_body_4").html(listHtml);
					$("#travel_page_4").html(pageHtml);
					pageInfo_4 = pageInfo;
				}
			}
		});
	};


	// 이전 페이지
	function prevPage(travel_category_no, currentBlock, startPageNum){
		if( currentBlock != 1 ){
			getTravelList(travel_category_no, location_no, startPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}

	// 다음  페이지
	function nextPage(travel_category_no, currentBlock, totalBlock, endPageNum){
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			getTravelList(travel_category_no, location_no, endPageNum);
		}else{
			alert(m.bbs.next);
		}
	}

	function goPage(goPage, travel_category_no){
		getTravelList(travel_category_no, location_no, goPage);
	}
	function view(travel_category_no, travel_no, page) {
		document.location.hash = "#t="+travel_category_no+"^p="+page;
		location=this.href;
		location.href = 'view.do?travel_category_no='+travel_category_no+'&travel_no='+travel_no+'&location_no='+location_no+'&no='+no;
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
        <table class="travel_area_list" id="travel_list_1" style="display: none;">
        	<caption>로드맵</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tbody id="travel_list_body_1"></tbody>
         </table>
        <ul class="page_number" style="margin-top:0; display: none;" id="travel_page_1"><!--페이지번호-->
        </ul>
        <table class="travel_area_list" id="travel_list_2">
        	<caption>추천여행지</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tbody id="travel_list_body_2"></tbody>
        </table>
        <ul class="page_number" style="margin-top:0; " id="travel_page_2" ><!--페이지번호-->
        </ul>
        <!---------------------------------------주요명소, 추천명소----------------------------------------->
        <ul class="tab_detail_c2" style="margin-top:50px;">
        	<li class="sel hand" id="menu_3"><img src="/resources/img/menu/travel_area_tab03_on.png" alt="主要景点" /></li><!--주요명소-->
            <li class="end hand" id="menu_4"><img src="/resources/img/menu/travel_area_tab04.png" alt="推荐景点" /></li><!--추천명소-->
        </ul>
         <table class="travel_area_list" id="travel_list_3">
        	<caption>주요명소</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tbody id="travel_list_body_3"></tbody>
        </table>
        <ul class="page_number" style="margin-top:0;" id="travel_page_3"><!--페이지번호-->
        </ul>
        <table class="travel_area_list hide" id="travel_list_4" style="display: none;">
        	<caption>추천명소</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tbody id="travel_list_body_4"></tbody>
        </table>
        <ul class="page_number" style="margin-top:0; display: none;" id="travel_page_4"><!--페이지번호-->
        </ul>
    </div>


    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />

</div>

	<!-- BOTTOM Include -->
	<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
