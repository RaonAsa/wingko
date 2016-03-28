<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 상단고정
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<script type="text/javascript">

	var error = "${errors}";
	
	if (error != "") {
		alert(error);
	}

	$(document).ready(function(){
		$("#btn_submit").click(function(){
			if ($("#user_id").val() == "") {
				alert(m.id.blank);
				$("#user_id").focus();
			} else if ($("#user_password").val() == "") {
				alert(m.password.blank);
				$("#user_password").focus();
			} else {
				$("#login").submit();
			}
		});
		
		$("#btn_join").click(function() {
			location.href = "/join/join_s1.do";
		});
		$("#btn_idpw").click(function() {
			location.href = "/join/idpw.do";
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
        	<img src="/resources/img/member/tit_login.png" alt="Login" />
            <div class="login_data">
            	<img src="/resources/img/member/txt_welcome.png" alt="한국관광의 모든것, 윙코스토리에 오신것을 환영합니다." />
            	<form:form modelAttribute="login">
            	<input type="hidden" name="url" value="${url}" />
                <table class="idpw">
                	<caption>로그인</caption>
                    <colgroup>
                    	<col width="60px" />
                    	<col width="180px" />
                    	<col width="85px" />
                    </colgroup>
                    <tr>
                    	<td><img src="/resources/img/member/txt_id.png" alt="ID" /></td>
                        <td><form:input path="user_id" cssClass="login_txt" cssStyle="width:100%; margin-bottom:5px;" tabindex="1" /></td>
                        <td rowspan="2"><a href="javascript:void();" id="btn_submit" tabindex="3"><img src="/resources/img/member/bt_login.png" alt="登录" /></a></td>
                    </tr>
                    <tr>
                    	<td><img src="/resources/img/member/txt_password.png" alt="Password" /></td>
                        <td><form:password path="user_password" cssClass="login_txt" cssStyle="width:100%;" tabindex="2" /></td>
                    </tr>
                    <tr>
                    	<td colspan="3" class="btn">
                        	<a href="javascript:void();" id="btn_join" tabindex="4"><img src="/resources/img/member/bt_join.png" alt="注册会员" /></a> <a href="javascript:void();" id="btn_idpw" tabindex="5"><img src="/resources/img/member/bt_password.png" alt="查找帐号/查找密码" /></a>
                        </td>
                    </tr>
                </table>
               	</form:form>
            </div>
        </div>
    </div>
</div>
<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>