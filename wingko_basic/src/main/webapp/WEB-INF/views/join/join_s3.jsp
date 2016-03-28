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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_ok").click(function() {
			location.href="/";
		});
	});
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
    <div id="Wide">
    	<!-- Join Tab -->
		<c:import url="../inc/join_tab.jsp" charEncoding="UTF-8" />
		
        <div class="login">
        	<img src="/resources/img/member/tit_join.png" alt="Wingko注册会员" />
            <div class="join_data2">
            	<div class="join_step"><img src="/resources/img/member/step3.png" alt="step3" /></div><!--회원가입3단계-->
                <br/><br/>
                <img src="/resources/img/member/join_end.png" alt="欢迎注册  优惠劵已发送到您的邮箱里，请您确认查收" style="margin-bottom:86px;" />
                <div class="bt_center"><a href="javascript:void();" id="btn_ok"><img src="/resources/img/member/btn_login_big.png" alt="登录" /></a></div>
                <br/><br/>
            </div>
        </div>
    </div>
</div>
<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
