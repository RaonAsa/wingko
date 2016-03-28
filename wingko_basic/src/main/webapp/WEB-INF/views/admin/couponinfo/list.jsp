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
			location.href = "/admin/couponinfo/write.do";
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
    	<div class="tit">Coupon 관리</div>
    	
		<div class="con">
			<table class="info">
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="8%" />
					<col width="25%" />
					<col width="10%" />
					<col width="22%" />
					<col width="13%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>타입</th>
					<th>가격/할인율</th>
					<th>설명</th>
					<th>사용</th>
					<th>유효기간</th>
					<th>등록일</th>
					<th>비고</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/couponinfo/write.do" method="get">
							<input type="hidden" name="idx" value="${data.idx}" />
							<tr>
								<td><a href="couponlist.do?idx=${data.idx}">${data.idx}</a></td>
								<td>
									<c:forEach items="${typeData }" var="type" >
										<c:if test="${type.value == data.coupon_type}" >${type.title}</c:if>
									</c:forEach>
								</td>
								<td>${data.coupon_value}</td>
								<td><a href="couponlist.do?idx=${data.idx}">${data.info_desc_ko}</a></td>
								<td><c:choose><c:when test="${data.used == 'Y'}">공개</c:when><c:otherwise>비공개</c:otherwise></c:choose></td>
								<td>${data.start_date} ~ ${data.end_date}</td>
								<td>${data.reg_date}</td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="9">데이터가 없습니다.</td>
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
