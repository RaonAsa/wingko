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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
        	<li>wingko news</li>
        	<li class="end">
        		<c:choose>
        			<c:when test="${category=='5'}">购物</c:when>
        			<c:when test="${category=='6'}">住宿</c:when>
        			<c:when test="${category=='7'}">美食</c:when>
        			<c:when test="${category=='8'}">美容</c:when>
        			<c:when test="${category=='9'}">医疗</c:when>
        			<c:when test="${category=='10'}">文化</c:when>
        		</c:choose>
        	</li><!--뉴스/한국뉴스-->
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="?category=5"><li <c:if test="${category=='5'}">class="on"</c:if>>购物</li></a><!--쇼핑-->
            <a href="?category=6"><li <c:if test="${category=='6'}">class="on"</c:if>>住宿</li></a><!--숙박-->
            <a href="?category=7"><li <c:if test="${category=='7'}">class="on"</c:if>>美食</li></a><!--맛집-->
            <a href="?category=8"><li <c:if test="${category=='8'}">class="on"</c:if>>美容</li></a><!--뷰티-->
            <a href="?category=9"><li <c:if test="${category=='9'}">class="on"</c:if>>医疗</li></a><!--의료-->
            <a href="?category=10"><li  <c:if test="${category=='10'}">class="end on"</c:if>class="end">文化</li></a><!--컬쳐-->
        </ul>
        <table class="detail_c2" style="margin-top:40px;">
        	<caption>한국뉴스</caption>
            <colgroup>
            	<col width="22%" />
                <col width="28%" />
                <col width="22%" />
                <col width="28%" />
            </colgroup>
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
            </tr>
        </table>
        <table class="news_t">
        	<caption>뉴스 더보기</caption>
            <colgroup>
            	<col width="7%" />
                <col width="93%" />
            </colgroup>
            <tr>
            	<td rowspan="2" class="num">10</td>
                <th><a href="Korea_news_view.html">舊金山中國農曆新年花車遊行 新浪花車打頭陣</a></th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">9</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">8</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">7</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">6</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">5</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">4</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">3</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">2</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
            <tr>
            	<td rowspan="2" class="num">1</td>
                <th>舊金山中國農曆新年花車遊行 新浪花車打頭陣</th>
            </tr>
            <tr>
            	<td>发表日期 2013-07-20 | 点击量 120</td>
            </tr>
        </table>
        <ul class="page_number"><!--페이지번호-->
        	<li><img src="/resources/img/menu/page_prev.png" alt="prev" /></li>
            <li class="on">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li class="end"><img src="/resources/img/menu/page_next.png" alt="next" /></li>
        </ul>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
