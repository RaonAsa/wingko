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
			location.href = "/admin/location/hotplace_write.do?parent_location_no=${hotPlace.parent_location_no}";
		});
		
		/* $("#submit").click(function() {
			if (confirm("수정하시겠습니까?")) {
				$("#frm").submit();
			}
		}); */
		
	});
	
	function deletes(no, parent_location_no, sort) {
		if (confirm('삭제하시겠습니까?')) {
			location.href = "/admin/location/hotplace_delete.do?parent_location_no="+parent_location_no+"&org_sort="+sort+"&no="+no;	
		}
	}
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">HotPlace관리</div>
		<div class="con">
			<div class="tab">
            	<div class="tab_left">
                   <ul style="width: 600px;">
                       <li <c:if test="${hotPlace.parent_location_no == '12' }">class="sel"</c:if>><a href="?parent_location_no=12">서울</a></li>
                       <li <c:if test="${hotPlace.parent_location_no == '13' }">class="sel"</c:if>><a href="?parent_location_no=13">제주</a></li>
                       <li <c:if test="${hotPlace.parent_location_no == '14' }">class="sel"</c:if>><a href="?parent_location_no=14">경기</a></li>
                       <li <c:if test="${hotPlace.parent_location_no == '15' }">class="sel"</c:if>><a href="?parent_location_no=15">부산</a></li>
                       <li <c:if test="${hotPlace.parent_location_no == '16' }">class="sel"</c:if>><a href="?parent_location_no=16">강원</a></li>
                       <li <c:if test="${hotPlace.parent_location_no == '17' }">class="sel"</c:if>><a href="?parent_location_no=17">기타지역</a></li>
                   </ul>
               </div>
            </div>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>순서</th>
					<th>지역</th>
					<th>수정일</th>
					<th>입력일</th>
					<th></th>
					<th></th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form id="frm" action="/admin/location/hotplace_update.do" method="post">
							<input type="hidden" name="no" value="${data.no}" />
							<input type="hidden" name="org_sort" value="${data.sort}" />
							<input type="hidden" name="parent_location_no" value="${data.parent_location_no}" />
							<tr>
								<td>
									<select name="sort" class="txt01" style="width: 50px;">
										<c:forEach var="j" begin="1" end="${fn:length(list)}" step="1">
											<option value="${j}" <c:if test="${j == data.sort }">selected</c:if>>${j}</option>
										</c:forEach>
									</select>
									순서 변경
								</td>
								<td><a href="/admin/location/write.do?location_no=${data.location_no}">${data.location_name}(${data.location_name_ko})</a></td>
								<td>${data.edit_date}</td>
								<td>${data.reg_date}</td>
								<td><input id="submit" type="submit" value="순서적용" class="black"/></td>
								<td><input onclick="javascript:deletes('${data.no}', '${data.parent_location_no}', '${data.sort }');" type="button" value="삭제" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
	 		<div class="bt03">
	 			<div id="insert" class="blue_big">등록</div>
	 		</div>
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
