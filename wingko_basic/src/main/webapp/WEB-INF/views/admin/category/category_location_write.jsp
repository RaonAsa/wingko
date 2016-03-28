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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		var categroy_no = "${categoryLocation.category_no}";
		if (categroy_no > 10 ) {
			$("#map").hide();
		}
		
		$("#submit").click(function(){ $("form").submit(); });

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
    	<div class="tit">분류 &gt; 지역 안내</div>
		<div class="con">
			<form method="post">
				<form:hidden path="categoryLocation.no" />
				<form:hidden path="categoryLocation.category_no" />
				<table class="info">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>분류명</th>
						<td>${categoryLocation.category_name}</td>
					</tr>
					<tr>
						<th>지역명</th>
						<td>${categoryLocation.location_name}</td>
					</tr>
					<tr id="map">
						<th>지도안내</th>
						<td><form:textarea path="categoryLocation.map_info" cols="100" rows="20"/></td>
					</tr>
					<tr>
						<th>안내</th>
						<td><form:textarea path="categoryLocation.info" cols="100" rows="20"/></td>
					</tr>
				</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
		 			<div id="submit" class="blue_big">입 력</div>
		 		</div>
			</form>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>

<script>
	CKEDITOR.replace('info', {
		filebrowserUploadUrl: '/admin/store/imageupload_editor.do'
	});
	
	CKEDITOR.replace('map_info', {
		filebrowserUploadUrl: '/admin/store/imageupload_editor.do'
	});
</script>


</body>
</html>
