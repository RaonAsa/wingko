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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-CN"></script>
<script src="/resources/js/sns.js"></script>
<script src="/resources/js/wingko.js"></script>
<script src="/resources/js/message.js"></script>
<script>
	$(document).ready(function() {
		var user_no = '${user_no}';
		$("img[id=pic]").mouseover(function(){ 
			$(".pic_on").removeClass("pic_on");
			$(this).parent().addClass("pic_on");
			$("#pic_on").attr("src", $(this).attr('src')).fadeIn('slow');
		});


		$("img[id=coupon]").click(function(){ 
			var strFeature = "";
			strFeature += "width=800, height=600, all=no";
			var objWin = window.open('', 'print', strFeature);
			objWin.document.write("<img src='"+ $(this).attr('src') +"' />");
			objWin.document.close();
			
			objWin.print();
			objWin.close();
		});
		
		$("img[id=cart]").click(function(){
			var menu_no = $(this).attr("no");
			if (user_no == '') {
				if ( confirm(m.confirm.login) ) {
					location.href = '/login.do';
				} else {
					return;
				}
			} else { 
				$.ajax({
					url: "/store/addcart.do?menu_no="+menu_no,
					beforeSend: function(){
						//$('#loading').show().fadeIn('fast');
					},
					complete: function(data){
						var obj = data.responseText;
						if ( confirm(m.confirm.cart) ) {
							location.href = '/wingshow/main.do';
						} else {
							return;
						}
					}
				});
			}
		});
		
		$("img[id='btn_scrap']").click(function() {
			insertScrap(user_no, "store", "${store.store_no}");
		});
		
		$("#btn_insert").click(function(){
			if (user_no == '') {
				if ( confirm(m.confirm.login) ) {
					location.href = '/login.do';
				} else {
					return;
				}
			} else if (confirm(m.confirm.ripple)) {
				$("#frm_ripple").submit();	
			} else {
				return;
			}
		});
		
		
		$("#review_content").bind('keyup', function(){
			checkContentSize($("#review_content"), $("#byte"));
		});

		$("#reply_textarea").bind({
			keyup : function() {
				checkContentSize($("#reply_textarea"), $("#reply_byte"));
			}
		});
		
		$("#reply_cancel").bind({
			click : function() {
				$("#reply_" + $("#reply_no").val()).hide();
			}
		});
		
		$("#reply_save").bind({
			click : function() {
				if (user_no == '') {
					if ( confirm(m.confirm.login) ) {
						location.href = '/login.do';
					} else {
						return;
					}
				} else if (confirm(m.confirm.ripple)) {
					$("#frm_reply").submit();	
				} else {
					return;
				}
			}	
		});
		
		
		var mapOptions = {
				zoom: 16,
				center: new google.maps.LatLng('${store.y}', '${store.x}'),
				mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById('st_map_view'), mapOptions);
		var infoWindow = new google.maps.InfoWindow();
		var x = "${store.x}";
		var y = "${store.y}";
		var title = "${store.title}";

		google.maps.event.addListener(map, "click", function(){
			infoWindow.close();
		});

		makeMarker({
			position: new google.maps.LatLng(y, x),
			title: title,
			icon: "/resources/img/icon/pin.png",
			content: "<table><tr><td rowspan='2'><img src='http://www.wingkostory.com/upload/store/${store.image_map}' class='map_image'/></td><td class='map_title'>${store.title}</td></tr><tr><td class='map_addr'>${store.address}</td></tr></table>"
		});

		function makeMarker(options){
			var pushPin = new google.maps.Marker({map:map});
			pushPin.setOptions(options);

			google.maps.event.addListener(pushPin, "click", function(){
				infoWindow.setOptions(options);
				infoWindow.open(map, pushPin);
			});
		}
		
		
		$("a[name=btn_print]").click(function(){
			window.open("/wingshow/print_view.do", "print", "width=795, height=650, left=0, top=0, scrollbars=yes");
			return false;
		});

	});
	
	function reply_view(no, reply_order) {
		if ($("#reply_" + no).css("display") == "none" ) {
			var editor = document.getElementById('reply_div'); 
			$("#reply_" + no).html(editor);
			$("#reply_" + no).show();
			$("#reply_div").show();
			$("#reply_no").val(no);
			$("#reply_order").val(reply_order);
		}
	}

	function review_delete(no) {
		if (confirm(m.confirm.deletes)) {
			location.href = "/store/review_delete.do?no="+no+"&parent_no=${store.store_no}";
		} else {
			return;
		}
	}
	
	function newsView(news_no) {
		location.href = "/news/view.do?news_no="+news_no;
	}
	
	function storeView(store_no) {
		location.href = "/store/main.do?store_no="+store_no;
	}	

	function upUrl() {
/* 		var m = "${m}",
			pl = "${pl}",
			t = "${t}",
			page = "${store.page}";
		var param = "location_no="+pl+"&t="+t+"&page="+page;

		if (m == "detail") {
			history.back(-1);
			//location.href = "/location/detail.do?" + param;
		} else if (m == "shopping") {
		//location.href = "/sub/shopping.do?" + param;
			history.back(-1);
		} else if (m == "lodging") {
			location.href = "/sub/lodging.do?" + param;
		} else if (m == "gourmet") {
			location.href = "/sub/gourmet.do?" + param;
		} else if (m == "beauty") {
			location.href = "/sub/beauty.do?" + param;
		} else if (m == "medical") {
			location.href = "/sub/medical.do?" + param;
		} else if (m == "culture") {
			location.href = "/sub/culture.do?" + param;
		} else {
			history.back(-1);
		} */
		history.back(-1);
	}
	
	
	
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	


	<div id="Content" print_view>
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
        	<li>地区</li>
        	<li class="end">
        		<c:if test="${store.parent_category_no == '8'}">购物</c:if>
        		<c:if test="${store.parent_category_no == '9'}">住宿</c:if>
        		<c:if test="${store.parent_category_no == '10'}">美食</c:if>
        		<c:if test="${store.parent_category_no == '11'}">美容</c:if>
        		<c:if test="${store.parent_category_no == '12'}">医疗</c:if>
        		<c:if test="${store.parent_category_no == '13'}">文化</c:if>
        	</li>
        </ul>
        <div class="sub_tit">
        	<c:choose>
        		<c:when test="${store.parent_category_no == '8'}"><img src="/resources/img/icon/icon_shopping.png" alt="resetorent" align="absmiddle"/></c:when>
        		<c:when test="${store.parent_category_no == '9'}"><img src="/resources/img/icon/icon_hotel.png" alt="resetorent" align="absmiddle"/></c:when>
        		<c:when test="${store.parent_category_no == '10'}"><img src="/resources/img/icon/icon_restorent.png" alt="resetorent" align="absmiddle"/></c:when>
        		<c:when test="${store.parent_category_no == '11'}"><img src="/resources/img/icon/icon_beauty.png" alt="resetorent" align="absmiddle"/></c:when>
        		<c:when test="${store.parent_category_no == '12'}"><img src="/resources/img/icon/icon_medical.png" alt="resetorent" align="absmiddle"/></c:when>
        		<c:when test="${store.parent_category_no == '13'}"><img src="/resources/img/icon/icon_culture.png" alt="resetorent" align="absmiddle"/></c:when>
        	</c:choose>
        	 ${store.title}
        </div><!--title-->
        <div class="con_btn_left"><!--왼쪽 버튼 모음-->
        	<a href="javascript:upUrl();"><img src="/resources/img/button/bt_back.png" alt="返回相关地区" class="hand" id="up"/></a> 
            <!-- <img src="/resources/img/button/bt_taste_store.png" alt="美食" /> -->
            <img src="/resources/img/button/bt_scrap.png" alt="剪贴" id="btn_scrap" class="hand" />
        </div>
        <div class="con_btn_right"><!--오른쪽 버튼 모음-->
        	<!-- <img src="/resources/img/button/bt_youku.png" alt="sns_youku" /> -->
            <a href="javascript:SNS.qq()"><img src="/resources/img/button/bt_qq.png" alt="sns_qq" /></a>
            <a href="javascript:SNS.weibo()"><img src="/resources/img/button/bt_sina.png" alt="sns_sina" /></a>
            <a href="javascript:SNS.renren()"><img src="/resources/img/button/bt_renren.png" alt="sns_renren" /></a>
            <a href="#" name="btn_print"><img src="/resources/img/button/bt_print.png" alt="print" /></a>
            <a href="/company/question_write.do?question_category=1"><img src="/resources/img/button/bt_question.png" alt="查询" /></a>
        </div>
        <div class="s_pic_m">
        	<div class="st_pic1 pic_on"><img id="pic" src="http://www.wingkostory.com/upload/store/${store.image}" alt="이미지1" class="img150x80 hand" /></div>
        	<c:if test="${fn:length(store.image1) > 0 }">
        		<div class="st_pic2"><img id="pic" src="http://www.wingkostory.com/upload/store/${store.image1}" alt="이미지2" class="img150x80 hand" /></div>
        	</c:if>
        	<c:if test="${fn:length(store.image2) > 0 }">
    	    	<div class="st_pic3"><img id="pic" src="http://www.wingkostory.com/upload/store/${store.image2}" alt="이미지3" class="img150x80 hand" /></div>
        	</c:if>
        	<c:if test="${fn:length(store.image3) > 0 }">
	        	<div class="st_pic4"><img id="pic" src="http://www.wingkostory.com/upload/store/${store.image3}" alt="이미지4"  class="img150x80 hand" /></div>
        	</c:if>
        	<img id="pic_on" src="http://www.wingkostory.com/upload/store/${store.image}" alt="샘플메인이미지" class="line_s1 img760x340" /><!--이미지크기 760*340-->
        </div>
        <table class="store_detail_info">
        	<caption>상점상세정보</caption>
            <colgroup>
            	<col width="30%" />
                <col width="70%" />
            </colgroup>
            <tr>
            	<th>地址</th><!--주소-->
                <td>${store.address}</td>
            </tr>
            <tr>
            	<th>营业时间/休息日</th><!--영업시간/휴일-->
                <td>${store.office_hour} / ${store.holiday}</td>
            </tr>
            <tr>
            	<th>外国语服务</th><!--외국어서비스-->
                <td>${store.language_service}</td>
            </tr>
            <tr>
            	<th>付款方法</th><!--지불방법-->
                <td>${store.payment}</td>
            </tr>
            <tr>
            	<th>交通指南</th><!--교통안내-->
                <td>${store.traffic_subway}</td>
            </tr>
            <tr>
            	<th>更多消息</th><!--추가정보-->
                <td>
                	${store.etc}
                </td>
            </tr>
			<c:choose>
				<c:when test="${fn:length(storeCoupon) >0 }">
		            <tr>
		            	<th>优惠劵指南</th><!--쿠폰안내-->
		                <td>
		            		<c:forEach items="${storeCoupon }" var="data" varStatus="status" >
		            			<img id="coupon" src="http://www.wingkostory.com/upload/store/coupon/${data.image}" alt="쿠폰" class="coupon_image hand" />
		                	</c:forEach>
		                </td>
		            </tr>
				</c:when>
			</c:choose>
        </table>
        <ul class="tab_detail_c4" id="store_detail"><!--상세설명, 메뉴, 지도, 리뷰 탭-->
        	<a href="#store_detail"><li class="sel"><img src="/resources/img/menu/store_tab01_on.png" alt="详细说明" /></li></a><!--선택탭 클래스 sel-->
        	<a href="#store_menu"><li class="no"><img src="/resources/img/menu/store_tab02.png" alt="菜单" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="#store_map"><li><img src="/resources/img/menu/store_tab03.png" alt="地图" /></li></a>
        	<a href="#store_review"><li class="end"><img src="/resources/img/menu/store_tab04.png" alt="地图" /></li></a>
        </ul>
        <div class="detail_txt">
        	${store.content }
        	<!-- <dt>新村的人气煎饼专卖店</dt>
            <dd>宋大叔绿豆煎饼是位于学生街新村 的煎饼专卖店。用竹筒拼成的店名招牌令人过目不忘，店内以原木色为基调，配以柔和的灯光营造出舒适的氛围。店内流淌着的背景音乐也是不夹杂电子合成音的纯净叙事曲，令人倍感放松和温馨。座位全是餐桌式，大概能容纳50人在左右。而店名中的宋大叔指的就是是店主，店名虽为绿豆煎饼 ，但店内其实供应各种不同的煎饼啦.</dd>
            <img src="/resources/img/print_img/sam_store.png" alt="샘플이미지" />이미지 너비는 762px을 넘으면 안됨
            <dt>超值的煎饼拼盘不可错过</dt>
            <dd>由于采访时间的关系，到达本店时，店里正在为营业作各种准备。首先展现在我们眼前的便是一盘可以品尝到各种口味的煎饼拼盘。煎饼拼盘是春节和中秋时，韩国家家户户祭祀先祖必备的食品之一。祭祀的前一天，家中的女人们会集中精力准备这道食物。制作这精致的煎饼拼盘对于韩国的女性而言，也可谓每逢祭祀时最头疼的一个传统习俗了</dd>
            <img src="/resources/img/print_img/sam_store.png" alt="샘플이미지" />이미지 너비는 762px을 넘으면 안됨 -->
        </div>
        <br /><br />
        <ul class="tab_detail_c4" id="store_menu"><!--상세설명, 메뉴, 지도, 리뷰 탭-->
        	<a href="#store_detail"><li><img src="/resources/img/menu/store_tab01.png" alt="详细说明" /></li></a><!--선택탭 클래스 sel-->
        	<a href="#store_menu"><li class="sel"><img src="/resources/img/menu/store_tab02_on.png" alt="菜单" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="#store_map"><li class="no"><img src="/resources/img/menu/store_tab03.png" alt="地图" /></li></a>
        	<a href="#store_review"><li class="end"><img src="/resources/img/menu/store_tab04.png" alt="地图" /></li></a>
        </ul>
        <table class="st_menu">
        	<caption>점포 메뉴</caption>
            <colgroup>
            	<col width="10%" />
                <col width="30%" />
                <col width="20%" />
                <col width="40%" />
            </colgroup>
            <c:choose>
            	<c:when test="${fn:length(storeMenu) >0 }">
            		<c:forEach items="${storeMenu }" var="data" varStatus="status" >
			            <tr>
			            	<c:choose>
			            		<c:when test="${data.image_thumb != null && data.image_thumb != ''}">
			            			<!-- 썸네일과 이미지 뒤바뀜..요청이 자꾸 바껴서 -->
			                		<td colspan="4"><img id="cart" no="${data.menu_no}" src="/upload/store/menu/${data.image_thumb}" alt="装进wingshow" class="hand" /></td>
			            		</c:when>
			            		<c:otherwise>
		 			            	<%-- <td><div class="menu_number">0${status.index+1}</div></td> --%>
					                <th colspan="2">${data.menu_name}</th>
					                <td>${data.menu_price}</td>
					                <td class="bt"><img id="cart" no="${data.menu_no}" src="/resources/img/button/bt_basket.png" alt="装进wingshow" class="hand" /></td>
			            		</c:otherwise>
			            	</c:choose>
			            </tr>
					</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
            			<td colspan="4" style="font-family:Microsoft-yahei ">无菜单选项</td>
            		</tr>
            	</c:otherwise>
            </c:choose>
        </table>
        <br /><br />
        <ul class="tab_detail_c4" id="store_map"><!--상세설명, 메뉴, 지도, 리뷰 탭-->
        	<a href="#store_detail"><li><img src="/resources/img/menu/store_tab01.png" alt="详细说明" /></li></a><!--선택탭 클래스 sel-->
        	<a href="#store_menu"><li><img src="/resources/img/menu/store_tab02.png" alt="菜单" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="#store_map"><li class="sel"><img src="/resources/img/menu/store_tab03_on.png" alt="地图" /></li></a>
        	<a href="#store_review"><li class="end no"><img src="/resources/img/menu/store_tab04.png" alt="地图" /></li></a>
        </ul>
        <div class="st_map">
        	<div class="store_map_view" id="st_map_view">
            	<!-- 지도삽입 -->
            </div>
            <div class="st_map_txt">
            	<table>
                	<caption>점포가는길</caption>
                    <colgroup>
                    	<col width="15%" />
                        <col width="85%" />
                    </colgroup>
                    <tr>
                    	<th><img src="/resources/img/icon/map_bus.png" alt="bus" /></th>
                        <td>${store.traffic_bus}</td>
                    </tr>
                    <tr>
                    	<th><img src="/resources/img/icon/map_taxi.png" alt="taxi" /></th>
                        <td>${store.traffic}</td>
                    </tr>
                    <tr>
                    	<th><img src="/resources/img/icon/map_metro.png" alt="metro" /></th>
                        <td>${store.traffic_subway}</td>
                    </tr>
                    <!-- <tr>
                        <td colspan="2" class="txt">首尔特别市西大门区沧川洞52-75 六16：30~次日 每月2次(不定期)、春节和中秋连休(3天)  对外服务语言详细说明</td>
                    </tr> -->
                </table>
            </div>
        </div>
        <br /><br />
        <ul class="tab_detail_c4" id="store_review"><!--상세설명, 메뉴, 지도, 리뷰 탭-->
        	<a href="#store_detail"><li><img src="/resources/img/menu/store_tab01.png" alt="详细说明" /></li></a><!--선택탭 클래스 sel-->
        	<a href="#store_menu"><li><img src="/resources/img/menu/store_tab02.png" alt="菜单" /></li></a><!--선택탭 옆 오른쪽 탭에 클래스 no-->
        	<a href="#store_map"><li><img src="/resources/img/menu/store_tab03.png" alt="地图" /></li></a>
        	<a href="#store_review"><li class="end sel"><img src="/resources/img/menu/store_tab04_on.png" alt="地图" /></li></a>
        </ul>
        <div class="review_noti">请在下方评论箱留下您宝贵的意见。咨询及投诉，请发送邮件到wingkomaster@wingkostory.com</div><!--소중한의견을 하단의 텍스트상자에 의견을 넣어주세요. 불만과 문의는 윙코스토릴로 문의해주세요-->
        <table class="review">
        	<caption>리뷰쓰기,리스트</caption>
            <colgroup>
                <col width="15%" />
                <col width="70%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<form id="frm_ripple" action="review_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${store.store_no }"/>
            	<input type="hidden" name="parent_code" value="store"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
            	<td colspan="2" class="no"><textarea class="review_txtarea" name="content" id="review_content"></textarea></td>
                <td class="no"><img id="btn_insert" src="/resources/img/button/bt_review_write.png" alt="评论" class="hand"/></td>
                </form>
            </tr>
            <tr><td colspan="3" class="txt">还可以输入140字 (<span id="byte">0</span>/140)</td></tr>
            <tr><td colspan="3" class="num">${rippleCount}条评论</td></tr><!--00명의 리뷰-->
            
			<c:choose>
			<c:when test="${fn:length(rippleList) > 0 }">
				<c:forEach var="data" varStatus="status" items="${rippleList}">
		            <tr><!--리뷰1개 시작-->
		            	<td colspan="2">
		            		<div class="sect${data.level}">
		            			<span class="id">
		            			<c:choose>
		            				<c:when test="${data.level > 1}">
		            					<img src="/resources/img/icon/reply.png" />
		            				</c:when>
		            			</c:choose>${data.user_id }
		            			</span>
		            			<span>${data.reg_date }</span><p>
		            			<span>${data.content }</span></p>
		            			<div class="reply" id="reply_${data.no}" style="display:none"></div>
		            		</div>
		            	</td>
		                <td class="delete">
		                	<img src="/resources/img/button/btn_reply.gif" alt="reply" class="hand" onclick="javascript:reply_view('${data.no}', '${data.reply_order }')"/>
		                	<c:choose>
		                		<c:when test="${data.user_no == user_no && user_no != '' }"><img src="/resources/img/icon/delete.png" alt="delete" class="hand" onclick="javascript:review_delete('${data.no}')"/></c:when>
		                		<c:otherwise>&nbsp;</c:otherwise>
		                	</c:choose>
		                </td>
		            </tr><!--리뷰1개 끝-->
	            </c:forEach>
			</c:when>
            </c:choose>
        </table>
        
        <!--  댓글 달기 start -->
        <div id="reply_div" class="review_noti" style="display:none;">
           	<form id="frm_reply" action="review_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${store.store_no }"/>
            	<input type="hidden" name="parent_code" value="store"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
            	<input type="hidden" name="page" value="${store.page}"/>
	        	<input type="hidden" name="no" id="reply_no"  />
	        	<input type="hidden" name="reply_order" id="reply_order"   />
	           	<img src="/resources/img/icon/reply.png"/>
	        	<textarea class="reply_txtarea" name="content" id="reply_textarea"></textarea>
	        	<img id="reply_save" src="/resources/img/button/bt_oks.gif" alt="write" class="hand"/>
	        	<img id="reply_cancel" src="/resources/img/button/bt_cancels.gif" alt="cancel" class="hand"/>
	            <p></p>还可以输入140字 (<span id="reply_byte">0</span>/140)
			</form>
        </div>
        <!--  댓글 달기 end -->
        
        
        <!-- 관련 기사 -->
		<c:choose>
			<c:when test="${fn:length(newsList) > 0 }">
				<div class="sub_tit"><img src="/resources/img/title/tit_newpaper.png" alt="相关消息" /></div><!--title 관련기사-->
				<table class="detail_c3" style="border:1px solid #dedede;">
					<caption>관련기사</caption>
					<colgroup>
						<col width="13%" />
						<col width="20%" />
						<col width="13%" />
						<col width="20%" />
						<col width="13%" />
						<col width="21%" />
					</colgroup>
					<tr><td colspan="6" class="space2"></td></tr> <!--여백-->
					<tr>
						<c:forEach var="data" items="${newsList }" varStatus="status">
							<c:set var="i" value="${status.index+1}" />
							<th onclick="javascript:newsView('${data.news_no}');" class="hand"><img src="http://www.wingkostory.com/upload/news/${data.thumb_image_location}" style="width: 80px; height: 55px;" alt="news_image" /></th>
							<td onclick="javascript:newsView('${data.news_no}');" class="hand"><span><c:out value="${fn:substring(data.title, 0, 11)}" escapeXml="false" /></span><br/><c:out value="${fn:substring(data.content, 0, 30)}" escapeXml="false" /></td>
						</c:forEach>
						<c:if test="${i < 3 }">
							<c:forEach var="j" begin="1" end="3" step="1">
								<c:if test="${i < j }">
									<th></th><td></td>
									<c:set value="${i+1}" var="i" />
								</c:if>
							</c:forEach>
						</c:if>
					</tr>        	
					<tr><td colspan="6" class="space2"></td></tr> <!--여백-->
				</table>
			</c:when>
		</c:choose>
		
		
        <!-- 가게주변정보 기사 -->
		<c:choose>
			<c:when test="${fn:length(storeList) > 0 }">
				<div class="sub_tit"><img src="/resources/img/title/tit_around_info.png" alt="商店周边信息" /></div><!--title 가게주변정보-->
				<table class="detail_c3" style="border:1px solid #dedede; margin-bottom:10px;">
					<caption>관련기사</caption>
					<colgroup>
						<col width="13%" />
						<col width="20%" />
						<col width="13%" />
						<col width="20%" />
						<col width="13%" />
						<col width="21%" />
					</colgroup>
					<tr><td colspan="6" class="space2"></td></tr> <!--여백-->
					<tr>
						<c:forEach var="data" items="${storeList }" varStatus="status">
							<c:set var="i" value="${status.index+1}" />
							<th onclick="javascript:storeView('${data.store_no}');" class="hand"><img src="http://www.wingkostory.com/upload/store/${data.image_thumb}" style="width: 80px; height: 55px;" alt="store_image" /></th>
							<td onclick="javascript:storeView('${data.store_no}');" class="hand"><span><c:out value="${fn:substring(data.title, 0, 11)}" escapeXml="false" /></span><br/><c:out value="${fn:substring(data.description, 0, 30)}" escapeXml="false" /></td>
						</c:forEach>
						<c:if test="${i < 3 }">
							<c:forEach var="j" begin="1" end="3" step="1">
								<c:if test="${i < j }">
									<th></th><td></td>
									<c:set value="${i+1}" var="i" />
								</c:if>
							</c:forEach>
						</c:if>
					</tr>        	
					<tr><td colspan="6" class="space2"></td></tr> <!--여백-->
				</table>
			</c:when>
			<c:otherwise><div style="margin-bottom: 10px;"></div></c:otherwise>
		</c:choose>

        <div class="con_btn_left"><!--왼쪽 버튼 모음-->
        	<a href="javascript:upUrl();"><img src="/resources/img/button/bt_back.png" alt="返回相关地区" /></a> 
            <!-- <img src="/resources/img/button/bt_taste_store.png" alt="美食" /> -->
            <img src="/resources/img/button/bt_scrap.png" alt="剪贴" id="btn_scrap" class="hand" />
        </div>
        <div class="con_btn_right"><!--오른쪽 버튼 모음-->
        	<!-- <img src="/resources/img/button/bt_youku.png" alt="sns_youku" /> -->
            <a href="javascript:SNS.qq()"><img src="/resources/img/button/bt_qq.png" alt="sns_qq" /></a>
            <a href="javascript:SNS.weibo()"><img src="/resources/img/button/bt_sina.png" alt="sns_sina" /></a>
            <a href="javascript:SNS.renren()"><img src="/resources/img/button/bt_renren.png" alt="sns_renren" /></a>
            <a href="#" name="btn_print"><img src="/resources/img/button/bt_print.png" alt="print" /></a>
            <a href="/company/question_write.do?question_category=1"><img src="/resources/img/button/bt_question.png" alt="查询" /></a>
        </div>
        <div class="reviw_bt"><img src="/resources/img/txt_review_noti.png" alt="时刻关注本文记载内容" /><a href="#"><img src="/resources/img/button/bt_top.png" alt="top" style="float:right;" /></a></div>
   </div>

    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
    
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>