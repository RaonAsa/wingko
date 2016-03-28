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
<script src="/resources/js/validation.js"></script>
<script src="/resources/js/message.js"></script>


<script type="text/javascript">

	$(document).ready(function(){
		
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
		
		$("#id").change(function(){ $("#id_check").val('N'); $("#id_true").addClass("hidden"); $("#id_false").addClass("hidden"); });
		$("#email").change(function(){ $("#email_check").val('N'); $("#email_true").addClass("hidden"); $("#email_false").addClass("hidden"); });
		$("#nickname").change(function(){ $("#nickname_check").val('N'); $("#nickname_true").addClass("hidden"); $("#nickname_false").addClass("hidden"); });

		$("#btn_id_check").click(function() {
			var _id = $("#id").val();
			if ( _id == "") {
				alert(m.id.blank);
				$("#id").focus();
			} else {
				if (_validation.id(_id)) {
					ajaxCheck('id', _id, $(this));
				} else {
					alert(m.check.wrong_format);
					$("#id").focus();
				}
			}
 		});
		$("#btn_email_check").click(function() {
			var _email = $("#email").val();
			if ( _email == "") {
				alert(m.email.blank);
				$("#email").focus();
			} else {
				if (_validation.email(_email)) {
					ajaxCheck('email', _email, $(this));
				} else {
					alert(m.check.wrong_format);
					$("#email").focus();
				}
			}
		});
		$("#btn_nickname_check").click(function() {
			var _nickname = $("#nickname").val();
			if ( _nickname == "") {
				alert(m.nickname.blank);
				$("#nickname").focus();
			} else {
				ajaxCheck('nickname', _nickname, $(this));
			}
		});

		$("#submit").click(function() {
			if ( "Y" != $("#id_check").val() ) {
				alert(m.id.duplication);
				$("#id").focus();
			} else if ( "Y" != $("#email_check").val() ) {
				alert(m.email.duplication);
				$("#email").focus();
			} else if ( "Y" != $("#nickname_check").val() ) {
				alert(m.nickname.duplication);
				$("#nickname").focus();
			} else if ( $("#password").val() == "" ) {
				alert(m.password.blank);
				$("#password").focus();
			} else if ( $("#password").val().length < 8 || $("#password").val().length > 12 ) {
				alert(m.password.check);
			} else if ( $("#password").val() != $("#password_repeat").val() ) {
				alert(m.password.different);
				$("#password_repeat").focus();
			} else if ( $("#name").val() == "" ) {
				alert(m.name.blank);
				$("#name").focus();
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
			} else {
				if (confirm(m.confirm.join)) {
					$("#join").submit();	
				} else {
					return false;
				}
				
			}
		});
		$("#cancel").click(function() {
			location.href="/";
		});
	});
	
	
	var ajaxCheck = function(checkType, checkString) {
		$.ajax({
			type: 'POST',
			url: "/join/ajaxCheck.do",
			data: "c="+checkType+"&s="+checkString,
			fail: function(){alert("fail")},
			success: function(data){
				$("#"+checkType+"_check").val(data);

				if (data == "Y") {
					$("#"+checkType+"_true").removeClass("hidden")
					$("#"+checkType+"_false").addClass("hidden");
				} else {
					$("#"+checkType+"_true").addClass("hidden")
					$("#"+checkType+"_false").removeClass("hidden");
				}
			}
		});
	};
	
	
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
            <div class="join_data">
            	<div class="join_step"><img src="/resources/img/member/step2.png" alt="step2" /></div><!--회원가입2단계-->
                <h3>填写基本信息</h3><!-- 기본정보입력 -->
                <form:form modelAttribute="join" action="/join/join_s3.do">
                <form:hidden path="id_check" />
                <form:hidden path="email_check" />
                <form:hidden path="nickname_check" />
                <form:hidden path="join_no" />
                <table class="join_basic_data">
                	<caption>회원가입 기본정보입력</caption>
                    <colgroup>
                    	<col width="20%" />
                        <col width="80%" />
                    </colgroup>
                    <tr>
                    	<th>用户名</th><!-- ID -->
                        <td>
                        	<form:input path="id" cssClass="login_txt" cssStyle="width:25%; " maxlength="12" /> <a href="javascript:void();" id="btn_id_check"><img src="/resources/img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a> <span class="noti">4~12个英文小写字母或数字<!-- 4~12자의 영문소문자와 숫자 --></span>
							<span id="id_true" class="hidden">可以使用此用户名</span><!-- 사용 가능한 아이디입니다 -->
                            <span id="id_false" class="hidden">此用户名无法使用</span><!-- 사용 불가능한 아이디입니다 -->
                        </td>
                    </tr>
                    <tr>
                    	<th>邮箱</th><!-- Email  -->
                        <td>
                        	<form:input path="email" cssClass="login_txt" cssStyle="width:40%; margin-bottom:4px;" /> <a href="javascript:void();" id="btn_email_check"><img src="/resources/img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a>
                        	<span id="email_true" class="hidden">可以使用此邮箱地址</span><!-- 사용 가능한 이메일 입니다 -->
                            <span id="email_false" class="hidden">此邮箱地址无法使用</span><!-- 사용 불가능한 이메일 입니다 -->
                        </td>
                    </tr>
                    <tr>
                    	<th>昵称</th><!-- nickname  -->
                        <td>
                        	<form:input path="nickname" cssClass="login_txt" cssStyle="width:40%; margin-bottom:4px;" /> <a href="javascript:void();" id="btn_nickname_check"><img src="/resources/img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a>
                        	<span id="nickname_true" class="hidden">可以使用此昵称</span><!-- 사용 가능한 닉네임입니다 -->
                            <span id="nickname_false" class="hidden">此昵称无法使用</span><!-- 사용 불가능한 닉네임입니다 -->
                        </td>
                    </tr>
                    <tr>
                    	<th>密码</th><!-- 비밀번호 -->
                        <td><form:password path="password" cssClass="login_txt" cssStyle="width:40%; margin-bottom:4px;" /><%-- <br/><span class="noti">8~12자의 영문소문자와 숫자</span> --%></td>
                    </tr>
                    <tr>
                    	<th>密码确认</th><!-- 비밀번호 확인 -->
                        <td><form:password path="password_repeat" cssClass="login_txt" cssStyle="width:40%;" /></td>
                    </tr>
                    <tr>
                    	<th>姓名</th><!-- 이름 -->
                        <td><form:input path="name" cssClass="login_txt" cssStyle="width:80%;" /></td>
                    </tr>
                    <tr>
                    	<th>性别</th><!-- 성별 -->
                        <td><form:radiobutton path="sex" value="M" /> 男 &nbsp;&nbsp; <form:radiobutton path="sex" value="F" /> 女</td>
                    </tr>
                    <tr>
                    	<th>手机号码</th><!-- 전화번호 -->
                        <td><form:input path="phone" cssClass="login_txt" cssStyle="width:80%; margin-bottom:4px;" /><br/><span>为方便购买或预约，请正确输入个人信息</span></td>
                    </tr>
                    <tr>
                    	<th>地区</th><!-- 주소 -->
                        <td>
	                        <form:select path="province_id" cssClass="login_txt" cssStyle="width:150px; margin-bottom:4px;">
	                        	<form:option value="">--省--</form:option>
								<form:options items="${provinceList}" itemLabel="title" itemValue="value" />
							</form:select>&nbsp;
							<form:select path="city_id" cssClass="login_txt" cssStyle="width:165px; margin-bottom:4px;">
								<form:option value="">--市--</form:option>
							</form:select>&nbsp;
							<form:select path="area_id" cssClass="login_txt" cssStyle="width:120px; margin-bottom:4px;">
								<form:option value="">--区--</form:option>
							</form:select>
                        </td>
                    </tr>
                    <tr>
                    	<th>详细地址</th><!-- 상세주소 -->
                        <td><form:input path="address" cssClass="login_txt" cssStyle="width:80%; margin-bottom:4px;"/></td>
                    </tr>
                </table>
                <div class="bt_center"><a href="javascript:void();" id="submit"><img src="/resources/img/member/btn_join_big.png" alt="注册会员" /></a> <a href="javascript:void();" id="cancel"><img src="/resources/img/member/btn_cancel.png" alt="取消" /></a></div>
                </form:form>
            </div>
        </div>
    </div>
</div>


<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>