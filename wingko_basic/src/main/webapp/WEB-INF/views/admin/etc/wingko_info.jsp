<%--
  - 작성자  meeroojin
  - 작성일자 2013. 7. 20.
  - 내용
  -
  -
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"        prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"   prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"         prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		
		
		$("#btn_edit").click(function(){
			location.href = "wingko_info_reg.do";
		});

	});
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">기타정보</div>
		<div class="con">
			<div class="bt03">
	 			<div id="btn_edit" class="blue_big">수정</div>
	 		</div>
	 		
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>은행정보</th>
					<td>${wingkoinfo.bank_info }</td>
				</tr>
				<tr>
					<th>문의전화</th>
					<td>${wingkoinfo.faq_tel }</td>
				</tr>
				<tr>
					<th>문의메일</th>
					<td>${wingkoinfo.faq_email }</td>
				</tr>
			</table>

		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
