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
		$("#submit").click(function(){
			if ($("#location_no").val() == "0") {
				alert("지역을 선택해주세요.");
				$("#location_no").focus();
			} else {
				if (confirm('등록하시겠습니까?')) {
					$("form").submit();
				}	
			}
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
    	<div class="tit">hotPlace관리</div>
		<div class="con">
			<table class="info">
				<form method="post">
				<c:if test="${hotPlace.no > 0 }">
					<form:hidden path="hotPlace.no" />
				</c:if>
				<form:hidden path="hotPlace.parent_location_no" />
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>부모지역</th>
					<td>
						<c:choose>
							<c:when test="${hotPlace.parent_location_no == '12'}">서울</c:when>
							<c:when test="${hotPlace.parent_location_no == '13'}">제주</c:when>
							<c:when test="${hotPlace.parent_location_no == '14'}">경기</c:when>
							<c:when test="${hotPlace.parent_location_no == '15'}">부산</c:when>
							<c:when test="${hotPlace.parent_location_no == '16'}">강원</c:when>
							<c:when test="${hotPlace.parent_location_no == '17'}">기타지역</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>지역선택</th>
					<td>
						<form:select path="hotPlace.location_no" cssStyle="margin-right:150px;">
							<form:option value="0">지역선택</form:option>
							<form:options items="${selectData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				</form>
			</table>
		 		<div class="bt03">
					<div id="cancel" class="glay_big" style="float:left;">취소</div>
		 			<div id="submit" class="blue_big">입 력</div>
		 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
