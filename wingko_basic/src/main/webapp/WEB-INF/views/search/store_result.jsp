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
	
	function view(store_no) {
		var url = '/store/main.do?store_no='+store_no;
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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">搜索店铺</li><!--홈/검색-->
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/tit_wingko_search.png" alt="wingko search" /></div>

        <ul class="search_tab">
        	<li class="on first">全体(${list.totalCount})</li>
        </ul>

        <table class="sch_result" width="100%">
        	<caption>검색결과</caption>
            <colgroup>
            	<col width="25%" />
                <col width="75%" />
            </colgroup>
            <c:choose>
            	<c:when test="${fn:length(list) > 0}">
            		<c:forEach var="data" items="${list}" varStatus="status">
			            <%-- <tr>
			            	<th colspan="2"><a href="/store/main.do?store_no=${data.store_no}">${data.title}</a></th>
			            </tr> --%>
			            <tr onclick="javascript:view('${data.store_no}');" class="hand">
			            	<td><img src="/upload/store/${data.image_thumb}" /></td>
			            	<td>
			            		<%-- <a href="/store/main.do?store_no=${data.store_no}"> --%>
			            		<h4>${data.title }</h4> <!--제목-->
			            		${data.description }<br /><br />
			            		${data.address }<br /><br />
			            		${data.traffic }<br />${data.traffic_bus }<br />${data.traffic_subway }
			            		<!-- </a> -->
			            	</td>
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
            			<td colspan="2">no data</td>
            		</tr>
            	</c:otherwise>
            </c:choose>

        </table>
        
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
        
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
