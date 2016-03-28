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
<script>
	$(document).ready(function(){
		if ($("#join_no").val() > 0) {
			$("#submit").text("수 정");
		}
		
		$("#submit").click(function(){
			if ($("#title").val() == '') {
				alert('제목을 입력해주세요.');
				$("#title").focus();
			} else if ($("#description").val() == '') {
				alert('설명을 입력해주세요.');
				$("#description").focus();
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
				location.href='join_delete.do?join_no=${joinCode.join_no}&page=${joinCode.page}';
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
    	<div class="tit">유입경로등록</div>
		<div class="con">
			<form method="post">
			<form:input path="joinCode.join_no" type="hidden"/>
			<form:input path="joinCode.page" type="hidden"/>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>제목</th>
					<td><form:input path="joinCode.title" cssClass="txt01" cssStyle="width:20%;"/></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><form:input path="joinCode.description" cssClass="txt01" cssStyle="width:50%;"/></td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<c:if test="${joinCode.join_no > 0 }">
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


</body>
</html>
