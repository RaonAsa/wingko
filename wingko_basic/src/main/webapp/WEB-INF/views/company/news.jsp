<%--
  - 작성자   ysh
  - 작성일자 2013. 9. 6.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<title>WingkoCommunication</title>
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
			location.href = '?page='+(startPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum);
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage;
	}
</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><a href="main.do"><li>회사소개</li></a><li class="end">언론기사</li>
        </ul>
        <div class="com_menu"><!--회사소개메뉴-->
        	<a href="summary.do"><img src="/resources/img/menu/company_m01.png" alt="회사개요" /></a><br/>
        	<a href="business.do"><img src="/resources/img/menu/company_m02.png" alt="사업분야" /></a><br/>
        	<a href="history.do"><img src="/resources/img/menu/company_m03.png" alt="연혁" /></a><br/>
        	<a href="ci.do"><img src="/resources/img/menu/company_m04.png" alt="CI &amp; BI" /></a><br/>
        	<a href="news.do"><img src="/resources/img/menu/company_m05_on.png" alt="언론기사" /></a><br/>
        	<a href="presentation_content.do"><img src="/resources/img/menu/company_m06.png" alt="컨텐츠소개" /></a><br/>
        </div>
        <div class="com_pic"><img src="/resources/img/company_main_img.png" alt="윙코커뮤니케이션과 함께해요" /></div><!--메인이미지-->
        <table class="board_list">
        	<caption>뉴스기사 리스트</caption>
            <colgroup>
            	<col width="10%" />
                <col width="50%" />
                <col width="15%" />
                <col width="15%" />
                <col width="10%" />
            </colgroup>
            <tr>
            	<td colspan="5" class="all">总 <span>${list.totalCount}</span> 条信息（${list.page}/${list.totalPage}页)</td><!--총 666개의 글이 있습니다(1/67페이지)-->
            </tr>
            <tr>
            	<th>编号</th><!--번호-->
            	<th>标题</th><!--제목-->
            	<th>作者</th><!--작성자-->
            	<th>发表日期</th><!--작성일-->
            	<th>点击量</th><!--조회수-->
            </tr>
            <!--리스트 시작-->
            <!--리스트 시작-->
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach items="${list}" var="data" varStatus="status">
            			<fmt:parseDate var="date" value="${data.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <tr>
			            	<td class="num">${data.no}</td>
			                <td class="title"><a href="news_view.do?no=${data.no}&page=${data.page}">${data.title }</a></td><!--판매중-->
			                <td>${data.user_nickname }</td>
			                <td><fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /></td>
			                <td>${data.hit }</td>
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise><tr><td colspan="5">no data</td></tr></c:otherwise>
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
