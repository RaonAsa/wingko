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
	function list(){
		location.href = "job.do?job_type=${job.job_type}&page=${job.page}&search_type=${job.search_type}&search_string=${job.search_string}";
	}
	
	function write(){
		if ($("#pwd").val() == '') {
			alert(m.password.blank);
			$("#pwd").focus();
		} else {
			location.href = "job_write.do?page=${job.page}&job_no=${job.job_no}&job_type=${job.job_type}&pwd="+$("#pwd").val();	
		}
	}
	
	function deletes(){
		if ($("#pwd").val() == '') {
			alert(m.password.blank);
			$("#pwd").focus();
		} else {
			location.href = "job_delete.do?page=${job.page}&job_no=${job.job_no}&job_type=${job.job_type}&pwd="+$("#pwd").val();	
		}
	}
	
	function print(){
		window.open("/wingshow/print_view.do", "print", "width=795, height=650, left=0, top=0, scrollbars=yes");
		return false;
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
        <ul class="job_tab">
        	<li class="first"><a href="job.do?job_type=company"><img src="/resources/img/menu/job_tab01<c:if test="${job.job_type == 'company' }">_on</c:if>.png" class="招聘" /></a></li><!--구인-->
            <li class="end"><a href="job.do?job_type=hunting"><img src="/resources/img/menu/job_tab02<c:if test="${job.job_type == 'hunting' }">_on</c:if>.png" alt="求职" /></a></li><!--구직-->
        </ul>
        <table class="board_write" print_view>
        	<caption>구직 뷰</caption>
            <colgroup>
            	<col width="10%" />
                <col width="40%" />
            	<col width="10%" />
                <col width="40%" />
            </colgroup>
            <tr>
            	<th>标题</th><!--제목-->
                <td class="blue">${job.title}</td>
            	<th>作者</th><!--작성자-->
                <td>${job.writer}</td>
            </tr>
            <tr>
            	<th>公司名称</th><!--이름-->
                <td>${job.hunter_name}</td>
            	<th>照片</th><!--사진-->
                <td>
                	<c:choose>
                		<c:when test="${fn:length(job.hunter_photo) > 0 }"><img src="/upload/community/${job.hunter_photo}" alt="photo" style="width: 79px; height: 66px;" /></c:when>
                		<c:otherwise><img src="/resources/img/basic_photo.png" alt="photo" /></c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <tr>
            	<th>希望收入</th><!--희망연봉-->
                <td>${job.hunter_pay}</td>
            	<th>邮箱</th><!--이메일-->
                <td>${job.hunter_email}</td>
            </tr>
            <tr>
            	<th>学历</th><!--학력사항-->
                <td colspan="3">
                	<ul>
                    	<c:if test="${job.hunter_education1 != ''}"><li>${job.hunter_education1}</li></c:if>
                    	<c:if test="${job.hunter_education2 != ''}"><li>${job.hunter_education2}</li></c:if>
                    	<c:if test="${job.hunter_education3 != ''}"><li>${job.hunter_education3}</li></c:if>
                    	<c:if test="${job.hunter_education4 != ''}"><li>${job.hunter_education4}</li></c:if>
                    	<c:if test="${job.hunter_education5 != ''}"><li>${job.hunter_education5}</li></c:if>
                    </ul>
                </td>
            </tr>
            <tr>
            	<th>经理</th><!--경력사항-->
                <td colspan="3">
                	<ul>
                		<c:if test="${job.hunter_career1 != ''}"><li>${job.hunter_career1}</li></c:if>
                		<c:if test="${job.hunter_career2 != ''}"><li>${job.hunter_career2}</li></c:if>
                		<c:if test="${job.hunter_career3 != ''}"><li>${job.hunter_career3}</li></c:if>
                		<c:if test="${job.hunter_career4 != ''}"><li>${job.hunter_career4}</li></c:if>
                		<c:if test="${job.hunter_career5 != ''}"><li>${job.hunter_career5}</li></c:if>
                    </ul>
                </td>
            </tr>
            <tr>
            	<th>自我介绍</th><!--자기소개-->
                <td colspan="3"><div class="txtarea2" style="overflow: auto;">${job.hunter_about}</div></td>
            </tr>
            <tr>
            	<th>密码</th><!--비밀번호-->
                <td colspan="3"><input type="password" name="pwd" id="pwd" class="txt" style="width: 100px;" /></td>
            </tr>
     </table>
        <div class="bt_right" style="margin-top:10px;">
        	<a href="javascript:deletes();"><img src="/resources/img/button/btn_delete.png" alt="删除삭제" /></a>
        	<a href="javascript:write();"><img src="/resources/img/button/bt_modify.png" alt="修改内容" /></a> 
        	<a href="javascript:print();"><img src="/resources/img/button/btn_print.png" alt="打印" /></a> 
        	<a href="javascript:list();"><img src="/resources/img/button/bt_list.png" alt="目录" /></a>
        </div><!--수정, 인쇄, 목록-->
        <table class="prev_next">
        	<caption>이전글, 다음글</caption>
            <colgroup>
            	<col width="3%" />
                <col width="8%" />
                <col width="79%" />
            </colgroup>
            <c:if test="${prev.job_no > 0 }">
	            <tr>
	            	<td <c:if test="${!(next.job_no > 0) }">class="bottom"</c:if>><img src="/resources/img/icon/prev_list.png" alt="prev" /></td>
	                <td <c:if test="${!(next.job_no > 0) }">class="bottom"</c:if>>上一篇</td><!--이전글-->
	                <th <c:if test="${!(next.job_no > 0) }">class="bottom"</c:if>><a href="?page=${job.page}&job_type=${job.job_type}&job_no=${prev.job_no}&search_type=${job.search_type}&search_string=${job.search_string}">${prev.title}</a></th><!--이전글이 없습니다.--> 
	            </tr>
            </c:if>
            <c:if test="${next.job_no > 0 }">
	            <tr>
	            	<td class="bottom"><img src="/resources/img/icon/next_list.png" alt="next" /></td>
                	<td class="bottom">下一篇</td><!--다음글-->
	                <th class="bottom"><a href="?page=${job.page}&job_type=${job.job_type}&job_no=${next.job_no}&search_type=${job.search_type}&search_string=${job.search_string}">${next.title}</a></th><!--无下一篇 다음글이 없습니다.--> 
	            </tr>
            </c:if>
        </table>
        <c:if test="${ad != null}">
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" class="space4"/></a>
        </c:if>
    </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
