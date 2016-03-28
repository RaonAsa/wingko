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
<meta name="keywords" content="韩国旅游,韩国时装,韩国化妆,韩国购物,韩国整容">
<title>WingkoStory</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		
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
	});
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

    <div id="Wide">
    	${fn:length(list)}
    	<table class="my_info">
    		<tr>
    			<th>번호</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>
    			<th>조회수</th>
    		</tr>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="data" varStatus="status" >
						<tr>
							<td>${data.no}</td>
							<td><a href="view.do?no=${data.no}">${data.title}</a></td>
							<td>${data.user_id}</td>
							<td>${data.reg_date}</td>
							<td>${data.hit}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
    	</table>
    	
    	<div>
    		<a href="write.do">글쓰기</a>
    	</div>
    	
		<!-- page nav -->
		<div class="pagination pagination">
			<ul>
				<li><a href="javascript:prevPage()">«</a></li>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="i" begin="${list.startPageNum}" end="${list.endPageNum}" step="1">
							<c:if test="${!(i > list.totalPage) && !(i==list.endPageNum)}">
								<c:choose>
					    			<c:when test="${i == list.page}">
					    				<li class="active"><a href="#">${i }</a></li>
									</c:when>
						    		<c:otherwise>
						    			<li><a href="javascript:goPage(${i })">${i }</a></li>
						    		</c:otherwise>
					    		</c:choose>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>1</c:otherwise>
				</c:choose>

				<li><a href="javascript:nextPage()">»</a></li>
			</ul>
		</div>
		<!-- page nav -->
    </div>
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>