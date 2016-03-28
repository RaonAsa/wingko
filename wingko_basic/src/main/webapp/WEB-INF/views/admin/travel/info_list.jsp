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
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
			location.href = "/admin/travel/info_write.do";
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
    	<div class="tit">한국여행정보</div>
		<div class="con">
            <table class="view">
            	<colgroup>
                    <col width="5%" />
                    <col width="20%" />
                    <col width="20%" />
                    <col width="20%" />
                    <col width="20%" />
                    <col width="15%" />
               </colgroup>
               <tr>
               	<th>No</th>
               	<th>메뉴</th>
                <th>제목</th>
                <th>링크</th>
                <th>입력일</th>
                <th>수정</th>
               </tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/travel/info_write.do" method="get">
							<input type="hidden" name="no" value="${data.no}" />
							<tr>
								<td>${data.no}</td>
								<td>
									<c:choose>
										<c:when test="${data.menu == 'info'}">한국여행정보</c:when>
										<c:when test="${data.menu == 'traffic'}">한국교통정보</c:when>
										<c:when test="${data.menu == 'communication'}">통신,와이파이,픽업</c:when>
										<c:when test="${data.menu == 'location'}">지역정보안내</c:when>
										<c:when test="${data.menu == 'travel'}">한국관광정보</c:when>
									</c:choose>
								</td>
								<td>${data.title}</td>
								<td>
									<c:choose>
										<c:when test="${data.menu == 'location'}">
											<a href="http://www.wingkostory.com/travel/list.do?menu=location&no=${data.no}" target="_blank">링크</a>
										</c:when>
										<c:when test="${data.menu == 'travel'}">
											<a href="http://wingkostory.com/travel/list_location.do?no=21&location_no=17" target="_blank">링크</a>
										</c:when>
										<c:otherwise>
											<a href="http://www.wingkostory.com/travel/info.do?no=${data.no}" target="_blank">링크</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${data.reg_date}</td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" style="height: 200px">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>

			<!-- page nav -->
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
