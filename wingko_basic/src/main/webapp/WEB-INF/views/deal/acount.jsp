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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
	
	//enable_click();
	
	$("#province_id").bind('change', function() {
		var id = $("option:selected", this).attr("oid");
		if (id != '') {
			$.ajax({
				type: 'GET',
				url: "/join/getAreaCode.do",
				data: "t=province&c="+id,
				dataType: 'json',
				fail: function(){alert("fail");},
				success: function(data){
					$("#city_id").find('option').remove();
					$("#city_id").append("<option value=''>--市--</option>");
					$.each(data, function(key, val) {
						$("#city_id").append("<option value='"+val.title+"' oid='"+val.value+"' >"+val.title+"</option>");
					});
				}
			});
		}
	});
	$("#city_id").bind('change', function() {
		var id = $("option:selected", this).attr("oid");
		if (id != '') {
			$.ajax({
				type: 'GET',
				url: "/join/getAreaCode.do",
				data: "t=city&c="+id,
				dataType: 'json',
				fail: function(){alert("fail");},
				success: function(data){
					$("#area_id").find('option').remove();
					$("#area_id").append("<option value=''>--区--</option>");
					$.each(data, function(key, val) {
						$("#area_id").append("<option value='"+val.title+"' oid='"+val.value+"' >"+val.title+"</option>");
					});
				}
			});
		}
	});
	
	$("input[name=new_area]").click(function(){
		var is_check = $(this).is(":checked");
		if(is_check == true){
			$("#join_userinfo").hide();
			$("#new_userinfo").show();
		}else{
			$("#join_userinfo").show();
			$("#new_userinfo").hide();
		}
	});

	
	$("#btn_pay_card").click(function(){
		$("input[name=pay_mode]").val("inipay");
		$("form[name=ini]").submit();
		return false;
	});
	
	$("#btn_pay_money").click(function(){
		$("input[name=pay_mode]").val("bank");
		$("form[name=ini]").attr("onSubmit", "");
		$("form[name=ini]").submit();
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
        
        ${inipay_form_start }
		<input type="hidden" name="pay_mode" value="inipay" />
		<input type="hidden" name="pid" value="${paymain.pid }" />
        <table class="wing_choice" >
        	<caption>결제상품리스트,사용일자,쿠폰적용,금액</caption>
            <colgroup>
            	<col width="55%" />
                <col width="20%" />
                <col width="25%" />
            </colgroup>
            <tr>
            	<th class="first">结算清单</th><!--결제상품리스트-->
            	<th>数量</th><!--수량-->
               <th class="end">金额</th><!--금액-->
            </tr>
	
			<c:forEach items="${payitem_list }" var="data" varStatus="status">
			<tr>
            	<td class="name">${data.item_name }</td>
                <td>${data.menu_cnt }</td>
                <td class="end"><fmt:formatNumber value="${data.pay_price_cn}" />元 / <fmt:formatNumber value="${data.pay_price_ko}" />&#8361;</td>	
            </tr>
			</c:forEach>
			
            <tr>
                <td colspan="5" class="sum">总金额 : <fmt:formatNumber value="${paymain.pay_price_cn}" />元 / <fmt:formatNumber value="${paymain.pay_price_ko}" />&#8361;</td>
            </tr>
        </table>

        
		<div style="margin-top:20px;">
			<h3> 新的航运领域 <input type="checkbox" name="new_area" value="new_area" /></h3><!-- 새로운 배송지역 -->
			<table class="join_basic_data" id="join_userinfo">
				<caption>배송지역 정보</caption>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>接受者</th><!-- 받는사람 -->
					<td>${userinfo.user_name }</td>
				</tr>
				<tr>
					<th>手机号码</th><!-- 전화번호 -->
					<td>${userinfo.phone }</td>
				</tr>
				<tr>
					<th>地区</th><!-- 주소 -->
					<td>
					${userinfo.province } ${userinfo.cicy } ${userinfo.area }
					<br/>${userinfo.address }	
				    </td>
				</tr>
			</table>
		
			<table class="join_basic_data" id="new_userinfo" style="display:none;">
				<caption>배송지역 정보</caption>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>接受者</th><!-- 받는사람 -->
					<td><input id="m_name" name="m_name" class="login_txt" style="width:70%;" type="text" value="" /></td>
				</tr>
				<tr>
					<th>手机号码</th><!-- 전화번호 -->
					<td><input id="m_phone" name="m_phone" class="login_txt" style="width:70%; type="text" value="" /></td>
				</tr>
				<tr>
					<th>地区</th><!-- 주소 -->
					<td>
						<select id="province_id" name="province_id" class="login_txt" style="width:150px; margin-bottom:4px;">
                        	<option value="">--省--</option>
                        	<c:forEach items="${provinceList }"  var="data" varStatus="status">
                        		<option value="${data.title }"  oid="${data.value }" >${data.title }</option>
                        	</c:forEach>
						</select>&nbsp;
						<select id="city_id" name="city_id" class="login_txt" style="width:150px; margin-bottom:4px;">
							<option value="">--市--</option>
						</select>&nbsp;
						<select id="area_id" name="area_id" class="login_txt" style="width:150px; margin-bottom:4px;">
							<option value="">--区--</option>
						</select>
				    </td>
				</tr>
				<tr>
					<th>详细地址</th><!-- 상세주소 -->
					<td><input id="address" name="m_address" class="login_txt" style="width:80%; margin-bottom:4px;" type="text" value=""/></td>
			    </tr>
			</table>
		</div>
		
		<div id="inipay_form" style="display:none;">${inipay_data }</div>
		</form>
        
        
        <h6>请先确认结算金额和使用日期后付款</h6> <!--결재금액과 배송비를 확인하시고 결제를 진행하여 주십시오. -->
        <div class="bt_center" style="margin-top:30px;"><!--신용카드, 현금-->
        	<a href="#" id="btn_pay_card"><img src="/resources/img/button/bt_credit_card.png" alt="信用卡" /></a>
        	<a href="#" id="btn_pay_money" ><img src="/resources/img/button/bt_money.png" alt="汇款" /></a>
        </div>
        
        
    </div>
    

    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
