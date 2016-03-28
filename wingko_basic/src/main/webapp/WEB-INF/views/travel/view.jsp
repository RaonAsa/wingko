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
<script src="/resources/js/sns.js"></script>
<script src="/resources/js/wingko.js"></script>
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var user_no = '${user_no}',
			travel_category_no = '${travel_category_no}',
			sort = '${sort}',
			page = '${page}',
			location_no = '${location_no}',
			no = '${no}';
		if (no == '') {
			no = '16';
		}
		
		
		$("img[id='btn_list']").click(function() {
			history.back(-1);
/* 			switch (travel_category_no) {
			case '5':
			case '6':
			case '7':
			case '8':
				location.href="/travel/list_location.do?no="+no+"&location_no="+location_no;
				break;
			case '9':
			case '10':
				location.href="/travel/list.do?travel_category_no="+travel_category_no+"&sort="+sort+"&page="+page;
				break;
			default:
				b reak;
			}*/
		});
		$("img[id='btn_recommend']").click(function() {
			insertRecommend(user_no, "travel", "${travel.travel_no}");
		});
		$("img[id='btn_scrap']").click(function() {
			insertScrap(user_no, "travel", "${travel.travel_no}");
		});
		
		

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

		$("a[name=btn_print]").click(function(){
			window.open("/wingshow/print_view.do", "print", "width=795, height=650, left=0, top=0, scrollbars=yes");
			return false;
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
			location.href = "/travel/review_delete.do?no="+no+"&parent_no=${travel.travel_no}&travel_category_no=${travel_category_no}&sort=${sort}";
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
	
	<div id="Content" print_view>
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>韩国旅游消息</li><li>地区信息</li><li>首尔</li><li class="end">路线图</li><!--홈-한국관광정보-지역정보-서울-로드맵-->
        </ul>
        <div class="sub_tit">${travel.title}</div><!--title-->
        <div class="con_btn_left"><!--왼쪽 버튼 모음-->
			<img src="/resources/img/button/bt_back.png" alt="返回相关地区" id="btn_list" class="hand" /> 
			<!-- <img src="/resources/img/button/bt_recommend_big.png" alt="推荐" id="btn_recommend" class="hand" /> --> 
			<img src="/resources/img/button/bt_scrap.png" alt="剪贴" id="btn_scrap" class="hand" />
        </div>
        <div class="con_btn_right"><!--오른쪽 버튼 모음-->
        	<!-- <img src="/resources/img/button/bt_youku.png" alt="sns_youku" /> -->
            <a href="javascript:SNS.qq()"><img src="/resources/img/button/bt_qq.png" alt="sns_qq" /></a>
            <a href="javascript:SNS.weibo()"><img src="/resources/img/button/bt_sina.png" alt="sns_sina" /></a>
            <a href="javascript:SNS.renren()"><img src="/resources/img/button/bt_renren.png" alt="sns_renren" /></a>
            <a href="#" name="btn_print"><img src="/resources/img/button/bt_print.png" alt="print" /></a>
            <a href="/company/question_write.do?question_category=1"><img src="/resources/img/button/bt_question.png" alt="查询" /></a>
        </div>
        <div class="travel_content">
        	${travel.content} 
        </div>
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
            	<input type="hidden" name="parent_no" value="${travel.travel_no }"/>
            	<input type="hidden" name="parent_code" value="travel"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
            	<input type="hidden" name="travel_category_no" value="${travel_category_no}"/>
            	<input type="hidden" name="sort" value="${sort}"/>
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
           	<form id="frm_reply" action="review_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${travel.travel_no }"/>
            	<input type="hidden" name="parent_code" value="travel"/>
            	<input type="hidden" name="user_no" value="${user_no}"/>
            	<input type="hidden" name="travel_category_no" value="${travel_category_no}"/>
            	<input type="hidden" name="sort" value="${sort}"/>
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
        
        <div class="con_btn_left"><!--왼쪽 버튼 모음-->
			<img src="/resources/img/button/bt_back.png" alt="返回相关地区" id="btn_list" class="hand"/> 
			<!-- <img src="/resources/img/button/bt_recommend_big.png" alt="推荐" id="btn_recommend" class="hand" /> --> 
			<img src="/resources/img/button/bt_scrap.png" alt="剪贴" id="btn_scrap" class="hand" />
        </div>
        <div class="con_btn_right"><!--오른쪽 버튼 모음-->
        	<!-- <img src="/resources/img/button/bt_youku.png" alt="sns_youku" /> -->
            <a href="javascript:SNS.qq()"><img src="/resources/img/button/bt_qq.png" alt="sns_qq" /></a>
            <a href="javascript:SNS.weibo()"><img src="/resources/img/button/bt_sina.png" alt="sns_sina" /></a>
            <a href="javascript:SNS.renren()"><img src="/resources/img/button/bt_renren.png" alt="sns_renren" /></a>
            <a href="#" name="btn_print"><img src="/resources/img/button/bt_print.png" alt="print" /></a>
            <a href="/company/question_write.do?question_category=1"><img src="/resources/img/button/bt_question.png" alt="查询" /></a>
        </div>
        <div class="reviw_bt">
        	<img src="/resources/img/txt_review_noti.png" alt="时刻关注本文记载内容" />
        	<a href="#"><img src="/resources/img/button/bt_top.png" alt="top" style="float:right;" /></a>
        </div>
        
   </div>
 
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
	
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" /><div id="Bottom"><!--하단 카피라이트-->

</body>
</html>
