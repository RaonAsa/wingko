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
<script src="/resources/js/wingko.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").click(function(){
			location.href = "qna.do?page=${qna.page}";
		});
		$("#update").click(function(){
			if (confirm("등록/수정 하시겠습니까?")) {
				$("#frm").submit();	
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
    	<div class="tit">문의 관리</div>
		<div class="con">
			<form id="frm" action="qna_reply.do" method="post">
			<form:hidden path="qna.user_no" />
			<form:hidden path="qna.page" />
			<form:hidden path="qna.no" />
			<form:hidden path="qna.ref" />
			<form:hidden path="qna.ref_level" />
			<form:hidden path="qna.sort" />
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>제목</th>
					<td><form:input path="qna.title" cssClass="txt01" size="50"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:textarea path="qna.content" /></td>
				</tr>
			</table>
	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">리스트</div>
	 			<div id="update" class="blue_big">확인</div>
	 		</div>
	 		</form>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>

<script>
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/admin/community/imageupload_editor.do'
	});
</script>

</body>
</html>
