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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<c:choose>
	<c:when test="${news.news_category_no=='1'}"><c:set var="news_category_title" value="韩国新闻" /></c:when>
	<c:when test="${news.news_category_no=='2'}"><c:set var="news_category_title" value="韩流资讯" /></c:when>
	<c:when test="${news.news_category_no=='3'}"><c:set var="news_category_title" value="演出信息" /></c:when>
	<c:when test="${news.news_category_no=='4'}"><c:set var="news_category_title" value="中国新闻" /></c:when>
	<c:when test="${news.news_category_no=='5'}"><c:set var="news_category_title" value="购物" /></c:when>
	<c:when test="${news.news_category_no=='6'}"><c:set var="news_category_title" value="住宿" /></c:when>
	<c:when test="${news.news_category_no=='7'}"><c:set var="news_category_title" value="美食" /></c:when>
	<c:when test="${news.news_category_no=='8'}"><c:set var="news_category_title" value="美容" /></c:when>
	<c:when test="${news.news_category_no=='9'}"><c:set var="news_category_title" value="医疗" /></c:when>
	<c:when test="${news.news_category_no=='10'}"><c:set var="news_category_title" value="文化" /></c:when>
</c:choose>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="${news_category_title}, 韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="${news_category_title}, wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网 : ${news_category_title}</title>
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

	function getParam(){
		return "&news_category_no=${news.news_category_no}";
	}
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1)+getParam();
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){

		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum)+getParam();
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage+getParam();
	}
	
	function view(news_no) {
		//alert(travel_no);
		location.href = 'view.do?news_no='+news_no+'&page=${list.page}'+getParam();
	}
	
	function newsView(news_category_no, news_no) {
		location.href = '/news/view.do?news_category_no='+news_category_no+'&news_no='+news_no;
	}
	
	

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
        	<c:choose>
        		<c:when test="${news.news_category_no < 5 }"><li>新闻</li></c:when>
        		<c:otherwise><li>wingko news</li></c:otherwise>
        	</c:choose>
        	<li class="end">
        		<c:choose>
        			<c:when test="${news.news_category_no=='1'}">韩国新闻</c:when>
        			<c:when test="${news.news_category_no=='2'}">韩流资讯</c:when>
        			<c:when test="${news.news_category_no=='3'}">演出信息</c:when>
        			<c:when test="${news.news_category_no=='4'}">中国新闻</c:when>
        			<c:when test="${news.news_category_no=='5'}">购物</c:when>
        			<c:when test="${news.news_category_no=='6'}">住宿</c:when>
        			<c:when test="${news.news_category_no=='7'}">美食</c:when>
        			<c:when test="${news.news_category_no=='8'}">美容</c:when>
        			<c:when test="${news.news_category_no=='9'}">医疗</c:when>
        			<c:when test="${news.news_category_no=='10'}">文化</c:when>
        		</c:choose>
        	</li><!--뉴스/한국뉴스-->
        </ul>
        <c:choose>
        	<c:when test="${news.news_category_no < 5 }">
		        <ul class="sub_tab_4"> <!--서브 메인 탭-->
		        	<a href="?news_category_no=1"><li <c:if test="${news.news_category_no=='1'}">class="on"</c:if>>韩国新闻</li></a><!--한국뉴스-->
		            <a href="?news_category_no=2"><li <c:if test="${news.news_category_no=='2'}">class="on"</c:if>>韩流资讯</li></a><!--한류뉴스-->
		            <a href="?news_category_no=3"><li <c:if test="${news.news_category_no=='3'}">class="on"</c:if>>演出信息</li></a><!--공연소식-->
		            <a href="?news_category_no=4"><li <c:if test="${news.news_category_no=='4'}">class="end on"</c:if>class="end">中国新闻</li></a><!--중국소식-->
		        </ul>
	        </c:when>
	        <c:otherwise>
		        <ul class="sub_tab"> <!--서브 메인 탭-->
		        	<a href="?news_category_no=5"><li <c:if test="${news.news_category_no=='5'}">class="on"</c:if>>购物</li></a><!--쇼핑-->
		            <a href="?news_category_no=6"><li <c:if test="${news.news_category_no=='6'}">class="on"</c:if>>住宿</li></a><!--숙박-->
		            <a href="?news_category_no=7"><li <c:if test="${news.news_category_no=='7'}">class="on"</c:if>>美食</li></a><!--맛집-->
		            <a href="?news_category_no=8"><li <c:if test="${news.news_category_no=='8'}">class="on"</c:if>>美容</li></a><!--뷰티-->
		            <a href="?news_category_no=9"><li <c:if test="${news.news_category_no=='9'}">class="on"</c:if>>医疗</li></a><!--의료-->
		            <a href="?news_category_no=10"><li  <c:if test="${news.news_category_no=='10'}">class="end on"</c:if>class="end">文化</li></a><!--컬쳐-->
		        </ul>
	        </c:otherwise>
        </c:choose>
        <table class="detail_c2" style="margin-top:40px;">
        	<caption>한국뉴스</caption>
            <colgroup>
            	<col width="22%" />
                <col width="28%" />
                <col width="22%" />
                <col width="28%" />
            </colgroup>

				<c:choose>
					<c:when test="${fn:length(topList) > 0 }">
						<c:forEach var="data" items="${topList}" varStatus="status">
							<c:if test="${status.index % 2 == 0 }">
								<c:if test="${status.index > 0 }">
									<tr>
										<td colspan="4" class="space"></td><!--여백-->
									</tr>
								</c:if>
								<tr>
								<c:set value="0" var="i" />
							</c:if>
							<th>
								<a href="/news/view.do?news_category_no=${data.news_category_no}&news_no=${data.news_no}">
									<c:choose>
										<c:when test="${data.thumb_image_top != null && data.thumb_image_top != '' }">
											<img src="http://www.wingkostory.com/upload/news/${data.thumb_image_top}" />
										</c:when>
										<c:otherwise>
											<img src="/resources/img/defalt_img_150_95.gif" />
										</c:otherwise>
									</c:choose>
								</a>
							</th>
							<td>
								<div class="hand" onclick="javascript:newsView('${data.news_category_no}', '${data.news_no}');">
									<span>${data.title}</span><br/><br/><c:out value="${fn:substring(data.content, 0, 40)}" escapeXml="false"></c:out>
								</div>
							</td>
							
						<c:if test="${status.index % 2 == 1 }"></tr></c:if>
						<c:set value="${i+1}" var="i" />
            		</c:forEach>
            		<c:forEach var="j" begin="1" end="2" step="1">
            			<c:if test="${i < j }"><th></th><td></td><c:set value="${i+1}" var="i" /></c:if>
            			<c:if test="${i == 2 }">
            				</tr>
							<!--<tr>
				            	<td colspan="4" class="space"></td>여백
				            </tr>-->
            			</c:if>
            		</c:forEach>
					</c:when>
				</c:choose>
            
<%--             <tr>
            	<th><img src="/resources/img/sam_150.png" alt="" /></th>
                <td>
                	<span>'포에버21' 컴백</span><br/>
                    특유의 팝한 컬러와 감각적인 디자인 명동을 찾는 쇼핑걸들을 설레게 했던 세계적인 SPA 브랜드 '포에버21'이 오랜 공백 끝에 화려하게 컴백했다.
                </td>
            	<th><img src="/resources/img/sam_150.png" alt="" /></th>
                <td>
                	<span>'포에버21' 컴백</span><br/>
                    특유의 팝한 컬러와 감각적인 디자인 명동을 찾는 쇼핑걸들을 설레게 했던 세계적인 SPA 브랜드 '포에버21'이 오랜 공백 끝에 화려하게 컴백했다.
                </td>
            </tr>
			<tr>
            	<td colspan="4" class="space"></td><!--여백-->
            </tr>
            <tr>
            	<th><img src="/resources/img/sam_150.png" alt="" /></th>
                <td>
                	<span>'포에버21' 컴백</span><br/>
                    특유의 팝한 컬러와 감각적인 디자인 명동을 찾는 쇼핑걸들을 설레게 했던 세계적인 SPA 브랜드 '포에버21'이 오랜 공백 끝에 화려하게 컴백했다.
                </td>
            	<th><img src="/resources/img/sam_150.png" alt="" /></th>
                <td>
                	<span>'포에버21' 컴백</span><br/>
                    특유의 팝한 컬러와 감각적인 디자인 명동을 찾는 쇼핑걸들을 설레게 했던 세계적인 SPA 브랜드 '포에버21'이 오랜 공백 끝에 화려하게 컴백했다.
                </td>
            </tr> --%>
        </table>
        <table class="news_t">
        	<caption>뉴스 더보기</caption>
            <colgroup>
            	<col width="7%" />
                <col width="93%" />
            </colgroup>
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach var="data" items="${list}" varStatus="status">
			            <tr>
			            	<td rowspan="2" class="num">
			            		<%-- ${data.news_no} --%>
			            		${list.totalCount - ((list.page - 1) *list.pageSize) - status.index }
			            	</td>
			                <th><a href="javascript:view('${data.news_no}');">${data.title}</a></th>
			            </tr>
			            <tr>
			            	<td>发表日期 ${data.reg_date} | 点击量 ${data.hit}</td>
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
		            <tr>
		            	<td rowspan="2" colspan="2">데이터가 없습니다.</td>
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
