<%--
  - 작성자  meeroojin
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
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		
		$("input[name=wing_date]").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd" });

		
		$("#btn_reg").click(function(){
			if (!confirm("등록 하시겠습니까?")) return;
			$("#frm_reg").submit();
		});

		$("#btn_cancel").click(function(){
			history.back(-1);
		});

		$("#btn_delete").click(function(){
			if (!confirm("삭제하시겠습니까?")) return;
			$("#frm_reg").attr("action", "wing_calendar_del.do");
			$("#frm_reg").submit();
			
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
    	<div class="tit">윙쇼기념일</div>
		<div class="con">
			<form id="frm_reg" method="post" action="wing_calendar_proc.do" >
			<c:if test="${calender.calender_id != null and calender.calender_id > 0 }">
				<input type="hidden" name="calender_id" value="${calender.calender_id }" />
			</c:if>

			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>날짜</th>
					<td><input type="text"  name="wing_date" value="${calender.wing_date }" class="txt01" style="width:160px;"  readonly/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="wing_name" value="${calender.wing_name }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>노출</th>
					<td>
						<select name="used"  class="txt01">
							<option value="N" >비공개</option>
							<option value="Y" <c:if test="${calender.used == 'Y' }">selected</c:if> >공개</option>
						</select>
					</td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="btn_cancel" class="glay_big" style="float:left;">취 소</div>
	 			<c:if test="${calender.calender_id > 0 }">
	 				<div id="btn_delete" class="blue_big">삭 제</div>
	 			</c:if>
	 			<div id="btn_reg" class="blue_big">등 록</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
