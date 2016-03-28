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
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("#btn_nickname").one('click', function() {
			$("#nickname_rowspan").attr("rowspan", "2").attr("class", "connection");
			$("#nickname_input").removeClass("hidden");
		});
		
		$("#btn_email").one('click', function() {
			$("#email_rowspan").attr("rowspan", "2").attr("class", "connection");
			$("#email_input").removeClass("hidden");
		});

		$("#btn_nickname_check").click(function() {
			var new_nickname = $("#new_nickname").val();
			if (new_nickname == "") {
				alert(m.nickname.change_blank);
				$("#new_nickname").focus();
			} else {
				ajaxCheck('nickname', new_nickname, checkCallback);
			}
		});
		
		$("#btn_email_check").click(function() {
			var new_email = $("#new_email").val();
			if (new_email == "") {
				alert(m.email.change_blank);
				$("#new_email").focus();
			} else {
				ajaxCheck('email', new_email, checkCallback);
			}
		});
		
		
		$("#province_id").bind('change', function() {
			var id = $(this).val();
			if (id != '') {
				$.ajax({
					type: 'GET',
					url: "/join/getAreaCode.do",
					data: "t=province&c="+$(this).val(),
					dataType: 'json',
					fail: function(){alert("fail");},
					success: function(data){
						$("#city_id").find('option').each(function(){
							$(this).remove();
						});
						$("#city_id").append("<option value=''>--市--</option>");
						$.each(data, function(key, val) {
							$("#city_id").append("<option value='"+val.value+"'>"+val.title+"</option>");
						});
					}
				});
			}
		});
		$("#city_id").bind('change', function() {
			var id = $(this).val();
			if (id != '') {
				$.ajax({
					type: 'GET',
					url: "/join/getAreaCode.do",
					data: "t=city&c="+$(this).val(),
					dataType: 'json',
					fail: function(){alert("fail");},
					success: function(data){
						$("#area_id").find('option').each(function(){
							$(this).remove();
						});
						$("#area_id").append("<option value=''>--区--</option>");
						$.each(data, function(key, val) {
							$("#area_id").append("<option value='"+val.value+"'>"+val.title+"</option>");
						});
					}
				});
			}
		});
		
		
		$("#btn_cancel").click(function() {
			location.href = "/";
		});
		
		$("#btn_submit").click(function() {

			var old_password = $("#password").val(),
				new_password = $("#new_password").val(),
				new_password_repeat = $("#new_password_repeat").val(),
				nickname_check = $("#nickname_check").val(),
				email_check = $("#email_check").val();

		 	if (nickname_check == "N") {
		 		alert(m.nickname.duplication);
			} else if (email_check == "N") {
				alert(m.email.duplication);
			} else if ( $("#province_id").val() == "" ) {
				alert(m.province.blank);
				$("#province_id").focus();
			} else if ( $("#city").val() == "" ) {
				alert(m.city.blank);
				$("#city").focus();
			} else if ( $("#area").val() == "" ) {
				alert(m.area.blank);
				$("#area").focus();
			} else if ( $("#address").val() == "" ) {
				alert(m.address.blank);
				$("#address").focus();
			} else if (old_password.length > 0) {
				if (new_password.length < 6 || new_password.length > 12) {
					alert(m.password.check);
				} else if (new_password != new_password_repeat) {
					alert(m.password.change_different);
				} else {
					$("#frm").submit();
				}
			} else {
				$("#frm").submit();
			}
		});
	});

	/**
	 * checkType : id, email, nickname
	 */
	var ajaxCheck = function(checkType, checkString, callback) {
		$.ajax({
			type: 'POST',
			url: "/join/ajaxCheck.do",
			data: "c="+checkType+"&s="+checkString,
			fail: function(){alert("fail");},
			success: function(data){
				$("#"+checkType+"_check").val(data);

				if ( typeof callback === "function" ) {
					callback(checkType, data);
				}
			}
		});
	};

	var checkCallback = function(checkType, result) {
		$("#"+checkType+"_rowspan").attr("rowspan", "3");
		$("#"+checkType+"_input").attr("class", "connection");
		$("#"+checkType+"_check_tr").removeClass("hidden");

		if (result == "Y") {
			$("#"+checkType+"_true").removeClass("hidden")
			$("#"+checkType+"_false").addClass("hidden");
		} else {
			$("#"+checkType+"_true").addClass("hidden")
			$("#"+checkType+"_false").removeClass("hidden");
		}
	}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">My Page</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/my_page.png" alt="My Page" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="/my/my_info.do"><img src="/resources/img/menu/my_tab01_on.png" alt="新消息" /></a></li>
        	<li><a href="/my/my_write.do"><img src="/resources/img/menu/my_tab02.png" alt="推荐信息" /></a></li>
        	<li><a href="/my/my_scrap.do"><img src="/resources/img/menu/my_tab03.png" alt="特辑专栏" /></a></li>
        	<!-- <li><a href="#"><img src="/resources/img/menu/my_tab04.png" alt="旅行表演" /></a></li> -->
        </ul>
        <form method="post" id="frm">
        <form:form modelAttribute="user">
        <form:hidden path="user_no" />
        <input type="hidden" name="nickname_check" id="nickname_check" />
        <input type="hidden" name="email_check" id="email_check" />
        <table class="my_info">
        	<caption>정보변경</caption>
            <colgroup>
            	<col width="25%" />
                <col width="75%" />
            </colgroup>
            <tr>
            	<th>姓名</th>
                <td>${user.user_name}</td>
            </tr>
            <tr>
            	<th rowspan="1" id="nickname_rowspan">昵称</th>
                <td class="noti">${user.user_nickname } <img src="/resources/img/button/btn_modify.png" alt="更改" align="absmiddle" id="btn_nickname" class="hand"/></td>
            </tr>
            <tr id="nickname_input" class="hidden">
                <td class="noti"><input type="text" id="new_nickname" name="new_nickname" class="login_txt" style="width:60%;" /> <img src="/resources/img/button/btn_overlap.png" alt="重复检查" align="absmiddle" id="btn_nickname_check" class="hand" /></td>
            </tr>
            <tr id="nickname_check_tr" class="hidden">
                <td class="noti"><span id="nickname_true" class="hidden">可以用这个绰号</span><span id="nickname_false" class="hidden">不可以用这个绰号</span></td><!--변경가능한 닉네임입니다. //사용불가능한 닉네임입니다（不可以用这个绰号）-->
            </tr>
            <tr>
            	<th rowspan="1" id="email_rowspan"">电子邮件</th>
                <td class="noti">${user.email } <img src="/resources/img/button/btn_modify.png" alt="更改" align="absmiddle" id="btn_email" class="hand"/></td>
            </tr>
            <tr id="email_input" class="hidden">
                <td class="noti"><input type="text" id="new_email" name="new_email" class="login_txt" style="width:60%;" /> <img src="/resources/img/button/btn_overlap.png" alt="重复检查" align="absmiddle" id="btn_email_check" class="hand" /></td>
            </tr>
            <tr id="email_check_tr" class="hidden">
                <td class="noti"><span id="email_true" class="hidden">可以用这个绰号</span><span id="email_false" class="hidden">不可以用这个绰号</span></td><!--변경가능한 닉네임입니다. //사용불가능한 닉네임입니다（不可以用这个绰号）-->
            </tr>
            <tr>
            	<th rowspan="2">手机号码</th>
                <td class="connection"><input type="text" name="phone" value="${user.phone }" class="login_txt"/> <!-- <a href="#"><img src="/resources/img/button/btn_modify.png" alt="更改" align="absmiddle" /></a> --></td>
            </tr>
            <tr>
                <td class="noti2">购买或预约时，可联系的号码. 无法联系时，免除责任事项介绍</td><!--구매나 예약시 연락 가능한 번호입니다. 연락 불가능시 책임면책사항 안내-->
            </tr>
            <tr>
            	<th rowspan="3">密码</th>
                <td class="connection">现有密码 <input type="password" id="password" name="password" class="login_txt" style="width:40%; margin-left:30px;" /></td>
            </tr>
             <tr>
                <td class="connection">新密码 <input type="password" id="new_password" name="new_password" class="login_txt" style="width:40%; margin-left:43px;" /></td>
            </tr>
             <tr>
                <td>确认新的密码 &nbsp;&nbsp;<input type="password" id="new_password_repeat" name="new_password_repeat" class="login_txt" style="width:40%;" /> <!-- <a href="#"><img src="/resources/img/button/btn_modify.png" alt="更改" align="absmiddle"/></a> --></td>
            </tr>
            <tr>
            	<th>地区</th><!-- 주소 -->
                <td class="noti">
					<form:select path="province_id" cssClass="login_txt" cssStyle="width:150px; margin-bottom:4px;">
	                    <form:option value="">--省--</form:option>
						<form:options items="${provinceList}" itemLabel="title" itemValue="value" />
					</form:select>&nbsp;
					<form:select path="city_id" cssClass="login_txt" cssStyle="width:165px; margin-bottom:4px;">
						<form:option value="">--市--</form:option>
						<form:options items="${cityList}" itemLabel="title" itemValue="value" />
					</form:select>&nbsp;
					<form:select path="area_id" cssClass="login_txt" cssStyle="width:120px; margin-bottom:4px;">
						<form:option value="">--区--</form:option>
						<form:options items="${areaList}" itemLabel="title" itemValue="value" />
					</form:select>
                </td>
            </tr>
            <tr>
            	<th>详细地址</th><!-- 상세주소 -->
                <td><form:input path="address" cssClass="login_txt" cssStyle="width:80%; margin-bottom:4px;"/></td>
            </tr>
       </table>
       </form:form>
       <div class="bt_center"><img src="/resources/img/button/btn_ok.png" alt="确认" id="btn_submit" class="hand"/> <img src="/resources/img/button/btn_cancel.png" alt="取消" id="btn_cancel" class="hand"/></div>
       <br/><br/><br/>
       <img src="/resources/img/banner/bottom_banner2.png" alt="배너" />
    </div>

	<!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />

</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>