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
<script>
	$(document).ready(function(){
		$("#cancel").click(function(){
			location.href = "qna.do?page=${qna.page}";
		});
		$("#reply").click(function(){
			location.href = "qna_reply.do?page=${qna.page}&no=${qna.no}&t=reply";
		});
		$("#update").click(function(){
			location.href = "qna_reply.do?page=${qna.page}&no=${qna.no}&t=update";
		});
		$("#delete").click(function(){
			if (confirm("삭제하시겠습니까?")) {
				location.href = "qna_delete.do?page=${qna.page}&no=${qna.no}";	
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
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>제목</th>
					<td>${qna.title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${qna.user_nickname}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${qna.content}</td>
				</tr>
			</table>
	 		<div class="bt03">

				<div id="cancel" class="glay_big" style="float:left;">리스트</div>
				<div id="delete" class="blue_big">삭제</div>
	 			<c:if test="${qna.ref_level == '0' && qna.qna_flag == '0'}"><div id="reply" class="blue_big">답변</div></c:if>
	 			<c:if test="${qna.ref_level == '1'}"><div id="update" class="blue_big">답변수정</div></c:if>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>

</body>
</html>
