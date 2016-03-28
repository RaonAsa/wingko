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
			location.href = "/admin/store/menu_write.do?store_no=${storeMenu.store_no}&page=${page}";
		});
		
		$("#cancel").click(function() {
			location.href = "/admin/store/list.do?page=${page}";
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
    	<div class="tit">상점메뉴관리</div>
		<div class="con">
            <table class="view">
            	<colgroup>
                	<col width="4%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="18%" />
                    <col width="10%" />
                    <%-- <col width="10%" /> --%>
                    <col width="9%" />
                    <col width="9%" />
                    <col width="9%" />
               </colgroup>
               <tr>
               	<th>No</th>
               	<th>상점</th>
                <th>메뉴명</th>
                <th>가격(원)</th>
                <th>가격(위안)</th>
                <th>쿠폰</th>
                <th>가용일</th>
                <!-- <th>썸네일</th> -->
                <th>수정일</th>
                <th>입력일</th>
                <th>사용</th>
                <th>수정</th>
               </tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/store/menu_write.do" method="get">
							<input type="hidden" name="page" value="${page}" />
							<input type="hidden" name="menu_no" value="${data.menu_no}" />
							<tr>
								<td>${data.menu_no}</td>
								<td>${data.store_name}</td>
								<td>${data.menu_name}</td>
								<td>${data.menu_price}</td>
								<td>${data.menu_price_cny}</td>
								<td>${data.menu_coupon}%</td>
								<td>${data.start_date} ~ ${data.end_date }</td>
								<%-- <td><c:if test="${data.image_thumb != ''}"><img class="img32" src="/upload/menu/${data.image_thumb}" /></c:if></td> --%>
								<td>${data.edit_date}</td>
								<td>${data.reg_date}</td>
								<td>
									<c:if test="${data.use_flag == 'Y' }">공개</c:if>
									<c:if test="${data.use_flag == 'N' }">비공개</c:if> 
								</td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="11" style="height: 200px">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">상점으로</div>
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
