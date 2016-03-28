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
		var param = "&title=" + $("#title").val();
		return param;
	}
	
	// 페이지 이동
	function goPage(goPage){
		if(goPage > 0){
			location.href = '?page='+goPage + getParam();			
		}else{
			alert('이동할 페이지가 없습니다.');
		}
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
		
		$("#btn_seach_cancel").click(function(){
			location.href = "main.do";
		});
		
		// reg data
		$("#btn_insert").click(function(){
			location.href = "deal_reg.do";
		});
		
		// reg data
		$("#btn_ems").click(function(){
			location.href = "ems_view.do";
		});
		
		// edit data
		$("div[name=btn_edit]").click(function(){
			location.href = "deal_reg.do?deal_id="+$(this).attr("deal_id") + "&page=" + page;
		});
		
		
		// list function
		$("#chk_all").click(function(){
			var isCheck = $(this).is(":checked");
			$("input[name=chk_id]").prop("checked", isCheck);
		});
				
		$("#excel_check").click(function(){
			var items = $("input[name=chk_id]:checked");
			var cnt = items.length;
			return;
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
			return;
			$("#frm_search").attr("action", "excel_list.do");
			$("#frm_search").submit();
			$("#frm_search").attr("action", "");
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
    	<div class="tit">이달의 딜 관리</div>
        <div class="sch">
	        <form id="frm_search" method="get">
			<table width="100%" >
				<colgroup>
					<col width="10%" />
					<col width="70%" />
					<col width="" />
				</colgroup>
				<tr>
					<td>상품명</td>
					<td><form:input path="search_dealmain.title"  type="text" cssClass="txt01" cssStyle="width:80%;"/></td>
					<td align="center">
						<input type="submit" value="검색" class="black"/>
					<c:if test="${fn:length(search_dealmain.title) > 0}"> <input type="button" id="btn_seach_cancel" value="취소" class="black"/> </c:if>
					</td>
				</tr>
			</table>
			</form>
        </div>
       	
		<div class="con">
			<div class="bt03">
				<div id="btn_ems" class="blue_big">EMS가격표</div>
	 			<div id="btn_insert" class="blue_big">등록</div>
	 		</div>
	 		<form name="frm_list" method="post">
			<table class="view">
				<colgroup>
					<col width="40" />
					<col width="60" />
					<col width="25%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="" />
				</colgroup>
				<tr>
					<th><input type="checkbox" id="chk_all" name="chk_all" /> </th>
					<th>No.</th>
					<th>상품명</th>
					<th>판매기간</th>
					<th>제한수량</th>
					<th>판매수량</th>
					<th>상태</th>
					<th>등록일</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="data" varStatus="status">
				<tr height="40">
					<td><input type="checkbox" name="chk_id" value="${data.deal_id}"  /></td>
					<td>${list.totalCount - (list.page -1) * list.pageSize - status.index }</td>
					<td>${data.title}</td>
					<td>${fn:substring(data.start_date, 0, 16)} ~ ${fn:substring(data.end_date, 0, 16)}</td>
					<td>
						<c:choose>
							<c:when test="${data.limit_count == 0 }">-</c:when>
							<c:otherwise><fmt:formatNumber value="${data.limit_count}" /></c:otherwise>
						</c:choose>
					</td>
					<td><fmt:formatNumber value="${data.sale_count}" /></td>
					<td>
						<c:choose>
							<c:when test="${data.used_sort == 0 }">비공개</c:when>
							<c:otherwise>공개</c:otherwise>
						</c:choose>
					</td>
					<td>${fn:substring(data.reg_date, 0, 16) }</td>
					<td><div name="btn_edit" class="black" deal_id="${data.deal_id }">수정</div></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(list) == 0 }">
				<tr>
					<td colspan="9" style="height: 200px">데이터가 없습니다.</td>
				</tr>
			</c:if>
			</table>
			</form>

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
			<!-- 
	 		<div class="bt03" style="text-align:left;">
	 			<div id="excel_check" class="black">선택 엑셀</div>
	 			<div id="excel_all" class="black">전체 엑셀</div>
	 		</div>-->
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
 
</body>
</html>
