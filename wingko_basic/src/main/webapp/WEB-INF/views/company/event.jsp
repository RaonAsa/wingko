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
			location.href = "/company/ripple_delete.do?no="+no+"&parent_no=${info.no}";
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
<!--     	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li class="end">event</li>
        </ul> -->
       	${info.content}


		<div class="review_noti" style="margin-top: 50px;">请在微博评论箱下方留下您宝贵的后记吧. 咨询及投诉，请发送邮件到韩巢预订中心</div><!--소중한의견을 하단의 텍스트상자에 의견을 넣어주세요. 불만과 문의는 윙코스토릴로 문의해주세요-->
        <table class="review">
        	<caption>리뷰쓰기,리스트</caption>
            <colgroup>
                <col width="15%" />
                <col width="70%" />
                <col width="15%" />
            </colgroup>
            <tr>
            	<form id="frm_ripple" action="ripple_insert.do" method="post">
            	<input type="hidden" name="parent_no" value="${info.no }"/>
            	<input type="hidden" name="parent_code" value="event"/>
            	<input type="hidden" name="user_no" value="${sessionScope['user_no']}"/>
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
            	<input type="hidden" name="parent_no" value="${info.no }"/>
            	<input type="hidden" name="parent_code" value="event"/>
            	<input type="hidden" name="user_no" value="${sessionScope['user_no']}"/>
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
       
   </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
