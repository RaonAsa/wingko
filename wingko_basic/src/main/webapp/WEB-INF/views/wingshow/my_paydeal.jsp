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
<link rel="stylesheet" type="text/css" href="${host}/resources/css/pop.css" />
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
	
	
	$("input[name=btn_pay_cancel]").click(function(){
		var _this = $(this);
		var pid = _this.attr("pid");
		var pay_date = _this.attr('pay_date');
		
		$("input[name=cancel_pid]").val(pid);
		$("input[name=bank_name]").val("");
		$("input[name=bank_num]").val("");
		$("input[name=bank_owner]").val("");
		
		if(pay_date == ""){
			// 취소하시겠습니까?
			if(!confirm('您确定要取消？') ) {
				return false; 
			}
			
			var form = $("#frm_cancel");
			form.attr('action', 'my_payment_cancel.do');
			form.submit();
			
			return false;
		}

		
		$( "#Popup" ).dialog({
		      width: 490,
		      height: 'auto',
		      modal: true
		});
		
		$('.ui-widget-header').remove(); //상단 타이틀 제거
		$('.ui-resizable-handle').remove(); //모달에 바인드된 div+이벤트 제거,ex)창크기조절,드래그 위치변경
		
		return false;
	});
	
	$("#btn_pop_ok").click(function(){
		// 취소하시겠습니까?
		if(!confirm('您确定要取消？') ) {
			return false; 
		}
		/*		
		if($("input[name=cancel_pid]").val() == ""){
			return false;
		}*/
		if($("input[name=bank_name]").val() == ""){
			alert("输入银行名称");
			$("input[name=bank_name]").focus();
			return false;
		}
		if($("input[name=bank_num]").val() == ""){
			alert("输入您的帐户号码");
			$("input[name=bank_num]").focus();
			return false;
		}
		if($("input[name=bank_owner]").val() == ""){
			alert("输入储户的名字");
			$("input[name=bank_owner]").focus();
			return false;
		}

		var form = $("#frm_cancel");
		form.attr('action', 'my_payment_cancel.do');
		form.submit();
		
		return false;
	});
	
	$("#btn_pop_cancel").click(function(){
		$('#Popup').dialog( "destroy" );
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
		
		// 결제상품
		var param = {mail_title:'[wingko]预约商品名', mail_body:html};		
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
       		<li ><a href="my_wingshow.do">预约内容</a></li>|<li><a href="my_payment.do">帐单历史</a></li>|<li class="on">本月推荐商品</li>
		</ul>
		<br/>
	<div print_view>
		<table class="wing_choice">
        	<caption>결제상품</caption>
            <colgroup>
            	<col width="12%" />
                <col width="33%" />
                <col width="15%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<td colspan="6" class="subject">预约商品名</td><!--결제상품-->
            </tr>
        </table>
        
<c:choose>
	<c:when test="${fn:length(list_main) >0 }">

		<c:forEach items="${list_main }" var="item_main" >
		
		<table class="wing_choice" style="margin-bottom:20px;">
        	<caption>결제상품</caption>
            <colgroup>
                <col width="33%" />
                <col width="13%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
                <col width="" />
            </colgroup>
           <tr>
            	<th class="first" >商品名</th><!--상품명-->
                <th>商品价格</th><!--상품가격-->
                <th>结算种类</th><!--결제종류-->
                <th>地址</th><!--주소-->
                <th>接受者</th><!--받는사람-->
                <th class="end">结算日期</th><!--결제일자-->
            </tr>
            
            <c:set var="item_cnt" value="${fn:length(item_main.list_item) }" />
            		
			<c:forEach items="${item_main.list_item }" var="data" varStatus="status">
			
			<tr pid="${data.pid }" item_id="${data.item_id }">
            	<td class="first name">${data.item_name } (${data.menu_cnt })</td>
                <td><fmt:formatNumber value="${data.pay_price_cn}" />元 /<br/> <fmt:formatNumber value="${data.pay_price_ko}" /></span>&#8361;</td>
			<c:if test="${status.first == true }"> <!--입금 存款, 카드 信用卡-->
                <td rowspan="${item_cnt }"> 
                	<c:choose>
                		<c:when test="${fn:contains(item_main.pay_method, 'CARD') == true }">信用卡</c:when>
                		<c:otherwise>存款</c:otherwise>
                	</c:choose>
                </td>
                <td rowspan="${item_cnt }">${item_main.area } <br/>${item_main.address}</td>
                <td rowspan="${item_cnt }">${item_main.name } <br/>${item_main.phone }</td>
                <td class="end"  rowspan="${item_cnt }">
                	<c:choose>
                	<c:when test="${item_main.pay_date == null }">-</c:when>
                	<c:otherwise>${fn:substring(item_main.pay_date, 0, 10) }</c:otherwise>
                </c:choose> <!---결제일자-->
                <br/><br/>
                <input type="button" name="btn_pay_cancel" value="取消" pid="${item_main.pid }" pay_date="${item_main.pay_date }" /> <!-- 취소  -->
                </td>
			</c:if>
            </tr>
			</c:forEach>
			
			<tr>
				<td colspan="2" class="sum" style="text-align:left;padding-left:10px;font-weight:normal;">订单号 : ${item_main.pid }</td>
				<td colspan="4" class="sum">总金额 : <fmt:formatNumber value="${item_main.pay_price_cn}" />元 / <fmt:formatNumber value="${item_main.pay_price_ko}" /></span>&#8361;</td>
			</tr>
		</table>
		
		</c:forEach>
	</c:when>
	<c:otherwise>
		<table class="wing_choice" style="margin-bottom:20px;">
        	<caption>결제상품</caption>
            <colgroup>
                <col width="33%" />
                <col width="13%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
                <col width="" />
            </colgroup>
           <tr>
            	<th class="first" >商品名</th><!--상품명-->
                <th>商品价格</th><!--상품가격-->
                <th>结算种类</th><!--결제종류-->
                <th>地址</th><!--주소-->
                <th>接受者</th><!--받는사람-->
                <th class="end">结算日期</th><!--결제일자-->
            </tr>
			<tr>
				<td colspan="6" height="50">没有数据</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
		
		<br/><br/>
		<table class="wing_choice">
        	<caption>결제취소내역</caption>
            <colgroup>
            	<col width="12%" />
                <col width="33%" />
                <col width="15%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
            </colgroup>
           <tr>
				<td colspan="6" class="subject">取消结算清单（${fn:length(list_refund)}件）</td><!--결제취소내역-->
			</tr>
        </table>
<c:choose>
	<c:when test="${fn:length(list_refund) >0 }">

		<c:forEach items="${list_refund }" var="item_main" >
		
		<table class="wing_choice" style="margin-bottom:20px;">
            <colgroup>
                <col width="33%" />
                <col width="13%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
                <col width="" />
            </colgroup>
           <tr>
            	<th class="first" >商品名</th><!--상품명-->
                <th>商品价格</th><!--상품가격-->
                <th>结算种类</th><!--결제종류-->
                <th>地址</th><!--주소-->
                <th>接受者</th><!--받는사람-->
                <th class="end">取消日期</th><!--취소일자-->
            </tr>
            
            <c:set var="item_cnt" value="${fn:length(item_main.list_item) }" />

			<c:forEach items="${item_main.list_item }" var="data" varStatus="status">
			
			<tr pid="${data.pid }" item_id="${data.item_id }">
            	<td class="first name">${data.item_name } (${data.menu_cnt })</td>
                <td><fmt:formatNumber value="${data.pay_price_cn}" />元 /<br/> <fmt:formatNumber value="${data.pay_price_ko}" /></span>&#8361;</td>
			<c:if test="${status.first == true }"> <!--입금 存款, 카드 信用卡-->
                <td rowspan="${item_cnt }"> 
                	<c:choose>
                		<c:when test="${fn:contains(item_main.pay_method, 'CARD') == true }">信用卡</c:when>
                		<c:otherwise>存款</c:otherwise>
                	</c:choose>
                </td>
                <td rowspan="${item_cnt }">${item_main.area } <br/>${item_main.address}</td>
                <td rowspan="${item_cnt }">${item_main.name } <br/>${item_main.phone }</td>
                <td class="end" rowspan="${item_cnt }" > <!-- 退款请求 환불요청,  不予退还 취소불가, 完成退款 환불완료 -->
					<c:if test="${item_main.pay_state == '30' }">退款请求<br/><br/></c:if>
					<c:if test="${item_main.pay_state == '38' }">不予退还<br/><br/></c:if>
					<c:if test="${item_main.pay_state == '39' }">完成退款<br/><br/></c:if>
					${fn:substring(item_main.cancel_date, 0, 10) }
				</td>
			</c:if>
            </tr>

			</c:forEach>
			
			<tr>
				<td colspan="2" class="sum" style="text-align:left;padding-left:10px;font-weight:normal;">订单号 : ${item_main.pid }</td>
				<td colspan="4" class="sum">总金额 : <fmt:formatNumber value="${item_main.pay_price_cn}" />元 / <fmt:formatNumber value="${item_main.pay_price_ko}" /></span>&#8361;</td>
			</tr>
		</table>
		
		</c:forEach>
	</c:when>
	<c:otherwise>
		<table class="wing_choice" style="margin-bottom:20px;">
        	<caption>결제상품</caption>
            <colgroup>
            	<col width="12%" />
                <col width="33%" />
                <col width="15%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
            </colgroup>
           <tr>
            	<th colspan="2" class="first" >商品名</th><!--상품명-->
                <th>商品价格</th><!--상품가격-->
                <th>结算种类</th><!--결제종류-->
                <th>使用日期</th><!--사용일자-->
                <th class="end">结算日期</th><!--결제일자-->
            </tr>
			<tr>
				<td colspan="6" height="50">没有数据</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
		
		
	</div>
		
		
		<div class="bt_center" style="margin-top:20px;"><a href="#" id="btn_mail"><img src="${host}/resources/img/button/bt_mail_mywingshow.png" alt="My Wing show 邮箱" /></a> <a href="#" id="btn_print"><img src="${host}/resources/img/button/bt_print_mywingshow.png" alt="打印My Wing show" /></a></div>
		 <div class="info_guide">
        	* 无卡转账后取消预订时退款方法 <!-- 무통장 입금 취소시 환불방법 안내 --><br/>
            * 银联卡结算取消方法 <!-- 카드결제 취소안내  -->
        </div>

    </div>
   
	<!-- RIGHT Include -->
 	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />


<div id="Popup" style="display:none;">
	<form id="frm_cancel" method="post">
	<input type="hidden" name="cancel_mode"  value="paydeal" />
	<input type="hidden" name="cancel_pid" />
	<img src="${host}/resources/img/title/tit_mywingshow.png" alt="my wingshow" />
    <div class="content">
    	<h1>确认取消购买吗?</h1>
        <table>
        	<caption>구매취소</caption>
            <colgroup>
            	<col width="25%" />
                <col width="75%" />
            </colgroup>
            <tr><th colspan="2" class="sp2">信用卡付款用户</th></tr><!--신용카드 결재고객-->
            <tr><td colspan="2" class="sp1">信用卡付款被取消时，根据信用卡公司，取消购买和确认时间有所不同</td></tr><!--신용카드결재 취소, 카드사에 따라서 결재취소와 확인이 다소 시간이 걸릴 수 있습니다. -->
            <tr><th colspan="2" class="sp2">转账用户</th></tr><!--계좌이체 고객-->
            <tr>
            	<td class="tit">银行名称</td><!--은행명-->
                <td><input type="text" class="txt" name="bank_name" /></td>
            </tr>
            <tr>
            	<td class="tit">存款帐户</td><!--입금계좌-->
                <td><input type="text" class="txt" name="bank_num" /></td>
            </tr>
             <tr>
            	<td class="tit">存款人姓名</td><!--예금주명-->
                <td><input type="text" class="txt" name="bank_owner" /></td>
            </tr>
            <tr><td colspan="2" class="noti">请正确记录银行账号，以便退还款式出现不必要的麻烦</td></tr><!--정확히 기재하셔야 환불금이 제대로 입금됩니다.-->
            <tr><td colspan="2" class="noti2">填写错误所引发的不必要麻烦，公司将不负责处理</td></tr><!--부정확한 기재는 책임지지 않습니다.-->
       </table>
       <br/>
       <a href="#" id="btn_pop_ok"><img src="${host}/resources/img/button/btn_ok.png" alt="确认" style="border:0px;"/></a> <a href="#" id="btn_pop_cancel"><img src="${host}/resources/img/button/btn_cancel.png" alt="取消"  style="border:0px;"/></a><!--확인 취소-->
    </div>
    </form>
</div> 

</body>
</html>
