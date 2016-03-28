<%--
  - 작성자   ysh
  - 작성일자 2013. 7. 24.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- <script src="/resources/js/jquery-1.9.1.js"></script> -->
<script>
	$(document).ready(function(){
		$(".menu_b").click(function(){
			var _this = $(this);
			var _menu = _this.parent().next(".menu_s");
			
			if(_menu.css("display") == "none"){
				_menu.show();
			}else{
				_menu.hide();
			}
			return false;
		});
		
		
		$(".menu_s").hide();
		$("li.sel").closest(".menu_s").show();
/* 		$("#menu01").click(function(){
			$("#sub01").toggle();
		}); */
	});
</script>

	<div id="Top"><!--Title-->
    	<a href="#"><img src="/resources/admin/img/top_logo.gif" alt="윙코" /></a>
    </div>

   <div id="Menu"><!--Left Menu-->
    	<div class="hello">관리자님 환영합니다 <a href="/admin/logout.do">로그아웃</a></div>
<!--         <div class="mybtn">
        	<a href="/admin/logout.do"><img src="/resources/admin/img/bt_logout.gif" alt="로그아웃" /></a><a href="../member/info.html"><img src="/resources/admin/img/bt_info.gif" alt="내정보" /></a>
        </div> -->
        <!-- <a href="#"><div class="menu_b">사이트관리</div></a> -->
<!--        <ul class="menu_s">
          	<li><a href="#">메뉴관리</a></li>
            <li><a href="#">템플릿관리</a></li>
            <li><a href="#">모듈관리</a></li>
        </ul>
-->     
		<a href="#"><div class="menu_b">회원관리</div></a>
        <ul class="menu_s">
        	<c:choose>
        		<c:when test="${leftMenu == '1'}"><li class="sel">회원관리</li></c:when>
        		<c:otherwise><li><a href="/admin/member/list.do">회원관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '2'}"><li class="sel">유입경로관리</li></c:when>
        		<c:otherwise><li><a href="/admin/member/join_list.do">유입경로관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '3'}"><li class="sel">메일발송내역</li></c:when>
        		<c:otherwise><li><a href="/admin/member/mail_list.do">메일발송내역</a></li></c:otherwise>
        	</c:choose>
            <!-- <li><a href="#">회원관리(특정사이트링크)</a></li>
          	<li><a href="#">메일관리</a></li>
          	<li><a href="#">SMS관리</a></li> -->
        </ul>
        
		<a href="#"><div class="menu_b">커뮤니티관리</div></a>
        <ul class="menu_s">
        	<c:choose>
        		<c:when test="${leftMenu == '31'}"><li class="sel">공지관리</li></c:when>
        		<c:otherwise><li><a href="/admin/community/notice.do">공지관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '32'}"><li class="sel">웹툰/게임/블로그</li></c:when>
        		<c:otherwise><li><a href="/admin/community/list.do">웹툰/게임/블로그</a></li></c:otherwise>
        	</c:choose>
			<c:choose>
        		<c:when test="${leftMenu == '33'}"><li class="sel">문의게시판</li></c:when>
        		<c:otherwise><li><a href="/admin/community/qna.do">문의게시판</a></li></c:otherwise>
        	</c:choose>
			<c:choose>
        		<c:when test="${leftMenu == '34'}"><li class="sel">댓글관리</li></c:when>
        		<c:otherwise><li><a href="/admin/community/userreply.do">댓글관리</a></li></c:otherwise>
        	</c:choose>
        </ul>

        <a href="#"><div class="menu_b">정보관리</div></a>
        <ul class="menu_s">
        	<c:choose>
        		<c:when test="${leftMenu == '5'}"><li class="sel">지역별정보</li></c:when>
        		<c:otherwise><li><a href="/admin/travel/list.do">지역별정보</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '11'}"><li class="sel">한국여행정보</li></c:when>
        		<c:otherwise><li><a href="/admin/travel/info_list.do">한국여행정보</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '15'}"><li class="sel">각종정보에디터</li></c:when>
        		<c:otherwise><li><a href="/admin/info/list.do">각종정보에디터</a></li></c:otherwise>
        	</c:choose>
        </ul>
        <a href="#"><div class="menu_b">지역&카테고리관리</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '8'}"><li class="sel">지역관리</li></c:when>
        		<c:otherwise><li><a href="/admin/location/list.do">지역관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '6'}"><li class="sel">HotPlace</li></c:when>
        		<c:otherwise><li><a href="/admin/location/hotplace.do">HotPlace</a></li></c:otherwise>
        	</c:choose>
			<c:choose>
        		<c:when test="${leftMenu == '9'}"><li class="sel">분류관리</li></c:when>
        		<c:otherwise><li><a href="/admin/category/list.do">분류관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '7'}"><li class="sel">분류>지역안내</li></c:when>
        		<c:otherwise><li><a href="/admin/category/category_location.do?category_no=8">분류>지역안내</a></li></c:otherwise>
        	</c:choose>
        </ul>
        <a href="#"><div class="menu_b">뉴스관리</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '13'}"><li class="sel">뉴스관리</li></c:when>
        		<c:otherwise><li><a href="/admin/news/list.do">뉴스관리</a></li></c:otherwise>
        	</c:choose>
        </ul>
        
		<a href="#"><div class="menu_b">회사관리</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '16'}"><li class="sel">언론기사관리</li></c:when>
        		<c:otherwise><li><a href="/admin/company/news.do">언론기사관리</a></li></c:otherwise>
        	</c:choose>
			<c:choose>
        		<c:when test="${leftMenu == '17'}"><li class="sel">문의</li></c:when>
        		<c:otherwise><li><a href="/admin/company/question.do">문의</a></li></c:otherwise>
        	</c:choose>
        </ul>
        	
        <a href="#"><div class="menu_b">광고관리</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '12'}"><li class="sel">광고관리</li></c:when>
        		<c:otherwise><li><a href="/admin/ad/list.do">광고관리</a></li></c:otherwise>
        	</c:choose>
        </ul>
        <a href="#"><div class="menu_b">실시간검색어</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '14'}"><li class="sel">실시간검색어</li></c:when>
        		<c:otherwise><li><a href="/admin/ad/word_list.do">실시간검색어</a></li></c:otherwise>
        	</c:choose>
        </ul>
        <a href="#"><div class="menu_b">상품(상점)관리</div></a>
        <ul class="menu_s">
			<c:choose>
        		<c:when test="${leftMenu == '10'}"><li class="sel">상품등록/관리</li></c:when>
        		<c:otherwise><li><a href="/admin/store/list.do">상품등록/관리</a></li></c:otherwise>
        	</c:choose>
        	<c:choose>
        		<c:when test="${leftMenu == '19'}"><li class="sel">이달의 딜</li></c:when>
        		<c:otherwise><li><a href="/admin/deal/main.do">이달의 딜</a></li></c:otherwise>
        	</c:choose>
<!--             <li><a href="#">상점쿠폰관리</a></li>
          	<li><a href="#">노출관리</a></li>
          	<li><a href="#">상점통계</a></li>
          	<li><a href="#">삭제리스트</a></li> -->
        </ul>
<!-- 		<a href="#"><div class="menu_b">페이지관리</div></a>
		<ul class="menu_s">
			<li><a href="#">주요명소</a></li>
			<li><a href="#">추천명소</a></li>
			<li><a href="#">광고성기사</a></li>
			<li><a href="#">뉴스등록</a></li>
			<li><a href="#">팝업페이지</a></li>
			<li><a href="#">페이지추가</a></li>
			<li><a href="#">페이지삭제함</a></li>
		</ul> -->
       <!-- <a href="#"><div class="menu_b">게시판관리</div></a> -->
<!--        <ul class="menu_s">
            <li><a href="#">공지사항</a></li>
          	<li><a href="#">커뮤니티</a></li>
          	<li><a href="#">웹툰</a></li>
          	<li><a href="#">장터</a></li>
          	<li><a href="#">취업게시판</a></li>
          	<li><a href="#">문의게시판</a></li>
        </ul>
-->       <!-- <a href="#"><div class="menu_b">쿠폰관리</div></a>
        <ul class="menu_s">
            <li><a href="#">쿠폰등록변경</a></li>
        </ul>
       <a href="#"><div class="menu_b">광고관리</div></a> -->
<!--        <ul class="menu_s">
            <li><a href="#">광고배너등록/변경</a></li>
        </ul>
-->       
		<a href="#"><div class="menu_b">구매관리</div></a>
        <ul class="menu_s">
       	<c:choose>
       		<c:when test="${leftMenu == '21'}"><li class="sel">무통장입금관리</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/paybank.do">무통장입금관리</a></li></c:otherwise>
       	</c:choose>
       	<c:choose>
       		<c:when test="${leftMenu == '22'}"><li class="sel">카드결제내역</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/paycard.do">카드결제내역</a></li></c:otherwise>
       	</c:choose>
       	<c:choose>
       		<c:when test="${leftMenu == '23'}"><li class="sel">예약관리</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/payreserve.do">예약관리</a></li></c:otherwise>
       	</c:choose>
       	<c:choose>
       		<c:when test="${leftMenu == '24'}"><li class="sel">이달의딜</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/paydeal.do">이달의딜</a></li></c:otherwise>
       	</c:choose>
       	<c:choose>
       		<c:when test="${leftMenu == '25'}"><li class="sel">취소내역</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/paycancel.do">취소내역</a></li></c:otherwise>
       	</c:choose>
		<c:choose>
       		<c:when test="${leftMenu == '29'}"><li class="sel">매출통계</li></c:when>
       		<c:otherwise><li><a href="/admin/paymgr/pay_acount.do">매출통계</a></li></c:otherwise>
       	</c:choose>
        </ul>
        
        <a href="#"><div class="menu_b">기타관리</div></a>
        <ul class="menu_s">
       	<c:choose>
       		<c:when test="${leftMenu == '91'}"><li class="sel">윙쇼기념일</li></c:when>
       		<c:otherwise><li><a href="/admin/etc/wing_calendar.do">윙쇼기념일</a></li></c:otherwise>
       	</c:choose>
       	<c:choose>
       		<c:when test="${leftMenu == '92'}"><li class="sel">기타정보</li></c:when>
       		<c:otherwise><li><a href="/admin/etc/wingko_info.do">기타정보</a></li></c:otherwise>
       	</c:choose>
        </ul>
        
		<a href="#"><div class="menu_b">통계관리</div></a>
        <ul class="menu_s">
            <li><a href="http://www.google.com/analytics/" target="_blank">구글통계</a></li>
            <li><a href="https://www.google.com/webmasters/tools/" target="_blank">구글웹마스터</a></li>
        </ul>
        

    </div>