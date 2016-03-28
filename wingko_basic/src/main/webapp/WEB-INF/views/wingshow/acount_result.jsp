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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script>
$(document).ready(function(){
	
	
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
        
        <div class="account_ok"><!--결제완료 문구노출-->
	<c:choose>
		<c:when test="${paymain.pay_method == paymethod_card && paymain.pay_used == payused_yes }">
			<p>谢谢您的付款</p>
            <a href="#">取消购买商品时，根据日期收取相关手续费咨询 ▶</a> <br/><!--결제 취소시 날짜구간별 부과수수료 안내 링크-->
            	结算详细内容和使用日期请在‘MY Wingshow’确认 <br/>
            	取消 'MY Wingshow'.
		</c:when>
		<c:when test="${paymain.pay_method == paymethod_bank && paymain.pay_used == payused_yes }"> <!--결제 은행 안내-->
			结算帐号 : 友利银行 1005-883-001030<br/>
			请在 ${after_month }月 ${after_day } 号前付款 <br/>
			期限内未付款时 My Wing show内所有购买选项将会自动取消.
		</c:when>
		<c:otherwise>
			<p>付款被拒</p>
			${paymain.cancel_msg }
		</c:otherwise>
	</c:choose>
        </div>
        
        <div class="bt_center" style="margin-top:20px;"><a href="my_wingshow.do"><img src="/resources/img/button/bt_my_wingshow.png" alt="my wingshow" /></a></div>
        <br/><br/>
	<c:if test="${paymain.pay_used == payused_yes }">
        <div class="account_ok">
        	您的可用的联系号是 ${paymain.user_phone } <br/><!--고객님의 연락 가능 연락처는 000입니다.-->
            如果不能联系，并根据您购买后的变化的缺点您不能获得全额赔偿. <br/>
            可以在My page更改您的联系号码.
        </div>
	</c:if>
        <div class="bt_center" style="margin-top:20px;"><a href="/my/my_info.do"><img src="/resources/img/button/bt_my_page.png" alt="my page" /></a></div>
        <div class="info_guide">
        	Wingko Story 电话号码询问 : 02-6365-1030 <br/>
            Wingko Story 电子邮件询问 : wingkomaster@wingkostory.com <br/><br/>
            如有任何问题，请随时与我们联系<!--궁금하신 사항은 언제든지 연락주세요-->
        </div>
    </div>
    

    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
