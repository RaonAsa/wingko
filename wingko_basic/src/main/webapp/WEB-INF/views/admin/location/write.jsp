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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		$("#submit").click(function(){ $("form").submit(); });
		
		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='delete.do?location_no=${location.location_no}&org_location_no=${org_location_no}';
			} else {
				return;
			}
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
    	<div class="tit">지역관리</div>
		<div class="con">
			<table class="info">
				<form  method="post" <c:if test="${location.location_no > 0 }">action="/admin/location/update.do"</c:if> enctype="multipart/form-data">
				<c:if test="${location.location_no > 0 }">
					<form:hidden path="location.location_no" />
				</c:if>
				<input type="hidden" name="org_location_no" value="${org_location_no}" />
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>부모지역</th>
					<td>
						<form:select path="location.parent_location_no" cssClass="txt01">
							<form:option value="0">부모지역을 선택해주세요.</form:option>
							<form:options items="${selectData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th>이미지(208x130)</th>
					<td>
						<form:input path="location.image" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${fn:length(location.image) > 0}">현재 이미지 <img src="/upload/location/${location.image}" /></c:if>
						<br />HotPlace에 들어가는 이미지
					</td>
				</tr>
				<tr>
					<th>지역명</th>
					<td><form:input path="location.name" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>지역명(한국어)</th>
					<td><form:input path="location.name_ko" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>위도</th>
					<td><form:input path="location.x" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>경도</th>
					<td><form:input path="location.y" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>한줄메모</th>
					<td><form:input path="location.memo" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>지역설명</th>
					<td><form:textarea path="location.header_info" cols="100" rows="20"/></td>
				</tr>
				</form>
			</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
		 			<c:if test="${location.location_no > 0 }">
		 				<div id="delete" class="blue_big">삭 제</div>
		 			</c:if>
		 			<div id="submit" class="blue_big">입 력</div>
		 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>

<script>
	CKEDITOR.replace('header_info', {
		filebrowserUploadUrl: '/admin/store/imageupload_editor.do'
	});
</script>


</body>
</html>
