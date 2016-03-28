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
		
	});
	
	function cancel() {
		location.href = "qna.do?page=${qna.page}&search_type=${qna.search_type}&search_string=${qna.search_string}";
	}
	function write() {
		location.href = "qna_write.do?page=${qna.page}&no=${qna.no}";
	}
	function deleteQna() {
		if (confirm(m.confirm.deletes)) {
			location.href = "qna_delete.do?page=${qna.page}&no=${qna.no}";
		} else {
			return;
		}
	}


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
        <table class="board_view">
        	<caption>문의게시판 뷰</caption>
            <colgroup>
            	<col width="50%" />
                <col width="50%" />
            </colgroup>
            <tr>
            	<th colspan="2">${qna.title}</th>
            </tr>
            <tr>
            	<td class="writer">作者 ${qna.user_nickname}</td>
                <td class="date">发表日期 ${qna.reg_date} | 点击量 ${qna.hit}</td>
            </tr>
            <tr>
            	<td colspan="2" class="view">
                    ${qna.content}
                </td>
            </tr>
        </table>
        <div class="bt_right" style="margin-top:10px;">
        	<a href="javascript:cancel();"><img src="/resources/img/button/bt_list.png" alt="目录목록" /></a>
        	<c:if test="${qna.user_no == user_no && user_no != '' }">
        		<a href="javascript:write();"><img src="/resources/img/button/bt_modify.png" alt="修改内容글수정" /></a>
        		<a href="javascript:deleteQna();"><img src="/resources/img/button/btn_delete.png" alt="删除삭제" /></a>
        	</c:if>
        </div><!--목록-->
        <table class="prev_next">
        	<caption>이전글, 다음글</caption>
            <colgroup>
            	<col width="3%" />
                <col width="8%" />
                <col width="79%" />
            </colgroup>
            <c:if test="${prev.no > 0 }">
	            <tr>
	            	<td <c:if test="${!(next.no > 0) }">class="bottom"</c:if>><img src="/resources/img/icon/prev_list.png" alt="prev" /></td>
	                <td <c:if test="${!(next.no > 0) }">class="bottom"</c:if>>上一篇</td><!--이전글-->
	                <th <c:if test="${!(next.no > 0) }">class="bottom"</c:if>><a href="?page=${qna.page}&no=${prev.no}&search_type=${qna.search_type}&search_string=${qna.search_string}">${prev.title}</a></th><!--이전글이 없습니다.--> 
	            </tr>
            </c:if>
            <c:if test="${next.no > 0 }">
	            <tr>
	            	<td class="bottom"><img src="/resources/img/icon/next_list.png" alt="next" /></td>
                	<td class="bottom">下一篇</td><!--다음글-->
	                <th class="bottom"><a href="?page=${qna.page}&no=${next.no}&search_type=${qna.search_type}&search_string=${qna.search_string}">${next.title}</a></th><!--无下一篇 다음글이 없습니다.--> 
	            </tr>
            </c:if>
        </table>
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
