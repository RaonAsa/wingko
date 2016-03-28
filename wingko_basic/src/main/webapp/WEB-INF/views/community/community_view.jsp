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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>

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
<script src="/resources/js/wingko.js"></script>
<script>

	$(document).ready(function(){
		var user_no = '${sessionScope["user_no"]}';
	
		
		$("#btn_insert").click(function(){
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
		});
		$("#review_content").bind('keyup', function(){
			checkContentSize($("#review_content"), $("#byte"));
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
			location.href = "/community/ripple_delete.do?no="+no+"&parent_no=${community.no}"+"&category=${community.category}"+"&page=${community.page}"+"&sort=${community.sort}";
		} else {
			return;
		}
	}

	function list() {
		location.href = "${community.category}.do?page=${community.page}&sort=${community.sort}&search_type=${community.search_type}&search_string=${community.search_string}";
	}
</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">公告栏</li><!--커뮤니티>공지사항-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li <c:if test="${community.category == 'webtoon' }">class="on"</c:if>>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li <c:if test="${community.category == 'game' }">class="on"</c:if>>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li <c:if test="${community.category == 'blog' }">class="on"</c:if>>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li>就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
        <table class="board_view">
        	<caption>웹툰 뷰</caption>
            <colgroup>
            	<col width="50%" />
                <col width="50%" />
            </colgroup>
            <tr>
            	<th colspan="2">${community.title }</th>
            </tr>
            <tr>
            	<td class="writer">作者 ${community.user_nickname }</td>
                <td class="date">发表日期 ${community.reg_date } | 点击量 ${community.hit } | 推荐 ${community.recommend }</td>
            </tr>
            <tr>
            	<td colspan="2" class="view2"><!--이미지 가운데처리-->
                	<!-- <img src="/resources/img/print_img/toon_sample.png" alt="웹툰샘플" /> -->
                	${community.content }
                </td>
            </tr>
        </table>
        <div class="bt_right" style="margin-top:10px;"><a href="javascript:insertRecommend('${community.user_no}', 'community', '${community.no}');"><img src="/resources/img/button/bt_recommend.png" alt="推荐" /></a> <a href="javascript:list();"><img src="/resources/img/button/bt_list.png" alt="目录" /></a></div><!--목록-->
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
	                <th <c:if test="${!(next.no > 0) }">class="bottom"</c:if>><a href="?category=${community.category}&page=${community.page}&sort=${community.sort}&no=${prev.no}&search_type=${community.search_type}&search_string=${community.search_string}">${prev.title}</a></th><!--이전글이 없습니다.--> 
	            </tr>
            </c:if>
            <c:if test="${next.no > 0 }">
	            <tr>
	            	<td class="bottom"><img src="/resources/img/icon/next_list.png" alt="next" /></td>
                	<td class="bottom">下一篇</td><!--다음글-->
	                <th class="bottom"><a href="?category=${community.category}&page=${community.page}&sort=${community.sort}&no=${next.no}&search_type=${community.search_type}&search_string=${community.search_string}">${next.title}</a></th><!--无下一篇 다음글이 없습니다.--> 
	            </tr>
            </c:if>
        </table>
        
        
        <div class="review_noti">请在下方评论箱留下您宝贵的意见。咨询及投诉，请发送邮件到wingkomaster@wingkostory.com</div><!--소중한의견을 하단의 텍스트상자에 의견을 넣어주세요. 불만과 문의는 윙코스토릴로 문의해주세요-->
        <table class="review">
        	<caption>리뷰쓰기,리스트</caption>
            <colgroup>
                <col width="15%" />
                <col width="70%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<form id="frm_ripple" action="ripple_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${community.no }"/>
            	<input type="hidden" name="parent_code" value="community"/>
            	<input type="hidden" name="category" value="${community.category}"/>
            	<input type="hidden" name="page" value="${community.page}"/>
            	<input type="hidden" name="sort" value="${community.sort}"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
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
		            </tr><!--리뷰1개 끝-->
	            </c:forEach>
			</c:when>
            </c:choose>
        </table>

        <!--  댓글 달기 start -->
        <div id="reply_div" class="review_noti" style="display:none;">
           	<form id="frm_reply" action="ripple_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${community.no }"/>
            	<input type="hidden" name="parent_code" value="community"/>
            	<input type="hidden" name="category" value="${community.category}"/>
            	<input type="hidden" name="page" value="${community.page}"/>
            	<input type="hidden" name="sort" value="${community.sort}"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
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
        
		<c:if test="ad != null}">
	        <a href="ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
