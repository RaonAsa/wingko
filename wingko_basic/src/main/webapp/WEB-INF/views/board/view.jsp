<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
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
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

    <div id="Wide">
    	<table class="my_info">
    		<tr>
    			<th>번호</th>
    			<td>${board.no}</td>
    		</tr>
    		<tr>
    			<th>지역</th>
    			<td>${board.no}</td>
    		</tr>
    		<tr>
    			<th>제목</th>
    			<td>${board.title}</td>
    		</tr>
    		<tr>
    			<th>내용</th>
    			<td>${board.content}</td>
    		</tr>
    		<tr>
    			<th>작성자</th>
    			<td>${board.user_id}</td>
    		</tr>
    		<tr>
    			<th>조회수</th>
    			<td>${board.hit}</td>
    		</tr>
    		<tr>
    			<th>입력일</th>
    			<td>${board.reg_date}</td>
    		</tr>
    	</table>

    	<div>
    		<form>
    			댓글<textarea rows="5" style="width: 80%"></textarea> <button id="btn_ripple_insert" style="width: 100px;height: 60px;">입력</button>
    		</form>
    	</div>
    	
    	<div>
    		<a href="write.do">글쓰기</a>
    		<a href="delete.do?no=${board.no}">삭제</a>
    		<a href="list.do">목록</a>
    	</div>

    </div>
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>