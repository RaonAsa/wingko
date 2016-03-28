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
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/wingko.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			if ($("#title").val() == '') {
				alert('제목을 입력해주세요.');
				$("#title").focus();
			} else if ($("#location_no").val() == '') {
				alert('지역을 선택해주세요.');
				$("#location_no").focus();
			} else if ($("#travel_category_no").val() == '') {
				alert('분류를 선택해주세요.');
				$("#travel_category_no").focus();
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
				location.href='delete.do?page=${travel.page}&travel_category_no=${org_travel_category_no}&location_no=${org_location_no}&travel_no=${travel.travel_no}';
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
    	<div class="tit">지역별정보 등록</div>
		<div class="con">
			<form method="post" <c:if test="${travel.travel_no > 0 }">action="/admin/travel/update.do"</c:if> enctype="multipart/form-data">
			<c:if test="${travel.travel_no > 0 }">
				<form:input path="travel.travel_no" type="hidden"/>
			</c:if>
			<input type="hidden" name="org_travel_category_no" value="${org_travel_category_no}" />
			<input type="hidden" name="org_location_no" value="${org_location_no}" />
			<form:input path="travel.page" type="hidden"/>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="60%" />
				</colgroup>
				<tr>
					<th>제목</th>
					<td colspan="3"><form:input path="travel.title" cssClass="txt01" cssStyle="width:50%;"/> <!-- (31/100) --></td>
				</tr>
				<tr>
					<th rowspan="2">분류</th>
					<td>지역</td>
					<td>
						<form:select path="travel.location_no" cssStyle="margin-right:150px;">
							<form:option value="">지역선택</form:option>
							<form:options items="${selectLocation}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
						<form:select path="travel.travel_category_no" cssStyle="margin-right:150px;">
							<form:option value="">분류선택</form:option>
							<form:options items="${selectTravelCategory}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th>이미지(208x130)</th>
					<td colspan="2">
						<form:input path="travel.image" type="file" cssClass="txt01" cssStyle="width:40%;"/>
						<c:if test="${travel.image != ''}">현재 이미지 <img class="img50" src="/upload/travel/${travel.image}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="2" class="edit"><form:textarea path="travel.content" cols="100" rows="20"/></td>
				</tr>
				<c:if test="${travel.travel_no > 0 }">
					<tr>
						<th>노출</th>
						<td colspan="2">
							<form:select path="travel.use_flag" cssClass="txt01">
								<form:option value="Y">공개</form:option>
								<form:option value="N">비공개</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<c:if test="${travel.travel_no > 0 }">
	 				<div id="delete" class="blue_big">삭 제</div>
	 			</c:if>
	 			<!-- <div id="view" class="bold_big">미리보기</div> -->
	 			<div id="submit" class="blue_big">입 력</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


<script>
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/admin/travel/imageupload_editor.do'
	});
</script>


</body>
</html>
