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
				location.href='delete.do?no=${adData.no}&ad_no=${adData.ad_no}';
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
			<form method="post" enctype="multipart/form-data">
				<c:if test="${adData.no > 0 }">
					<form:hidden path="adData.no" />
				</c:if>
				<form:hidden path="adData.page" />
				<table class="info">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th>광고위치</th>
						<td>
							<form:select path="adData.ad_no" cssClass="txt01">
								<form:option value="0">광고위치를 선택해주세요.</form:option>
								<form:options items="${select}" itemLabel="title" itemValue="value" />
							</form:select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><form:input path="adData.title" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><form:input path="adData.content" cssClass="txt01" size="50"/></td>
					</tr>
					<tr>
						<th>링크</th>
						<td><form:input path="adData.link" cssClass="txt01" size="50"/></td>
					</tr>
				<tr>
					<th>이미지</th>
					<td>
						<form:input path="adData.image" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${adData.image != ''}"><br />현재 이미지 <img src="/upload/ad/${adData.image}" /></c:if>
					</td>
				</tr>
				<c:if test="${adData.no > 0 }">
					<tr>
						<th>노출</th>
						<td>
							<form:select path="adData.use_flag" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">사용</form:option>
								<form:option value="N">미사용</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
					<%-- <c:if test="${adData.no > 0 }"><div id="delete" class="blue_big">삭 제</div></c:if> --%>
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
