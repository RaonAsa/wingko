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


</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">분류 &gt; 지역 안내</div>
		<div class="con">
			<div class="tab">
            	<div class="tab_left">
                   <ul style="width: 600px;">
                       <%-- <li <c:if test="${categoryLocation.category_no == '' || categoryLocation.category_no == null }">class="sel"</c:if>><a href="category_location.do">전체</a></li> --%>
                       <li <c:if test="${categoryLocation.category_no == '8' }">class="sel"</c:if>><a href="category_location.do?category_no=8">쇼핑</a></li>
                       <li <c:if test="${categoryLocation.category_no == '9' }">class="sel"</c:if>><a href="category_location.do?category_no=9">호텔</a></li>
                       <li <c:if test="${categoryLocation.category_no == '10' }">class="sel"</c:if>><a href="category_location.do?category_no=10">맛집</a></li>
                       <li <c:if test="${categoryLocation.category_no == '11' }">class="sel"</c:if>><a href="category_location.do?category_no=11">뷰티</a></li>
                       <li <c:if test="${categoryLocation.category_no == '12' }">class="sel"</c:if>><a href="category_location.do?category_no=12">의료</a></li>
                       <li <c:if test="${categoryLocation.category_no == '13' }">class="sel"</c:if>><a href="category_location.do?category_no=13">컬쳐</a></li>
                   </ul>
               </div>
            </div>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>분류 &gt; 지역</th>
					<th>수정일</th>
					<th>입력일</th>
					<th></th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/category/category_location_write.do" method="get">
							<input type="hidden" name="no" value="${data.no}" />
							<tr>
								<td>${data.no}</td>
								<td>${data.category_name} > ${data.location_name}</td>
								<td>${data.edit_date}</td>
								<td>${data.reg_date}</td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">데이터가 없습니다.</td>
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
