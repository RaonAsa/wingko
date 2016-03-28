<%--
  - 작성자   ysh
  - 작성일자 2013. 7. 24.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/member.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>

	var result = "${result}";
	if (result == "false") {
		alert('아이디 또는 비밀번호가 다릅니다.');
		location.href = "/admin/login.do";
	}

	$(document).ready(function(){
		$("#submit").click(function(){
			$("form").submit();
		});
	});
</script>

</head>

<body>
<div id="login">
	<div class="login_con">
		<form action="" method="post">
		<img src="/resources/admin/img/txt_login.png" alt="comic talk login" style="margin-top:50px; margin-bottom:50px;" /> <br />
        <input type="text" class="txt1" style="margin-bottom:3px;" name="user_id" /> <br/>
        <input type="password" class="txt1" name="user_password"/> <br/>
        <div class="sp01">
        	<a href="javascript:void();" id="submit"><img src="/resources/admin/img/bt_login.gif" alt="로그인" /></a>
        </div>
        </form>
    </div>
</div>
<div id="bottom">
	<img src="/resources/admin/img/copyright.png" alt="(주)바인트리 135-080 서울시 강남구 역삼동 619-28 매트로빌딩 4층   |   대표번호 02-566-3132   |   Copyrightⓒ2012 Vinetree Co.,Ltd. All Rights Reserved." />
</div>
</body>
</html>
