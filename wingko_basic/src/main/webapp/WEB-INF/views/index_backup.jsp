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
<title>Wingko</title>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/wingko.css" />
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<!-- 이벤트 -->
<script src="/resources/js/event.js"></script>
<script>

	$(document).ready(function() {
		$('#m_toon_bxslider').bxSlider({
			auto: true,
			pause: 7000,
			pager: true,
			nextText: '',
			prevText: '',
			pagerCustom: '#toon-bx-pager'
		});

		var ex = "${ex_now}";
		
		$("#krw").bind({
			keyup : function() {
				var w = $(this).val();
				$("#cny").val( roundXL((w/ex), 2) );
			}
		});
		$("#cny").bind({
			keyup : function() {
				var c = $(this).val();
				$("#krw").val( roundXL((c*ex), 2) );
			}
		});
		
 		var adNewsData = ${adNewsJson};
		
		$.each(adNewsData, function(key, val) {
			var listHtml = "",
				i = 0;

			if (val.length > 0) {
				for ( var j = 0; j < val.length; j++) {
					var adNews = val[j];

					if (j % 2 == 0) {
						listHtml += '<tr>';
						i = 0;
					}
					
					if (adNews.title.length >= 14) {
						adNews.title = adNews.title.substring(0, 14)+"..";
					}
					if (adNews.content.length >= 35) {
						adNews.content = adNews.content.substring(0, 35)+"...";
					}

					if (j >= 4) {
						listHtml += "<th onclick=\"javascript:view('"+ adNews.news_category_no+"', '"+ adNews.news_no+"');\" class='hand end'><img src='http://www.wingkostory.com/upload/news/"+adNews.thumb_image+"' alt=''></th>";
						listHtml += "<td class='end'>";
					} else {
						listHtml += "<th onclick=\"javascript:newsView('"+ adNews.news_category_no+"', '"+ adNews.news_no+"');\" class='hand'><img src='http://www.wingkostory.com/upload/news/"+adNews.thumb_image+"' alt=''></th>";
						listHtml += "<td>";
					}
					listHtml += "<div onclick=\"javascript:newsView('"+ adNews.news_category_no+"', '"+ adNews.news_no+"');\" class='hand'>";
					listHtml += "<span>"+adNews.title+"</span><br />"+adNews.content;
					listHtml += "</div>";
					listHtml += "</td>";

					if (j % 2 == 1) { listHtml += '</tr>'; }
					i++;
				}
				for ( var j = 1; j <= 2; j++) {
					if (i < j) { listHtml += "<th></th><td></td>"; i++; }
				}
			} else {
				listHtml += "</tr><tr><td colspan='4' class='space'>데이터가 없습니다.</td></tr>";
			}
			$("#adNews"+key).html(listHtml);
		});
		//adNews1
		
		
		$.ajax({
			url: "/ad/ad_list.do?a=55",
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				// console.log('광고 로드');
				var obj = jQuery.parseJSON(data.responseText);
				// console.log(obj);
				if (obj.count == 0) {
					getRightAd(56);
				}
				$.each(obj.adList, function(key, val) {
					var adhtml = "";
					if (val.position == "5") {
						adhtml = "<a href=\""+val.link+"\" target=\"_blank\"><img style='margin-bottom:10px;' src=\"http://www.wingkostory.com/upload/ad/"+val.image+"\" alt=\"광고\" class=\"c_banner\" /></a>";
					} else if (val.position == "6") {
						adhtml = "<a href=\""+val.link+"\" target=\"_blank\"><img style='margin-bottom:10px;' src=\"http://www.wingkostory.com/upload/ad/"+val.image+"\" alt=\"광고\" class=\"toon2\" /></a>";
					} else if (val.position == "7" || val.position == "8") {
						adhtml = "<a href=\""+val.link+"\" ><img src=\"http://www.wingkostory.com/upload/ad/"+val.image+"\" alt=\"광고\" /></a>";
						$("#ad7").append(adhtml);
					} else if (val.position == "9" || val.position == "10" || val.position == "11" || val.position == "12") {
						adhtml = "<a href=\""+val.link+"\" target=\"_blank\"><img src=\"http://www.wingkostory.com/upload/ad/"+val.image+"\" alt=\"광고\" /></a>";
						$("#ad9").append(adhtml);
					} else {
						adhtml = "<a href=\""+val.link+"\" target=\"_blank\"><img style='margin-bottom:10px;' src=\"http://www.wingkostory.com/upload/ad/"+val.image+"\" alt=\"광고\" /></a>";						
					}
					if ( !(val.position == "7" || val.position == "8" || val.position == "9" || val.position == "10" || val.position == "11" || val.position == "12") ) {
						$("#ad"+val.position).html(adhtml);
					}
				});
			}
		});
		
		$.ajax({
			url: "json_couponbest.do",
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				// console.log('광고 로드');
				var obj = jQuery.parseJSON(data.responseText);
				var i =0;
				var html="";
				$.each(obj, function(key, val) {
					i++;
					if (i == 1) {
						html += "<li class='one'><a href='/store/main.do?store_no="+val.store_no+"'>"+val.coupon_name+"</a></li>";	
					} else if (i == 2) {
						html += "<li class='one'><a href='/store/main.do?store_no="+val.store_no+"'>"+val.coupon_name+"</a></li>";	
					} else if (i == 3) {
						html += "<li class='one'><a href='/store/main.do?store_no="+val.store_no+"'>"+val.coupon_name+"</a></li>";	
					} else { }
				});
				$("#coupon_best").html(html);
			}
		});
		
		for(var i=1; i<=11; i++) {
			(new Image).src = "/resources/img/map/smap" + i + ".gif";
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
				$("#MMap").attr("src", "/resources/img/map/smap" + $(this).attr("fa") + ".gif");
			})
			.mouseout( function(){
				$("#MMap").attr("src", "/resources/img/map/smap0.gif"); 
			});
	});

	var goWeather = function(location_no) {
		location.href = "/location/main.do?location_no=" + location_no;
	};
	
	var newsView = function(news_category_no, news_no) {
		location.href = "/news/view.do?news_category_no="+news_category_no+"&news_no="+news_no;
	};

	var img = {
		on : ["/resources/img/main/koreanews_tab01_on.png", "/resources/img/main/koreanews_tab02_on.png", "/resources/img/main/koreanews_tab03_on.png"],
		off: ["/resources/img/main/koreanews_tab01.png", "/resources/img/main/koreanews_tab02.png", "/resources/img/main/koreanews_tab03.png"]
	};
	var news_tab = function(news_category) {
		for ( var i = 0; i < 3; i++) {
			if ( i == news_category ) {
				$("#news_img"+news_category).attr("src", img.on[news_category]);
				$("#news"+news_category).show();
			} else {
				$("#news_img"+i).attr("src", img.off[i]);
				$("#news"+i).hide();
			}
		}
	};
	
	
	function roundXL(n, digits) {
	  if (digits >= 0) return parseFloat(n.toFixed(digits));

	  digits = Math.pow(10, digits);
	  var t = Math.round(n * digits);
	  return parseFloat(t.toFixed(0));
	}

	
	/*
	  광고성 기사 상,하 3단탭 2개
	*/
	var adNewsData = {
			on: ["/resources/img/main/add_tab01_on.png", "/resources/img/main/add_tab02_on.png", "/resources/img/main/add_tab03_on.png",
			     "/resources/img/main/add_tab04_on.png", "/resources/img/main/add_tab05_on.png", "/resources/img/main/add_tab06_on.png"],
			off: ["/resources/img/main/add_tab01.png", "/resources/img/main/add_tab02.png", "/resources/img/main/add_tab03.png",
				 "/resources/img/main/add_tab04.png", "/resources/img/main/add_tab05.png", "/resources/img/main/add_tab06.png"],
			imgId: ["adNewsImg1", "adNewsImg2", "adNewsImg3", "adNewsImg4", "adNewsImg5", "adNewsImg6"],
			tbodyId: ["adNews1", "adNews2", "adNews3", "adNews4", "adNews5", "adNews6"]
	};
	var adNewsTab = function(index) {
		if (index <= 2) {
			for ( var i = 0; i <= 2; i++) {
				if (i == index) {
					$("#"+adNewsData.imgId[i]).attr("src", adNewsData.on[i]);
					$("#"+adNewsData.tbodyId[i]).show();
				} else {
					$("#"+adNewsData.imgId[i]).attr("src", adNewsData.off[i]);
					$("#"+adNewsData.tbodyId[i]).hide();
				}
			}
		} else {
			for ( var i = 3; i <= 5; i++) {
				if (i == index) {
					$("#"+adNewsData.imgId[i]).attr("src", adNewsData.on[i]);
					$("#"+adNewsData.tbodyId[i]).show();
				} else {
					$("#"+adNewsData.imgId[i]).attr("src", adNewsData.off[i]);
					$("#"+adNewsData.tbodyId[i]).hide();
				}
			}
		}
	};
</script>

</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="inc/top.jsp" charEncoding="UTF-8" />

<%-- 	<div id="myCarousel" class="main_picture carousel slide">
		<!-- Carousel items -->
 		<div class="left m_pic_prev" href="#myCarousel" data-slide="prev"></div>
    	<div class="right m_pic_next" href="#myCarousel" data-slide="next"></div>
		<div class="carousel-inner">
		<c:choose>
			<c:when test="${fn:length(topAd) > 0 }">
				<c:forEach var="data" items="${topAd}" varStatus="status">
					<c:choose>
						<c:when test="${status.index == 0}">
							<div class="active item"><a href="${data.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="메인샘플이미지1" /></a></div>
						</c:when>
						<c:otherwise>
							<div class="item"><a href="${data.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="메인샘플이미지1" /></a></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="item active"><img src="/resources/img/main/m_pic01.png" alt="메인샘플이미지1" /></div>
			</c:otherwise>
		</c:choose>
		</div>
	</div> --%>
	
	<div class="main_picture ">
    	<div class="m_pic_prev" id="m_slider-prev"></div>
		<div class="m_pic_next" id="m_slider-next"></div>
		<ul id="m_bxslider">
			<c:choose>
				<c:when test="${fn:length(topAd) > 0 }">
					<c:forEach var="data" items="${topAd}" varStatus="status">
						<li><a href="${data.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="메인샘플이미지1" /></a></li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="item active"><img src="/resources/img/main/m_pic01.png" alt="메인샘플이미지1" /></div>
				</c:otherwise>
			</c:choose>
		</ul>
	</div><!--배너. 배너사이즈는 222*118을 넘으면 안됨.-->
	
	
	<script>
		(function(){
			$('#m_bxslider').bxSlider({
				auto: true,
				pause: 7000,
				pager: false,
				nextSelector: '#m_slider-next',
				prevSelector: '#m_slider-prev',
				nextText: '<img src="/resources/img/main/m_pic_next.png" />',
				prevText: '<img src="/resources/img/main/m_pic_prev.png" />'
			});
		})();
	</script>
	

    <div id="Left"><!--여기부터 왼쪽메뉴 시작-->
    	<img src="/resources/img/main/tit_traffic.png" alt="地图" />
        <div class="traffic"><!--교통-->
        	<a href="/travel/info.do?menu=traffic&no=8"><img src="/resources/img/main/t_airplane.png" alt="airplane" /></a>
            <a href="/travel/info.do?menu=traffic&no=11"><img src="/resources/img/main/t_subway.png" alt="subway" /></a>
            <a href="/travel/info.do?menu=traffic&no=10"><img src="/resources/img/main/t_bus.png" alt="bus" /></a>
            <a href="/travel/info.do?menu=traffic&no=9"><img src="/resources/img/main/t_taxi.png" alt="taxi" /></a>
        </div>
        <div class="exchange_rate"><!--환율-->
        	<table class="ex_rate">
            	<caption>중국환율</caption>
                <colgroup>
                	<col width="30%" />
                    <col width="70%" />
                </colgroup>
                <tr>
                	<td colspan="2" class="date">${ex_date}</td>
                </tr>
                <tr>
                	<td colspan="2" class="rate">1元=${ex_now}圆</td>
                </tr>
                <tr>
                	<th><img src="/resources/img/main/sell.png" alt="sell" /></th>
                	<td class="won" id="ex_sell">${ex_sell}</td>
                </tr>
                <tr>
                	<th><img src="/resources/img/main/buy.png" alt="buy" /></th>
                	<td class="won" id="ex_buy">${ex_buy}</td>
                </tr>
            </table>
            汇率计算器
            <ul>
            	<li><img src="/resources/img/main/exchange_korea.png" alt="korea" style="vertical-align:bottom;" /><input id="krw" type="text" class="ex_txt" value="${ex_now}"/></li>
                <li><img src="/resources/img/main/exchange_china.png" alt="china" style="vertical-align:bottom;" /><input id="cny" type="text" class="ex_txt" value="1"/></li>
            </ul>
        </div>
        <img src="/resources/img/main/tit_map.png" alt="地图" />
        <div class="map"><!--지도-->
			<img src="/resources/img/map/smap0.gif" alt="" name="IMap" border="0" usemap="#MMap" id="MMap" />
			<map name="MMap">
				<area shape="poly" fa="1" coords="28,58,32,55,36,52,41,59,38,65,30,65,25,58" href="#" /><!--서울-->
				<area shape="poly" fa="2" coords="18,50,22,51,24,42,37,27,43,32,50,36,52,40,56,43,53,51,54,55,63,60,60,76,44,88,39,86,31,88,26,80,22,76,29,73,22,65,23,59,16,52" href="#" /><!--경기도-->
				<area shape="poly" fa="3" coords="39,26,53,25,61,25,72,25,79,20,82,14,91,33,100,47,107,58,117,77,110,81,101,80,93,81,84,78,76,74,69,73,64,78,61,76,62,69,64,60,55,55,55,50,57,44,51,36,49,34,47,34,38,26" href="#" />
				<!--강원도-->
				<area shape="poly" fa="4" coords="28,86,23,87,16,85,14,91,9,93,9,89,6,95,10,101,16,103,18,111,19,122,24,129,31,127,36,123,39,126,46,125,51,129,55,129,53,120,54,120,52,118,50,111,47,110,44,104,44,99,47,96,43,89,37,88,31,89,28,86" href="#" /><!--충청북도-->
				<area shape="poly" fa="5" coords="90,82,85,88,84,93,76,92,70,94,70,98,65,101,64,103,66,109,64,117,70,121,67,128,59,129,55,126,53,120,51,115,51,111,46,108,44,99,47,95,44,88,51,83,60,77,64,77,70,73,79,76,90,82" href="#" />
				<!--충청남도-->
				<area shape="poly" fa="6" coords="23,128,23,133,28,133,28,138,22,141,17,145,23,148,18,151,16,155,21,160,27,156,30,152,34,156,37,154,39,160,44,160,51,160,55,159,57,160,60,154,58,148,59,140,65,135,69,131,67,128,60,129,55,127,53,130,45,126,40,127,36,124,29,129,24,127" href="#" /><!--전라북도-->
				<area shape="poly" fa="7" coords="16,155,12,163,14,168,6,169,12,174,13,179,12,184,9,188,14,194,18,203,22,199,27,192,29,198,33,198,35,190,43,187,43,192,47,197,53,192,49,185,52,180,56,182,57,189,61,185,64,180,58,180,58,177,63,174,59,167,57,160,50,160,40,160,36,155,34,156,29,154,26,157,21,160,16,155" href="#" /><!--전라남도-->
				<area shape="poly" fa="8" coords="117,77,118,90,118,100,118,106,116,116,117,126,118,130,124,127,122,135,120,144,115,145,107,144,99,146,89,144,82,143,76,139,73,135,68,133,67,127,70,121,64,117,66,107,64,103,70,99,72,94,80,92,85,93,85,87,91,82,103,80,110,81" href="#" /><!--경상북도-->
				<area shape="poly" fa="9" coords="63,174,68,174,73,170,75,176,83,175,86,183,87,170,93,168,99,168,103,165,115,154,109,147,106,144,95,146,80,143,70,134,64,136,58,145,59,154,57,162" href="#" /><!--경상남도-->
				<area shape="poly" fa="10" coords="120,144,119,154,114,163,106,170,103,166,111,158,115,154,112,149,107,145,117,145" href="#" /><!--부산-->
				<area shape="poly" fa="11" coords="16,215,6,219,2,225,7,227,16,226,25,223,28,217,23,213" href="#" /><!--제주도-->
				<area shape="poly" fa="8" coords="120,57,125,58,131,58,133,62,136,58,133,56,127,55,125,51,119,54" href="#" /><!--울릉도,독도-->
			</map>
        </div>
        <div class="map" id="ad1"></div>
        <div class="map" id="ad2"></div>
        <img src="/resources/img/main/tit_weather.png" alt="天气" />
        <div class="weather"><!--날씨-->
        	<table class="weather_list" id="weather_list">
            	<caption>지역별 날씨</caption>
                <colgroup>
                	<col width="50%" />
                    <col width="50%" />
                </colgroup>
                <c:choose>
                	<c:when test="${fn:length(weatherList) > 0}">
                		<c:forEach var="weather" items="${weatherList}" varStatus="status">
                			<c:if test="${status.index > 0}">
                				<tr><td colspan="2" class="space"></td></tr><!--여백라인-->
                			</c:if>
							<tr class="hand" onclick="javascript:goWeather('${weather.location_no}');">
			                	<td class="pic"><img src="/resources/img/weather/${weather.image}" style="width: 65px;height: 65px;" alt="${weather.text}" /><%-- <img src="/resources/img/main/w_clody.png" alt="${weather.text}" /> --%></td>
			                    <td>${weather.location}<br/><span>${weather.temp}˚</span><br/>${weather.text}</td>
			                </tr>
                		</c:forEach>
                	</c:when>
                </c:choose>
            </table>
        </div>
        <div class="time"><!--시간 위젯-->
        	<div class="hour" id="hours">23</div><div class="minute" id="min">23</div>
            <div class="t_date" id="date">
            <!-- Monday,<br/> 
			September 24, 2012 -->
            </div>
        </div>        
    </div><!--여기까지 Left 끝-->
    
    
    
    <div id="Center"><!--여기부터 Center 시작-->
    	<div class="korea_news">
        	<ul>
            	<li class="first"><a href="javascript:news_tab(0);"><img src="/resources/img/main/koreanews_tab01<c:if test="${rnd == 0 }">_on</c:if>.png" alt="韩国新闻" id="news_img0" /></a></li><!--한국뉴스-->
            	<li><a href="javascript:news_tab(1);"><img src="/resources/img/main/koreanews_tab02<c:if test="${rnd == 1 }">_on</c:if>.png" alt="韩国新闻" id="news_img1" /></a></li><!--한류뉴스-->
            	<li><a href="javascript:news_tab(2);"><img src="/resources/img/main/koreanews_tab03<c:if test="${rnd == 2 }">_on</c:if>.png" alt="业绩新闻" id="news_img2" /></a></li><!--공연소식-->
            </ul>
            <div class="kn_sp">
                <table class="news" id="news0" <c:if test="${rnd != 0 }">style="display: none;"</c:if>>
                    <caption>한국뉴스</caption>
                    <colgroup>
                        <col width="30%" />
                        <col width="70%" />
                    </colgroup>
                    <c:choose>
                    	<c:when test="${fn:length(news1) > 0 }">
                    		<c:forEach var="data" items="${news1}" varStatus="status">
			                    <tr>
			                        <th><a href="javascript:newsView('${data.news_category_no}', '${data.news_no}');"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image}" alt="샘플사진" /></a></th>
			                        <td>
										<div class="hand" onclick="javascript:newsView('${data.news_category_no}', '${data.news_no}');">
											<span><c:out value="${fn:substring(data.title, 0, 15)}" escapeXml="false" /></span><br/><c:out value="${fn:substring(data.content, 0, 30)}" escapeXml="false" />
										</div>
			                        </td>
			                    </tr>                    			
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise><tr><th colspan="2">기사가 없습니다.</th></tr></c:otherwise>
                    </c:choose>
                </table>
                <table class="news" id="news1" <c:if test="${rnd != 1 }">style="display: none;"</c:if>>
                    <caption>한국뉴스</caption>
                    <colgroup>
                        <col width="30%" />
                        <col width="70%" />
                    </colgroup>
                    <c:choose>
                    	<c:when test="${fn:length(news2) > 0 }">
                    		<c:forEach var="data" items="${news2}" varStatus="status">
			                    <tr>
			                        <th><a href="javascript:newsView('${data.news_category_no}', '${data.news_no}');"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image}" alt="샘플사진" /></a></th>
			                        <td>
										<div class="hand" onclick="javascript:newsView('${data.news_category_no}', '${data.news_no}');">
											<span><c:out value="${fn:substring(data.title, 0, 15)}" escapeXml="false" /></span><br/><c:out value="${fn:substring(data.content, 0, 30)}" escapeXml="false" />
										</div>
			                        </td>
			                    </tr>                    			
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise><tr><th colspan="2">기사가 없습니다.</th></tr></c:otherwise>
                    </c:choose>
                </table>
                <table class="news" id="news2" <c:if test="${rnd != 2 }">style="display: none;"</c:if>>
                    <caption>한국뉴스</caption>
                    <colgroup>
                        <col width="30%" />
                        <col width="70%" />
                    </colgroup>
                    <c:choose>
                    	<c:when test="${fn:length(news3) > 0 }">
                    		<c:forEach var="data" items="${news3}" varStatus="status">
			                    <tr>
			                        <th><a href="javascript:newsView('${data.news_category_no}', '${data.news_no}');"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image}" alt="샘플사진" /></a></th>
			                        <td>
										<div class="hand" onclick="javascript:newsView('${data.news_category_no}', '${data.news_no}');">
											<span><c:out value="${fn:substring(data.title, 0, 15)}" escapeXml="false" /></span><br/><c:out value="${fn:substring(data.content, 0, 30)}" escapeXml="false" />
										</div>
			                        </td>
			                    </tr>                    			
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise><tr><th colspan="2">기사가 없습니다.</th></tr></c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>

	<div class="toon">
		<ul id="m_toon_bxslider">
			<c:choose>
				<c:when test="${fn:length(topBottomAd) > 0 }">
					<c:forEach var="data" items="${topBottomAd}" varStatus="status">
						<li><a href="${data.link}"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="메인샘플이미지1" /></a></li>
					</c:forEach>
				</c:when>
			</c:choose>
		</ul>
	</div><!--배너. 배너사이즈는 222*118을 넘으면 안됨.-->

      <%--   <div id="myCarousel2" class="toon carousel slide">
			<c:choose>
				<c:when test="${fn:length(topBottomAd) > 0 }">
 					<ol class="carousel-indicators">
					<c:forEach var="data" items="${topBottomAd}" varStatus="status">
						<li data-target="#myCarousel2" data-slide-to="${status.index}" <c:if test="${status.index == 0}"> class="active"</c:if>></li>
					</c:forEach>
					</ol>
				</c:when>
			</c:choose>
			<div class="carousel-inner">
			<c:choose>
				<c:when test="${fn:length(topBottomAd) > 0 }">
					<c:forEach var="data" items="${topBottomAd}" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="active item"><a href="${data.link}"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="웹툰" style="width: 293px; height: 291px;" /></a></div>
							</c:when>
							<c:otherwise>
								<div class="item"><a href="${data.link}"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="웹툰" style="width: 293px; height: 291px;" /></a></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="item active"><img src="/resources/img/main/toon.png" alt="웹툰" /></div>
				</c:otherwise>
			</c:choose>
			</div>
        </div>
 --%>
        <div class="propose" id="ad7"><!--vs,로드맵-->

        </div>
        <ul class="add_tab"> <!--뉴스탭-->
           	<li><a href="javascript:adNewsTab(0);"><img src="/resources/img/main/add_tab01<c:if test="${rnd == 0 }">_on</c:if>.png" alt="新消息" id="adNewsImg1" /></a></li>
            <li><a href="javascript:adNewsTab(1);"><img src="/resources/img/main/add_tab02<c:if test="${rnd == 1 }">_on</c:if>.png" alt="推荐信息" id="adNewsImg2" /></a></li>
            <li><a href="javascript:adNewsTab(2);"><img src="/resources/img/main/add_tab03<c:if test="${rnd == 2 }">_on</c:if>.png" alt="特辑专栏" id="adNewsImg3" /></a></li>
        </ul>
        <div class="add_news"><!--뉴스 리스트-->
        	<table class="news" style="height:214px;">
            	<colgroup>
                	<col width="14%" />
                    <col width="36%" />
                    <col width="14%" />
                    <col width="36%" />
                </colgroup>
                
                <tbody id="adNews1" <c:if test="${rnd != 0 }">style="display: none;"</c:if>><tr><td colspan='4' class='space'></td></tr></tbody>
                <tbody id="adNews2" <c:if test="${rnd != 1 }">style="display: none;"</c:if>></tbody>
                <tbody id="adNews3" <c:if test="${rnd != 2 }">style="display: none;"</c:if>></tbody>
            </table>
        </div>

        <div class="m_title" style="border-top:none;"><!--예약-->
        	<img src="/resources/img/main/tit_quick_reservation.png" alt="今日特價酒店" />
        </div>
		<div class="hotel">
 			<div id="agodaSearchBox">&nbsp;</div>
 		</div>


        <div id="ad5"></div>
        <div class="m_title" style="border-bottom:none;"><!--한국뉴스-->
        	<img src="/resources/img/main/tit_korea_news.png" alt="Notice" /><a href="/news/list.do?news_category_no=4"><img src="/resources/img/main/notice_more.png" alt="more" class="more03" /></a>
        </div>
        <div class="add_news" ><!--한국뉴스 리스트-->
        	<table class="news" style="border-bottom:none;">
            	<colgroup>
                	<col width="14%" />
                    <col width="36%" />
                    <col width="14%" />
                    <col width="36%" />
                </colgroup>

	            <c:choose>
	            	<c:when test="${fn:length(chinaNews) > 0 }">
	            		<c:forEach var="data" items="${chinaNews}" varStatus="status">
	            			<c:if test="${status.index % 2 == 0 }"><tr></c:if>
	                        <th <c:if test="${status.index > 3}">class="end"</c:if>><a href="javascript:newsView('${data.news_category_no}', '${data.news_no}');"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image}" alt="샘플사진" /></a></th>
	                        <td <c:if test="${status.index > 3}">class="end"</c:if>>
								<div class="hand" onclick="javascript:newsView('${data.news_category_no}', '${data.news_no}');">
									<span>${data.title}</span><br/><c:out value="${fn:substring(data.content, 0, 30)}" escapeXml="false"></c:out>
								</div>
	                        </td>
							<c:if test="${status.index % 2 == 1 }"></tr></c:if>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise>
						<tr>
			            	<td colspan="4" class="space">데이터가 없습니다.</td>
			            </tr>
	            	</c:otherwise>
	            </c:choose>
            
            </table>
        </div>
        <div id="ad6"></div>
        <ul class="add_tab"> <!--뉴스탭-->
			<li><a href="javascript:adNewsTab(3);"><img src="/resources/img/main/add_tab04<c:if test="${rnd == 0 }">_on</c:if>.png" alt="新消息" id="adNewsImg4" /></a></li>
            <li><a href="javascript:adNewsTab(4);"><img src="/resources/img/main/add_tab05<c:if test="${rnd == 1 }">_on</c:if>.png" alt="推荐信息" id="adNewsImg5" /></a></li>
            <li><a href="javascript:adNewsTab(5);"><img src="/resources/img/main/add_tab06<c:if test="${rnd == 2 }">_on</c:if>.png" alt="特辑专栏" id="adNewsImg6" /></a></li>
        </ul>
        <div class="add_news"><!--뉴스 리스트-->
        	<table class="news" style="height:214px;">
            	<colgroup>
                	<col width="14%" />
                    <col width="36%" />
                    <col width="14%" />
                    <col width="36%" />
                </colgroup>

				<tbody id="adNews4" <c:if test="${rnd != 0 }">style="display: none;"</c:if>><tr><td colspan='4' class='space'></td></tr></tbody>
                <tbody id="adNews5" <c:if test="${rnd != 1 }">style="display: none;"</c:if>></tbody>
                <tbody id="adNews6" <c:if test="${rnd != 2 }">style="display: none;"</c:if>></tbody>                
            </table>
        </div>
        
		<div class="toon2" id="ad9"></div>
        
        <div class="m_title"><!--공지사항-->
        	<img src="/resources/img/main/tit_notice.png" alt="Notice" /><a href="/community/notice.do"><img src="/resources/img/main/notice_more.png" alt="more" class="more02" /></a>
        </div>
        <ul class="notice">
        	<c:choose>
        		<c:when test="${fn:length(notice) > 0 }">
		        	<c:forEach items="${notice}" var="data" varStatus="status">
		        		<li style="overflow: hidden;"><a href="/community/notice_view.do?no=${data.no}"><c:out value="${fn:substring(data.title, 0, 25)}" escapeXml="false"></c:out></a></li>
		        	</c:forEach>
        		</c:when>
        	</c:choose>
        </ul>
    </div><!--여기까지 Center 끝-->
    <div id="Right"><!--여기부터 Right 시작-->
		<div id="ad3"><%-- <a href="${adList[2].link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${adList[2].image}" /></a><!-- <br/> --> --%></div>
    	<!-- <a href="#"><img src="/resources/img/main/add_banner.png" alt="배너" /></a><br/> -->
        <a href="/deal/main.do"><img src="/resources/img/main/deal.png" alt="이달의 딜" /></a><br/>
        <img src="/resources/img/main/tit_wingko_coupon.png" alt="WINGKO优惠卷" /><br/>
        <a href="/coupon/list.do?category_no=8"><img src="/resources/img/main/coupon_01.png" alt="购物" /></a><a href="/coupon/list.do?category_no=9"><img src="/resources/img/main/coupon_02.png" alt="住宿" /></a><br/>
        <a href="/coupon/list.do?category_no=10"><img src="/resources/img/main/coupon_03.png" alt="美食" /></a><a href="/coupon/list.do?category_no=11"><img src="/resources/img/main/coupon_04.png" alt="美容" /></a><br/>
        <a href="/coupon/list.do?category_no=12"><img src="/resources/img/main/coupon_05.png" alt="医疗" /></a><a href="/coupon/list.do?category_no=13"><img src="/resources/img/main/coupon_06.png" alt="文化" /></a><br/>
        <a href="/coupon/list.do?best=1"><img src="/resources/img/main/tit_wingko_best.png" alt="wingko best" /></a>
        <br />
        <div class="coupon"><!--쿠폰-->
        	<ol id="coupon_best">
            	<li class="one" id="coupon_1">신라면세점 30% 쿠폰</li>
            	<li class="two" id="coupon_2">롯데면세점 30% 쿠폰</li>
            	<li class="three" id="coupon_3">강남에스테틱 30% 쿠폰</li>
            </ol>
        </div>
        
		<div class="weibo">
			<iframe width="164" height="350" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?width=164&height=350&fansRow=1&ptype=1&speed=100&skin=1&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=3719392632&verifier=09d0e2bb&dpc=1"></iframe>
		</div>
		
        <img src="/resources/img/main/tit_rail_pass.png" alt="Rail Pass" />
        <div class="rail_pass"><!--레일패스-->
        	<a href="/travel/view.do?travel_no=${railPass.travel_no }">
	        	<img src="/upload/travel/${railPass.image }" alt="RailPass" style="width: 166px;height: 100px;" /><!--이미지 사이즈 너비 164고정-->
	        	<div style="font-size: 12px;">${railPass.title }</div>
            </a>
        </div>
        <div id="ad4"></div>
    </div><!--여기부터 Right 끝-->
</div>

<!-- BOTTOM Include -->
<c:import url="inc/bottom.jsp" charEncoding="UTF-8" />

<!-- 시계(s)  -->
<script type="text/javascript">
$(document).ready(function() {
	var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
	var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

	var newDate = new Date();
	newDate.setDate(newDate.getDate());
	$('#date').html(dayNames[newDate.getDay()] + ", <br />" + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	setInterval( function() {
		var minutes = new Date().getMinutes();
		$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
	}, 1000);
		
	setInterval( function() {
		var hours = new Date().getHours();
		$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
	}, 1000);
}); 
</script>
<!-- 시계(e)  -->

<script src="http://ajaxsearch.partners.agoda.com/partners/SearchBox/Scripts/Agoda.SearchBoxV2.js" type="text/javascript"></script>
<script type="text/javascript">
	var AgodaSearch = new AgodaSearchBox({
		cid: 1610816,
		filterCityName: 'seoul',
		fixedCityName: false,
		fixedCityNameVisible:true,
		hotelID: '',
		checkInDateBefore:3,
		night:2,
		language:7,
		currencyCode: 'USD',
		newWindow: true,
		header: 'http://www.wingkostory.com/resources/img/logo.png',
		footer: 'http://www.wingkostory.com/resources/img/main/copyright.png',
		style: 'style',
		Element: 'agodaSearchBox'
	});
	$("#SearchButton").val("search");
</script>
			
<style>
	.hotel{border:1px solid #dedede; border-top:hidden; background:#fff; height:155px;}
	#AgodaSearchBox {
		width:540px;
		text-align:left;
		margin-top:10px;
		margin-left:30px;
		padding: 0px 5px;
		float:left;
		text-align: center; 
		height:auto;
	}

	#AgodaSearchBoxWrapper *
	{
		font-family:verdana, Tahoma;
		font-size:14px;
		color:#333;
	}

	#AgodaSearchBoxWrapper #AgodaLogo
	{
		width: 96%;
		height: auto;
		text-align: right;
		padding: 0
	}

	#AgodaSearchBoxWrapper #logodiv
	{
		height:18px;
		width:auto;
	}

	#AgodaSearchBoxWrapper #AgodaLogo .txt
	{
		font-size:11px;
		display:inline;
		color:#666;
		float:left;
	}


	#AgodaSearchBoxWrapper #AgodaLogo .logo
	{
		width:155px;
		height:17px;
		display:inline-block;
		background-image:url(http://img.agoda.net/images/affiliates/agoda_logo_small.png);
		background-position:0 0;
		background-repeat:no-repeat;
		margin:0 3px;
	}

	#AgodaSearchBoxWrapper
	{
		width: 250px;
		float:left;
		height:auto;
	}

	#AgodaSearchBoxWrapper #Title1
	{
		float:left;
		width:240px;
		height:50px;
		font-size:14px;
		color:#333333;
		font-weight:bold;
		position:absolute;
		left:15px;
		top:7px;
		display:none;
	}

	#AgodaSearchBoxWrapper #Title2
	{
		float:left;
		width:40px;
		height:50px;
		display:none;
	}

	#AgodaSearchBox #ButtonField
	{
		width:90%;
		float:left;
		height:auto;
	}

	#AgodaSearchBox #CityRow
	{
		width:100%;
		padding:4px;
		float:left;
		height:auto;  
		margin-bottom:4px;
	}

	#AgodaSearchBox #CheckInRow
	{
		width:100%;
		padding:4px;
		float:left;
		height:auto; 
	}

	#AgodaSearchBox #CityLabel
	{
		width:72px;
		float:left;
		height:auto;
	}

	#AgodaSearchBox #CheckInLabel
	{
		width:72px;
		float:left;
		height:auto;
		font-size:14px;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}

	#AgodaSearchBox #CheckInField
	{
		width:300px;
		margin-left:8px;
		float:left;
		height:22px;
		text-align:left;
		font-weight:normal;
	}


	#AgodaSearchBox .CityTextBox
	{
		font-size:14px;
		color:#333333 !important;
		width:400px;
		border:1px solid #c2c2c2;
		height:22px;
		padding-left:5px;
	}

	#AgodaSearchBox #CheckInField img
	{
		width: 23px;
		height: 20px;
		cursor: pointer;
		margin-top: 0px;
		margin-right: 10px;
		float: left;
		background-image:url(http://img.agoda.net/images/affiliates/calendar.gif);
		background-repeat:no-repeat;
		margin-top:3px;
	}

	#AgodaSearchBox .CheckInDateTextBox 
	{
		float:left;
		margin-right:2px;
		font-size:13px;
		color:#333333 !important;
		width:250px;
		height:22px;
		border:1px solid #c2c2c2;
	}

	#AgodaSearchBox #CityField
	{
		width:100%;
		height:auto;
		text-align:left;
		margin-left:80px;
	}

	#AgodaSearchBox img
	{
		width:auto;
		height:auto;
		cursor:pointer;
		margin-top:0px;
		margin-right:10px;
		top:0px;
	}

	#AgodaSearchBox .Invalid
	{
		background-color:#ffd400 !important;
	}

	#AgodaSearchBox #Night
	{
		width:45px;
		border-color:#c2c2c2;
	}

	#AgodaSearchBox #NightLabel
	{
		width:67px;
		font-family:Verdana, Arial, Helvetica, sans-serif;
		font-size:14px;
		color:#333;
		float:left;
		height:auto;
	}

	#AgodaSearchBox #NightRow
	{
		margin-left:380px;
		width:150px;
		height:auto;
		text-align:left;
	}

	#AgodaSearchBox .Row
	{
		width:96%;
		padding:2%;
		float:left;
		height:auto;  
	}

	#AgodaSearchBoxWrapper.RTL #AgodaSearchBox div, #AgodaSearchBoxWrapper.RTL #AgodaSearchBox span, #AgodaSearchBoxWrapper #AgodaLogo
	{
		direction:rtl;
		float:right !important;
	}

	#AgodaSearchBoxWrapper.RTL input, #AgodaSearchBoxWrapper.RTL #CheckInField  img
	{
		float:right;
	}


	#AgodaSearchBoxWrapper.RTL #CheckInField  img
	{
		margin-right:2px;
	}

	#AgodaSearchBoxWrapper.RTL #SearchButton

	{
		float:right;
		margin-right:0;
	}

	#AgodaSearchBoxWrapper.RTL #NightRow
	{
		text-align:right !important;
	}

	#AgodaSearchBoxWrapper.RTL  #AgodaLogo .logo
	{
		background-position: 0 1px;
		float:left !important;
	}

	#AgodaSearchBoxWrapper.RTL #logodiv
	{
		float:right;
	}

	#AgodaSearchBox Select
	{
		width:44px;
		height:20px;
	}

	#AgodaSearchBox span
	{
		position:relative;
	}

	#AgodaSearchBox #SearchButton
	{
		margin-left:193px;
		margin-top:15px;
		padding: 5px 50px;
		float:left;
		cursor: pointer;
		font-size: 13px;
		font-weight: 600;
		margin-bottom:5px;
	}

	#AgodaSearchBox #SearchButtonRow
	{
		width:100%;
		height:55px;
		text-align:center;
	}

	#AgodaSearchBox .TextBox
	{
		width:262px;
		background-color:#fffedf;
		float:left;
		margin-right:2px;
		font-size:13px;
		color:#333333 !important;
	}

</style>
</body>
</html>

