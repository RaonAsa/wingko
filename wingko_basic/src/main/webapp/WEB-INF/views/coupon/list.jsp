<%--
  - 작성자   ysh
  - 작성일자 2013. 9. 2.
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
<script>
	$(document).ready(function(){
		$(document).ready(function(){
			page = Number("${list.page}");
			pageSize = Number("${list.pageSize}");
			currentBlock = Number("${list.currentBlock}");
			totalBlock = Number("${list.totalBlock}");
			startPageNum = Number("${list.startPageNum}");
			endPageNum = Number("${list.endPageNum}");
		});
	});
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum);
		}else{
			alert(m.bbs.next);
		}
	}
	
	
	function print(imgUrl) {
		var strFeature = "";
		strFeature += "width=800, height=600, all=no";
		var objWin = window.open('', 'print', strFeature);
		objWin.document.write("<img src='"+ imgUrl +"' />");
		objWin.document.close();
		
		objWin.print();
		objWin.close();
	}

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /><li class="end">WINGKO优惠</li><!--홈/윙코쿠폰-->
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/wingko_coupon.png" alt="wingko优惠" /></div>
        <img src="/resources/img/coupon_guide.png" alt="优惠券使用方法 - 1.到相关商店网页，可通过WINGSHOW使用优惠券 2.可打印优惠券后，访问相关店面使用" />
        <table class="coupon_menu">
        	<caption>쿠폰메뉴</caption>
            <colgroup>
            	<col width="15%" />
                <col width="11%" />
                <col width="11%" />
                <col width="11%" />
                <col width="11%" />
                <col width="11%" />
                <col width="11%" />
                <col width="19%" />
            </colgroup>
            <tr>
            	<td rowspan="2" <c:if test="${map.category_no == '' && map.location_no == '' && map.best == '0' }">class="sel"</c:if>><a href="/coupon/list.do"><img src="/resources/img/menu/coupon_all.png" alt="查看更多优惠券" /></a></td><!--쿠폰전체보기-->
                <td <c:if test="${map.category_no == '8' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=8">购物</a></td><!--쇼핑-->
                <td <c:if test="${map.category_no == '9' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=9">住宿</a></td><!--숙박-->
                <td <c:if test="${map.category_no == '10' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=10">美食</a></td><!--맛집-->
                <td <c:if test="${map.category_no == '11' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=11">美容</a></td><!--뷰티-->
                <td <c:if test="${map.category_no == '12' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=12">医疗</a></td><!--의료-->
                <td <c:if test="${map.category_no == '13' }">class="sel"</c:if>><a href="/coupon/list.do?category_no=13">文化</a></td><!--컬쳐-->
                <td rowspan="2" <c:if test="${map.best == '1' }">class="sel"</c:if>><a href="/coupon/list.do?best=1"><img src="/resources/img/menu/caregory_best.png" alt="类别列表" /></a></td><!--카테고리best-->
            </tr>
            <tr>
                <td <c:if test="${map.location_no == '12' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=12">首尔</a></td><!--서울-->
                <td <c:if test="${map.location_no == '13' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=13">济州</a></td><!--경기-->
                <td <c:if test="${map.location_no == '14' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=14">京畿</a></td><!--제주-->
                <td <c:if test="${map.location_no == '15' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=15">釜山</a></td><!--부산-->
                <td <c:if test="${map.location_no == '16' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=16">江原</a></td><!--강원-->
                <td <c:if test="${map.location_no == '17' }">class="sel"</c:if>><a href="/coupon/list.do?location_no=17">其他地区</a></td><!--기타-->
                <%-- <td <c:if test="${map.best == '1' }">class="sel"</c:if>><a href="/coupon/list.do?best=1"><img src="/resources/img/menu/area_best.png" alt="地区列表" /></a></td><!--지역best--> --%>
            </tr>
        </table>
        <table class="coupon_list">
        	<caption>쿠폰리스트</caption>
            <colgroup>
            	<col width="66%" />
                <col width="34%" />
            </colgroup>
			<c:choose>
				<c:when test="${fn:length(list) > 0 }">
					<c:forEach var="data" items="${list}" varStatus="status">
			            <tr>
                            <td class="coupon"><img id="coupon" src="http://www.wingkostory.com/upload/store/coupon/${data.image}" alt="coupon" class="coupon_image hand"/></td>
			            	<!--<td class="coupon"><img id="coupon" src="http://wingkostory.com/upload/coupon/${data.image}" alt="coupon" class="coupon_image hand"/></td>-->
			                <td rowspan="2">
			                	<a href="/store/main.do?store_no=${data.store_no}"><img src="/resources/img/button/bt_go_store.png" alt="进入商店" /></a>
			                	<br /><br />
                                <a href="javascript:print('http://wingkostory.com/upload/store/coupon/${data.image}');"><img src="/resources/img/button/bt_print_coupon.png" alt="打印优惠劵" /></a>
			                	<!--<a href="javascript:print('http://wingkostory.com/upload/coupon/${data.image}');"><img src="/resources/img/button/bt_print_coupon.png" alt="打印优惠劵" /></a>-->
			                </td><!--상점바로가기-->
			                <%-- <td rowspan="2"><a href="javascript:print('http://wingkostory.com/upload/coupon/${data.image}');"><img src="/resources/img/button/bt_print_coupon.png" alt="打印优惠劵" /></a></td><!--쿠폰출력--> --%>
			            </tr>
			            <tr>
			            	<td class="tt">${data.coupon_desc}</td><!--쿠폰설명-->
			            </tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="3">no data</td></tr>
				</c:otherwise>
			</c:choose>
        </table>
        
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
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
