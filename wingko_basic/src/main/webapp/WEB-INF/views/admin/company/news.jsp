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

		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
		$("#insert").click(function(){
			location.href = "/admin/company/news_write.do";
		});
		
		$("#btn_search").click(function() {
			$("#frm_search").submit();
		});

	});
	
	
	var params = "&search_type=${companyNews.search_type}&search_string=${companyNews.search_string}";
	
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1)+params;
		}else{
			alert('이전 페이지가 없습니다.');
		}
	}
	
	// 다음  페이지
	function nextPage(){

		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum)+params;
		}else{
			alert('다음 페이지가 없습니다.');
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage+params;
	}	
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">회사소개 -> 언론기사</div>
    	
    	<form id="frm_search" method="get">
        <div class="sch">
			<form:select path="companyNews.search_type" cssClass="txt01" cssStyle="width:80px;" >
            	<form:option value="title">제목</form:option>
            	<form:option value="content">내용</form:option>
            </form:select> 
            <form:input path="companyNews.search_string" cssClass="txt01" cssStyle="width:120px;" />
            
			<span id="btn_search" class="glay_big">검색</span>
        </div>
       	</form>
       	
       	
		<div class="con">
			<table class="info">
				<colgroup>
					<col width="5%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="5%" />
					<col width="15%" />
					<col width="15%" />
					<col width="5%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>입력자</th>
					<th>조회수</th>
					<th>입력</th>
					<th>수정</th>
					<th>사용</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<tr>
								<td>${data.no}</td>
								<td><a href="/admin/company/news_write.do?page=${list.page}&no=${data.no}">${data.title}</a></td>
								<td>${data.user_nickname}</td>
								<td>${data.hit}</td>
								<td>${data.reg_date}</td>
								<td>${data.edit_date}</td>
								<td>
									<c:if test="${data.use_flag == 'Y'}"><span class="red">사용</span></c:if>
									<c:if test="${data.use_flag == 'N'}">미사용</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			
			<!-- page nav -->
			<div class="Pageing">
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
