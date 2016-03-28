<%--
  - 작성자  yshsy
  - 작성일자 2013. 7. 20.
  - 내용
  -
  -
  --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"        prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"   prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"         prefix="fmt"%>
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
	$(document).ready(function(){
		var user_no = '${user_no}';
		
		$("#btn_save").bind({
			click : function() {
				if (user_no == '') {
					if ( confirm(m.confirm.login) ) {
						location.href = '/login.do';
					} else {
						return;
					}
				} else if (confirm(m.confirm.insert)) {
					$("#frmBlog").submit();
				} else {
					return;
				}
			} 	
		});

		$("#btn_cancel").click(function(){
			location.href = "blog.do?page=${community.page}";
		});
	});
	
	// FIXME 한글 -> 한자로 변경 해야 함.
</script>
</head>
<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

    <div id="Content"><!--Content-->
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">WINGKO博客</li><!--커뮤니티>윙코블로그-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li class="on">WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li>就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
		<form id="frmBlog" method="post" action="blog_write.do" enctype="multipart/form-data">
			<c:if test="${community.no > 0 }">
				<form:hidden path="community.no" />
			</c:if>
			<form:hidden path="community.page" />
			<form:hidden path="community.user_no" />
			<form:hidden path="community.user_name" />
			<input type='hidden' name='category' value='blog' />
			<input type="hidden" name="org_category" value="${org_category}"/>
			<table class="board_write">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr id="location">
					<th>지역</th>
					<td>
						<form:select path="community.location_no" cssStyle="margin-right:150px;">
							<form:option value="0">지역선택</form:option>
							<form:options items="${locationData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th>썸네일</th>
					<td>
						<form:input path="community.image_thumb" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${community.image_thumb != ''}"><br />현재 이미지 <img src="/upload/community/${community.image_thumb}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><form:input path="community.title" cssClass="txt01" size="50"/></td>
				</tr>
				<c:if test="${community.no > 0 }">
					<tr>
						<th>노출</th>
						<td>
							<form:select path="community.use_flag" cssClass="txt01" cssStyle="width:20%">
								<form:option value="Y">사용</form:option>
								<form:option value="N">미사용</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2"><form:textarea path="community.content" cssClass="txtarea"/></td>
				</tr>
			</table>
	        <div class="bt_center" style="margin-top:20px;">
	        	<img id="btn_save" src="/resources/img/button/btn_write_ok.png" alt="确认" /> 
	        	<img id="btn_cancel" src="/resources/img/button/btn_cancel.png" alt="取消" />
	        </div><!--확인 취소-->
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
		filebrowserUploadUrl: '/admin/community/imageupload_editor.do'
	});
</script>


</body>
</html>
