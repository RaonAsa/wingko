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
		$("#submit").click(function(){
			$("form").submit();
		});

		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='notice_delete.do?page=${notice.page}&no=${notice.no}';
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
    	<div class="tit">광고등록</div>
		<div class="con">
			<form method="post">
				<c:if test="${notice.no > 0 }">
					<form:hidden path="notice.no" />
				</c:if>
				<form:hidden path="notice.user_no" />
				<form:hidden path="notice.user_name" />
				<form:hidden path="notice.page" />
				<table class="info">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>제목</th>
						<td><form:input path="notice.title" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>상단고정</th>
						<td>
							<form:select path="notice.top" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">사용</form:option>
								<form:option value="N">미사용</form:option>
							</form:select>
						</td>
					</tr>
					<c:if test="${notice.no > 0 }">
						<tr>
							<th>노출</th>
							<td>
								<form:select path="notice.use_flag" cssClass="txt01" cssStyle="width:20%">
									<form:option value="Y">사용</form:option>
									<form:option value="N">미사용</form:option>
								</form:select>
							</td>
						</tr>
					</c:if>
					<tr>
						<th>내용</th>
						<td><form:textarea path="notice.content" rows="20" cols="100"/></td>
					</tr>
				</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
					<c:if test="${notice.no > 0 }"><div id="delete" class="blue_big">삭 제</div></c:if>
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
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/admin/community/imageupload_editor.do'
	});
</script>


</body>
</html>
