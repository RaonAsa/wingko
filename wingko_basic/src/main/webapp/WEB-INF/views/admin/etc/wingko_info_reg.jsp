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
		
		
		$("#btn_reg").click(function(){
			if (!confirm("등록 하시겠습니까?")) return;
			$("#frm_reg").submit();
		});

		$("#btn_cancel").click(function(){
			history.back();
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
			<form id="frm_reg" method="post" action="wingko_info_reg.do" >
			<c:if test="${wingkoinfo.idx != null and wingkoinfo.idx > 0 }"><input type="hidden" name="idx" value="${wingkoinfo.idx }" /></c:if>

			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>은행정보</th>
					<td><input type="text" name="bank_info" value="${wingkoinfo.bank_info }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>문의전화</th>
					<td><input type="text" name="faq_tel" value="${wingkoinfo.faq_tel }" class="txt01"  style="width:70%;" /></td>
				</tr>
				<tr>
					<th>문의메일</th>
					<td><input type="text" name="faq_email" value="${wingkoinfo.faq_email }" class="txt01"  style="width:70%;" /></td>
				</tr>
				<tr <c:if test="${mode == null }">style="display:none;"</c:if> >
					<th>결제취소 예정일</th>
					<td><input type="text" name="cancel_pay_day" value="${wingkoinfo.cancel_pay_day }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr <c:if test="${mode == null }">style="display:none;"</c:if> >
					<th>예약취소 예정일</th>
					<td><input type="text" name="cancel_reservation_day" value="${wingkoinfo.cancel_reservation_day }" class="txt01" style="width:70%;" /></td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="btn_cancel" class="glay_big" style="float:left;">취 소</div>
	 			<div id="btn_reg" class="blue_big">등 록</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
