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
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_login").click(function() {
			location.href = "/login.do";
		});
		
		$("#btn_join").click(function() {
			location.href = "/join/join_s1.do";
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

		<c:choose>
			<c:when test="${result == 'login' }">
		        <div class="login">
		        	<img src="/resources/img/member/tit_idpw.png" alt="Login" />
		            <div class="login_data">
		            	您的用户名是 ${user.user_id}.<!--고객님의 아이디는 ***입니다.--><br/>
		                <a href="javascript:void();" id="btn_login"><img src="/resources/img/member/btn_login.png" alt="登录" class="bt_space1"/></a><!--로그인-->
		            </div>
		        </div>
			</c:when>
			<c:when test="${result == 'join' }">
		        <div class="login">
		        	<img src="/resources/img/member/tit_idpw.png" alt="Login" />
		            <div class="login_data">
		            	此邮箱未注册. 您要注册吗？<!--등록되지 않은 이메일입니다. 가입하시겠습니까?--><br/>
		                <a href="javascript:void();" id="btn_join"><img src="/resources/img/member/btn_join.png" alt="注册会员" class="bt_space1"/></a><!--회원가입-->
		            </div>
		        </div>
			</c:when>
	        <c:when test="${result == 'email' }">
		        <div class="login">
		        	<img src="/resources/img/member/tit_idpw.png" alt="Login" />
		            <div class="login_data">
						您的临时密码发送到您的注册电子邮件.<!--고객님의 임시비밀번호를 등록 이메일로 발송해드렸습니다.--><br/>
						请您检查电子邮件，使用临时密码登录，在 My Page 菜单更改您的信息. <!--이메일 확인후 임시비밀번호로 접속하시고 My Page 메뉴에서 정보를 수정하여 주십시오.--> <br/>
		                <a href="javascript:void();" id="btn_login"><img src="/resources/img/member/btn_login.png" alt="登录" class="bt_space1"/></a><!--회원가입-->
		            </div>
		        </div>
	        </c:when>
        </c:choose>

    </div>

</div>
<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
