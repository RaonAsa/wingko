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
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btn_id_submit").click(function() {
			var name = $("#id_name").val(),
				email1 = $("#id_email1").val(),
				email2 = $("#id_email2").val(),
				email = email1 + "@" + email2;

			if (name == "") {
				alert(m.name.blank);
				$("#id_name").focus();
			} else if (email1 == "") {
				alert(m.email.blank);
				$("#id_email1").focus();
			} else if (email2 == "") {
				alert(m.email.blank);
				$("#id_email2").focus();
			} else {
				$("#id_email").val(email);
				$("#frm_id").submit();
			}
		});
		
		$("#btn_pw_submit").click(function() {
			var id = $("#pw_id").val(),
				name = $("#pw_name").val(),
				email1 = $("#pw_email1").val(),
				email2 = $("#pw_email2").val(),
				email = email1 + "@" + email2;

			if (id == "") {
				alert(m.id.blank);
				$("#pw_id").focus();
			} else if (name == "") {
				alert(m.name.blank);
				$("#pw_name").focus();
			} else if (email1 == "") {
				alert(m.email.blank);
				$("#pw_email1").focus();
			} else if (email2 == "") {
				alert(m.email.blank);
				$("#pw_email2").focus();
			} else {
				$("#pw_email").val(email);
				$("#frm_pw").submit();
			}
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
        	<img src="/resources/img/member/tit_idpw.png" alt="Login" />
            <div class="sch_data">
            	<div class="sch_id">
            		<form action="/join/idpw_id.do" id="frm_id" method="post">
            		<input type="hidden" name="email" id="id_email" />
                	<table class="ta_idpw"><!--비밀번호찾기-->
                    	<caption>ID찾기</caption>
                        <colgroup>
                        	<col width="55px" />
                            <col width="265px" />
                        </colgroup>
                        <tr>
                        	<th colspan="2" class="t"><img src="/resources/img/member/txt_sch_id.png" alt="查找用户名" /></th>
                        </tr>
                        <tr>
                        	<th>姓名</th>
                            <td><input type="text" id="id_name" name="user_name" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>电子邮件</th>
                            <td><input type="text" id="id_email1" name="email1" class="login_txt" style="width:36%;" /> @ <input type="text" id="id_email2" name="email2" class="login_txt" style="width:50%;" /></td>
                        </tr>
                        <tr>
                        	<th></th>
                            <td align="right"><a href="javascript:void();" id="btn_id_submit"><img src="/resources/img/member/bt_sch_id.png" alt="查找用户名" /></a></td>
                        </tr>
                    </table>
                    </form>
                </div>
                <div class="sch_pw"><!--아이디찾기-->
                	<form action="/join/idpw_pw.do" id="frm_pw" method="post">
                	<input type="hidden" name="email" id="pw_email" />
                	<table class="ta_idpw">
                    	<caption>ID찾기</caption>
                        <colgroup>
                        	<col width="55px" />
                            <col width="265px" />
                        </colgroup>
                        <tr>
                        	<th colspan="2" class="t"><img src="/resources/img/member/txt_sch_pw.png" alt="查找密码" /></th>
                        </tr>
                        <tr>
                        	<th>用户名</th><!-- id -->
                            <td><input type="text" id="pw_id" name="user_id" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>姓名</th><!-- name -->
                            <td><input type="text" id="pw_name" name="user_name" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>电子邮件</th><!-- email -->
                            <td><input type="text" id="pw_email1" name="email1" class="login_txt" style="width:36%;" /> @ <input type="text" id="pw_email2" name="email2" class="login_txt" style="width:50%;" /></td>
                        </tr>
                        <tr>
                        	<th></th>
                            <td align="right"><a href="javascript:void();" id="btn_pw_submit"><img src="/resources/img/member/bt_sch_pw.png" alt="查找密码" /></a></td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
