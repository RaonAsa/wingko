<%--
  - 작성자  meeroojin
  - 작성일자 2013. 9. 19.
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
<style>
.item_list {
	padding:5px 0px;
}
.item_list .title{
	display:inline-block;
	width:380px;
}
.item_list .count{
	display:inline-block;
	width:50px;
}
.item_list .price{
	display:inline-block;
	width:100px;
	text-align:right;
}
</style>
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>

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


var m_diff_time = "${diff_time}";

function runTimeFunc() { 
	var day = Math.floor(m_diff_time / 60 / 60 / 24);
	var hour = Math.floor((m_diff_time / 60 / 60) % 24);
	var minute = Math.floor((m_diff_time / 60) % 60);
	var second = Math.floor(m_diff_time % 60);
	
	var end_zone = $(".end_time");
	$(".month", end_zone).text( (day < 10 ? "0"+day : day) );
	$(".hour", end_zone).text( (hour < 10 ? "0"+hour : hour) );
	$(".minute", end_zone).text( (minute < 10 ? "0"+minute : minute) );
	$(".seconds", end_zone).text( (second < 10 ? "0"+second : second) );
	
	if(m_diff_time > 0){
		--m_diff_time;
		var newtime = window.setTimeout("runTimeFunc();", 1000);
	}
}




$(document).ready(function() {
	
	var user_no = '${user_no}';
	
	runTimeFunc();
	
	function set_total_price(){
		var price_ko = 0;
		var price_cn = 0;
		
		$("div.item_list").each(function(index){
			var _this = $(this);
			
			price_ko += Number(_this.attr("ko")) ;
			price_cn += Number(_this.attr("cn")) ;
		});
		
		$("#total_price_cn").text(price_cn.comma() );
		$("#total_price_ko").text(price_ko.comma() );
	}
	
	$("#deal_item").change(function(){
		var _this = $(this);
		var item_id = _this.val();
		
		if(item_id != ""){
			
			if( $(".item_list").size() >= 3){
				alert("可以最多三个"); // 3개까지 가능
			}else{
				//if( $(".item_list[item_id=" + item_id + "]").size() == 0){	
					var sel_option = $("option[value=" + item_id +"]", _this);
					
					var item_name = sel_option.text();
					var price_ko = sel_option.attr("ko");
					var price_cn = sel_option.attr("cn");
					
					var item_html = '<div class="item_list" item_id="' + item_id + '" ko="' + price_ko + '" cn="' + price_cn + '">' +
						'	<input type="hidden" name="deal_item_id" value="' + item_id+ '" />' +
						'	<span class="title">' + item_name + '</span>' +
//						'	<span class="count"><select><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></span>' +
						'	<span class="price">' + price_cn.comma() +' 元 <img src="/resources/img/button/bt_delete.png" name="btn_del_item" class="hand" alt="delete" align="absbottom" style="margin-left:20px;"/></span>' +
						'</div>';
						
					$("#frm_item_list").append(item_html);
				
			//}
			}
		}
		
		_this.val("");
		
		set_total_price();
	});
	
	
	$("#frm_item_list").on("click", "img[name=btn_del_item]", function(){
		var div_item = $(this).closest("div");
		div_item.remove();
		
		set_total_price();
	});
	
	$("#btn_mywingshow").click(function(){
		if(user_no == ""){
			if ( !confirm('你想登陆？') ) return false; // 로그인 하시겠습니까?
			location.href = '/login.do';
			return false;
		}
		
		
		var form = $("#frm_item_list");
		if($("input[name=deal_item_id]", form).size() == 0 ){
			alert("你有没有选择项目"); // 선택된 상품이 없습니다
			return false;
		}
		
		if ( !confirm('你要付钱吗？') ) return false; // 결제 하시겠습니까?
		
		form.submit();
		
		
		return false;
	});
	
	$("#ripple_content").bind({
		click : function(){
			if(user_no == ""){
				$(this).prop("readonly", true);
				if ( !confirm('你想登陆？') ) return; // 로그인 하시겠습니까?
				location.href = '/login.do';
			}
		},
		keyup : function(){
			var maxByte = 140;
			var contentByte = 0;
			var currentByte = 0;
			var content = $(this).val();
			var tempContent = '';
			var tempByte = 0;

			for ( var i = 0; i < content.length; i++) {
				currentByte = content.charCodeAt(i);
				if (currentByte > 127) {
					contentByte += 2;
				} else {
					contentByte++;
				}
				if (contentByte <= 140) {
					tempContent = content.substring(0, i);
					tempByte = contentByte;
				}
			}
			if (contentByte > maxByte) {
				alert("메세지는 " + maxByte + " Byte 까지 입력 가능합니다.");
				$(this).val(tempContent);
				$("#byte").text(tempByte);
				return;
			} else {
				$("#byte").text(contentByte);
			}
		}
	});
	
	
	$("#btn_ripple_add").bind({
		click : function(){
			if(user_no == ""){
				if ( !confirm('你想登陆？') ) return; // 로그인 하시겠습니까?
				location.href = '/login.do';
				return;
			}
			
			if ( !confirm('你要注册吗？') ) return; // 등록하겠습니까?
			
			$("#frm_ripple").submit();
		}
	});
	
	$("img[name=btn_ripple_del]").bind({
		click : function(){
			if ( !confirm('您确定您要删除吗？') ) return; // 삭제 하겠습니까?
			location.href = 'review_remove.do?no=' + $(this).attr("no");
		}
	});
	
	<c:if test="${dealmain == null }">
	$(window).load(function(){
		alert('有没有产品'); // 상품이 없습니다
		history.back();
	});
	</c:if>

});
</script>
</head>
<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
		<ul class="location">
			<a name="tab_top"></a>
			<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>购物</li><li class="end">本月交易</li>
		</ul>
		<div class="commodity">
			<div class="number"><!--판매갯수,한정수량-->
				<img src="/resources/img/title/txt_sell_num.png" alt="销售量" /> <span><fmt:formatNumber value="${dealmain.sale_count}" /></span>个 <img src="/resources/img/icon/deal_line.png" alt="" class="space_dm" /> <img src="/resources/img/title/txt_limited_num.png" alt="限定量" /> <span>${dealmain.limit_count}</span>个
			</div>
			<div class="end_time"><!--남은시간-->
				<div class="deal_time month">00</div>
				<div class="deal_time hour">00</div>
				<div class="deal_time minute">00</div>
				<div class="deal_time seconds">00</div>
			</div>
		</div>
		<div class="deal_pic"><!--이달의딜 메인이미지-->
			<div class="discount_rate"><span>${dealmain.discount}</span>%</div><!--할인률-->
			<c:if test="${dealmain.image != '' and dealmain.image != null}"><img src="/upload/deal/${dealmain.image }" alt="딜 샘플이미지" /> <!--메인이미지 크기 고정 762*345--></c:if>
		</div>
		<div class="deal_info">
			<div class="deal_name">加入所有服务提供方便</div>
			<ul class="deal_price">
				<li class="small">販賣價 <fmt:formatNumber value="${dealmain.cost_sale}" />￦</li><!--판매가-->
				<li>打折价格 <span><fmt:formatNumber value="${dealmain.cost_discount}" /></span>￦</li><!--할인가-->
			</ul>
		</div>
		<table class="store_detail_info" style="margin-bottom:15px;">
			<caption>상점상세정보</caption>
			<colgroup>
				<col width="25%" />
				<col width="50%" />
				<col width="8%" />
				<col width="17%" />
			</colgroup>
			<tr>
				<th>商品名称</th><!--상품명-->
				<td colspan="3">${dealmain.title }</td>
			</tr>
			<tr>
				<th>营产地/厂商</th><!--원산지/제조사-->
				<td colspan="3">${dealmain.info_origin }</td>
			</tr>
			<tr>
				<th>配送方法</th><!--배송방법-->
				<td colspan="3">${dealmain.info_transfer }</td>
			</tr>
			<tr>
				<th>咨询</th><!--문의-->
				<td colspan="3">${dealmain.info_faq }</td>
			</tr>
			<tr>
				<th>备注</th><!--추가정보-->
				<td colspan="3">${dealmain.summary }</td>
			</tr>
			<tr>
				<th>选择商品</th><!--상품선택-->
				<td colspan="3">
					<select id="deal_item">
						<option value="">-选择-</option>
					<c:forEach items="${list_item }" var="data" varStatus="status">
						<option value="${data.item_id }" ko="${data.price_ko }" cn="${data.price_cn }">${data.item_name }</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>商品数量</th><!--상품수량-->
				<td colspan="3" >
					<form id="frm_item_list" method="post" action="acount.do">
						<input type="hidden" name="deal_id" value="${dealmain.deal_id}" />
					<!-- <div class="item_list">
						<span class="title">옵션1 - 1인 디너 할인권 + 런치 할인권</span>
						<span class="count">
							<select>
								<option value="1">1</option>
								<option value="1">2</option>
							</select>
						</span>
						<span class="price">20,000元 <img src="/resources/img/button/bt_delete.png" alt="delete" align="absbottom" /></span>
					</div> -->
					</form>
				</td>
			</tr>
			<tr>
				<th></th><!--총결제예정금액-->
				<td colspan="3" class="sum">预约总合 : <span id="total_price_cn">0</span>元 (<span id="total_price_ko">0</span>&#8361;)</td>
			</tr>
		</table>
		<div class="bt_right"><a href="#" id="btn_mywingshow"><img src="/resources/img/button/bt_basket.png" alt="装进wingshow" /></a></div><!--윙쇼에담기-->
		<ul class="tab_detail_c2" style="margin-top:70px;"><!--상세설명, 리뷰 탭-->
			<li class="sel"><img src="/resources/img/menu/store_tab01_on.png" alt="详细说明" /></li><!--선택탭 클래스 sel-->
			<a href="#tab_02" name="tab_01"><li class="no end"><img src="/resources/img/menu/store_tab04.png" alt="评论" /></li></a>
		</ul>
		${dealmain.content }
		<!-- <img src="/resources/img/print_img/sam_detail.png" alt="샘플" />  -->
		<ul class="tab_detail_c2" style="margin-top:70px;"><!--상세설명, 리뷰 탭-->
			<a href="#tab_01" name="tab_02"><li><img src="/resources/img/menu/store_tab01.png" alt="详细说明" /></li></a><!--선택탭 클래스 sel-->
			<li class="sel"><img src="/resources/img/menu/store_tab04_on.png" alt="评论" /></li>
		</ul>
		<div class="review_noti">请在下方评论箱留下您宝贵的意见。咨询及投诉，请发送邮件到wingkomaster@wingkostory.com</div><!--소중한의견을 하단의 텍스트상자에 의견을 넣어주세요. 불만과 문의는 윙코스토릴로 문의해주세요-->
		<form id="frm_ripple" action="review_insert.do" method="post">
			<input type="hidden" name="parent_no" value="${dealmain.deal_id }" />
		<table class="review">
			<caption>리뷰쓰기,리스트</caption>
			<colgroup>
				<col width="15%" />
				<col width="70%" />
				<col width="15%" />
			</colgroup>
			<tr>
				<td colspan="2" class="no"><textarea id="ripple_content" name="content" class="review_txtarea" ></textarea></td>
				<td class="no"><img id="btn_ripple_add" src="/resources/img/button/bt_review_write.png" alt="评论"  class="hand"/></td>
			</tr>
			<tr><td colspan="3" class="txt">还可以输入140字 (<span id="byte">0</span>/140)</td></tr>
			<tr><td colspan="3" class="num"><fmt:formatNumber value="${ripple_count}" />条评论</td></tr><!--00명의 리뷰-->
		<c:forEach items="${ripple_list}" var="data" varStatus="status" >
			<tr><!--리뷰1개 시작-->
				<th>${data.user_id }</th>
				<td class="date">${fn:substring(data.reg_date, 0, 10) }</td>
				<td rowspan="2" class="delete">
					<c:choose>
	               		<c:when test="${data.user_no == user_no }"><img name="btn_ripple_del"  no="${data.no }" src="/resources/img/icon/delete.png" alt="delete" class="hand" /></c:when>
	               		<c:otherwise>&nbsp;</c:otherwise>
	               	</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">${data.content }</td>
			</tr><!--리뷰1개 끝-->
		</c:forEach>
		</table>
		</form>
		<div class="reviw_bt"><img src="/resources/img/txt_review_noti.png" alt="时刻关注本文记载内容" /><a href="#tab_top"><img src="/resources/img/button/bt_top.png" alt="top" style="float:right;" /></a></div>
	</div>


    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
    
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>