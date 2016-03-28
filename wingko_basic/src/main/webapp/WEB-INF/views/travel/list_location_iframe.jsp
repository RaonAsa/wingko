<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 15.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/wingko.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<style>
	html{margin:0; padding:0;}
	body{margin:0; padding:0; font-family: Verdana, Arial, Helvetica, sans-serif, Microsoft-yahei, SimHei, Simsun, Tahoma;}
	
	table.travel_area_list{width:100%; }
	table.travel_area_list th{}
	table.travel_area_list td{font-weight:normal; font-size:13px; color:#333; padding-top:10px; padding-bottom:30px; text-align:center;}
	
	ul.page_number{width:100%; text-align:center; margin-top:30px; .margin-left:300px;} /*페이지 번호*/
	ul.page_number li{display:inline-block; *float:left; width:24px; height:19px; background:#fff; border:1px solid #d7d7d7; color:#7d7d7d; cursor:pointer;
						font-size:11px; text-align:center; padding-top:5px; margin-right:10px; font-family:Verdana, Arial, Helvetica, sans-serif;}
	ul.page_number li:active{background:#d7d7d7; color:#fff;}
	ul.page_number li.end{margin-right:0;}
	ul.page_number li.on{border-color:#6695c8; color:#6695c8;}
</style>
<script>
	$(document).ready(function() {
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
	});

	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+(startPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}

	// 다음  페이지
	function nextPage(){
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+(endPageNum);
		}else{
			alert(m.bbs.next);
		}
	}

	function goPage(goPage){
		location.href = '?travel_category_no=${travel_category_no}&location_no=${location_no}&page='+goPage;
	}
	function view(travel_no) {
		parent.location.href = 'view.do?travel_category_no=${travel_category_no}&travel_no='+travel_no+'&location_no=${location_no}';
	}
</script>
<div>
	<table class="travel_area_list" id="travel_area_list">
		<colgroup>
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
			<col width="69px" />
			<col width="208px" />
		</colgroup>
           <c:choose>
           	<c:when test="${fn:length(list) > 0 }">
           		<c:forEach items="${list}" var="data" varStatus="status">
           			<fmt:parseNumber var="nowline" integerOnly="true" value="${(status.index)/3}" />
           			<c:if test="${status.index % 3 == 0 }"><c:set value="0" var="i" /><tr></c:if>
					<c:if test="${status.index % 3 > 0 }"><td></td></c:if>
					<td onclick="javascript:view('${data.travel_no}')" class="hand">
						<c:choose>
							<c:when test="${data.image != ''}">
								<img src="http://www.wingkostory.com/upload/travel/${data.image}" alt="" class="travel_image" /><br />${data.title}<%-- (${data.ripple_count}) --%>
							</c:when>
							<c:otherwise>
								<img src="/resources/img/defalt_img_208_130.gif" alt="" class="travel_image" /><br />${data.title}<%-- (${data.ripple_count}) --%>
							</c:otherwise>
						</c:choose>
					</td>
           			<c:if test="${status.index % 3 == 2 }"></tr></c:if>
           			<c:set value="${i+1}" var="i" />
           		</c:forEach>
           		<c:forEach var="j" begin="1" end="3" step="1">
           			<c:if test="${i < j }"><td></td><td></td><c:set value="${i+1}" var="i" /></c:if>
           			<c:if test="${i == 3 }"></tr></c:if>
           		</c:forEach>
           	</c:when>
           	<c:otherwise>
           		<tr><th colspan="5">데이터가 없습니다.</th></tr>
           	</c:otherwise>
           </c:choose>
       </table>

	<!-- page nav -->
       <ul class="page_number" style="margin-top:0;"><!--페이지번호-->
		<li onclick="javascript:prevPage();"><img src="/resources/img/menu/page_prev.png" alt="prev" /></li>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="i" begin="${list.startPageNum}" end="${list.endPageNum}" step="1">
					<c:if test="${!(i > list.totalPage) && !(i==list.endPageNum)}">
						<c:choose>
			    			<c:when test="${i == list.page}">
			    				<li onclick="javascript:goPage(${i})" class="on">${i}</li>
							</c:when>
				    		<c:otherwise>
				    			<li onclick="javascript:goPage(${i})">${i}</li>
				    		</c:otherwise>
			    		</c:choose>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise><li class="on">1</li></c:otherwise>
		</c:choose>
		 <li class="end" onclick="javascript:nextPage();"><img src="/resources/img/menu/page_next.png" alt="next" /></li>
	</ul>
</div>
