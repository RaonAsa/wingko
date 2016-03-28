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
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
	});

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">咨询栏</li><!--커뮤니티>문의-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li>就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li class="on">咨询栏</li></a><!--문의게시판-->
        </ul>
        <div class="board_sch"><!--검색-->
        	<select class="select_sch">
            	<option value="标题">标题</option><!--제목-->
            	<option value="作者">作者</option><!--작성자-->
            	<option value="内容">内容</option><!--내용-->
            </select> 
            <input type="text" class="date_txt" style="width:380px;" /> <img src="/resources/img/button/community_sch.png" alt="search" align="absbottom" />
        </div>
        <div class="review_noti">목적에 부합하지 않는 글은 임의로 삭제할 수 있습니다.</div>
        <!--목적에 부합하지 않는 글은 임의로 삭제할 수 있습니다. -->
        <br/>
        <table class="board_list">
        	<caption>문의 리스트</caption>
            <colgroup>
            	<col width="10%" />
                <col width="50%" />
                <col width="15%" />
                <col width="15%" />
                <col width="10%" />
            </colgroup>
            <tr>
            	<td colspan="5" class="all">总 <span>666</span> 条信息（1/67页)</td><!--총 666개의 글이 있습니다(1/67페이지)-->
            </tr>
            <tr>
            	<th>编号</th><!--번호-->
            	<th>标题</th><!--제목-->
            	<th>作者</th><!--작성자-->
            	<th>发表日期</th><!--작성일-->
            	<th>点击量</th><!--조회수-->
            </tr>
            <!--리스트 시작-->
            <tr>
            	<td class="num"><img src="/resources/img/icon/notice.png" alt="公告" /></td><!--공지-->
                <td class="title"><a href="#">공지사항입니다.</a></td>
                <td>wingko</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">2</td>
                <td class="title"><a href="question_view.html">문의할 것이 있습니다.</a></td>
                <td>hollys</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">3</td>
                <td class="reply"><a href="question_view_reply.html">답변입니다.</a></td>
                <td>wingko</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">4</td>
                <td class="title"><a href="#">문의할 것이 있습니다.</a></td>
                <td>hollys</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">5</td>
                <td class="reply"><a href="#">답변입니다.</a></td>
                <td>wingko</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">6</td>
                <td class="title"><a href="#">문의할 것이 있습니다.</a></td>
                <td>hollys</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">7</td>
                <td class="reply"><a href="#">답변입니다.</a></td>
                <td>wingko</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">8</td>
                <td class="title"><a href="#">문의할 것이 있습니다.</a></td>
                <td>hollys</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">9</td>
                <td class="reply"><a href="#">답변입니다.</a></td>
                <td>wingko</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
            <tr>
            	<td class="num">10</td>
                <td class="title"><a href="#">문의할 것이 있습니다.</a></td>
                <td>hollys</td>
                <td>2013-07-23</td>
                <td>100</td>
            </tr>
       </table>
       <div class="bt_right" style="margin-top:10px;"><a href="question_write.html"><img src="/resources/img/button/btn_write.png" alt="评论" /></a></div><!--글쓰기-->
        <ul class="page_number"><!--페이지번호-->
        	<li><img src="/resources/img/menu/page_prev.png" alt="prev" /></li>
            <li class="on">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li class="end"><img src="/resources/img/menu/page_next.png" alt="next" /></li>
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
