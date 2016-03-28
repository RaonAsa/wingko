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
		if ($("#category").val() == 'blog') {
			$("#location").show();
		}
		$("#category").change(function() {
			if ($("#category").val() == 'blog') {
				$("#location").show();
			} else {
				$("#location").hide();
			}
		});
		
		
		$("#submit").click(function(){
			$("form").submit();
		});

		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='delete.do?no=${community.no}';
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
    	<div class="tit">커뮤니티등록</div>
		<div class="con">
			<form method="post" action="write.do" enctype="multipart/form-data">
				<c:if test="${community.no > 0 }">
					<form:hidden path="community.no" />
				</c:if>
				<form:hidden path="community.page" />
				<form:hidden path="community.user_no" />
				<form:hidden path="community.user_name" />
				<input type="hidden" name="org_category" value="${org_category}"/>
				<table class="info">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>분류</th>
						<td>
							<form:select path="community.category" cssStyle="margin-right:150px;">
								<form:option value="">게시판선택</form:option>
								<form:option value="webtoon" label="웹툰" />
								<form:option value="game" label="게임" />
								<form:option value="blog" label="블로그" />
							</form:select>
						</td>
					</tr>
					<tr style="display: none;" id="location">
						<th>지역</th>
						<td>
							<form:select path="community.location_no" cssStyle="margin-right:150px;">
								<form:option value="0">지역선택</form:option>
								<form:options items="${locationData}" itemLabel="title" itemValue="value" />
							</form:select>
						</td>
					</tr>
					<%-- <tr>
						<th>상단고정</th>
						<td>
							<form:select path="community.notice_flag" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">사용</form:option>
								<form:option value="N">미사용</form:option>
							</form:select>
						</td>
					</tr> --%>
					<tr>
						<th>회원번호/글쓴이</th>
						<td>
							${community.user_no} / ${community.user_name}
						</td>
					</tr>
					<tr>
						<th>썸네일</th>
						<td>
							<form:input path="community.image_thumb" type="file" cssClass="txt01" cssStyle="width:30%;"/>
							<c:if test="${community.image_thumb != ''}"><br />현재 이미지 <img src="/upload/community/${community.image_thumb}" /></c:if>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><form:input path="community.title" cssClass="txt01" size="50"/></td>
					</tr>
					<c:if test="${community.no > 0 }">
						<tr>
							<th>노출</th>
							<td>
								<form:select path="community.use_flag" cssClass="txt01" cssStyle="width:20%">
									<form:option value="Y">사용</form:option>
									<form:option value="N">미사용</form:option>
								</form:select>
							</td>
						</tr>
					</c:if>
					<tr>
						<th>내용</th>
						<td><form:textarea path="community.content" rows="20" cols="100"/></td>
					</tr>
				</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
					<c:if test="${community.no > 0 }"><div id="delete" class="blue_big">삭 제</div></c:if>
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
