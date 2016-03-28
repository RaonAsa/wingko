<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 상단고정
  --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="/resources/js/jquery.vticker.js"></script>
<script src="/resources/js/jquery.bxslider.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/jquery.bxslider.css" />

<script>
	
	$(document).ready(function() {

		getRank();
		getQuick();
		getTopRightAd();

		function viewQuick(){
			var scroll = $(window).scrollTop();
			var view = $('#quick_menu');
			if (scroll > 200) {
				view.css({'position':'fixed', 'top':'-5px', 'left':'985'});
			} else {
				view.attr("style", "position:absolute;");
			}
		}
		viewQuick();
		$(window).bind('scroll resize', viewQuick);
		
		$("#top_search").click(function() {
			$("#s_form").submit();
		});
		

		
		$("#btn_menu").click(function() {
			$("#m_all").slideToggle('fast');
		});
		$("#real").bind({
			mouseover: function() { $("#open_real").show(); },
			mouseout: function() { $("#open_real").hide(); }
		});
		
		for(var i=2; i<=8; i++) {
			(new Image).src = "/resources/img/main/m_menu0"+i+"_on.png";
			(new Image).src = "/resources/img/main/m_menu0"+i+".png";
		}
		$("#btn_sub_1").bind({
			mouseover: function() { $("#btn_sub_1").attr("class", "on seconde"); $("#i1").attr("src", "/resources/img/main/m_menu02_on.png"); $("#a1").show(); },
			mouseout: function() { $("#btn_sub_1").removeClass("on"); $("#i1").attr("src", "/resources/img/main/m_menu02.png"); $("#a1").hide(); }
		});
		$("#btn_sub_2").bind({
 			mouseover: function() { $("#btn_sub_2").addClass("on"); $("#a2").show(); $("#i2").attr("src", "/resources/img/main/m_menu03_on.png"); },
			mouseout: function() { $("#btn_sub_2").removeClass("on"); $("#a2").hide(); $("#i2").attr("src", "/resources/img/main/m_menu03.png"); }
		});
		$("#btn_sub_3").bind({
			mouseover: function() { $("#btn_sub_3").addClass("on"); $("#a3").show(); $("#i3").attr("src", "/resources/img/main/m_menu04_on.png"); },
			mouseout: function() { $("#btn_sub_3").removeClass("on"); $("#a3").hide(); $("#i3").attr("src", "/resources/img/main/m_menu04.png"); }
		});
		$("#btn_sub_4").bind({
			mouseover: function() { $("#btn_sub_4").addClass("on"); $("#a4").show(); $("#i4").attr("src", "/resources/img/main/m_menu05_on.png"); },
			mouseout: function() { $("#btn_sub_4").removeClass("on"); $("#a4").hide(); $("#i4").attr("src", "/resources/img/main/m_menu05.png"); }
		});
		$("#btn_sub_5").bind({
			mouseover: function() { $("#btn_sub_5").addClass("on"); $("#a5").show(); $("#i5").attr("src", "/resources/img/main/m_menu06_on.png"); },
			mouseout: function() { $("#btn_sub_5").removeClass("on"); $("#a5").hide(); $("#i5").attr("src", "/resources/img/main/m_menu06.png"); }
		});
		$("#btn_sub_6").bind({
			mouseover: function() { $("#btn_sub_6").addClass("on"); $("#a6").show(); $("#i6").attr("src", "/resources/img/main/m_menu07_on.png"); },
			mouseout: function() { $("#btn_sub_6").removeClass("on"); $("#a6").hide(); $("#i6").attr("src", "/resources/img/main/m_menu07.png"); }
		});
		$("#btn_sub_7").bind({
			mouseover: function() { $("#btn_sub_7").addClass("on"); $("#a7").show(); $("#i7").attr("src", "/resources/img/main/m_menu08_on.png"); },
			mouseout: function() { $("#btn_sub_7").removeClass("on"); $("#a7").hide(); $("#i7").attr("src", "/resources/img/main/m_menu08.png"); }
		});
		$("#btn_sub_8").bind({
			mouseover: function() { $("#btn_sub_8").addClass("on"); $("#a8").show(); $("#i8").attr("src", "/resources/img/main/m_menu09_on.png"); },
			mouseout: function() { $("#btn_sub_8").removeClass("on"); $("#a8").hide(); $("#i8").attr("src", "/resources/img/main/m_menu09.png"); }
		});
		
		
		
/* 		function viewBanner(){
			var scroll = $(window).scrollTop();
			var view = $('div.quick');
			var viewposiotion = $('#Center .toon').height()+$('#sideBanner').offset().top;
			var dealArea = $('ul.gnbTabBox');
			var coupangWidth = dealArea.offset().left+dealArea.width()+15;
			
			if (scroll > viewposiotion+10) {
				view.css({'position':'fixed', 'top':'10px', 'left':coupangWidth});
			} else {
				view.css({position:'absolute', 'top':'235', 'left':'0'});
			}
		}
		viewBanner();
		$(window).bind('scroll resize', viewBanner); */
		
		
		/* 
		$("#quick").animate( { "top": $(document).scrollTop() + 20 +"px" }, 500 );
		$(window).scroll(function(){
			$("#quick").stop();
			$("#quick").animate( { "top": $(document).scrollTop() + 20 + "px" }, 1000 );
		}); */
	});
	
	var go = function(url) {
		location.href = url;
	};
	var goStore = function(no) {
		location.href = "/store/main.do?store_no="+no;
	};
	var goNews = function(no) {
		location.href = "/news/view.do?news_no="+no;
	};
	
	var goSearch = function(word) {
		$("#searchString").hide();
		$("#searchString").val(word);
		$("#s_form").submit();
	}
	
	var getRank = function() {
		$.ajax({
			url: "/ad/rank.do",
			dataType: "json",
			beforeSend: function(){
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				// console.log(obj);
				$.each(obj, function(key, val) {
					var _rank = val.rank,
						_word = val.word;

					$("#rank"+_rank).attr("onclick", "javascript:goSearch('"+_word+"');").text(_word);
					$("#r_rank"+_rank).html("<span style='color: #333;'>"+_word+"</span>");
					/* if (_rank == 1) {
						$("#rank").text(_word);	
					} */
				});
				$("#div_rank").show();
				
				$(function(){  
				    $('#div_rank').vTicker({   
				        speed: 500,  
				        pause: 3000,  
				        animation: 'fade',  
				        mousePause: false,  
				        showItems: 1,  
				        height: 0,  
				        direction: 'up'  
				    });  
				});  
			}
		});
	};
	
	var getQuick = function() {
		$.ajax({
			url: "/json_quick.do",
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				// console.dir(obj);
				var _html = "";
				$.each(obj, function(key, val) {
					var _no = val.no,
						_img = val.image,
						_title = val.title,
						_content = val.content,
						_content_type = val.content_type;
					
					if (_title.length > 14) {
						_title = _title.substring(0, 13);
					}
					
					if ( _content_type == "store" ) {
						_html += "<tr><td class='hand' onclick=\"javascript:goStore('"+_no+"');\"><img src=\"http://www.wingkostory.com/upload/store/"+_img+"\" style='width: 80px; height: 55px;' /></td></tr>";
						_html += "<tr><td class='hand' onclick=\"javascript:goStore('"+_no+"');\">"+_title+"</td></tr>";
					} else {
						_html += "<tr><td class='hand' onclick=\"javascript:goNews('"+_no+"');\"><img src=\"http://www.wingkostory.com/upload/news/"+_img+"\" style='width: 80px; height: 55px;' /></td></tr>";
						_html += "<tr><td class='hand' onclick=\"javascript:goNews('"+_no+"');\">"+_title+"</td></tr>";
					}
					
					$("#quick").html(_html);
					
				});
			}
		});
	};
	
	var getTopRightAd = function() {
		$.ajax({
			url: "/json_toprightad.do",
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				var _html = "";
				var i = 0;
				$.each(obj, function(key, val) {
					var _link = val.link,
						_image = val.image;
					i++;
					// <div class="active item"><a href="${data.link}"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="배너" /></a></div>
					// <div class="item"><a href="${data.link}"><img src="http://www.wingkostory.com/upload/ad/${data.image}" alt="배너" /></a></div>
					if (i == 1) {
						_html = "<li><a href=\""+_link+"\"><img src=\"http://www.wingkostory.com/upload/ad/"+_image+"\" alt=\"배너\" style='width:190px; height:118px;' /></a></li>";
					} else {
						_html = "<li><a href=\""+_link+"\"><img src=\"http://www.wingkostory.com/upload/ad/"+_image+"\" alt=\"배너\" style='width:190px; height:118px;' /></a></li>";
					}

					$("#bxslider").append(_html);

				});
				//$('#myCarouselTopRight').carousel({
				//	interval: 7000
				//});
				
				$('#bxslider').bxSlider({
					pager : false,
					nextSelector: '#slider-next',
					prevSelector: '#slider-prev',
					nextText: '<img src="/resources/img/menu/top_banner_next.png" />',
					prevText: '<img src="/resources/img/menu/top_banner_prev.png" />'
				});
			}
		});
	};
</script>

	<div id="Top">
		<ul class="header"><!--탑메뉴-->
    		<c:choose>
    			<c:when test="${fn:length(sessionScope['user_id']) > 0 }">
		        	<li class="first"><a href="/logout.do"><img src="/resources/img/menu/top_menu01_1.png" alt="退出" /></a></li>
		            <li><a href="/my/my_info.do"><img src="/resources/img/menu/top_menu03.png" alt="My Page" /></a></li>
		            <li><a href="/wingshow/main.do"><img src="/resources/img/menu/top_menu04.png" alt="wing show" /></a></li>
		            <li><a href="/travel/info.do?menu=info&no=2"><img src="/resources/img/menu/top_menu05.png" alt="Visa" /></a></li>
		            <li><a href="/community/job.do"><img src="/resources/img/menu/top_menu06.png" alt="Job Info" /></a></li>
		            <li class="end"><a href="/community/notice.do"><img src="/resources/img/menu/top_menu07.png" alt="Community" /></a></li>
    			</c:when>
    			<c:otherwise>
		        	<li class="first"><a href="/login.do"><img src="/resources/img/menu/top_menu01.png" alt="登录" /></a></li>
		            <li><a href="/join/join_s1.do"><img src="/resources/img/menu/top_menu02.png" alt="注册会员" /></a></li>
		            <li><a href="/wingshow/main.do"><img src="/resources/img/menu/top_menu04.png" alt="wing show" /></a></li>
		            <li><a href="/travel/info.do?menu=info&no=2"><img src="/resources/img/menu/top_menu05.png" alt="Visa" /></a></li>
		            <li><a href="/community/job.do"><img src="/resources/img/menu/top_menu06.png" alt="Job Info" /></a></li>
		            <li class="end"><a href="/community/notice.do"><img src="/resources/img/menu/top_menu07.png" alt="Community" /></a></li>
    			</c:otherwise>
    		</c:choose>
		</ul>
		<div class="logo"><a href="/index.do"><img src="/resources/img/logo.png" alt="wingko story" /></a></div><!--로고-->
		<form method="post" action="/search/result.do" id="s_form">
        <div class="search"><!--검색창-->
        	<input type="text" class="s_txt" name="searchString" id="searchString" /><a href="#"><img src="/resources/img/main/suggest.png" alt="서제스트" style="vertical-align:bottom " /></a><a href="#" id="top_search"><img src="/resources/img/main/m_search.png" alt="검색" style="vertical-align:bottom"/></a>
        </div>
        </form>
		<div class="real_time" id="real"><!--실시간 검색순위-->
			<div class="open_real" id="open_real" style="display: none;">
				<div class="open_tit">实时问题</div><!--실시간이슈-->
				<ul>
					<li><img src="/resources/img/main/s01.png" alt="1" align="absbottom"/> <a id="rank1" href="#">바다 불티</a></li>
					<li><img src="/resources/img/main/s02.png" alt="2" align="absbottom"/> <a id="rank2" href="#">이승현 시구</a></li>
					<li><img src="/resources/img/main/s03.png" alt="3" align="absbottom"/> <a id="rank3" href="#">조장혁 저녁놀</a></li>
					<li><img src="/resources/img/main/s04.png" alt="4" align="absbottom"/> <a id="rank4" href="#">강호동 아들 밥 3그릇</a></li>
					<li><img src="/resources/img/main/s05.png" alt="5" align="absbottom"/> <a id="rank5" href="#">Kill Everybody</a></li>
					<li><img src="/resources/img/main/s06.png" alt="6" align="absbottom"/> <a id="rank6" href="#">All I Ask Of You</a></li>
					<li><img src="/resources/img/main/s07.png" alt="7" align="absbottom"/> <a id="rank7" href="#">With Your Friends</a></li>
					<li><img src="/resources/img/main/s08.png" alt="8" align="absbottom"/> <a id="rank8" href="#">不仅是美国好莱坞的</a></li>
					<li><img src="/resources/img/main/s09.png" alt="9" align="absbottom"/> <a id="rank9" href="#">的艺人们必备的化妆品</a></li>
					<li class="end"><img src="/resources/img/main/s10.png" alt="10" align="absbottom"/> <a id="rank10" href="#">不仅是美国好莱坞的演</a></li>
				</ul>
			</div>
			<div id="div_rank" style="display: none;">
				<ul>
					<li><img src="/resources/img/main/s01.png" alt="1" align="absbottom"/> <span id="r_rank1">바다 불티</span></li>
					<li><img src="/resources/img/main/s02.png" alt="2" align="absbottom"/> <span id="r_rank2">이승현 시구</span></li>
					<li><img src="/resources/img/main/s03.png" alt="3" align="absbottom"/> <span id="r_rank3">조장혁 저녁놀</span></li>
					<li><img src="/resources/img/main/s04.png" alt="4" align="absbottom"/> <span id="r_rank4">강호동 아들 밥 3그릇</span></li>
					<li><img src="/resources/img/main/s05.png" alt="5" align="absbottom"/> <span id="r_rank5">Kill Everybody</span></li>
					<li><img src="/resources/img/main/s06.png" alt="6" align="absbottom"/> <span id="r_rank6">All I Ask Of You</span></li>
					<li><img src="/resources/img/main/s07.png" alt="7" align="absbottom"/> <span id="r_rank7">With Your Friends</span></li>
					<li><img src="/resources/img/main/s08.png" alt="8" align="absbottom"/> <span id="r_rank8">不仅是美国好莱坞的</span></li>
					<li><img src="/resources/img/main/s09.png" alt="9" align="absbottom"/> <span id="r_rank9">的艺人们必备的化妆品</span></li>
					<li class="end"><img src="/resources/img/main/s10.png" alt="10" align="absbottom"/> <span id="r_rank10">不仅是美国好莱坞的演</span></li>
				</ul>
			</div>
		</div>
		
		
		
		<div class="top_banner ">
	    	<div class="b_pic_prev" id="slider-prev"></div>
			<div class="b_pic_next" id="slider-next"></div>
			<ul id="bxslider"></ul>
		</div><!--배너. 배너사이즈는 222*118을 넘으면 안됨.-->
		
		
		
		<ul class="m_menu"><!--메인메뉴-->
			<li class="first" id="btn_menu"><a href="#"><img src="/resources/img/main/m_menu01.png" alt="查看全部菜单" /></a></li>
			<li class="second" id="btn_sub_1">
				<a href="/travel/info.do"><img id="i1" src="/resources/img/main/m_menu02.png" alt="韩国旅游信息" /></a><br />
				<div class="a1" id="a1" style="display: none;"><!--   -->
					<table class="menu_d">
						<caption>한국관광정보:한국여행정보,한국교통정보,통신/와이파이/픽업,지역별분류,기타한국정보</caption>
						<tr onclick="javascript:go('/travel/info.do');"><td>韩国旅游信息</td></tr>
						<tr onclick="javascript:go('/travel/info.do?menu=traffic&no=7');"><td>韩国交通信息</td></tr>
						<tr onclick="javascript:go('/travel/info.do?menu=communication&no=13');"><td>通讯,WIFI,接送</td></tr>
						<tr onclick="javascript:go('/travel/list_location.do?no=16&location_no=12');"><td>地区分类</td></tr>
						<tr onclick="javascript:go('/travel/list.do?travel_category_no=10');"><td>其他韩国信息</td></tr>
					</table>
				</div>
			</li>
			<li id="btn_sub_2">
				<a href="/location/main.do"><img id="i2" src="/resources/img/main/m_menu03.png" alt="地区" /></a><br />
				<div class="a2" id="a2" style="display: none;">
					<table class="menu_d">
						<caption>지역:서울,제주,경기,부산,강원,기타지역</caption>
						<tr onclick="javascript:go('/location/main.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/location/main.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/location/main.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/location/main.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/location/main.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/location/main.do?location_no=17');"><td>其他地区</td></tr>
					</table>
				</div>
			</li>
			<li id="btn_sub_3">
				<a href="/sub/shopping.do"><img id="i3" src="/resources/img/main/m_menu04.png" alt="购物" /></a><br />
				<div class="a3" id="a3" style="display: none;">
					<table class="menu_d">
						<caption>쇼핑:서울,제주,경기,부산,강원,기타지역,이달의딜</caption>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/shopping.do?location_no=17');"><td>其他地区</td></tr>
						<tr onclick="javascript:go('/deal/main.do');"><a href="#"><td>本月推荐商品</td></tr>
					</table>
				</div>
			</li>
			<li id="btn_sub_4">
				<a href="/sub/lodging.do"><img id="i4" src="/resources/img/main/m_menu05.png" alt="住宿" /></a><br />
				<div class="a4" id="a4" style="display: none;">
					<table class="menu_d">
						<caption>숙박:서울,제주,경기,부산,강원,기타지역,이달의딜</caption>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/lodging.do?location_no=17');"><td>其他地区</td></tr>
					</table>
				</div>
			</li>
			<li id="btn_sub_5">
				<a href="/sub/gourmet.do"><img id="i5" src="/resources/img/main/m_menu06.png" alt="美食" /></a><br />
				<div class="a5" id="a5" style="display: none;">
					<table class="menu_d">
						<caption>맛집:서울,제주,경기,부산,강원,기타지역</caption>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/gourmet.do?location_no=17');"><td>其他地区</td></tr>
					</table>
				</div>
			</li><!--선택시 클래스on 이미지역시 바뀜 크롬때문에 어쩔 수 없음-->
			<li id="btn_sub_6">
				<a href="/sub/beauty.do"><img id="i6" src="/resources/img/main/m_menu07.png" alt="美容" /></a><br />
				<div class="a6" id="a6" style="display: none;">
					<table class="menu_d">
						<caption>뷰티:미용실,스파/마사지,메이크업,쁘띠성형,네일아트,두피관리</caption>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=17');"><td>其他地区</td></tr>
						<!-- <tr onclick="javascript:go('/sub/beauty.do?location_no=12');"><td>美容院</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=13');"><td>SPA/按摩</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=14');"><td>化妆</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=15');"><td>微整形</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=16');"><td>美甲</td></tr>
						<tr onclick="javascript:go('/sub/beauty.do?location_no=17');"><td>头皮管理</td></tr> -->
					</table>
				</div>
			</li>
			<li id="btn_sub_7">
				<a href="/sub/medical.do"><img id="i7" src="/resources/img/main/m_menu08.png" alt="医疗" /></a><br />
				<div class="a7" id="a7" style="display: none;">
					<table class="menu_d">
						<caption>의료:건강검진,성형외과,피부과,치과,산부인과,한의원,관절척추</caption>
						<tr onclick="javascript:go('/sub/medical.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=17');"><td>其他地区</td></tr>
						<!-- <tr onclick="javascript:go('/sub/medical.do?location_no=12');"><td>体检</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=13');"><td>整形外科</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=14');"><td>皮肤科</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=15');"><td>牙科</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=16');"><td>妇产科</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=17');"><td>韩医院</td></tr>
						<tr onclick="javascript:go('/sub/medical.do?location_no=17');"><td>关节脊椎</td></tr> -->
					</table>
				</div>
			</li>
			<li id="btn_sub_8">
				<a href="/sub/culture.do"><img id="i8" src="/resources/img/main/m_menu09.png" alt="文化" /></a><br />
				<div class="a8" id="a8" style="display: none;">
					<table class="menu_d">
						<caption>컬쳐:공연,카지노,놀이동산,기타</caption>
						<tr onclick="javascript:go('/sub/culture.do?location_no=12');"><td>首尔</td></tr>
						<tr onclick="javascript:go('/sub/culture.do?location_no=13');"><td>济州</td></tr>
						<tr onclick="javascript:go('/sub/culture.do?location_no=14');"><td>京畿</td></tr>
						<tr onclick="javascript:go('/sub/culture.do?location_no=15');"><td>釜山</td></tr>
						<tr onclick="javascript:go('/sub/culture.do?location_no=16');"><td>江原</td></tr>
						<tr onclick="javascript:go('/sub/culture.do?location_no=17');"><td>其他地区</td></tr>
						<!-- <tr onclick="javascript:go('');"><a href="/sub/culture.do"><td>演出</td></tr>
						<tr onclick="javascript:go('');"><a href="/sub/culture.do"><td>赌场</td></tr>
						<tr onclick="javascript:go('');"><a href="/sub/culture.do"><td>游乐场</td></tr>
						<tr onclick="javascript:go('');"><a href="/sub/culture.do"><td>其他</td></tr> -->
					</table>
				</div>
			</li>
			<li class="end"><a href="/wingshow/info.do"><img src="/resources/img/main/m_menu10.png" alt="wingshow?" /></a></li>
		</ul>
	</div>
	<div class="main_picture">
 		<div class="m_all" id="m_all" style="display: none;"><!--여기부터 전체메뉴 클릭시 나오는 메뉴-->
			<table class="all_menu">
				<caption>전체메뉴</caption>
				<colgroup>
					<col width="16%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				<tr>
					<th>韩国旅游信息</th><!--한국관광정보-->
					<th>地区</th><!--지역-->
					<th>购物</th><!--쇼핑-->
					<th>住宿</th><!--숙박-->
					<th>美食</th><!--맛집-->
					<th>美容</th><!--뷰티-->
					<th>医疗</th><!--의료-->
					<th>文化</th><!--컬쳐-->
				</tr>
				<tr>
					<td colspan="8" class="space end"></td>
				</tr>
				<tr>
					<td>
						<a href="/travel/info.do">韩国旅游信息</a><br/><!--한국여행정보-->
						<a href="/travel/info.do?menu=traffic&no=7">韩国交通信息</a><br/><!--한국교통정보-->
						<a href="/travel/info.do?menu=communication&no=13">通讯,WIFI,接送</a><br/><!--통신,와이파이,픽업-->
						<a href="/travel/list_location.do?no=16&location_no=12">地区分类</a><br/><!--지역별분류-->
						<a href="/travel/list.do?travel_category_no=10">其他韩国信息</a><!--기타한국정보-->
					</td>
					<td>
						<a href="/location/main.do">首尔</a><br/><!--서울-->
						<a href="/location/main.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/location/main.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/location/main.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/location/main.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/location/main.do?location_no=17">其他地区</a><!--기타지역-->
					</td>
					<td class="ss"><!-- 쇼핑 -->
						<a href="/sub/shopping.do">首尔</a><br/><!--서울-->
						<a href="/sub/shopping.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/shopping.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/shopping.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/shopping.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/shopping.do?location_no=17">其他地区</a><br/><!--기타지역-->
						<a href="/deal/main.do">本月推荐商品</a><!--이달의딜-->
					</td>
					<td><!-- 숙박 -->
						<a href="/sub/lodging.do">首尔</a><br/><!--서울-->
						<a href="/sub/lodging.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/lodging.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/lodging.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/lodging.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/lodging.do?location_no=17">其他地区</a><br/><!--기타지역-->
					</td>
					<td><!-- 맛집 -->
						<a href="/sub/gourmet.do">首尔</a><br/><!--서울-->
						<a href="/sub/gourmet.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/gourmet.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/gourmet.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/gourmet.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/gourmet.do?location_no=17">其他地区</a><br/><!--기타지역-->
					</td>
					<td><!-- 미용 -->
						<a href="/sub/beauty.do">首尔</a><br/><!--서울-->
						<a href="/sub/beauty.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/beauty.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/beauty.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/beauty.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/beauty.do?location_no=17">其他地区</a><br/><!--기타지역-->
					</td>
					<td><!-- 의료 -->
						<a href="/sub/medical.do">首尔</a><br/><!--서울-->
						<a href="/sub/medical.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/medical.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/medical.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/medical.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/medical.do?location_no=17">其他地区</a><br/><!--기타지역-->
					</td>
					<td class="end"><!-- 컬쳐 -->
						<a href="/sub/culture.do">首尔</a><br/><!--서울-->
						<a href="/sub/culture.do?location_no=13">济州</a><br/><!--제주-->
						<a href="/sub/culture.do?location_no=14">京畿</a><br/><!--경기-->
						<a href="/sub/culture.do?location_no=15">釜山</a><br/><!--부산-->
						<a href="/sub/culture.do?location_no=16">江原</a><br/><!--강원-->
						<a href="/sub/culture.do?location_no=17">其他地区</a><br/><!--기타지역-->
					</td>
				</tr>
			</table>
		</div><!--여기까지 전체메뉴-->
		<div class="quick" id="quick_menu">
			<img src="/resources/img/quick_b01.png" />
			<div class="quick_list">
				<table id="quick">
					<caption>퀵리스트</caption>
				</table>
			</div>
		</div>
	</div>