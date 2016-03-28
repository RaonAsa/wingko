<%--
  - 작성자   meeroojin
  - 작성일자 2013. 8. 21.
  - 내용
  -
  -
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/mytld.tld" prefix="myfn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="${host}/resources/css/sub.css" />
<link rel="stylesheet" type="text/css" href="${host}/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="${host}/resources/js/jquery-1.9.1.js"></script>
<script src="${host}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${host}/resources/js/wingshow.js"></script>
<script>

//number comma
var commaPrice = function(number)  {
	return number.match(/[0-9]/g).join("").replace(/(\d)(?=(\d\d\d)+$)/g , '$1,');
};

Number.prototype.comma = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};
 
String.prototype.comma = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.comma();
};



$(document).ready(function(){
	var _root = $('#wing_calendar');
	var wing = new WingCalender(_root);
	
	wing.onShow = function(year, month ){
		
		var cur_date = year + '-'+ month + '-01';
		var param = {used_date : cur_date};
		$.post("json_calendar.do", param, function(json, status){
			
			if(status == 'success'){
				if(json.list){
					$.each(json.list, function(index, item){
						
						var arr_date = item.used_date.split('-');
						var item_title = item.item_location + '/' + item.item_store + '/' + item.item_name;
						if(item.pay_type == "30"){
							item_title = '(R)' + item_title;
						}else{
							item_title = '(P)' + item_title;
						}
						wing.addData(arr_date[2], item.item_id, item_title);
						
					});
				}
			}
		}, "json");

	};
	
	wing.onClickKeyData = function(key){
		
	};
	
	/*
	wing.onClickDay = function(obj, year, month, day){
		alert(year + ' - ' + month + ' - ' + day);
	}
	*/
	
	wing.showWing(); // today
	
	
		
	$("input[name=used_date]" ).each(function(){
		var _this = $(this);
		var start_date = _this.attr('start_date');
		var end_date = _this.attr('end_date');
		_this.prop("readonly", true);
		_this.datepicker({
			changeMonth: true
			, changeYear: true
			, showMonthAfterYear: true
			, dateFormat: "yy-mm-dd" 
				, showOn: "button" // both, button 
		        , buttonImage: "${host}/resources/img/button/bt_modify_date.png"
		        , buttonText: "更改日期"
		        , buttonImageOnly: true  
//			, monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
//			, dayNames: [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ] 
//			, dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ] 
//			, minDate: '+1d'
			, onSelect: function(sDate, obj){
				
				var table_td = _this.closest("td");
				var cur_val = $("div[name=used_date_text]", table_td).text();
				
				if(cur_val == sDate) return;
				
				// 변경하시겠습니까?
				if(!confirm('你想改变吗？') ) {
					$("input[name=used_date]", table_td).val(cur_val);
					return; 
				}
				
				var item_id = _this.closest("tr").attr('item_id');
				var param = {item_id : item_id, used_date : sDate};
				$.post("json_date_change.do", param, function(data, status){
					if(status != "success"){
						alert('error');
						return;
					}
					document.location.reload();
				});
				
			}
		});
		
		if(start_date){
			_this.datepicker("option", "minDate", start_date);
		}
		if(end_date){
			_this.datepicker("option", "maxDate", end_date);
		}
	});
	
	
	$("a[name=btn_cancel]").click(function(){

		// 취소하시겠습니까?
		if(!confirm('您确定要取消？') ) {
			return false; 
		}
		var _this = $(this);
		var table_tr = _this.closest("tr");
		var item_id = table_tr.attr("item_id");
		
		var form = $("#frm_id");
		form.append("<input type='hidden' name='item_id' value='" +item_id+ "' />");
		
		form.attr('action', 'reservation_cancel.do');
		form.submit();
		
		return false;
	});
	
	$("#btn_mail").click(function(){
		
		// 메일발송?
		if(!confirm('发送邮件？') ) {
			return false; 
		}
		
		var html = '';
		$("[print_view]").each(function(index){
			var _this = $(this);
			
			html += _this.wrap("<div>").parent().html();
			_this.unwrap();
		});
		
		// 예약 상품
		var param = {mail_title:'[wingko]预约商品', mail_body:html};		
		$.post("json_sendmail.do", param, function(data, status){
			if(data.success && data.success == true){
				alert('成功');
			}else{
				alert('失败');
			}
		}, "json");
			
			
		return false;
	});
	
	$("#btn_print").click(function(){
		window.open("print_view.do", "print", "width=775, height=650, left=0, top=0, scrollbars=yes");
		return false;
	});
	

});

</script>
</head>
<body>
<div id="Wrapper">
	<!-- TOP Include -->
 	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
   	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="${host}/resources/img/home.png" alt="home" /></li><li class="end">Wing Show</li>
        </ul>
        <div class="sub_tit"><img src="${host}/resources/img/title/tit_wingshow.png" alt="Wing Show" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="main.do"><img src="${host}/resources/img/menu/wingshow_tab01.png" alt="Making Wing show" /></a></li>
        	<li><a href="my_wingshow.do"><img src="${host}/resources/img/menu/wingshow_tab02_on.png" alt="My Wing show" /></a></li>
        </ul>

		<!-- 달력 -->
        <div id='wing_calendar'></div>
        
        <!--예약내역, 결제내역-->
       	<ul class="board_tab">
       		<li class="on">预约内容</li>|<li><a href="my_payment.do">帐单历史</a></li>|<li><a href="my_paydeal.do">本月推荐商品</a></li>
		</ul>
		<br/>
		
		<form id="frm_id" method="post"></form>
		
		
	<div print_view>
		<table class="wing_choice">
			<caption>예약내역</caption>
			<tr>
				<td class="subject">预约商品</td><!--예약상품-->
			</tr>
		</table>
	
<c:choose>
	<c:when test="${fn:length(list_array) >0 }">

		<c:forEach items="${list_array }" var="item_list" varStatus="status">
		
		<c:set var="pay_pid" value="" />
		<c:set var="total_price_cn" value="0" />
		<c:set var="total_price_cn" value="0" />
		
		<table class="wing_choice" style="margin-bottom:20px;">
			<caption>예약내역</caption>
			<colgroup>
				<col width="12%" />
				<col width="33%" />
				<col width="19%" />
				<col width="18%" />
				<col width="18%" />
			</colgroup>
			<tr>
				<th colspan="2" class="first" >商品名</th><!--상품명-->
				<th>商品价格</th><!--상품가격-->
				<th>预订日期</th><!--예약일자-->
				<th class="end">预约自动取消日期</th><!--예약자동취소일-->
			</tr>
			  
			<c:forEach items="${item_list }" var="data" >
			<c:set var="pay_pid" value="${data.pid }" />
			
			<fmt:parseDate var="tmp_date1" value="${data.start_date }" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="start_date" value="${tmp_date1 }" pattern="yyyy-MM-dd"/>
			<c:if test="${start_date <= now_date }">
				<fmt:parseDate var="tmp_date1" value="${now_date }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="start_date" value="${myfn:dateAdd(tmp_date1, 1) }" pattern="yyyy-MM-dd"/>
			</c:if>
			
			<fmt:parseDate var="tmp_date2" value="${data.end_date }" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="end_date" value="${tmp_date2 }" pattern="yyyy-MM-dd"/>
			<fmt:parseDate var="tmp_date3" value="${data.used_date }" pattern="yyyy-MM-dd"/> 
			<fmt:formatDate var="cancel_date_limit" value="${myfn:dateAdd(tmp_date3, -wingkoinfo.cancel_reservation_day) }" pattern="yyyy-MM-dd"/>
			
			<tr item_id="${data.item_id }">
				<td class="first"><img src="http://www.wingkostory.com/upload/store/menu/${data.image_thumb }" style="width: 70px; height: 55px;" alt="" /></td><!--이미지사이즈 70*55-->
            	<td class="name">[${data.item_location } - ${data.item_store }] <br/>${data.item_name } ${data.menu_cnt }EA</td>
                <td><fmt:formatNumber value="${data.pay_price_cn}" />元 / <fmt:formatNumber value="${data.pay_price_ko}" /></span>&#8361;</td>
                <td><div name="used_date_text" style="margin:0px 0px 5px 0px;">${data.used_date }</div>
                <c:if test="${now_date < cancel_date_limit }">
                	<input type="hidden" name="used_date" value="${data.used_date }" start_date="${start_date }" end_date="${end_date }" />
                </c:if>
                </td><!--날짜변경-->
                <td class="end">${cancel_date_limit }<br/>
                <c:if test="${now_date < cancel_date_limit }">
                	<a href="#" name="btn_cancel" ><img src="${host}/resources/img/button/bt_cancel_reservation.png" alt="取消预约" class="space3" /></a></td><!--예약취소-->
                </c:if>
            </tr>
            
            <c:set var="total_price_cn" value="${total_price_cn + data.pay_price_cn}" />
            <c:set var="total_price_ko" value="${total_price_ko + data.pay_price_ko}" />
			</c:forEach>
			<tr>
				<td colspan="2" class="sum" style="text-align:left;padding-left:10px;font-weight:normal;">订单号 : ${pay_pid }</td>
				<td colspan="3" class="sum">总金额 : <fmt:formatNumber value="${total_price_cn}" />元 / <fmt:formatNumber value="${total_price_ko}" /></span>&#8361;</td>
			</tr>
		</table>
		
		</c:forEach>
	</c:when>
	<c:otherwise>
		<table class="wing_choice">
			<caption>예약내역</caption>
			<colgroup>
				<col width="12%" />
				<col width="33%" />
				<col width="19%" />
				<col width="18%" />
				<col width="18%" />
			</colgroup>
			<tr>
				<th colspan="2" class="first" >商品名</th><!--상품명-->
				<th>商品价格</th><!--상품가격-->
				<th>预订日期</th><!--예약일자-->
				<th class="end">预约自动取消日期</th><!--예약자동취소일-->
			</tr>
			<tr>
				<td colspan="5" height="50">没有数据</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
	</div>		
		
		
		<div class="bt_center" style="margin-top:20px;"><a href="#" id="btn_mail"><img src="${host}/resources/img/button/bt_mail_mywingshow.png" alt="My Wing show 邮箱" /></a> <a href="#" id="btn_print"><img src="${host}/resources/img/button/bt_print_mywingshow.png" alt="打印My Wing show" /></a></div>
		<div class="info_guide">
			* 예약결재 계좌 안내 （预约付款账户）<br/>
			* 예약자동취소와 납부방법안내(预约自动取消时转账方法)<br/>
			* 윙코스토리 연락처 안내 （Wingko story 电话）<br/>
			* 연락받을 연락처 필수 기재 안내 （必需填写联系电话）
		</div>

    </div>
   
	<!-- RIGHT Include -->
 	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
 <c:import url="../inc/bottom.jsp" charEncoding="UTF-8" /> 

</body>
</html>
