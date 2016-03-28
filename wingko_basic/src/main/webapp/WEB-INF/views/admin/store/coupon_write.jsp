<%--
  - 작성자  yshsy
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
<script>
	$(document).ready(function(){
		$("#start_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});
		$("#end_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});
		
		if ($("#coupon_no").val() > 0) {
			$("#submit").text("수 정");
		}
		
		$("#submit").click(function(){
			if ($("#coupon_name").val() == '') {
				alert('쿠폰명을 입력해주세요.');
				$("#coupon_name").focus();
			} else if ($("#coupon_desc").val() == '') {
				alert('쿠폰설명을 입력해주세요.');
				$("#coupon_desc").focus();
			} else if ($("#start_date").val() == '') {
				alert('시작일을 입력해주세요.');
				$("#start_date").focus();
			} else if ($("#end_date").val() == '') {
				alert('종료일을 입력해주세요.');
				$("#end_date").focus();
			} else {
				if (confirm("내용을 입력/수정 하시겠습니까?")) {
					$("form").submit();				
				}
			}
		});

		$("#cancel").click(function(){
			history.back(-1);
		});

		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='coupon_delete.do?coupon_no=${storeCoupon.coupon_no}';
			} else {
				return;
			}
		});

		//$("#fileupload").hide();
	});
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">쿠폰등록</div>
		<div class="con">
			<form enctype="multipart/form-data" method="post" <c:if test="${storeCoupon.coupon_no > 0 }">action="/admin/store/coupon_update.do"</c:if>>
			<form:input path="storeCoupon.store_no" type="hidden"/>
			<input type="hidden" name="page" value="${page}"/>
			<c:if test="${storeCoupon.coupon_no > 0 }">
				<form:input path="storeCoupon.coupon_no" type="hidden"/>
			</c:if>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<c:if test="${storeCoupon.coupon_no > 0 }">
					<tr>
						<th>노출</th>
						<td>
							<form:select path="storeCoupon.use_flag" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">공개</form:option>
								<form:option value="N">비공개</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>쿠폰명</th>
					<td><form:input path="storeCoupon.coupon_name" cssClass="txt01" cssStyle="width:20%;"/> (31/100)</td>
				</tr>
				<tr>
					<th>쿠폰설명</th>
					<td><form:input path="storeCoupon.coupon_desc" cssClass="txt01" cssStyle="width:50%;"/></td>
				</tr>
				<tr>
					<th>가용기간</th>
					<td>
						<form:input path="storeCoupon.start_date" cssClass="txt01" cssStyle="width:20%;"/> ~ <form:input path="storeCoupon.end_date" cssClass="txt01" cssStyle="width:20%;"/>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<form:input path="storeCoupon.image" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${storeCoupon.image != ''}">현재 이미지 <img class="img50" src="/upload/coupon/${storeCoupon.image}" /></c:if>
					</td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<%-- <c:if test="${storeCoupon.coupon_no > 0 }">
	 				<div id="delete" class="blue_big">삭 제</div>
	 			</c:if> --%>
	 			<!-- <div id="view" class="bold_big">미리보기</div> -->
	 			<div id="submit" class="blue_big">입 력</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
