<%--
  - 작성자   ysh
  - 작성일자 2013. 9. 2.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script>
	$(document).ready(function(){
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
		$("#btn_search").click(function() {
			$("#frm").submit();
		});
	});
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			$("#page").val(startPageNum-1);
			$("#frm").submit();
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			$("#page").val(endPageNum);
			$("#frm").submit();
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		$("#page").val(goPage);
		$("#frm").submit();
	}
	
	function view(content_type, no) {
		var url = "";
		if (content_type == "travel") {
			url = '/travel/view.do?travel_no='+no;
		} else {
			url = '/store/main.do?store_no='+no;
		}
		window.open(url);
	}

	function goSubmit(menu) {
		$("#menu").val(menu);
		$("#page").val(1);
		$("#frm").submit();
	}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">搜索</li><!--홈/검색-->
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/tit_wingko_search.png" alt="wingko search" /></div>
        <div class="board_sch" style="margin-top:25px; margin-bottom:40px;"><!--검색-->
			<form id="frm" method="post">
			<form:hidden path="search.menu" />
			<form:hidden path="search.page" />
			<%-- <input type="hidden" name="page" value="${list.page}" />
			<input type="hidden" name="pageSize" value="${list.pageSize}" /> --%>
        	<form:select path="search.searchType" cssClass="select_sch">
            	<form:option value="title">标题</form:option><!--제목-->
            	<!-- <option value="作者">作者</option>작성자 -->
            	<form:option value="content">内容</form:option><!--내용-->
            </form:select>
            <form:input path="search.searchString" cssClass="date_txt" cssStyle="width:380px;" /> <img id="btn_search" class="hand" src="/resources/img/button/community_sch.png" alt="search" align="absbottom" />
            </form>
        </div>

        <c:choose>
        	<c:when test="${count[0] > 0}">
		       <%--  <div class="result_all">
		        	<c:if test="${search.menu == 0 }">共搜</c:if>
		        	<c:if test="${search.menu == 1 }">韩国旅游信息</c:if>
		        	<c:if test="${search.menu == 2 }">地区</c:if>
		        	<c:if test="${search.menu == 3 }">购物</c:if>
		        	<c:if test="${search.menu == 4 }">住宿</c:if>
		        	<c:if test="${search.menu == 5 }">美食</c:if>
		        	<c:if test="${search.menu == 6 }">美容</c:if>
		        	<c:if test="${search.menu == 7 }">医疗</c:if>
		        	<c:if test="${search.menu == 8 }">文化</c:if>
		        	索到${count[0]}条 <span>${search.searchString}</span> 岛相关消息
		        </div><!--검색결과 검색어에 span태그--> --%>
		        <ul class="search_tab">
		        	<li <c:if test="${search.menu == 0 }">class="on first"</c:if> class="first"><a href="javascript:goSubmit(0);">全体(${count[0]})</a></li>|
		        	<li <c:if test="${search.menu == 1 }">class="on"</c:if>><a href="javascript:goSubmit(1);">韩国旅游信息(${count[1]})</a></li>|
		        	<li <c:if test="${search.menu == 2 }">class="on"</c:if>><a href="javascript:goSubmit(2);">地区(${count[2]})</a></li>|
		        	<li <c:if test="${search.menu == 3 }">class="on"</c:if>><a href="javascript:goSubmit(3);">购物(${count[3]})</a></li>|
		        	<li <c:if test="${search.menu == 4 }">class="on"</c:if>><a href="javascript:goSubmit(4);">住宿(${count[4]})</a></li>|
		        	<li <c:if test="${search.menu == 5 }">class="on"</c:if>><a href="javascript:goSubmit(5);">美食(${count[5]})</a></li>|
		        	<li <c:if test="${search.menu == 6 }">class="on"</c:if>><a href="javascript:goSubmit(6);">美容(${count[6]})</a></li>|
		        	<li <c:if test="${search.menu == 7 }">class="on"</c:if>><a href="javascript:goSubmit(7);">医疗(${count[7]})</a></li>|
		        	<li <c:if test="${search.menu == 8 }">class="on"</c:if>><a href="javascript:goSubmit(8);">文化(${count[8]})</a></li>
		            <!--전체,한국관광정보,지역,쇼핑,숙박,맛집,뷰티,의료,컬쳐-->
		        </ul>

		       <div class="sch_num">
		        	<c:if test="${search.menu == 0 }">共搜</c:if>
		        	<c:if test="${search.menu == 1 }">韩国旅游信息</c:if>
		        	<c:if test="${search.menu == 2 }">地区</c:if>
		        	<c:if test="${search.menu == 3 }">购物</c:if>
		        	<c:if test="${search.menu == 4 }">住宿</c:if>
		        	<c:if test="${search.menu == 5 }">美食</c:if>
		        	<c:if test="${search.menu == 6 }">美容</c:if>
		        	<c:if test="${search.menu == 7 }">医疗</c:if>
		        	<c:if test="${search.menu == 8 }">文化</c:if> 
		       		<strong>${count[search.menu]}</strong>条 韩国旅游资讯
		       	</div><!--한국관광정보에서 총 5건이 검색되었습니다.-->
		        <table class="sch_result" width="100%">
		        	<caption>검색결과</caption>
		            <colgroup>
		            	<col width="22%" />
		                <col width="78%" />
		            </colgroup>
		            <c:choose>
		            	<c:when test="${fn:length(list) > 0}">
		            		<c:forEach var="data" items="${list}" varStatus="status">
					            <tr onclick="javascript:view('${data.content_type}', '${data.no}');" class="hand">
					            	<c:choose>
					            		<c:when test="${data.content_type == 'travel' }"><td><img src="http://www.wingkostory.com/upload/travel/${data.image}" style="width: 150px; height: 95px;" alt="" /></td></c:when>
					            		<c:otherwise><td><img src="http://www.wingkostory.com/upload/store/${data.image}" style="width: 150px; height: 95px;" alt="" /></td></c:otherwise>
					            	</c:choose>
									<td>
										<h4>${data.title }</h4> <!--제목-->
										<c:out value="${fn:substring(data.content, 0, 200)}" escapeXml="false" />
					                </td>
					            </tr>
		            		</c:forEach>
		            	</c:when>
		            	<c:otherwise>
		            		<tr>
		            			<td colspan="2"></td>
		            		</tr>
		            	</c:otherwise>
		            </c:choose>

		        </table>
		        <c:if test="${fn:length(list) > 0}">
					<!-- page nav -->
			        <ul class="page_number"><!--페이지번호-->
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
				</c:if>
        	</c:when>
        	<c:otherwise>
		        <ul class="search_tab">
		        	<li <c:if test="${search.menu == 0 }">class="on first"</c:if> class="first"><a href="javascript:goSubmit(0);">全体(0)</a></li>|
		        	<li <c:if test="${search.menu == 1 }">class="on"</c:if>><a href="javascript:goSubmit(1);">韩国旅游信息(0)</a></li>|
		        	<li <c:if test="${search.menu == 2 }">class="on"</c:if>><a href="javascript:goSubmit(2);">地区(0)</a></li>|
		        	<li <c:if test="${search.menu == 3 }">class="on"</c:if>><a href="javascript:goSubmit(3);">购物(0)</a></li>|
		        	<li <c:if test="${search.menu == 4 }">class="on"</c:if>><a href="javascript:goSubmit(4);">住宿(0)</a></li>|
		        	<li <c:if test="${search.menu == 5 }">class="on"</c:if>><a href="javascript:goSubmit(5);">美食(0)</a></li>|
		        	<li <c:if test="${search.menu == 6 }">class="on"</c:if>><a href="javascript:goSubmit(6);">美容(0)</a></li>|
		        	<li <c:if test="${search.menu == 7 }">class="on"</c:if>><a href="javascript:goSubmit(7);">医疗(0)</a></li>|
		        	<li <c:if test="${search.menu == 8 }">class="on"</c:if>><a href="javascript:goSubmit(8);">文化(0)</a></li>
		            <!--전체,한국관광정보,지역,쇼핑,숙박,맛집,뷰티,의료,컬쳐-->
		        </ul>
				<div class="no_result"><img src="/resources/img/icon/no_result.png" alt="在搜索结果中" /></div>  <!--검색 결과가 없습니다.-->  
        	</c:otherwise>
        </c:choose>
        
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
