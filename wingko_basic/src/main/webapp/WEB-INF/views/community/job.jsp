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
			$("#job_search_frm").submit();
		});
	});
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1)+"&search_type=${job.search_type}&search_string=${job.search_string}";
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum)+"&search_type=${job.search_type}&search_string=${job.search_string}";
		}else{
			alert(m.bbs.next);
		}
	}
	
	function goPage(page) {
		location.href = "?job_type=${job.job_type}&page="+page+"&search_type=${job.search_type}&search_string=${job.search_string}";
	}
</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">就业信息</li><!--커뮤니티>취업정보-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li class="on">就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
        <ul class="job_tab">
        	<li class="first"><a href="job.do?job_type=company"><img src="/resources/img/menu/job_tab01<c:if test="${job.job_type == 'company' }">_on</c:if>.png" class="招聘" /></a></li><!--구인-->
            <li class="end"><a href="job.do?job_type=hunting"><img src="/resources/img/menu/job_tab02<c:if test="${job.job_type == 'hunting' }">_on</c:if>.png" alt="求职" /></a></li><!--구직-->
        </ul>
        <div class="board_sch" style="margin-top:20px;"><!--검색-->
        	<form id="job_search_frm" action="job.do?page=${list.page}" method="get">
        	<form:hidden path="job.job_type" />
        	<form:select path="job.search_type" cssClass="select_sch">
            	<form:option value="title">标题</form:option><!--제목-->
             	<!-- <form:option value="user_nickname">作者</form:option> -->
            	<form:option value="content">内容</form:option><!--내용-->
            </form:select> 
            <form:input path="job.search_string" cssClass="date_txt" cssStyle="width:380px;" /> <img class="hand" id="btn_search" src="/resources/img/button/community_sch.png" alt="search" align="absbottom" />
            </form>
        </div>
        <div class="review_noti">发现虚假或非法内容时将删除会员. 请注意遵守</div>
        <!--허위사항이나 불법사항이 적발될 시에는 무조건 회원탈퇴입니다. 주의하시기 바랍니다 -->
        <br/>
        <table class="board_list">
        	<caption>구인 리스트</caption>
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
           <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach items="${list}" var="data" varStatus="status">
            			<fmt:parseDate var="date" value="${data.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <tr>
			            	<td class="num">
			            		${list.totalCount - ((list.page - 1) *list.pageSize) - status.index }
				            	<%-- ${data.job_no } --%>
			            	</td>
			                <td class="title"><a href="job_view.do?page=${list.page}&job_type=${data.job_type}&job_no=${data.job_no}&search_type=${job.search_type}&search_string=${job.search_string}">${data.title }</a></td>
			                <%-- <c:choose>
			                	<c:when test="${data.job_type == 'company'}"><td>${data.company_title}</td></c:when>
			                	<c:otherwise><td>${data.hunter_name}</td></c:otherwise>
			                </c:choose> --%>
			                <td>${data.writer}</td>
			                <td><fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /></td>
			                <td>${data.hit}</td>
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
		            	<td colspan="5">데이터가 없습니다.</td>
		            </tr>
            	</c:otherwise>
            </c:choose>
       </table>
		<div class="bt_right" style="margin-top:10px;">
			<a href="job_write.do?page=${list.page}&job_type=company"><img src="/resources/img/button/bt_job_offer.png" alt="写求职" /></a>
			<a href="job_write.do?page=${list.page}&job_type=hunting"><img src="/resources/img/button/bt_job_hunting.png" alt="写招聘" /></a>
		</div><!--구인, 구직글쓰기-->
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
        <c:if test="${ad != null}">
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>