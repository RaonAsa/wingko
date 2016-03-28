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
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/wingko.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script>

	// 검색 파라미터
	function getParam(){
		var param = "&pay_type=" + $("#pay_type").val() + "&pay_state=" + $("#pay_state").val() + "&user_name=" + $("#user_name").val() + 
		"&pid=" + $("#pid").val()  + "&start_date=" + $("#start_date").val()  + "&end_date=" + $("#end_date").val();
		return param;
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage + getParam();
	}
	
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1) + getParam();
		}else{
			alert('이전 페이지가 없습니다.');
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum) + getParam();
		}else{
			alert('다음 페이지가 없습니다.');
		}
	}
	
	
	// dialog popup
	function show_dialog(dialog_url, dialog_title, dialog_width, dialog_height){
		
		var $dialog = $('<div style="overflow:hidden"></div>')
	    .html('<iframe scrolling="yes" style="border: 0px; " src="' + dialog_url + '" width="100%" height="100%"></iframe>')
	    .dialog({
	        modal: true,
	        show: "fade",
	        autoOpen: true,
	        resizable: false,
	        autoResize: false,
	        width: dialog_width,
	        height: dialog_height,
	        title: dialog_title,
	    });
		$dialog.dialog('open');
	}
	
	
	
	$(document).ready(function(){
		
		$("#start_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
		$("#end_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});

		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		// search function
		$("#btn_1day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_3day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			now.setDate(now.getDate() -3);
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_7day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			now.setDate(now.getDate() -7);
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_all").click(function(){
			$('#start_date').val("");
			$('#end_date').val("");
		});
		
		// search submit
		$("#frm_search").submit(function() {
			return true;
		});
		
		
		
		// list function
		$("#chk_all").click(function(){
			var isCheck = $(this).is(":checked");
			$("input[name=chk_pid]").prop("checked", isCheck);
		});
		
		
		$("#pay_complete").click(function(){
			var items = $("input[name=chk_pid]:checked");
			var cnt = items.length;
			
			if(cnt == 0){
				alert("선택된 항목이 없습니다");
				return ;
			}
			
			if(!confirm("입금확인 하시겠습니까?")){
				return;
			}
			
			$("input[name=mode]").val("complete");
			$("#frm_list").attr("action", "pay_proc.do");
			$("#frm_list").submit();
			
		});
		
		$("#pay_cancel").click(function(){
			var items = $("input[name=chk_pid]:checked");
			var cnt = items.length;
			
			if(cnt == 0){
				alert("선택된 항목이 없습니다");
				return ;
			}
			
			/*for(var i=0; i<cnt; ++i){
				if($(items.get(i)).closest("tr").attr("pay_state") != "110"){
					alert("완료 항목이 있으면 안됩니다.");
					return;
				}
			}*/
			
						
			if(!confirm("주문취소 하시겠습니까?")){
				return;
			}
			
			$("input[name=mode]").val("cancel");
			$("#frm_list").attr("action", "pay_proc.do");
			$("#frm_list").submit();
		});
		
		
		$("#excel_check").click(function(){
			var items = $("input[name=chk_pid]:checked");
			var cnt = items.length;
			
			if(cnt == 0){
				alert("선택된 항목이 없습니다");
				return ;
			}
			
			if(!confirm("선택된 항목을 다운로드 합니다.")){
				return;
			}
			
			$("#frm_list").attr("action", "excel_select.do");
			$("#frm_list").submit();
		});
		
		$("#excel_all").click(function(){
			
			if(!confirm("전체 항목을 다운로드 합니다")){
				return;
			}
			
			$("#frm_search").attr("action", "excel_list.do");
			$("#frm_search").submit();
			$("#frm_search").attr("action", "");
		});
		
		$("a[name=pay_info]").click(function(){
			var pid = $(this).attr("pid");
			show_dialog("pay_info.do?pid="+pid, "결제정보", 780, 720);
			return false;
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
    	<div class="tit">취소내역</div>
        <div class="sch">
	        <form id="frm_search" method="get">
	        <form:hidden path="paymain.pay_type" />
			<table width="100%" >
				<colgroup>
				<col width="8%" />
                   <col width="" />
                   <col width="8%" />
                   <col width="" />
                   <col width="8%" />
                   <col width="" />
                   <col width="8%" />
                   <col width="" />
                   <col width="80" />
                   </colgroup>
				<tr>
					<td>결제상태</td>
					<td>
						<form:select path="paymain.pay_state" cssClass="txt01" cssStyle="width:80%">
						<form:option value="${select_state_all }">전체</form:option>
						<form:options items="${select_state}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
					<td>주문자</td>
					<td><form:input path="paymain.user_name"  type="text" cssClass="txt01" cssStyle="width:80%;"/></td>
					<td>주문번호</td>
					<td><form:input path="paymain.pid"  type="text" cssClass="txt01" cssStyle="width:80%;"/></td>
					<td rowspan="2" align="center"><input type="submit" value="검색" class="black"/></td>
				</tr>
				<tr>
					<td>주문기간</td>
					<td colspan="6">
						<input type="text" id="start_date" name="start_date" cssClass="txt01" size="14"  value="${paymain.start_date}" /> ~ 
						<input type="text" id="end_date" name="end_date" cssClass="txt01" size="14" value="${paymain.end_date}"/> 
						<input type="button" id="btn_1day" value="당일" class="glay_big"/>
						<input type="button" id="btn_3day" value="3일" class="glay_big"/>
						<input type="button" id="btn_7day" value="1주일" class="glay_big"/>
						<input type="button" id="btn_all" value="전체" class="glay_big"/>
					</td>
				</tr>
			</table>
			</form>
        </div>
       	
		<div class="con">
            <table class="view">
            	<colgroup>
                    <col width="40" />
                    <col width="15%" />
                    <col width="9%" />
                    <col width="15%" />
                    <col width="9%" />
                    <col width="9%" />
                    <col width="9%" />
                    <col width="9%" />
                    <col width="9%" />
                    <col width="" />
               </colgroup>
               <tr>
				<th><input type="checkbox" id="chk_all" name="chk_all" /> </th>
				<th>주문번호</th>
				<th>결제타입</th>
				<th>주문자</th>
				<th>전화번호</th>
				
				<th>금액(cn)</th>
				<th>금액(ko)</th>
				<th>결제방법</th>
				<th>상태</th>
				<th>주문일</th>
               </tr>
               <form id="frm_list" method="post">
            	<input type="hidden"  name="mode" value="" />
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<tr height="40" pay_type="${data.pay_type }" pay_state="${data.pay_state }">
								<td><input type="checkbox" name="chk_pid" value="${data.pid}"  /></td>
								<td><a href="#" name="pay_info"  pid="${data.pid}">${data.pid}</a></td>
								<td><c:forEach items="${select_type }" var="type" ><c:if test="${type.value == data.pay_type}" >${type.title}</c:if></c:forEach></td>
								<td>${data.user_id}(${data.user_name})</td>
								<td>${data.user_phone}</td>
								<td><fmt:formatNumber value="${data.pay_price_cn}" /> 元</td>
								<td><fmt:formatNumber value="${data.pay_price_ko}" /> &#8361;</td>
								<td><c:forEach items="${select_method }" var="type" ><c:if test="${type.value == data.pay_method}" >${type.title}</c:if></c:forEach></td>
								<td><c:forEach items="${select_state }" var="type" ><c:if test="${type.value == data.pay_state}" >${type.title}</c:if></c:forEach></td>
								<td>${fn:substring(data.reg_date, 0, 16 ) }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" style="height: 200px">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</form>
			</table>


			<!-- page nav -->
			<div class="Pageing">
				<div style="float:left;">총 ${list.totalCount } 건</div>
				<a href="javascript:goPage(1)"><img src="/resources/admin/img/icon_first.png" alt="첫페이지로" /></a> 
				<a href="javascript:prevPage()"><img src="/resources/admin/img/btn_icon_prev.gif"></a>
				<span>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach var="i" begin="${list.startPageNum}" end="${list.endPageNum}" step="1">
								<c:if test="${!(i > list.totalPage) && !(i == list.endPageNum)}">
									<c:if test="${i > list.startPageNum}"><span class='dotted'>.</span></c:if>
									<c:choose>
						    			<c:when test="${i == list.page}">
											<a href='javascript:goPage(${i})'><strong style='color:#dd0709;'>${i}</strong></a>
										</c:when>
							    		<c:otherwise>
							    			<a href='javascript:goPage(${i})'>${i}</a>
							    		</c:otherwise>
						    		</c:choose>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>1</c:otherwise>
					</c:choose>
				</span>
				<a href="javascript:nextPage()"><img src="/resources/admin/img/btn_icon_next.gif"></a> 
				<a href="javascript:goPage(${list.totalPage })"><img src="/resources/admin/img/icon_end.png" alt="마지막페이지로" /></a>
			</div>

			<!-- page nav -->
	 		<div class="bt03" style="text-align:left;">
	 			<!-- <div id="pay_complete" class="black">입금확인</div> -->
	 			<!-- <div id="pay_cancel" class="black">주문취소</div> -->
	 			<div id="excel_check" class="black">선택 엑셀</div>
	 			<div id="excel_all" class="black">전체 엑셀</div>
	 		</div>
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
 
</body>
</html>
