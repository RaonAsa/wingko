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
<script>

	if ("${pass}") {
		alert(m.password.different);
		history.back(-1);
	} else if ("${error}") {
		alert(${error});
	}

	$(document).ready(function(){
		$("#btn_photo").click(function() {
			$("#file_image").trigger("click");
		});
	});

	function write() {
		if ($("#pwd").val() == '') {
			alert(m.password.blank);
			$("#pwd").focus();
		} else if ($("#captcha").val() == '') {
			alert(m.captcha.blank);
			$("#captcha").focus();
		} else {
			if (confirm(m.confirm.insert)) {
				$("#frm").submit();	
			}			
		}
	}
	function cancel() {
		location.href = "job.do?page=${job.page}&job_type=${job.job_type}";
	}
</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><li>社区</li><li class="end">就业信息</li><!--커뮤니티>취업정보-->
        </ul>
        <ul class="sub_tab_7"> <!--서브 메인 탭-->
        	<a href="/community/notice.do"><li class="small">公告栏</li></a><!--공지사항--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="/community/webtoon.do"><li>WINGKO动漫</li></a><!--윙코웹툰-->
            <a href="/community/game.do"><li>WINGKO游戏</li></a><!--윙코게임방-->
            <a href="/community/blog.do"><li>WINGKO博客</li></a><!--윙코블로그-->
            <a href="/community/market.do"><li>集市</li></a><!--장터-->
            <a href="/community/job.do"><li class="on">就业信息栏</li></a><!--취업정보-->
            <a href="/community/qna.do"><li>咨询栏</li></a><!--문의게시판-->
        </ul>
        <br/>
        <h5><img src="/resources/img/icon/noti.png" alt="" align="absbottom" /> 发现虚假或非法内容时将删除会员. 请注意遵守</h5>
        <!--허위사항이나 불법사항이 적발될 시에는 무조건 회원탈퇴입니다. 주의하시기 바랍니다 -->
        <br/>
        
        
        <form id="frm" action="job_write.do" method="post" enctype="multipart/form-data">
	        <form:hidden path="job.job_type" value="hunting" />
	        <c:if test="${job.job_no > 0}">
	        	<form:hidden path="job.job_no"/>
	        </c:if>
        <table class="board_write" style="margin-top:0;">
        	<caption>구직 글쓰기</caption>
            <colgroup>
            	<col width="10%" />
                <col width="40%" />
            	<col width="10%" />
                <col width="40%" />
            </colgroup>
            <tr>
            	<th>标题</th><!--제목-->
                <td><form:input path="job.title" cssClass="txt" /></td>
            	<th>作者/密码</th><!--작성자-->
                <td><form:input path="job.writer" cssClass="txt" cssStyle="width: 100px;" /> <input type="password" name="pwd" id="pwd" class="txt" style="width: 100px;" /></td>
            </tr>
            <tr>
            	<th>公司名称</th><!--이름-->
                <td><form:input path="job.hunter_name" cssClass="txt" /></td>
            	<th>照片</th><!--사진-->
                <td>
        			<img id="photo" src="/resources/img/button/photo_update.png" alt="photo" style="width: 79px; height: 66px;" /> 
        			<img id="btn_photo" src="/resources/img/button/btn_photo_update.png" alt="上传照片" class="hand" />
        			<input type="file" id="file_image" name="file_image" style="display: none;"/><form:input path="job.hunter_photo" type="hidden" />
                </td>
            </tr>
            <tr>
            	<th>希望收入</th><!--희망연봉-->
                <td><form:input path="job.hunter_pay" cssClass="txt" /></td>
            	<th>邮箱</th><!--이메일-->
                <td><form:input path="job.hunter_email" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th rowspan="5">学历</th><!--학력사항-->
                <td colspan="3" class="no"><form:input path="job.hunter_education1" cssClass="txt" /></td>
            </tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_education2" cssClass="txt" /></td></tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_education3" cssClass="txt" /></td></tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_education4" cssClass="txt" /></td></tr>
            <tr><td colspan="3"><form:input path="job.hunter_education5" cssClass="txt" /></td></tr>
            <tr>
            	<th rowspan="5">经历</th><!--경력사항-->
                <td colspan="3" class="no"><form:input path="job.hunter_career1" cssClass="txt" /></td>
            </tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_career2" cssClass="txt" /></td></tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_career3" cssClass="txt" /></td></tr>
            <tr><td colspan="3" class="no"><form:input path="job.hunter_career4" cssClass="txt" /></td></tr>
            <tr><td colspan="3"><form:input path="job.hunter_career5" cssClass="txt" /></td></tr>
            <tr>
            	<th>自我介绍</th><!--자기소개-->
                <td colspan="3"><form:textarea path="job.hunter_about" cssClass="txtarea2" cssStyle="height:200px;" /></td>
            </tr>
            <!-- display captcha image start -->
			<tr>
				<th>图像值#</th> <!-- Image -->
				<td>
					<img id="captcha_id" name="imgCaptcha" src="/captcha.jpg">
					<a href="javascript:;"
                        title="change captcha text"
                        onclick="document.getElementById('captcha_id').src = '/captcha.jpg?' + Math.random();  return false">
                            <img src="/resources/img/button/btn_refresh.png" /></a>
				</td> 
				<th>图像值#1</th>
				<td><form:input path="job.captcha" cssClass="txt"/><br></br>输入图像值#</td> <!-- Image값을 입력하세요. -->
			</tr>
			<tr>
			</tr>            
            <!-- display captcha image end -->
            
     </table>
     	<div class="bt_center" style="margin-top:20px;">
       		<c:if test="${sessionScope.user_no == '8' }">
       			<script>
       				$(function() {
       					$("#pwd").val("${job.pwd}");
       				})();
       			</script>
       		</c:if>
     		<a href="javascript:write();"><img src="/resources/img/button/btn_write_ok.png" alt="确认" /></a> 
     		<a href="javascript:cancel();"><img src="/resources/img/button/btn_cancel.png" alt="取消" /></a>
     	</div><!--확인 취소-->
        </form>
        <c:if test="${ad != null}">
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<script src="/resources/js/vendor/jquery.ui.widget.js"></script>
<script src="/resources/js/jquery.iframe-transport.js"></script>
<script src="/resources/js/jquery.fileupload.js"></script>
<script>
$(function () {
    $('input:file').fileupload({
        dataType: 'json',
        url: '/community/imageupload.do',
        fail: function(e, error) {
        	// console.dir(e);
        	// console.dir(error);
        	alert('fail');
        },
        done: function (e, data) {
        	var result = $.parseJSON(data.jqXHR.responseText);
       		$("#photo").attr("src", result.file);
       		$("#hunter_photo").val(result.fileName);
        }
    });
});
</script>



<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
