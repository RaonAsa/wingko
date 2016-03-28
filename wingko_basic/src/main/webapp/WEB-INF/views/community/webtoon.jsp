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
		$(document).ready(function(){
			page = Number("${list.page}");
			pageSize = Number("${list.pageSize}");
			currentBlock = Number("${list.currentBlock}");
			totalBlock = Number("${list.totalBlock}");
			startPageNum = Number("${list.startPageNum}");
			endPageNum = Number("${list.endPageNum}");
		});
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

	function view(no) {
		location.href = "/community/community_view.do?category=webtoon&page=${list.page}&sort=${community.sort}&no="+no;
	}

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">WINGKO 漫画</li><!--커뮤니티>윙코웹툰-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li class="on">WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li>就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
        <div class="sub_tit" id="r_div"><img src="/resources/img/title/tit_best_webtoon.png" alt="推荐最佳漫画" /></div><!--추천최고웹툰-->
        <table class="best_toon" id="r_table">
        	<caption>추천최고웹툰</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tr>
            	<th><img id="r_img_1" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
                <th></th><!--여백-->
            	<th><img id="r_img_2" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
                <th></th><!--여백-->
            	<th><img id="r_img_3" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
            </tr>
            <tr>
            	<td id="r_title_1"><strong>'여행중에 생긴일'</strong></td><!--제목-->
            	<td></td><!--여백-->
            	<td id="r_title_2"><strong>'여행중에 생긴일'</strong></td>
            	<td></td><!--여백-->
            	<td id="r_title_3"><strong>'여행중에 생긴일'</strong></td>
            </tr>
            <tr>
            	<td class="writer" id="r_user_1">나작가</td><!--작가-->
            	<td></td><!--여백-->
            	<td class="writer" id="r_user_2">나작가</td>
            	<td></td><!--여백-->
            	<td class="writer" id="r_user_3">나작가</td>
            </tr>
        </table>
		<c:choose>
			<c:when test="${fn:length(rippleCountList) == 3 || fn:length(rippleCountList) > 3  }">
				<c:forEach var="data" varStatus="status" items="${rippleCountList}">
					<script>
						(function(){
							var i = "${status.index+1}",
								no = "${data.no}",
								image_thumb = "${data.image_thumb}",
								title = "${data.title}",
								user_nickname = "${data.user_nickname}";
							if (i < 4) {
								$("#r_img_"+i).addClass("hand").attr("onclick", "javascript:view('"+no+"');").attr("src", "http://www.wingkostory.com/upload/community/"+image_thumb);
								$("#r_title_"+i).addClass("hand").attr("onclick", "javascript:view('"+no+"');").html("<strong>"+title+"</strong>");
								$("#r_user_"+i).text(user_nickname);
							}
						})();
					</script>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<script>$("#r_div").hide(); $("#r_table").hide()</script>
			</c:otherwise>
		</c:choose>
		
		
        <div class="sub_tit" id="re_div"><img src="/resources/img/title/tit_best_webtoon_review.png" alt="推荐最佳漫画" /></div><!--리뷰최고웹툰-->
        <table class="best_toon" id="re_table">
        	<caption>리뷰최고웹툰</caption>
            <colgroup>
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            	<col width="69px" />
            	<col width="208px" />
            </colgroup>
            <tr>
            	<th><img id="re_img_1" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
                <th></th><!--여백-->
            	<th><img id="re_img_2" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
                <th></th><!--여백-->
            	<th><img id="re_img_3" src="/resources/img/defalt_img_208_130.gif" style="width: 208px; height: 132px;"  alt="" /></th>
            </tr>
            <tr>
            	<td  id="re_title_1"><strong>'여행중에 생긴일'</strong></td><!--제목-->
            	<td></td><!--여백-->
            	<td  id="re_title_2"><strong>'여행중에 생긴일'</strong></td>
            	<td></td><!--여백-->
            	<td  id="re_title_3"><strong>'여행중에 생긴일'</strong></td>
            </tr>
            <tr>
            	<td class="writer" id="re_user_1">나작가</td><!--작가-->
            	<td></td><!--여백-->
            	<td class="writer" id="re_user_2">나작가</td>
            	<td></td><!--여백-->
            	<td class="writer" id="re_user_3">나작가</td>
            </tr>
        </table>
		<c:choose>
			<c:when test="${fn:length(recommendList) == 3 || fn:length(recommendList) > 3  }">
				<c:forEach var="data" varStatus="status" items="${recommendList}">
					<script>
						(function(){
							var i = "${status.index+1}",
								no = "${data.no}",
								image_thumb = "${data.image_thumb}",
								title = "${data.title}",
								user_nickname = "${data.user_nickname}";
							if (i < 4) {
								$("#re_img_"+i).addClass("hand").attr("onclick", "javascript:view('"+no+"');").attr("src", "http://www.wingkostory.com/upload/community/"+image_thumb);
								$("#re_title_"+i).addClass("hand").attr("onclick", "javascript:view('"+no+"');").html("<strong>"+title+"</strong>");
								$("#re_user_"+i).text(user_nickname);
							}
						})();
					</script>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<script>$("#r_div").hide(); $("#r_table").hide()</script>
			</c:otherwise>
		</c:choose>
		
		
		
       	<div class="toon_left"><img src="/resources/img/title/tit_all_webtoon.png" alt="全部漫画" /></div><!--전체웹툰-->
        <div class="toon_right">
           	<ul>
               	<li class="first"><a href="?page=${list.page}&sort=no"><img src="/resources/img/menu/toon_tab01<c:if test="${community.sort == 'no' }">_on</c:if>.png" alt="按更新" /></a></li><!--업데이트순-->
                <li><a href="?page=${list.page}&sort=hit"><img src="/resources/img/menu/toon_tab02<c:if test="${community.sort == 'hit' }">_on</c:if>.png" alt="按点击量" /></a></li><!--조회순-->
                <li><a href="?page=${list.page}&sort=user_no"><img src="/resources/img/menu/toon_tab03<c:if test="${community.sort == 'user_no' }">_on</c:if>.png" alt="按作者" /></a></li><!--작가순-->
                <li class="end"><a href="?page=${list.page}&sort=recommend"><img src="/resources/img/menu/toon_tab04<c:if test="${community.sort == 'recommend' }">_on</c:if>.png" alt="按推荐" /></a></li><!--추천순-->
            </ul>
        </div>
        <table class="all_toon">
        	<caption>전체웹툰</caption>
            <colgroup>
            	<col width="10%" />
                <col width="15%" />
                <col width="30%" />
                <col width="45%" />
            </colgroup>
            <!--리스트 시작-->
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach items="${list}" var="data" varStatus="status">
            			<fmt:parseDate var="date" value="${data.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <tr>
			            	<td rowspan="2" class="num">
			            		<%-- ${data.no} --%>
			            		${list.totalCount - ((list.page - 1) *list.pageSize) - status.index }
							</td><!--공지-->
			                <td rowspan="2"><img src="/upload/community/${data.image_thumb}" alt="" style="width: 100px;height: 80px;"/><!-- <img src="/resources/img/print_img/toon_100.png" alt="" /> --></td>
			                <th colspan="2"><a href="javascript:view('${data.no}');">${data.title}</a></th>
			            </tr>
			            <tr>
			            	<td>作者 ${data.user_nickname}</td><!--작성자 작성인-->
			                <td class="date">发表日期 <fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /> | 点击量 ${data.hit} | <span>推荐 ${data.recommend }</span></td><!--작성일자 조회수-->
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
		            	<td rowspan="4" class="num" colspan="2">데이터가 없습니다.</td>
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
