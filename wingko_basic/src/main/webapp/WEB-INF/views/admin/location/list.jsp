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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		$("#insert").click(function(){
			location.href = "/admin/location/write.do";
		});
		
		$("#location_search").click(function() {
			$("#frm_search").submit();
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
    	<div class="tit">지역관리</div>
    	<form id="frm_search" method="get">
        <div class="sch">
        	지역 <form:select path="location.location_no" cssClass="txt01">
						<form:option value="">전체</form:option>
						<form:options items="${select}" itemLabel="title" itemValue="value" />
					</form:select> <span id="location_search" class="glay_big">검색</span>
        </div>
       	</form>
		<div class="con">
			<table class="info">
				<colgroup>
					<col width="5%" />
					<col width="20%" />
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="5%" />
				</colgroup>
				<tr>
					<th>지역</th>
					<th>지역(한국어)</th>
					<th>뎁스</th>
					<th>부모지역</th>
					<th>위도</th>
					<th>경도</th>
					<th>입력일</th>
					<th></th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/location/write.do" method="get">
							<input type="hidden" name="location_no" value="${data.location_no}" />
							<input type="hidden" name="org_location_no" value="${location.location_no}" />
							<tr>
								<td>${data.location_no}</td>
								<td>${data.name}(${data.name_ko})</td>
								<td>${data.depth} 뎁스</td>
								<td>
									<c:choose>
										<c:when test="${data.parent_location_no > 0 }">
											${data.parent_location_name}(${data.parent_location_name_ko})
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</td>
								<td>${data.x}</td>
								<td>${data.y}</td>
								<td>${data.reg_date}</td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
	 		<div class="bt03">
	 			<div id="insert" class="blue_big">입력</div>
	 		</div>
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
