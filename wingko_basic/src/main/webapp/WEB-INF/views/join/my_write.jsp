<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 상단고정
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		menu = "${menu}";
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
			location.href = '?page='+(startPageNum-1)+"&menu=${menu}";
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){
	
		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum)+"&menu=${menu}";
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage+"&menu=${menu}";
	}
	
	function view(content_type, no) {
		if (content_type == "travel") {
			var url = '/travel/view.do?travel_no='+no;
		} else {
			var url = '/store/main.do?store_no='+no;
		}
		window.open(url);
	}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">My Page</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/my_page.png" alt="My Page" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="/my/my_info.do"><img src="/resources/img/menu/my_tab01.png" alt="新消息" /></a></li>
        	<li><a href="/my/my_write.do"><img src="/resources/img/menu/my_tab02_on.png" alt="推荐信息" /></a></li>
        	<li><a href="/my/my_scrap.do"><img src="/resources/img/menu/my_tab03.png" alt="特辑专栏" /></a></li>
        	<!-- <li><a href="#"><img src="/resources/img/menu/my_tab04.png" alt="旅行表演" /></a></li> -->
        </ul>

		<ul class="board_tab">
        	<li <c:if test="${menu == 0 }">class="on"</c:if>><a href="?menu=0&page=1">留言板</a></li>|
        	<li <c:if test="${menu == 1 }">class="on"</c:if>><a href="?menu=1&page=1">查询</a></li>|
        	<li <c:if test="${menu == 2 }">class="on"</c:if>><a href="?menu=2&page=1">商品评论</a></li> <!--게시판,문의,상품평-->
        </ul>
        
        <c:if test="${menu == 0 }">
			<table class="my_board">
	        	<caption>마켓</caption>
	            <colgroup>
	            	<col width="10%" />
	                <col width="10%" />
	                <col width="40%" />
	                <col width="15%" />
	                <col width="15%" />
	                <col width="10%" />
	            </colgroup>
	            <tr>
	            	<th>分类</th>
	                <th>号码</th>
	                <th>题目</th>
	                <th>作者</th>
	                <th>发表日</th>
	                <th>点击</th>
	            </tr>
	            <c:choose>
	            	<c:when test="${fn:length(list) > 0 }">
	            		<c:forEach items="${list }" var="data" varStatus="status">
				            <tr>
				            	<td><img src="/resources/img/icon/store.png" alt="集市" /></td>
				                <td>${data.no}</td>
				                <td class="tit">
				                	<a href="/community/market_view.do?no=${data.no}" target="_blank">[<c:if test="${data.sell_flag == 'Y' }">销售完毕</c:if><c:if test="${data.sell_flag == 'N' }">销售中</c:if>]${data.title }</a>
				                </td>
				                <td>${data.user_nickname}</td>
				                <td>${data.reg_date}</td>
				                <td>${data.hit}</td>
				            </tr>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise><tr><td colspan="6">no data</td></tr></c:otherwise>
	            </c:choose>
<!-- 	            <tr>
	            	<td><img src="/resources/img/icon/store.png" alt="集市" /></td>
	                <td>03</td>
	                <td class="tit">티켓팝니다（售票)</td>
	                <td>영감</td>
	                <td>2013.06.18</td>
	                <td>2100</td>
	            </tr> -->
	        </table>
		</c:if>
        
        <c:if test="${menu == 1 }">
	        <table class="my_board">
	        	<caption>문의</caption>
	            <colgroup>
	            	<col width="10%" />
	                <col width="10%" />
	                <col width="40%" />
	                <col width="15%" />
	                <col width="15%" />
	                <col width="10%" />
	            </colgroup>
	            <tr>
	            	<th>回答是</th>
	                <th>号码</th>
	                <th>题目</th>
	                <th>作者</th>
	                <th>发表日</th>
	                <th>点击</th>
	            </tr>
	            <c:choose>
	            	<c:when test="${fn:length(list) > 0 }">
	            		<c:forEach items="${list }" var="data" varStatus="status">
				            <tr>
				            	<td><img src="/resources/img/icon/answer.png" alt="回答" /></td>
				                <td>${data.no}</td>
				                <td class="tit"><a href="/community/qna_view.do?no=${data.no}" target="_blank">${data.title }</a></td>
				                <td>${data.user_nickname}</td>
				                <td>${data.reg_date}</td>
				                <td>${data.hit}</td>
				            </tr>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise><tr><td colspan="6">no data</td></tr></c:otherwise>
	            </c:choose>
	           <!--  <tr>
	            	<td><img src="/resources/img/icon/answer.png" alt="回答" /></td>
	                <td>03</td>
	                <td class="tit">티켓팝니다（售票)</td>
	                <td>영감</td>
	                <td>2013.06.18</td>
	                <td>2100</td>
	             </tr> -->
	        </table>
		</c:if>
	       
        
		<c:if test="${menu == 2 }">
	        <table class="my_board">
	        	<caption>댓글</caption>
	            <colgroup>
	            	<col width="10%" />
	                <col width="70%" />
	                <col width="20%" />
	                <%-- <col width="20%" /> --%>
	            </colgroup>
	            <tr>
	            	<th>分类</th>
	                <th>内容</th>
	                <th>发表日</th>
	                <!-- <th>评分</th> -->
	            </tr>
	            <c:choose>
	            	<c:when test="${fn:length(list) > 0 }">
	            		<c:forEach items="${list }" var="data" varStatus="status">
				            <tr>
				                <td>${data.no}</td>
				                <td class="tit">
				                	<c:choose>
				                		<c:when test="${data.parent_code == 'travel' }"><a href="/travel/view.do?travel_no=${data.parent_no}" target="_blank">${data.content }</a></c:when>
				                		<c:when test="${data.parent_code == 'store' }"><a href="/store/main.do?store_no=${data.parent_no}" target="_blank">${data.content }</a></c:when>
				                		<c:when test="${data.parent_code == 'news' }"><a href="/news/view.do?no=${data.parent_no}" target="_blank">${data.content }</a></c:when>
				                		<c:when test="${data.parent_code == 'community' }"><a href="/community/community_view.do?no=${data.parent_no}" target="_blank">${data.content }</a></c:when>
				                		<c:when test="${data.parent_code == 'dealshop' }"><a href="/deal/main.do?no=${data.parent_no}" target="_blank">${data.content }</a></c:when>
				                	</c:choose>
				                	
				                </td>
				                <td>${data.reg_date}</td>
				            </tr>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise><tr><td colspan="3">no data</td></tr></c:otherwise>
	            </c:choose>
	            <!-- <tr>
	                <td>03</td>
	                <td class="tit">상품명/상호명（商品名/商店名）- 상품명내용（商品名称内容)</td>
	                <td>2013.06.18</td>
	                <td><img src="/resources/img/icon/star.png" alt="" /><img src="/resources/img/icon/star.png" alt="" /><img src="/resources/img/icon/star.png" alt="" /><img src="/resources/img/icon/star.png" alt="" /><img src="/resources/img/icon/star.png" alt="" /></td>
	            </tr> -->
	        </table>
		</c:if>
        
        
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
				<c:otherwise><li onclick="javascript:goPage(1)" class="on">1</li></c:otherwise>
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