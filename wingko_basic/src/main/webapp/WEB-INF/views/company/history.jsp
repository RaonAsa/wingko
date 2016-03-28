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
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><a href="main.do"><li>회사소개</li></a><li class="end">연혁</li>
        </ul>
        <div class="com_menu"><!--회사소개메뉴-->
        	<a href="summary.do"><img src="/resources/img/menu/company_m01.png" alt="회사개요" /></a><br/>
        	<a href="business.do"><img src="/resources/img/menu/company_m02.png" alt="사업분야" /></a><br/>
        	<a href="history.do"><img src="/resources/img/menu/company_m03_on.png" alt="연혁" /></a><br/>
        	<a href="ci.do"><img src="/resources/img/menu/company_m04.png" alt="CI &amp; BI" /></a><br/>
        	<a href="news.do"><img src="/resources/img/menu/company_m05.png" alt="언론기사" /></a><br/>
        	<a href="presentation_content.do"><img src="/resources/img/menu/company_m06.png" alt="컨텐츠소개" /></a><br/>
        </div>
        <div class="com_pic"><img src="/resources/img/company_main_img.png" alt="윙코커뮤니케이션과 함께해요" /></div><!--메인이미지-->
        <div class="company_con">
        	${info.content}
        </div>
   </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
