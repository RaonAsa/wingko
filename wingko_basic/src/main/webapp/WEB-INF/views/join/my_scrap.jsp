<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 상단고정
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
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
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
	
	function view(content_type, no) {
		if (content_type == "travel") {
			var url = '/travel/view.do?travel_no='+no;
		} else {
			var url = '/store/main.do?store_no='+no;
		}
		window.open(url);
	}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">My Page</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/my_page.png" alt="My Page" /></div><!--title-->
        <ul class="my_tab"><!--마이페이지 상단탭-->
        	<li><a href="/my/my_info.do"><img src="/resources/img/menu/my_tab01.png" alt="新消息" /></a></li>
        	<li><a href="/my/my_write.do"><img src="/resources/img/menu/my_tab02.png" alt="推荐信息" /></a></li>
        	<li><a href="/my/my_scrap.do"><img src="/resources/img/menu/my_tab03_on.png" alt="特辑专栏" /></a></li>
        	<!-- <li><a href="#"><img src="/resources/img/menu/my_tab04.png" alt="旅行表演" /></a></li> -->
        </ul>

		<table class="my_board" style="margin-bottom:15px;">
        	<caption>게시판</caption>
            <colgroup>
            	<col width="10%" />
                <col width="15%" />
            	<col width="15%" />
                <col width="10%" />
                <col width="50%" />
            </colgroup>
            <tr>
            	<th></th>
                <th>地区</th>
                <th>分类</th>
                <th>号码</th>
                <th>题目</th>
            </tr>
 			<!--리스트 시작-->
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach items="${list}" var="data" varStatus="status">
			            <tr>
			            	<td><input type="checkbox" /></td>
			            	<td><div class="orange">${data.location_name}</div></td>
			                <td>${data.category_name }</td>
			                <td>${data.scrap_no}</td>
			                <td class="tit hand" onclick="javascript:view('${data.content_type }', '${data.no}');">${data.title}</td>
			            </tr>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
		            	<td rowspan="3" class="tit" colspan="5">无剪贴内容</td>
		            </tr>
            	</c:otherwise>
            </c:choose>
<!--             <tr>
            	<td><input type="checkbox" /></td>
            	<td><div class="orange">首尔</div></td>
                <td>美食店</td>
                <td>03</td>
                <td class="tit">명동맛집（明洞美食店)</td>
            </tr>
            <tr>
            	<td><input type="checkbox" /></td>
            	<td><div class="orange">济州</div></td>
                <td>医疗</td>
                <td>02</td>
                <td class="tit">명동맛집（明洞美食店)</td>
            </tr>
            <tr>
            	<td><input type="checkbox" /></td>
            	<td><div class="orange">首尔</div></td>
                <td>美食店</td>
                <td>01</td>
                <td class="tit">제주의료（济州医疗)</td>
            </tr> -->
        </table>
        <a href="#"><img src="/resources/img/button/btn_choice_delete.png" alt="删除选项" /></a>
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
    </div>

	<!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />

</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>