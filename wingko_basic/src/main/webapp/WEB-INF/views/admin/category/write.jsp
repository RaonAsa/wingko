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
<script>
	$(document).ready(function(){
		$("#submit").click(function(){ $("form").submit(); });

		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='delete.do?category_no=${category.category_no}&org_category_no=${org_category_no}';
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
    	<div class="tit">분류관리</div>
		<div class="con">
			<form method="post" <c:if test="${category.category_no > 0 }">action="/admin/category/update.do"</c:if>>
				<c:if test="${category.category_no > 0 }">
					<form:hidden path="category.category_no" />
				</c:if>
				<input type="hidden" name="org_category_no" value="${org_category_no}" />
				<table class="info">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>부모분류</th>
						<td>
							<form:select path="category.parent_category_no" cssClass="txt01">
								<form:option value="0">부모분류를 선택해주세요.</form:option>
								<form:options items="${selectData}" itemLabel="title" itemValue="value" />
							</form:select>
						</td>
					</tr>
					<tr>
						<th>분류명</th>
						<td><form:input path="category.name" cssClass="txt01" size="50" placeholder="분류명"/></td>
					</tr>
					<tr>
						<th>분류명(한국어)</th>
						<td><form:input path="category.name_ko" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>위도</th>
						<td><form:input path="category.x" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>경도</th>
						<td><form:input path="category.y" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>한줄메모</th>
						<td><form:input path="category.memo" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><form:textarea path="category.content" cols="100" rows="20"/></td>
					</tr>
				</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
					<c:if test="${category.category_no > 0 }"><div id="delete" class="blue_big">삭 제</div></c:if>
		 			<div id="submit" class="blue_big">입 력</div>
		 		</div>
			</form>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
