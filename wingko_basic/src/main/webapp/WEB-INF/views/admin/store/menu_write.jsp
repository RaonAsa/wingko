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
<!-- <style>
.ui-datepicker{ font-size: 12px; width: 220px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
</style> -->

<script>
	$(document).ready(function(){
		$("#start_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});
		$("#end_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});

		if ($("#menu_no").val() > 0) {
			$("#submit").text("수 정");
		}
		
		$("#submit").click(function(){
			if ($("#menu_name").val() == '') {
				alert('메뉴명을 입력해주세요.');
				$("#menu_name").focus();
			} else if ($("#menu_price").val() == '') {
				alert('가격(원화)를 입력해주세요.');
				$("#menu_price").focus();
			} else if ($("#menu_price_cny").val() == '') {
				alert('가격(위안화)를 입력해주세요.');
				$("#menu_price_cny").focus();
			} else if ($("#menu_coupon").val() == '') {
				alert('쿠폰 할인율을 입력해주세요.');
				$("#menu_coupon").focus();
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
				location.href='menu_delete.do?menu_no=${storeMenu.menu_no}';
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
    	<div class="tit">상점메뉴관리</div>
		<div class="con">
			<form enctype="multipart/form-data" method="post" <c:if test="${storeMenu.menu_no > 0 }">action="/admin/store/menu_update.do"</c:if>>
			<form:input path="storeMenu.store_no" type="hidden"/>
			<input type="hidden" name="page" value="${page}"/>
			<c:if test="${storeMenu.menu_no > 0 }">
				<form:input path="storeMenu.menu_no" type="hidden"/>
			</c:if>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<c:if test="${storeMenu.menu_no > 0 }">
					<tr>
						<th>노출</th>
						<td>
							<form:select path="storeMenu.use_flag" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">공개</form:option>
								<form:option value="N">비공개</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>메뉴명</th>
					<td><form:input path="storeMenu.menu_name" cssClass="txt01" cssStyle="width:40%;"/> <!-- (31/100) --></td>
				</tr>
				<tr>
					<th>가격(원화)</th>
					<td><form:input path="storeMenu.menu_price" cssClass="txt01" cssStyle="width:10%;"/>\</td>
				</tr>
				<tr>
					<th>가격(위안화)</th>
					<td><form:input path="storeMenu.menu_price_cny" cssClass="txt01" cssStyle="width:10%;"/>元</td>
				</tr>
				<tr>
					<th>쿠폰</th>
					<td><form:input path="storeMenu.menu_coupon" cssClass="txt01" cssStyle="width:5%;"/>%</td>
				</tr>
				<tr>
					<th>가용기간</th>
					<td>
						<form:input path="storeMenu.start_date" cssClass="txt01" cssStyle="width:20%;"/> ~ <form:input path="storeMenu.end_date" cssClass="txt01" cssStyle="width:20%;" />
					</td>
				</tr>
				<!-- 수정사항 적용하다가 이미지, 썸네일 바껴버림.. -->
 				<tr>
					<th>이미지</th>
					<td>
						<form:input path="storeMenu.image_thumb" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${storeMenu.image_thumb != ''}">현재 이미지 <img class="img50" src="/upload/store/menu/${storeMenu.image_thumb}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>썸네일 이미지</th>
					<td>
						<form:input path="storeMenu.image" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${storeMenu.image != ''}">현재 이미지 <img class="img50" src="/upload/store/menu/${storeMenu.image}" /></c:if>
					</td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<%-- <c:if test="${storeMenu.menu_no > 0 }">
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
