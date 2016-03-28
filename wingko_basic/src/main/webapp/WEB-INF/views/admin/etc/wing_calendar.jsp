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
	
	
	
	$(document).ready(function(){
		

		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
		// reg data
		$("#btn_insert").click(function(){
			location.href = "wing_calendar_reg.do";
		});
		
		// edit data
		$("div[name=btn_edit]").click(function(){
			location.href = "wing_calendar_reg.do?calender_id="+$(this).attr("calender_id");
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
			<div class="bt03">
	 			<div id="btn_insert" class="blue_big">등록</div>
	 		</div>
	 		<form name="frm_list" method="post">
			<table class="view">
				<colgroup>
					<col width="10%" />
					<col width="25%" />
					<col width="30%" />
					<col width="15%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>ID</th>
					<th>날짜</th>
					<th>제목</th>
					<th>사용</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="data" varStatus="status">
				<tr height="40">
					<td>${list.totalCount - (list.page -1) * list.pageSize - status.index }</td>
					<td>${data.wing_date}</td>
					<td>${data.wing_name}</td>
					<td>
						<c:choose>
							<c:when test="${data.used == 'Y' }">공개</c:when>
							<c:otherwise>비공개</c:otherwise>
						</c:choose>
					</td>
					<td><div name="btn_edit" class="black" calender_id="${data.calender_id }">수정</div></td>
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
	 		
 		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
 
</body>
</html>
