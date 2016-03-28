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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><a href="main.do"><li>회사소개</li></a><li class="end">언론기사</li>
        </ul>
        <table class="board_view">
        	<caption>장터 뷰</caption>
            <colgroup>
            	<col width="50%" />
                <col width="50%" />
            </colgroup>
            <tr>
            	<th colspan="2">${companyNews.title}</th>
            </tr>
            <tr>
            	<td class="writer">作者 ${companyNews.user_nickname }</td><!--작성자, 지역권-->
                <td class="date">发表日期 ${companyNews.reg_date} | 点击量 ${companyNews.hit }</td><!--작성일, 조회수-->
            </tr>
            <tr>
            	<td colspan="2" class="view">
                    ${companyNews.content }
                </td>
            </tr>
        </table>
        <div class="bt_right" style="margin-top:10px;"><a href="news.do"><img src="/resources/img/button/bt_list.png" alt="目录목록" /></a> </div><!--목록-->
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
	                <th <c:if test="${!(next.no > 0) }">class="bottom"</c:if>><a href="?page=${companyNews.page}&no=${prev.no}">${prev.title}</a></th><!--이전글이 없습니다.--> 
	            </tr>
            </c:if>
            <c:if test="${next.no > 0 }">
	            <tr>
	            	<td class="bottom"><img src="/resources/img/icon/next_list.png" alt="next" /></td>
                	<td class="bottom">下一篇</td><!--다음글-->
	                <th class="bottom"><a href="?page=${companyNews.page}&no=${next.no}">${next.title}</a></th><!--无下一篇 다음글이 없습니다.--> 
	            </tr>
            </c:if>
        </table>
   </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
