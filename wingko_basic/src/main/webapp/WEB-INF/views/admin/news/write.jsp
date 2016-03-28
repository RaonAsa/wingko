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
		
		var news_category_no = "${news.news_category_no}";
		if (news_category_no > 4) {
			$("#tr_store").show();
		}
		
		$("#news_category_no").change(function() {
			if ( $(this).val() > 4 ) {
				$("#tr_store").show();
			} else {
				$("#tr_store").hide();
			}
		});
		
		$("#submit").click(function(){
			if ($("#title").val() == '') {
				alert('제목을 입력해주세요.');
				$("#title").focus();
			} else if ($("#news_category_no").val() == '') {
				alert('분류를 선택해주세요.');
				$("#news_category_no").focus();
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
				location.href='delete.do?news_category_no=${org_news_category_no}&page=${news.page}&news_no=${news.news_no}';
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
    	<div class="tit">뉴스 등록</div>
		<div class="con">
			<form method="post" enctype="multipart/form-data">
			<c:if test="${news.news_no > 0 }">
				<form:input path="news.news_no" type="hidden"/>
			</c:if>
			<form:input path="news.page" type="hidden"/>
			<input type="hidden" name="org_news_category_no" value="${org_news_category_no}" />
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="60%" />
				</colgroup>
				<c:if test="${news.news_no > 0 }">
					<tr>
						<th>상단고정</th>
						<td colspan="2">
							<form:select path="news.top_use_flag" cssClass="txt01">
								<form:option value="Y">사용</form:option>
								<form:option value="N">미사용</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>제목</th>
					<td colspan="2"><form:input path="news.title" cssClass="txt01" cssStyle="width:50%;"/> <!-- (31/100) --></td>
				</tr>
				<tr>
					<th>분류</th>
					<td colspan="2">
						<form:select path="news.news_category_no" cssStyle="margin-right:150px;">
							<form:option value="0">분류선택</form:option>
							<form:options items="${select}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr id="tr_store" style="display: none;">
					<th>상점</th>
					<td colspan="2">
						<form:select path="news.store_no" cssStyle="margin-right:150px;">
							<form:option value="0">상점선택</form:option>
							<form:options items="${select_store}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th>지역상세 썸네일(80x55)</th>
					<td colspan="2">
						<form:input path="news.thumb_image_location" type="file" cssClass="txt01" cssStyle="width:40%;"/>
						<c:if test="${news.thumb_image_location != ''}">현재 이미지 <img class="img80" src="/upload/news/${news.thumb_image_location}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>기사상단 썸네일(150x95)</th>
					<td colspan="2">
						<form:input path="news.thumb_image_top" type="file" cssClass="txt01" cssStyle="width:40%;"/>
						<c:if test="${news.thumb_image_top != ''}">현재 이미지 <img class="img150" src="/upload/news/${news.thumb_image_top}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>메인 썸네일(70x58)</th>
					<td colspan="2">
						<form:input path="news.thumb_image" type="file" cssClass="txt01" cssStyle="width:40%;"/>
						<c:if test="${news.thumb_image != ''}">현재 이미지 <img class="img50" src="/upload/news/${news.thumb_image}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2" class="edit"><form:textarea path="news.content" cols="100" rows="40"/></td>
				</tr>
				<c:if test="${news.news_no > 0 }">
					<tr>
						<th>노출</th>
						<td colspan="2">
							<form:select path="news.use_flag" cssClass="txt01">
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
	 			<c:if test="${news.news_no > 0 }">
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
		filebrowserUploadUrl: '/admin/news/imageupload_editor.do'
	});
</script>


</body>
</html>
