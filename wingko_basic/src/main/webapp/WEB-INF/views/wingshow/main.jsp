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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/wingshow.js"></script>
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
	
	wing.onLoadEventDay = function(){

		$("input[name=datepicker]").each(function(){
			var _this = $(this);
			var sDate = _this.val();
			var arr_date = sDate.split("-");
			
			if(arr_date.length != 3) return;
			if( Number(arr_date[0]) != wing.year || Number(arr_date[1]) != wing.month) return;

			var item_id = _this.attr('item_id');
			var row_tr = _this.closest("tr");
			var menu_title = $(".name", row_tr).html();
			
			//wing.removeData(item_id); // remove data
			wing.addData(arr_date[2], item_id, menu_title); // add data
		});
	};
	
	wing.onClickKeyData = function(key){
		if(!confirm('您确定您要删除吗？')) return ;
		
		wing.removeData(key);
		$('input[item_id=' + key + ']').val('');
	};
	
	/*
	wing.onClickDay = function(obj, year, month, day){
		alert(year + ' - ' + month + ' - ' + day);
	}
	*/
	
	wing.showWing(); // today
	

	$("input[name=datepicker]" ).each(function(){
		var _this = $(this);
		var start_date = _this.attr('start_date');
		var end_date = _this.attr('end_date');
		_this.prop("readonly", true);
		_this.datepicker({
			changeMonth: true
			, changeYear: true
			, showMonthAfterYear: true
			, dateFormat: "yy-mm-dd" 
//			, monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
//			, dayNames: [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ] 
//			, dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ] 
			, minDate: '+1d'
			, onSelect: function(sDate, obj){
				var arr_date = sDate.split("-");
				
				if(arr_date.length != 3) return;
				if( Number(arr_date[0]) != wing.year || Number(arr_date[1]) != wing.month) return;
				
				var item_id = _this.attr('item_id');
				
				var row_tr = _this.closest("tr");
				var menu_title = $(".name", row_tr).html();
				
				wing.removeData(item_id); // remove data
				wing.addData(arr_date[2], item_id, menu_title); // add data
			}
		});
		if(start_date){
			_this.datepicker("option", "maxDate", start_date);
		}
		if(end_date){
			_this.datepicker("option", "maxDate", end_date);
		}
	});
	
	
	
	
	function sumTotalPrice(){
		var sum_price = 0;
		var sum_price_cny = 0;
		
		$("input[name=chk_id]").each(function(){
			var isCheck = $(this).is(":checked");
			if(isCheck){
				var item_num = $(this).closest("tr").find("span[name=item_total]").text();
				var item_num_cny = $(this).closest("tr").find("span[name=item_total_cny]").text();
				sum_price += Number(item_num.replace(",", ""));
				sum_price_cny += Number(item_num_cny.replace(",", ""));
			}
		});
		
		$("#total_price").text( sum_price.comma() );
		$("#total_price_cny").text( sum_price_cny.comma() );
	};
	
	// check box
	$("input[name=chk_id]").click(function(){
		sumTotalPrice();
		
		return true;
	});
	
	
	function sumItemPrice(root_obj){
		var item_count = $("select[name=item_count]", root_obj).val();
		
		var item_price = $("span[name=item_price]", root_obj).text();
		var item_price_cny = $("span[name=item_price_cny]", root_obj).text();
		item_price = Number(item_price.replace(",", ""));
		item_price_cny = Number(item_price_cny.replace(",", ""));
		
		
		var item_coupon = Number($("select[name=item_coupon]", root_obj).val());
		var coupon_price = item_price * item_coupon / 100;
		var coupon_price_cny = item_price_cny * item_coupon / 100;
		
		var sum_price = (item_price - coupon_price) * item_count;
		var sum_price_cny = (item_price_cny - coupon_price_cny) * item_count;
		$("span[name=item_total]", root_obj).text( sum_price.comma());
		$("span[name=item_total_cny]", root_obj).text( sum_price_cny.comma());
	}
	
	$("select[name=item_count]").change(function(){
		sumItemPrice( $(this).closest("tr") );
		sumTotalPrice();
	});
	
	$("select[name=item_coupon]").change(function(){
		sumItemPrice( $(this).closest("tr") );
		sumTotalPrice();
	});
	
	
	$("#btn_del").click(function(){
		var cnt = $('input[name=chk_id]:checked').size();
		if(cnt == 0){
			alert('没有数据');
			return false;
		}
		
		if( !confirm('您确定您要删除吗？')) return false; // 삭제 하시겠습니까?
				
		$('#frm_list').attr('action', '');
		$('#frm_list').submit();
		
		return false;
	});
	
	
	$("#btn_acount").click(function(){
		var cnt = 0;
		var isDate = true;
		
		$('input[name=chk_id]').each(function(){
			if($(this).is(':checked')){
				var parent_tr = $(this).closest("tr");
				var value = $("input[name=datepicker]", parent_tr).val();
				if(value == ''){
					isDate = false;
					return false;
				}
				cnt++;
			}
		});
		
		if(isDate == false){
			alert('输入日期');
			return false;
		}
		
		if(cnt == 0){
			alert('没有数据');
			return false;
		}
		
		// remove
		$('input[name=chk_id]').each(function(){
			if($(this).is(':checked') == false){
				var parent_tr = $(this).closest("tr");
				parent_tr.remove();
			}
		});
		
		$('#frm_list').attr('action', 'acount.do');
		$('#frm_list').submit();
		
		return false;
	});
	
	$("#btn_reservation").click(function(){
		var cnt = 0;
		var isDate = true;
		
		$('input[name=chk_id]').each(function(){
			if($(this).is(':checked')){
				var parent_tr = $(this).closest("tr");
				var value = $("input[name=datepicker]", parent_tr).val();
				if(value == ''){
					isDate = false;
					return false;
				}
				cnt++;
			}
		});
		
		if(isDate == false){
			alert('输入日期');
			return false;
		}
		
		if(cnt == 0){
			alert('没有数据');
			return false;
		}
		
		// remove
		$('input[name=chk_id]').each(function(){
			if($(this).is(':checked') == false){
				var parent_tr = $(this).closest("tr");
				parent_tr.remove();
			}
		});
		

		$('#frm_list').attr('action', 'reservation.do');
		$('#frm_list').submit();
		
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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">Wing Show</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/tit_wingshow.png" alt="Wing Show" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="main.do"><img src="/resources/img/menu/wingshow_tab01_on.png" alt="Making Wing show" /></a></li>
        	<li><a href="my_wingshow.do"><img src="/resources/img/menu/wingshow_tab02.png" alt="My Wing show" /></a></li>
        </ul>
        <div id='wing_calendar'></div>
        
        <table class="wing_choice">
        	<caption>선택된 윙쇼</caption>
            <colgroup>
            	<col width="4%" />
                <col width="12%" />
            	<col width="17%" />
                <col width="10%" />
                <col width="13%" />
                <col width="17%" />
                <col width="12%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<th class="first"></th>
            	<th colspan="2">商品名称</th><!--상품명-->
                <th>数量</th><!--수량-->
                <th>商品价格</th><!--상품가격-->
                <th>打折优惠劵</th><!--할인가쿠폰적용-->
                <th>总计</th><!--합계-->
                <th class="end">选择日期</th><!--날짜선택-->
            </tr>
            
			<form id="frm_list" method="post">
			<c:choose>
				<c:when test="${fn:length(data_list) >0 }">
					<c:forEach items="${data_list }" var="data" varStatus="status">
					
						<fmt:parseDate var="tmp_date1" value="${data.start_date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="start_date" value="${tmp_date1 }" pattern="yyyy-MM-dd"/>
						<c:if test="${start_date <= now_date }">
							<fmt:parseDate var="tmp_date1" value="${now_date }" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="start_date" value="${tmp_date1 }" pattern="yyyy-MM-dd"/>
						</c:if>
						
						<fmt:parseDate var="tmp_date2" value="${data.end_date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="end_date" value="${tmp_date2 }" pattern="yyyy-MM-dd"/>
				<tr>
	            	<td class="check"><input type="checkbox"  name="chk_id" value="${data.cart_id}"/></td><!--지역,상호명,메뉴명-->
	                <td><img src="http://www.wingkostory.com/upload/store/menu/${data.image_thumb }" style="width: 70px; height: 55px;" alt="" /></td><!--이미지사이즈 70*55-->
	                <td class="name">[${data.location_name }] ${data.store_title }<br/>${data.menu_name }</td>
	                <td>
	                	<select name="item_count">
	                    	<option value="1">1</option>
	                        <option value="2">2</option>
	                        <option value="3">3</option>
	                        <option value="4">4</option>
	                        <option value="5">5</option>
	                        <option value="6">6</option>
	                        <option value="7">7</option>
	                        <option value="8">8</option>
	                        <option value="9">9</option>
	                        <option value="10">10</option>
	                    </select>
	                </td>
	                <td><span name="item_price_cny"><fmt:formatNumber value="${data.menu_price_cny}" /></span>元 <br/>
	                	<span name="item_price"><fmt:formatNumber value="${data.menu_price}" /></span>&#8361;</td>
	                <td>
	                	<select name="item_coupon">
	                		<option value="0">未使用优惠卷</option><!--쿠폰미적용-->
	                	<c:if test="${data.menu_coupon > 0}">
	                    	<option value="${data.menu_coupon}">使用优惠卷</option><!--쿠폰적용-->
	                    </c:if>
	                   </select>
	                </td>
	                <td><span name="item_total_cny"><fmt:formatNumber value="${data.menu_price_cny }" /></span>元 <br/>
						<span name="item_total"><fmt:formatNumber value="${data.menu_price }" /></span>&#8361;</td>
	                <td class="end"><input type="text" name="datepicker" class="date_txt" item_id="${data.cart_id}"  start_date="${start_date}" end_date="${end_date }" /></td>
	            </tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="8" style="height: 100px">没有数据</td><!-- 데이터가 없습니다 -->
				</tr>
				</c:otherwise>
			</c:choose>
			</form>
				
			
            <tr>
            	<td colspan="8" class="delete"><a href="#" id="btn_del"><img src="/resources/img/button/btn_choice_delete.png" alt="删除选项" /></a></td><!--선택삭제-->
            </tr>
            <tr>
            	<td colspan="8" class="sum">总金额 : <span id="total_price_cny">0</span>元 / <span id="total_price">0</span>&#8361;</td><!--총합계금액-->
            </tr>
        </table>
        <div class="bt_center" style="margin-top:20px;"><a href="#" id="btn_acount"><img src="/resources/img/button/bt_account.png" alt="付款" /></a> <a href="#" id="btn_reservation"><img src="/resources/img/button/bt_reservation.png" alt="预约" /></a></div>
        <div class="info_guide">
        	* 请在此填写优惠券信息，促销信息，店铺促销信息等
        </div>
    </div>
   
   <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
