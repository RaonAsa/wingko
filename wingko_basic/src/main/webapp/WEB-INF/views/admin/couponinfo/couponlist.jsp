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
		
		$("#cancel").click(function(){
			history.back(-1);
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
    	<div class="tit">Coupon 관리 > Data</div>
    	
		<div class="con">
			<table class="info">
				<caption>Coupon Info</caption>
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

				<c:if test="${couponinfo != null }">
					<tr>
						<td>${couponinfo.idx}</td>
						<td>
							<c:forEach items="${typeData }" var="type" >
								<c:if test="${type.value == couponinfo.coupon_type}" >${type.title}</c:if>
							</c:forEach>
						</td>
						<td>${couponinfo.coupon_value}</td>
						<td>${couponinfo.info_desc_ko}</td>
						<td><c:choose><c:when test="${couponinfo.used == 'Y'}">공개</c:when><c:otherwise>비공개</c:otherwise></c:choose></td>
						<td>${couponinfo.start_date} ~ ${couponinfo.end_date}</td>
						<td>${couponinfo.reg_date}</td>
						<td></td>
					</tr>
				</c:if>
			</table>
			
	 		<div class="bt03">
	 			<div id="cancel" class="glay_big" >취소</div>
	 		</div>
	 		
	 		<table class="info">
				<colgroup>
					<col width="15%" />
					<col width="10%" />
					<col width="5%" />
					<col width="10%" />
					<col width="" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				<tr>
					<th>쿠폰번호</th>
					<th>사용자ID</th>
					<th>사용</th>
					<th>결재ID</th>
					<th>발급사유</th>
					<th>발급일</th>
					<th>사용일</th>
					<th>등록일</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<tr>
								<td>${data.coupon_id}</td>
								<td>${data.user_no}</td>
								<td><c:choose><c:when test="${data.used == 'Y'}">공개</c:when><c:otherwise>비공개</c:otherwise></c:choose></td>
								<td><a href="#">${data.payment_id}</a></td>
								<td>${data.give_desc}</td>
								<td>${data.give_date}</td>
								<td>${data.used_date}</td>
								<td>${data.reg_date}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
