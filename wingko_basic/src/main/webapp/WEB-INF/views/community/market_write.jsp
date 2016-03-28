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
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/message.js"></script>
<script>

	function write() {
		if ($("#title").val() == "") {
			alert(m.bbs.title);
			$("#title").focus();
		} else {
			$("#frm").submit();
		}
	}

	function cancel() {
		location.href = "market.do?page=${market.page}";
	}

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">集市</li><!--커뮤니티>장터-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li class="on">集市</li></a><!--장터-->
            <a href="/community/job.do"><li>就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
        
        <form id="frm" method="post">
        	<form:hidden path="market.no" />
        	<form:hidden path="market.page" />
        	<form:hidden path="market.user_no" />
        <table class="board_write">
        	<caption>장터 글쓰기</caption>
            <colgroup>
            	<col width="20%" />
                <col width="80%" />
            </colgroup>
            <tr>
            	<th>地区</th><!--지역-->
                <td>
                	<form:select path="market.location_no">
                    	<form:option value="12">首尔</form:option><!--서울-->
                        <form:option value="14">京畿</form:option><!--경기-->
                        <form:option value="16">江原</form:option><!--강원-->
                        <form:option value="15">釜山</form:option><!--부산-->
                        <form:option value="13">济州</form:option><!--제주-->
                        <form:option value="17">其他</form:option><!--기타-->
                    </form:select>
                </td>
            </tr>
            <tr>
            	<th>销售</th>
            	<td>
            		<form:select path="market.sell_flag">
            			<form:option value="N">销售中</form:option>
            			<form:option value="Y">销售完毕</form:option>
            		</form:select>
            	</td>
            </tr>
            <tr>
            	<th>标题</th><!--제목-->
                <td><form:input path="market.title" cssClass="txt" /></td>
            </tr>
            <tr>
            	<td colspan="2"><form:textarea path="market.content" cssClass="txtarea"></form:textarea></td>
            </tr>
        </table>
        <div class="bt_center" style="margin-top:20px;"><a href="javascript:write();"><img src="/resources/img/button/btn_write_ok.png" alt="确认" /></a> <a href="javascript:cancel();"><img src="/resources/img/button/btn_cancel.png" alt="取消" /></a></div><!--확인 취소-->
		</form>

        <c:if test="${ad != null}">
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

<script>
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/community/imageupload_editor.do',
		height: '400px',
		language : 'zh-cn'
	});
</script>

</body>
</html>
