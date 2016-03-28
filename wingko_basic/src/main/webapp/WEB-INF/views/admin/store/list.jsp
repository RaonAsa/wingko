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
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");

		$("#insert").click(function(){
			location.href = "/admin/store/write.do?page=1";
		});
		
		$("#location_search").click(function() {
			$("#frm_search").submit();
		});
	});
	
	
	var params = "&search_type=${store.search_type}&search_string=${store.search_string}&location_no=${store.location_no}&category_no=${store.category_no}";
	
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
    	<div class="tit">상점관리</div>
    	
    	<form id="frm_search" method="get">
        <div class="sch">
        	지역 <form:select path="store.location_no" cssClass="txt01">
						<form:option value="">전체</form:option>
						<form:options items="${select}" itemLabel="title" itemValue="value" />
					</form:select> 
        	분류 <form:select path="store.category_no" cssClass="txt01">
						<form:option value="">전체</form:option>
						<form:options items="${select_category}" itemLabel="title" itemValue="value" />
					</form:select>

			<form:select path="store.search_type" cssClass="txt01" cssStyle="width:80px;" >
            	<form:option value="title">제목</form:option>
            	<form:option value="content">내용</form:option>
            </form:select> 
            <form:input path="store.search_string" cssClass="txt01" cssStyle="width:120px;" />
            
			<span id="location_search" class="glay_big">검색</span>
        </div>
       	</form>
	       	
		<div class="con">
            <div class="div_count">
            	총 <fmt:formatNumber value="${list.totalCount}" type="number" />  건
            </div>
            <table class="view">
            	<colgroup>
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="18%" />
                    <col width="10%" />
                    <col width="9%" />
                    <col width="9%" />
                    <col width="9%" />
               </colgroup>
               <tr>
               	<th>No</th>
               	<th>지역</th>
                <th>상품</th>
                <th>제목</th>
                <th>썸네일</th>
                <th>등록일자</th>
                <th>변경일자</th>
                <th>사용</th>
                <th>메뉴</th>
                <th>쿠폰</th>
                <th>수정</th>
               </tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/store/write.do" method="get">
							<input type="hidden" name="store_no" value="${data.store_no}" />
							<input type="hidden" name="page" value="${list.page}" />
							<input type="hidden" name="org_location_no" value="${store.location_no}" />
							<input type="hidden" name="org_category_no" value="${store.category_no}" />
							<tr>
								<td>${data.store_no}</td>
								<td>${data.location_name}(${data.location_name_ko})</td>
								<td>${data.category_name}(${data.category_name_ko})</td>
								<td><a href="/store/main.do?store_no=${data.store_no }" target="_blank">${data.title}</a></td>
								<td><c:if test="${data.image_thumb != ''}"><img class="img32" src="/upload/store/${data.image_thumb}" /></c:if></td>
								<td>${data.reg_date}</td>
								<td>${data.edit_date}</td>
								<td>
									<c:if test="${data.use_flag == 'Y' }">공개</c:if>
									<c:if test="${data.use_flag == 'N' }">비공개</c:if>
								</td>
								<td><a href="/admin/store/menu_list.do?store_no=${data.store_no}&page=${list.page}">메뉴</a></td>
								<td><a href="/admin/store/coupon_list.do?store_no=${data.store_no}&page=${list.page}">쿠폰</a></td>
								<td><input type="submit" value="수정" class="black"/></td>
							</tr>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="11" style="height: 200px">데이터가 없습니다.</td>
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
