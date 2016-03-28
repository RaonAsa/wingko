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
			location.href = "question.do?page=${companyQuestion.page}";
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
    	<div class="tit">회사소개 > 문의 내용</div>
		<div class="con">
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>문의주제</th>
					<td>
						<c:choose>
							<c:when test="${companyQuestion.question_category == '1' }">일반문의</c:when>
							<c:when test="${companyQuestion.question_category == '2' }">광고문의</c:when>
							<c:when test="${companyQuestion.question_category == '3' }">콘텐츠구입문의</c:when>
							<c:when test="${companyQuestion.question_category == '4' }">제휴제안</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>회사명</th>
					<td>${companyQuestion.company}</td>
				</tr>
				<tr>
					<th>담당자명</th>
					<td>${companyQuestion.name}</td>
				</tr>
				<tr>
					<th>회사 홈페이지 URL</th>
					<td>${companyQuestion.url}</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td>${companyQuestion.email}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${companyQuestion.phone}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${companyQuestion.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${companyQuestion.content}</td>
				</tr>
				<tr>
					<th>첨부</th>
					<td>
						<a href="javascript:filedownPath('/upload/question/', '${companyQuestion.file}')">${companyQuestion.file}</a>
					</td>
				</tr>
			</table>
	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">리스트</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>

</body>
</html>
