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
				location.href='delete.do?travel_no=${travel.travel_no}';
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
			<form method="post" >
			<c:if test="${travelInfo.no > 0 }">
				<form:input path="travelInfo.no" type="hidden"/>
				<form:input path="travelInfo.title" type="hidden"/>
			</c:if>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="60%" />
				</colgroup>
				<tr>
					<th>메뉴</th>
					<td colspan="2">
						<form:select path="travelInfo.menu" cssStyle="margin-right:150px;">
							<form:option value="info">한국여행정보</form:option>
							<form:option value="traffic">한국교통정보</form:option>
							<form:option value="communication">통신,와이파이,픽업</form:option>
							<form:option value="location">지역정보안내</form:option>
							<form:option value="travel">한국관광정보</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="2">${travelInfo.title}<%-- <form:input path="travelInfo.title" cssClass="txt01" cssStyle="width:50%;"/> <!-- (31/100) --> --%></td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="2" class="edit"><form:textarea path="travelInfo.content" cols="100" rows="20"/></td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<%-- <c:if test="${travelInfo.no > 0 }">
	 				<div id="delete" class="blue_big">삭 제</div>
	 			</c:if> --%>
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
