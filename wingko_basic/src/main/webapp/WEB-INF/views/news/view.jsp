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

<c:choose>
	<c:when test="${news.news_category_no=='1'}"><c:set var="news_category_title" value="韩国新闻" /></c:when>
	<c:when test="${news.news_category_no=='2'}"><c:set var="news_category_title" value="韩流资讯" /></c:when>
	<c:when test="${news.news_category_no=='3'}"><c:set var="news_category_title" value="演出信息" /></c:when>
	<c:when test="${news.news_category_no=='4'}"><c:set var="news_category_title" value="中国新闻" /></c:when>
	<c:when test="${news.news_category_no=='5'}"><c:set var="news_category_title" value="购物" /></c:when>
	<c:when test="${news.news_category_no=='6'}"><c:set var="news_category_title" value="住宿" /></c:when>
	<c:when test="${news.news_category_no=='7'}"><c:set var="news_category_title" value="美食" /></c:when>
	<c:when test="${news.news_category_no=='8'}"><c:set var="news_category_title" value="美容" /></c:when>
	<c:when test="${news.news_category_no=='9'}"><c:set var="news_category_title" value="医疗" /></c:when>
	<c:when test="${news.news_category_no=='10'}"><c:set var="news_category_title" value="文化" /></c:when>
</c:choose>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="${news_category_title} ${news.title} 韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="${news_category_title}, ${news.title}, wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网 : ${news.title}</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script src="/resources/js/wingko.js"></script>
<script>
	$(document).ready(function(){
		var user_no = '${user_no}',
			news_category_no = '${news.news_category_no}',
			page = '${news.page}',
			news_no = '${news.news_no}';		

		$("#btn_insert").bind({
			click : function(){
				if (user_no == '') {
					if ( confirm(m.confirm.login) ) {
						location.href = '/login.do';
					} else {
						return;
					}
				} else if (confirm(m.confirm.ripple)) {
					$("#frm_ripple").submit();	
				} else {
					return;
				}
			}
		});

		$("#review_content").bind({
/* 			focus : function() {
				if (user_no == '') {
					if ( confirm(m.confirm.login) ) {
						location.href = '/login.do';
					} else {
						return;
					}
				} else {
					return;
				}
			}, */
			keyup : function(){
				checkContentSize($("#review_content"), $("#byte"));
			}
		});
		
		$("#reply_textarea").bind({
			keyup : function() {
				checkContentSize($("#reply_textarea"), $("#reply_byte"));
			}
		});
		
		$("#reply_cancel").bind({
			click : function() {
				$("#reply_" + $("#reply_no").val()).hide();
			}
		});
		
		$("#reply_save").bind({
			click : function() {
				if (user_no == '') {
					if ( confirm(m.confirm.login) ) {
						location.href = '/login.do';
					} else {
						return;
					}
				} else if (confirm(m.confirm.ripple)) {
					$("#frm_reply").submit();	
				} else {
					return;
				}
			}	
		});
	});
		
	function back() {
		location.href = "list.do?news_category_no=${news.news_category_no}&page=${news.page}";
	}
	
	function reply_view(no, reply_order) {
		if ($("#reply_" + no).css("display") == "none" ) {
			var editor = document.getElementById('reply_div'); 
			$("#reply_" + no).html(editor);
			$("#reply_" + no).show();
			$("#reply_div").show();
			$("#reply_no").val(no);
			$("#reply_order").val(reply_order);
		}
	}
	
	function review_delete(no) {
		if (confirm(m.confirm.deletes)) {
			location.href = "/news/review_delete.do?no="+no+"&parent_no=${news.news_no}&news_category_no=${news.news_category_no}&page=${news.page}";
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
			<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
			<c:choose>
				<c:when test="${news.news_category_no < 5 }"><li>新闻</li></c:when>
				<c:otherwise><li>wingko news</li></c:otherwise>
			</c:choose>
			<li class="end">
				<c:choose>
					<c:when test="${news.news_category_no=='1'}">韩国新闻</c:when>
					<c:when test="${news.news_category_no=='2'}">韩流资讯</c:when>
					<c:when test="${news.news_category_no=='3'}">演出信息</c:when>
					<c:when test="${news.news_category_no=='4'}">中国新闻</c:when>
					<c:when test="${news.news_category_no=='5'}">购物</c:when>
					<c:when test="${news.news_category_no=='6'}">住宿</c:when>
					<c:when test="${news.news_category_no=='7'}">美食</c:when>
					<c:when test="${news.news_category_no=='8'}">美容</c:when>
					<c:when test="${news.news_category_no=='9'}">医疗</c:when>
					<c:when test="${news.news_category_no=='10'}">文化</c:when>
				</c:choose>
			</li><!--뉴스/한국뉴스-->
        </ul>
        <c:choose>
        	<c:when test="${news.news_category_no < 5 }">
		        <ul class="sub_tab_4"> <!--서브 메인 탭-->
		        	<a href="list.do?news_category_no=1"><li <c:if test="${news.news_category_no=='1'}">class="on"</c:if>>韩国新闻</li></a><!--한국뉴스-->
		            <a href="list.do?news_category_no=2"><li <c:if test="${news.news_category_no=='2'}">class="on"</c:if>>韩流资讯</li></a><!--한류뉴스-->
		            <a href="list.do?news_category_no=3"><li <c:if test="${news.news_category_no=='3'}">class="on"</c:if>>演出信息</li></a><!--공연소식-->
		            <a href="list.do?news_category_no=4"><li <c:if test="${news.news_category_no=='4'}">class="end on"</c:if>class="end">中国新闻</li></a><!--중국소식-->
		        </ul>
	        </c:when>
	        <c:otherwise>
		        <ul class="sub_tab"> <!--서브 메인 탭-->
		        	<a href="list.do?news_category_no=5"><li <c:if test="${news.news_category_no=='5'}">class="on"</c:if>>购物</li></a><!--쇼핑-->
		            <a href="list.do?news_category_no=6"><li <c:if test="${news.news_category_no=='6'}">class="on"</c:if>>住宿</li></a><!--숙박-->
		            <a href="list.do?news_category_no=7"><li <c:if test="${news.news_category_no=='7'}">class="on"</c:if>>美食</li></a><!--맛집-->
		            <a href="list.do?news_category_no=8"><li <c:if test="${news.news_category_no=='8'}">class="on"</c:if>>美容</li></a><!--뷰티-->
		            <a href="list.do?news_category_no=9"><li <c:if test="${news.news_category_no=='9'}">class="on"</c:if>>医疗</li></a><!--의료-->
		            <a href="list.do?news_category_no=10"><li  <c:if test="${news.news_category_no=='10'}">class="end on"</c:if>class="end">文化</li></a><!--컬쳐-->
		        </ul>
	        </c:otherwise>
        </c:choose>
        <table class="board_view" style="margin-bottom:40px;">
        	<caption>한국뉴스 뷰</caption>
            <colgroup>
            	<col width="50%" />
                <col width="50%" />
            </colgroup>
            <tr>
            	<th colspan="2">${news.title}</th>
            </tr>
            <tr>
            	<td class="writer">输入 ${news.reg_date} | 评论 ${news.ripple_count}</td>
                <td class="date"><a href="javascript:back();"><img src="/resources/img/button/bt_news_home.png" alt="返回新闻首页 뉴스홈가기" /></a></td>
            </tr>
            <tr>
            	<td colspan="2" class="view"><!--이미지 가운데처리-->
                    ${news.content}
                </td>
            </tr>
        </table>
        <div class="review_noti">请在下方评论箱留下您宝贵的意见。咨询及投诉，请发送邮件到wingkomaster@wingkostory.com</div><!--소중한의견을 하단의 텍스트상자에 의견을 넣어주세요. 불만과 문의는 윙코스토릴로 문의해주세요-->
        <table class="review" style="margin-bottom:20px;">
        	<caption>리뷰쓰기,리스트</caption>
            <colgroup>
                <col width="15%" />
                <col width="70%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<form id="frm_ripple" action="review_insert.do" method="post">
	            	<input type="hidden" name="parent_no" value="${news.news_no }"/>
	            	<input type="hidden" name="parent_code" value="news"/>
	            	<input type="hidden" name="user_no" value="${user_no}"/>
	            	<input type="hidden" name="news_category_no" value="${news.news_category_no}"/>
	            	<input type="hidden" name="page" value="${news.page}"/>
	            	<td colspan="2" class="no"><textarea class="review_txtarea" name="content" id="review_content"></textarea></td>
	                <td class="no"><img id="btn_insert" src="/resources/img/button/bt_review_write.png" alt="评论" class="hand"/></td>
                </form>
            </tr>
            <tr><td colspan="3" class="txt">还可以输入140字 (<span id="byte">0</span>/140)</td></tr>
            <tr><td colspan="3" class="num">${rippleCount}条评论</td></tr><!--00명의 리뷰-->
			<c:choose>
			<c:when test="${fn:length(rippleList) > 0 }">
				<c:forEach var="data" varStatus="status" items="${rippleList}">
		            <tr><!--리뷰1개 시작-->
		            	<td colspan="2">
		            		<div class="sect${data.level}">
		            			<span class="id">
		            			<c:choose>
		            				<c:when test="${data.level > 1}">
		            					<img src="/resources/img/icon/reply.png" />
		            				</c:when>
		            			</c:choose>${data.user_id }
		            			</span>
		            			<span>${data.reg_date }</span><p>
		            			<span>${data.content }</span></p>
		            			<div class="reply" id="reply_${data.no}" style="display:none"></div>
		            		</div>
		            	</td>
		                <td class="delete">
		                	<img src="/resources/img/button/btn_reply.gif" alt="reply" class="hand" onclick="javascript:reply_view('${data.no}', '${data.reply_order }')"/>
		                	<c:choose>
		                		<c:when test="${data.user_no == user_no && user_no != '' }"><img src="/resources/img/icon/delete.png" alt="delete" class="hand" onclick="javascript:review_delete('${data.no}')"/></c:when>
		                		<c:otherwise>&nbsp;</c:otherwise>
		                	</c:choose>
		                </td>
		            </tr>
		            <!--리뷰1개 끝-->
	            </c:forEach>
			</c:when>
            </c:choose>
        </table>
        
        <!--  댓글 달기 start -->
        <div id="reply_div" class="review_noti" style="display:none;">
           	<form id="frm_reply" action="review_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${news.news_no }"/>
            	<input type="hidden" name="parent_code" value="news"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
            	<input type="hidden" name="news_category_no" value="${news.news_category_no}"/>
            	<input type="hidden" name="page" value="${news.page}"/>
	        	<input type="hidden" name="no" id="reply_no"  />
	        	<input type="hidden" name="reply_order" id="reply_order"   />
	           	<img src="/resources/img/icon/reply.png"/>
	        	<textarea class="reply_txtarea" name="content" id="reply_textarea"></textarea>
	        	<img id="reply_save" src="/resources/img/button/bt_oks.gif" alt="write" class="hand"/>
	        	<img id="reply_cancel" src="/resources/img/button/bt_cancels.gif" alt="cancel" class="hand"/>
	            <p></p>还可以输入140字 (<span id="reply_byte">0</span>/140)
			</form>
        </div>
        <!--  댓글 달기 end -->
        
        <br/>
        <div class="btn_left">
        	<a href="javascript:back();"><img src="/resources/img/button/bt_news_home.png" alt="返回新闻首页" /></a><!--뉴스홈가기--><br/><br/><br/><br/>
            <img src="/resources/img/txt_review_noti.png" alt="时刻关注本文记载内容" /><!--기재 내용에는 세심의 주위를 기울이고 있습니다-->
        </div>
        <div class="btn_right">
        	<a href="#"><img src="/resources/img/button/bt_question.png" alt="查询" /></a><!--문의--><br/><br/><br/><br/>
            <a href="#"><img src="/resources/img/button/bt_top.png" alt="top" /></a>
        </div>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>