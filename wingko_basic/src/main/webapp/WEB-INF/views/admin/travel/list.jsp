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
			location.href = "/admin/travel/write.do";
		});
		
		$("#location_search").click(function() {
			$("#frm_search").submit();
		});
	});
	
	
	var params = "&travel_category_no=${travel.travel_category_no}&location_no=${travel.location_no}&search_title=${travel.search_title}";
	
	
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
    	<div class="tit">지역별정보</div>
		    	<form id="frm_search" method="get">
		    	<input type="hidden" name="page" value="1" />
		    	<form:hidden path="travel.travel_category_no" />
		        <div class="sch">
 		        	지역 <form:select path="travel.location_no" cssClass="txt01">
								<form:option value="">전체</form:option>
								<form:options items="${selectLocation}" itemLabel="title" itemValue="value" />
							</form:select>
					<form:input path="travel.search_title" cssClass="txt01" cssStyle="width:120px;" />
					<span id="location_search" class="glay_big">검색</span>
		        </div>
		       	</form>
		<div class="con">
            <div class="tab">
            	<div class="tab_left">
                   <ul style="width: 600px;">
                       <li <c:if test="${travel.travel_category_no == '0' || travel.travel_category_no == '' || travel.travel_category_no == null }">class="sel"</c:if>><a href="list.do">전체</a></li>
                       <li <c:if test="${travel.travel_category_no == '5' }">class="sel"</c:if>><a href="list.do?travel_category_no=5">로드맵</a></li>
                       <li <c:if test="${travel.travel_category_no == '6' }">class="sel"</c:if>><a href="list.do?travel_category_no=6">추천여행지</a></li>
                       <li <c:if test="${travel.travel_category_no == '7' }">class="sel"</c:if>><a href="list.do?travel_category_no=7">주요명소</a></li>
                       <li <c:if test="${travel.travel_category_no == '8' }">class="sel"</c:if>><a href="list.do?travel_category_no=8">추천명소</a></li>
                       <li <c:if test="${travel.travel_category_no == '9' }">class="sel"</c:if>><a href="list.do?travel_category_no=9">Rail Pass</a></li>
                       <li <c:if test="${travel.travel_category_no == '10' }">class="sel"</c:if>><a href="list.do?travel_category_no=10">기타한국정보</a></li>
                   </ul>
               </div>
            </div>
            
            <div class="div_count">
            	총 <fmt:formatNumber value="${list.totalCount}" type="number" />  건
            </div>
            <table class="view">
            	<colgroup>
                    <col width="5%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="5%" />
                    <col width="10%" />
                    <col width="10%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="10%" />
                    <col width="10%" />
               </colgroup>
               <tr>
               	<th>No</th>
               	<th>지역</th>
				<th>분류</th>
                <th>제목</th>
                <th>이미지</th>
                <th>등록일자</th>
                <th>변경일자</th>
                <th>링크</th>
                <th>사용</th>
                <th>수정</th>
               </tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<form action="/admin/travel/write.do" method="get">
							<input type="hidden" name="travel_no" value="${data.travel_no}" />
							<input type="hidden" name="travel_category_no" value="${travel.travel_category_no}" />
							<input type="hidden" name="location_no" value="${travel.location_no}" />
							<input type="hidden" name="page" value="${list.page}" />
							<tr>
								<td>
									<%-- ${data.travel_no} --%>
									${list.totalCount - ((list.page - 1) *list.pageSize) - status.index }
								</td>
								<td>${data.location_name}(${data.location_name_ko})</td>
								<td>${data.travel_category_name}(${data.travel_category_name_ko})</td>
								<%-- <td><a href="/travel/travel_main.do?travel_no=${data.travel_no }" target="_blank">${data.title}</a></td> --%>
								<td>${data.title}</td>
								<td><c:if test="${data.image != ''}"><img class="img32" src="/upload/travel/${data.image}" /></c:if></td>
								<td>${data.edit_date}</td>
								<td>${data.reg_date}</td>
								<td><a href="http://www.wingkostory.com/travel/view.do?travel_category_no=${data.travel_category_no}&sort=ripple_count&travel_no=${data.travel_no}" target="_blank">링크</a></td>
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
							<td colspan="10" style="height: 200px">데이터가 없습니다.</td>
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
