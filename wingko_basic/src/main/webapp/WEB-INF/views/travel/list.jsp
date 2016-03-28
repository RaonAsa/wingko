<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 15.
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
			location.href = '?travel_category_no=${travel_category_no}&sort=${sort}&page='+(startPageNum-1);
		}else{
			alert(m.bbs.prev);
		}
	}
	
	// 다음  페이지
	function nextPage(){

		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?travel_category_no=${travel_category_no}&sort=${sort}&page='+(endPageNum);
		}else{
			alert(m.bbs.next);
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?travel_category_no=${travel_category_no}&sort=${sort}&page='+goPage;
	}
	
	function view(travel_no) {
		//alert(travel_no);
		location.href = 'view.do?travel_category_no=${travel_category_no}&sort=${sort}&travel_no='+travel_no+'&page=${list.page}';
	}

</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />


	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>韩国旅游信息</li><li class="end">其他信息</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="info.do?menu=info&no=1"><li class="small">韩国旅游消息</li></a><!--한국여행정보--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="info.do?menu=traffic&no=7"><li>韩国交通信息</li></a><!--한국교통정보-->
            <a href="info.do?menu=communication&no=13"><li>通信,无线网,接送</li></a><!--통신,와이파이,픽업-->
            <a href="list_location.do?no=16&location_no=12"><li>地区信息</li></a><!--지역별정보-->
            <a href="list.do?travel_category_no=9"><li <c:if test="${travel_category_no == 9}">class="on"</c:if>>Rail Pass</li></a><!--Rail Pass-->
            <a href="list.do?travel_category_no=10"><li <c:if test="${travel_category_no == 10}">class="on"</c:if>>其他信息</li></a><!--기타한국정보-->
        </ul>
        <br/>
        <ul class="board_tab">
        	<a href="list.do?travel_category_no=${travel_category_no}&sort=ripple_count"><li <c:if test="${sort == 'ripple_count'}">class="on"</c:if>>评论数</li></a>| <!--리뷰수-->
            <a href="list.do?travel_category_no=${travel_category_no}&sort=recommend"><li <c:if test="${sort == 'recommend'}">class="on"</c:if>>推荐数</li></a> <!--추천수-->
        </ul>
        <table class="travel_area_list" id="travel_area_list">
			<caption>로드맵-리뷰수순</caption>
			<colgroup>
				<col width="208px" />
				<col width="69px" />
				<col width="208px" />
				<col width="69px" />
				<col width="208px" />
			</colgroup>
            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach items="${list}" var="data" varStatus="status">
            			<fmt:parseNumber var="nowline" integerOnly="true" value="${(status.index)/3}" />
            			<c:if test="${status.index % 3 == 0 }"><c:set value="0" var="i" /><tr></c:if>
						<c:if test="${status.index % 3 > 0 }"><td></td></c:if>
						<td onclick="javascript:view('${data.travel_no}')" class="hand">
							<c:choose>
								<c:when test="${data.image != ''}">
									<img src="http://www.wingkostory.com/upload/travel/${data.image}" alt="" class="travel_image" />${data.title}<%-- (${data.ripple_count}) --%>
								</c:when>
								<c:otherwise>
									<img src="/resources/img/defalt_img_208_130.gif" alt="" class="travel_image" /><br />${data.title}<%-- (${data.ripple_count}) --%>
								</c:otherwise>
							</c:choose>
						</td>
            			<c:if test="${status.index % 3 == 2 }"></tr></c:if>
            			<c:set value="${i+1}" var="i" />
            		</c:forEach>
            		<c:forEach var="j" begin="1" end="3" step="1">
            			<c:if test="${i < j }"><td></td><td></td><c:set value="${i+1}" var="i" /></c:if>
            			<c:if test="${i == 3 }"></tr></c:if>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr><th colspan="5">데이터가 없습니다.</th></tr>
            	</c:otherwise>
            </c:choose>
        </table>
        
		<!-- page nav -->
        <ul class="page_number" style="margin-top:0;"><!--페이지번호-->
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
