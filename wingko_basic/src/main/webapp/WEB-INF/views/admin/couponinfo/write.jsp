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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/wingko.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script>
	$(document).ready(function(){
		$("#start_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});
		$("#end_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm:ss.l"});
		
		
		$("#submit").click(function(){
			
			if($("#coupon_type").val() == 0){
				alert("타입을 선택해 주세요.");
				$("#coupon_type").focus();
				return;
			}
			
			if(! /^\d{1,}$/.test( $("#coupon_value").val() ) ){
				alert("숫자만 입력 가능합니다. ");
				$("#coupon_value").focus(); 
				return false;
			}
			
			if($("#info_desc_ko").val() == 0){
				alert("설명을 입력해 주세요.");
				$("#info_desc_ko").focus();
				return;
			}
			
			if($("#start_date").val() == 0){
				alert("날짜를 형식에 맞게 입력해주세요. ");
				$("#start_date").focus();
				return;
			}
			
			if($("#end_date").val() == 0){
				alert("날짜를 형식에 맞게 입력해주세요. ");
				$("#end_date").focus();
				return;
			}
			
			/*
			if(! /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/.test( $("#start_date").val() ) ){
				alert("날짜 형식이 아닙니다. ");
				$("#start_date").focus(); 
				return false;
			}
			
			if(! /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/.test( $("#end_date").val() ) ){
				alert("날짜 형식이 아닙니다. ");
				$("#end_date").focus(); 
				return false;
			}
			*/
			
			if(confirm('등록하시겠습니까?')){
				$("form").submit();				
			}

		});
		
		$("#cancel").click(function(){
			history.back(-1);
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
    	<div class="tit">Coupon 관리</div>
		<div class="con">
			<table class="info">
				<form method="post" <c:if test="${couponinfo.idx > 0 }">action="/admin/couponinfo/update.do"</c:if>>
				<c:if test="${couponinfo.idx > 0 }">
					<form:hidden path="couponinfo.idx" />
				</c:if>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				
				<tr>
					<th>타입</th>
					<td>
						<form:select path="couponinfo.coupon_type" cssClass="txt01">
							<form:option value="0">쿠폰 형식을 선택해주세요.</form:option>
							<form:options items="${selectData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				
				<tr>
					<th>가격(W)/할인율(%)</th>
					<td><form:input path="couponinfo.coupon_value" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<form:hidden path="couponinfo.info_desc" />
						<form:textarea path="couponinfo.info_desc_ko" cols="100" rows="10" />
					</td>
				</tr>
				<tr>
					<th>사용</th>
					<td>
						<form:select path="couponinfo.used" cssClass="txt01">
							<form:option value="Y">공개</form:option>
							<form:option value="N">비공개</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>유효기간</th>
					<td>
						<form:input path="couponinfo.start_date" cssClass="txt01" size="50"/> ~
						<form:input path="couponinfo.end_date" cssClass="txt01" size="50"/> 
					</td>
				</tr>
				</form>
			</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
		 			<!--<c:if test="${couponinfo.idx > 0 }">
		 				<div id="delete" class="blue_big">삭 제</div>
		 			</c:if>-->
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
