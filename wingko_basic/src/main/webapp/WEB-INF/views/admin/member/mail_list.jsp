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
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>

<script>
	$(document).ready(function(){
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
		$("#chk_all").click(function(){
			var isCheck = $(this).is(":checked");
			$("input[name=chk_id]").prop("checked", isCheck);
		});
		
		$("#btn_check_del").click(function(){
			var items = $("input[name=chk_id]:checked");
			var cnt = items.length;
			
			if(cnt == 0){
				alert("선택된 항목이 없습니다");
				return ;
			}
			
			if(!confirm("삭제 하시겠습니까?")) return ;
			
			$("#frm_list").submit();
			
			
		});
		
		
	});
	
	function getParam(){
		var param = "";
		return param;
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
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage + getParam();
	}
	
	
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">메일발송내역</div>
        
		<div class="con">
            <div class="div_count">
            	총 <fmt:formatNumber value="${list.totalCount}" type="number" />  건
            </div>
            
            <form id="frm_list" method="post" action="mail_delete.do">
            <table class="view">
            	<colgroup>
                    <col width="60" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="10%" />
                    <col width="" />
               </colgroup>
				<tr>
					<th><input type="checkbox" id="chk_all" name="chk_all" value="all" /></th>
					<th>발송일</th>
					<th>구분</th>
					<th>제목</th>
					<th>수신주소</th>
					<th>수량</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="data" varStatus="status">
				<tr height="40">
					<td><input type="checkbox" name="chk_id" value="${data.mail_no }" /></td>
					<td>${fn:substring(data.reg_date, 0, 16)}</td>
					<td>${data.mail_type}</td>
					<td>${data.mail_title}</td>
					<td>${data.addr_to}</td>
					<td>${data.send_count}</td>
					<td></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(list) == 0 }">
				<tr>
					<td colspan="6" style="height: 200px">데이터가 없습니다.</td>
				</tr>
			</c:if>
			</table>
			</form>

			<!-- page nav -->
			<div class="Pageing">
				<a href="javascript:goPage(1)"><img src="/resources/admin/img/icon_first.png" alt="첫페이지로" /></a> 
				<a href="javascript:prevPage()"><img src="/resources/admin/img/btn_icon_prev.gif" /></a>
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
				<a href="javascript:nextPage()"><img src="/resources/admin/img/btn_icon_next.gif" /></a> 
				<a href="javascript:goPage(${list.totalPage })"><img src="/resources/admin/img/icon_end.png" alt="마지막페이지로" /></a>
			</div>
			
			<div class="bt03" style="text-align:left;">
	 			<div id="btn_check_del" class="black">선택삭제</div>
	 		</div>

 		</div>
 		
 		
    </div>
    

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
