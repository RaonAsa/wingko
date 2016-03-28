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
<script src="/resources/js/wingko.js"></script>
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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">회사소개</li>
        </ul>
        <div class="com_menu"><!--회사소개메뉴-->
        	<a href="summary.do"><img src="/resources/img/menu/company_m01.png" alt="회사개요" /></a><br/>
        	<a href="business.do"><img src="/resources/img/menu/company_m02.png" alt="사업분야" /></a><br/>
        	<a href="history.do"><img src="/resources/img/menu/company_m03.png" alt="연혁" /></a><br/>
        	<a href="ci.do"><img src="/resources/img/menu/company_m04.png" alt="CI &amp; BI" /></a><br/>
        	<a href="news.do"><img src="/resources/img/menu/company_m05.png" alt="언론기사" /></a><br/>
        	<a href="presentation_content.do"><img src="/resources/img/menu/company_m06.png" alt="컨텐츠소개" /></a><br/>
        </div>
        <div class="com_pic"><img src="/resources/img/company_main_img.png" alt="윙코커뮤니케이션과 함께해요" /></div><!--메인이미지-->
        <div class="bt_center" style="clear:both;">
        	<a href="javascript:filedown('wingkostory_Korean.pdf');"><img src="/resources/img/button/bt_download_company_k.png" alt="한국어 회사소개서 PDF 다운로드" style="margin-left:10px;" /></a> &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:filedown('wingkostory_Chinese.pdf');"><img src="/resources/img/button/bt_download_company_c.png" alt="公司简介下载(pdf)" /></a>
        </div>
        <table class="company_menu">
        	<caption>광고소개,컨텐츠구입,문의</caption>
            <colgroup>
            	<col width="28%" />
            	<col width="7%" />
            	<col width="28%" />
            	<col width="7%" />
            	<col width="28%" />
            </colgroup>
            <tr>
            	<th><img src="/resources/img/menu/txt_com_add.png" alt="광고소개" /></th>
                <td rowspan="2" class="space"></td>
                <th><img src="/resources/img/menu/txt_com_content.png" alt="컨텐츠구입" /></th>
                <td rowspan="2" class="space"></td>
                <th><img src="/resources/img/menu/txt_com_question.png" alt="문의" /></th>
            </tr>
            <tr>
            	<td>
                	<ul>
                    	<li><a href="/company/adinfo.do?no=7">광고개요</a></li>
                        <li><a href="/company/adinfo.do?no=8">윙코스토리광고</a></li>
                        <li><a href="/company/adinfo.do?no=9">커뮤니티광고</a></li>
                        <li><a href="/company/adinfo.do?no=10">광고혜택/매체자료</a></li>
                    </ul>
                </td>
            	<td>
                	<ul>
                    	<li><a href="presentation_content.do">컨텐츠구입개요</a></li>
                    </ul>
                </td>
            	<td>
                	<ul>
                    	<li><a href="question.do">문의안내</a></li>
                        <li><a href="question_write.do?question_category=1">일반문의</a></li>
                        <li><a href="question_write.do?question_category=2">광고문의</a></li>
                        <li><a href="question_write.do?question_category=3">컨텐츠구입문의</a></li>
                        <li><a href="question_write.do?question_category=4">제휴제안</a></li>
                    </ul>
                </td>
            </tr>
        </table>
   </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
