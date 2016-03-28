<%--
  - 작성자   meeroojin
  - 작성일자 2013. 8. 26.
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
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >

<!-- inipay head Include -->
<c:import url="../inipay/inipay_head_start.jsp" charEncoding="UTF-8" />

<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script>
$(document).ready(function(){
	
	enable_click();
	
	$("#btn_pay_card").click(function(){
		$("form[name=ini]").submit();
		return false;
	});
	
	$("#btn_pay_money").click(function(){
		$("#frm_list").submit();
		return false;
	});
});
</script>
</head>
<body onload="javascript:enable_click()" onFocus="javascript:focus_control()">
<div id="Wrapper">
   	
   	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">Wing Show</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/tit_wingshow.png" alt="Wing Show" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="main.do"><img src="/resources/img/menu/wingshow_tab01_on.png" alt="Making Wing show" /></a></li>
        	<li><a href="my_wingshow.do"><img src="/resources/img/menu/wingshow_tab02.png" alt="My Wing show" /></a></li>
        </ul>
        <table class="wing_choice" >
        	<caption>결제상품리스트,사용일자,쿠폰적용,금액</caption>
            <colgroup>
            	<col width="35%" />
                <col width="10%" />
                <col width="15%" />
            	<col width="15%" />
                <col width="25%" />
            </colgroup>
            <tr>
            	<th class="first">结算清单</th><!--결제상품리스트-->
            	<th>数量</th><!--수량-->
                <th>使用日期</th><!--사용일자-->
                <th>使用优惠卷</th><!--쿠폰적용-->
               <th class="end">金额</th><!--금액-->
            </tr>
	<form id="frm_list" method="post" action="./acount_proc.do">
	<input type="hidden" name="pid" value="${paymain.pid }" />

	<c:choose>
		<c:when test="${fn:length(data_list) >0 }">
			<c:forEach items="${data_list }" var="data" varStatus="status">
			<tr>
            	<td class="name">[${data.location_name }] ${data.store_title } ${data.menu_name }</td>
                <td>${data.menu_cnt }</td>
                <td>${data.used_date }</td>
                <td><c:choose>
                	<c:when test="${data.coupon_apply > 0 }">使用</c:when>
					<c:otherwise>未使用</c:otherwise>
                </c:choose></td><!--적용-->
                <td class="end"><fmt:formatNumber value="${data.sum_price_cn}" />元 / <fmt:formatNumber value="${data.sum_price_ko}" />&#8361;</td>	
            </tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</form>
			
            <tr>
                <td colspan="5" class="sum">总金额 : <fmt:formatNumber value="${paymain.pay_price_cn}" />元 / <fmt:formatNumber value="${paymain.pay_price_ko}" />&#8361;</td>
            </tr>
        </table>
        <h6>请先确认结算金额和使用日期后付款</h6> <!--결재금액과 사용날짜를 확인하시고 결제를 진행하여 주십시오. -->
        <div class="bt_center" style="margin-top:30px;"><!--신용카드, 현금-->
        	<a href="#" id="btn_pay_card"><img src="/resources/img/button/bt_credit_card.png" alt="信用卡" /></a>
        	<a href="#" id="btn_pay_money" ><img src="/resources/img/button/bt_money.png" alt="汇款" /></a>
        </div>
        
        <div id="inipay_form" style="display:none;">${inipay_formdata }</div>
    </div>
    

    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
