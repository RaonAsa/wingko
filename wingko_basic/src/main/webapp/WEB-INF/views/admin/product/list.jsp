<%--
  - 작성자  yshsy
  - 작성일자 2013. 7. 20.
  - 내용
  -
  -
  --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			location.href = "/admin/product/write.do";
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
		<div class="con">
            <div class="tab">
            	<div class="tab_left">
                   <ul>
                       <li <c:if test="${product.category_id == '' }">class="sel"</c:if>><a href="list.do">전체</a></li>
                       <li <c:if test="${product.category_id == '1' }">class="sel"</c:if>><a href="list.do?category_id=1">쇼핑</a></li>
                       <li <c:if test="${product.category_id == '2' }">class="sel"</c:if>><a href="list.do?category_id=2">숙박</a></li>
                       <li <c:if test="${product.category_id == '3' }">class="sel"</c:if>><a href="list.do?category_id=3">맛집</a></li>
                       <li <c:if test="${product.category_id == '4' }">class="sel"</c:if>><a href="list.do?category_id=4">뷰티</a></li>
                       <li <c:if test="${product.category_id == '5' }">class="sel"</c:if>><a href="list.do?category_id=5">의료</a></li>
                       <li <c:if test="${product.category_id == '6' }">class="sel"</c:if>><a href="list.do?category_id=6">컬쳐</a></li>
                       <!-- <li><a href="list.do">지역</a></li> -->
                   </ul>
               </div>
               <div class="tab_right">
               		<a href="#"><img src="/resources/admin/img/excel.png" alt="엑셀다운로드" title="엑셀다운로드" /></a>
               </div>
            </div>
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
                    <col width="9%" />
                    <col width="9%" />
               </colgroup>
               <tr>
               	<th><input type="checkbox" /></th>
               	<th>No</th>
               	<th>지역</th>
                <th>상품</th>
                <th>제목</th>
                <th>썸네일</th>
                <th>등록일자</th>
                <th>변경일자</th>
                <th>사용</th>
                <th>수정</th>
               </tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/product/write.do" method="get">
							<input type="hidden" name="product_no" value="${data.product_no}" />
							<tr>
								<td><inpup type="checkbox"/></td>
								<td>${data.product_no}</td>
								<td>${data.location_name}(${data.location_name_ko})</td>
								<td>${data.category_name}(${data.category_name_ko})</td>
								<td><a href="view.do?product_no=${data.product_no }">${data.title}</a></td>
								<td><c:if test="${data.image_thumb != ''}"><img src="http://218.232.117.137:8080/upload/${data.image_thumb}" /></c:if></td>
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
							<td colspan="9" style="height: 200px">데이터가 없습니다.</td>
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
