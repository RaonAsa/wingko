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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游,韩国时装,韩国化妆,韩国购物,韩国整容">
<title>WingkoStory</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_write").click(function() {
			if (confirm('글을 입력하시겠습니까?')) {
				$("#board").submit();	
			} else {
				return; 
			}
		});

		$("#btn_cancel").click(function() {
			if (confirm('글 입력을 취소하시겠습니까?')) {
				history.back(-1);	
			} else {
				return;
			}
		});
	});
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<%-- <c:import url="../inc/top.jsp" charEncoding="UTF-8" /> --%>

    <div id="Wide">
    	<form:form modelAttribute="board">
    		<form:hidden path="board_category_no" />
    		<form:hidden path="user_no" />
	    	<table class="my_info">
	    		<tr>
	    			<th>제목</th>
	    			<th><form:input path="title" /></th>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<th><form:textarea path="content" /></th>
	    		</tr>
	    	</table>
    	</form:form>

    	<div>
    		<button id="btn_write">글쓰기</button>
    		<button id="btn_cancel">취소</button>
    	</div>
    </div>
</div>

<!-- BOTTOM Include -->
<%-- <c:import url="../inc/bottom.jsp" charEncoding="UTF-8" /> --%>

<script>
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/${board_name}/imageupload.do'
	});
</script>



</body>
</html>