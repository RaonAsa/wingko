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
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>

<script>
	$(document).ready(function(){
		page = Number("${list.page}");
		pageSize = Number("${list.pageSize}");
		currentBlock = Number("${list.currentBlock}");
		totalBlock = Number("${list.totalBlock}");
		startPageNum = Number("${list.startPageNum}");
		endPageNum = Number("${list.endPageNum}");
		
		$("#start_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
		$("#end_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
		
		// search function
		$("#btn_1day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_3day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			now.setDate(now.getDate() -3);
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_7day").click(function(){
			var now = new Date();
			$('#end_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
			now.setDate(now.getDate() -7);
			$('#start_date').val($.datepicker.formatDate($.datepicker.ATOM, now));
		});
		
		$("#btn_all").click(function(){
			$('#start_date').val("");
			$('#end_date').val("");
		});
		
		
		$("#chk_all").click(function(){
			var isCheck = $(this).is(":checked");
			$("input[name=chk_id]").prop("checked", isCheck);
		});
		
		
		
		
		var dialog = $('<div id="pop_dialog" style="overflow:hidden"></div>');
		
		$("#btn_mail_check").click(function(){
			var items = $("input[name=chk_id]:checked");
			var cnt = items.length;
			
			if(cnt == 0){
				alert("선택된 항목이 없습니다");
				return ;
			}
			
			var email_value = "";
			items.each(function(){
				var table_tr = $(this).closest("tr");
				var text_email = $("td[email]", table_tr).text();
				
				if(email_value == ""){
					email_value = text_email;
				}else{
					email_value += ", " + text_email;
				}
			});
			
			var dialog_url = "mail_form.do?mail_type=sel&to_addr=" + email_value;
			
			dialog.html('<iframe scrolling="yes" style="border: 0px; " src="' + dialog_url + '" width="100%" height="100%"></iframe>');
		    dialog.dialog({
		        modal: true,
		        show: "fade",
		        autoOpen: true,
		        resizable: false,
		        autoResize: false,
		        width: 820,
		        height: 600,
		        title: "메일 보내기",
		    });
			dialog.dialog('open');
			
		});
		

		$("#btn_mail_all").click(function(){
			var dialog_url = "mail_form.do?mail_type=all";
			
			dialog.html('<iframe scrolling="yes" style="border: 0px; " src="' + dialog_url + '" width="100%" height="100%"></iframe>');
		    dialog.dialog({
		        modal: true,
		        show: "fade",
		        autoOpen: true,
		        resizable: false,
		        autoResize: false,
		        width: 820,
		        height: 600,
		        title: "메일 보내기(전체)",
		    });
			dialog.dialog('open');
		});
		

		
		
	});

	
	function getParam(){
		var param = "&level=" + $("#level").val() + "&join_no=" + $("#join_no").val() + "&start_date=" + $("#start_date").val() + "&end_date=" + $("#end_date").val()  + "&search_id=" + $("#search_id").val(); 
		return param;
	}
	
	
	// 이전 페이지
	function prevPage(){
		if( currentBlock != 1 ){
			location.href = '?page='+(startPageNum-1) + getParam();
		}else{
			alert('이전 페이지가 없습니다.');
		}
	}
	
	// 다음  페이지
	function nextPage(){

		if( currentBlock != totalBlock && totalBlock != 0 ){ 
			location.href = '?page='+(endPageNum) + getParam();
		}else{
			alert('다음 페이지가 없습니다.');
		}
	}
	
	// 페이지 이동
	function goPage(goPage){
		location.href = '?page='+goPage + getParam();
	}
	
	
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">회원정보</div>
        <div class="sch">
	        <form id="frm_search" method="get">
			<table width="100%" >
				<colgroup>
                   <col width="10%" />
                   <col width="10%" />
                   <col width="10%" />
                   <col width="10%" />
                   <col width="60%" />
                </colgroup>
				<tr>
					<td>회원</td>
					<td>
						<form:select path="member.level" cssClass="txt01" cssStyle="width:120px;">
							<form:option value="0">전체</form:option>
							<form:option value="1">운영자</form:option>
							<form:option value="9">회원</form:option>
						</form:select>
					</td>
					<td>유입경로</td>
					<td>
						<form:select path="member.join_no" cssClass="txt01" cssStyle="width:120px;">
							<form:option value="">전체</form:option>
							<form:options items="${selectData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
					<td rowspan="2" align="center">
						아이디 <form:input path="member.search_id" cssClass="txt01" cssStyle="width:120px;" />
						<input type="submit" value="검색" class="black"/>
					</td>
				</tr>
				<tr>
					<td>가입기간</td>
					<td colspan="4">
						<input type="text" id="start_date" name="start_date" class="txt01" size="14"  value="${member.start_date}" /> ~ 
						<input type="text" id="end_date" name="end_date" class="txt01" size="14" value="${member.end_date}"/> 
						<input type="button" id="btn_1day" value="당일" class="glay_big"/>
						<input type="button" id="btn_3day" value="3일" class="glay_big"/>
						<input type="button" id="btn_7day" value="1주일" class="glay_big"/>
						<input type="button" id="btn_all" value="전체" class="glay_big"/>
					</td>
				</tr>
			</table>
			</form>
        </div>
		<div class="con">

            <div class="div_count">
            	총 <fmt:formatNumber value="${list.totalCount}" type="number" />  건
            </div>
            
            <table class="view">
            	<colgroup>
                    <col width="30" />
                    <col width="5%" />
                    <col width="8%" />
                    <col width="8%" />
                    <col width="8%" />
                    <col width="5%" />
                    <col width="10%" />
                    <col width="8%" />
                    <col width="19%" />
                    <col width="6%" />
                    <col width="6%" />
                    <col width="6%" />
                    <col width="" />
               </colgroup>
				<tr>
					<th><input type="checkbox" id="chk_all" name="chk_all" value="all" /></th>
					<th>No</th>
					<th>가입일</th>
					<th>ID</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>주소</th>
					<th>구매내역</th>
					<th>로그인횟수</th>
					<th>탈퇴여부</th>
					<th>유입경로</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) >0 }">
						<c:forEach items="${list }" var="data" varStatus="status">
							<tr class="height: 40px;">
								<td><input type="checkbox" name="chk_id" value="${data.user_no }" /></td>
								<td>
									<%-- ${data.user_no} --%>
									${list.totalCount - ((list.page - 1) *list.pageSize) - status.index }
								</td>
								<td>${fn:substring(data.reg_date, 0, 16)}</td>
								<td><a href="write.do?user_no=${data.user_no}&page=${list.page}">${data.user_id}</a></td>
								<td>${data.user_password}</td>
								<td>${data.user_name}</td>
								<td>${data.email}</td>
								<td>${data.phone}</td>
								<td>${data.province} ${data.city} ${data.area} ${data.address}</td>
								<td>구매내역</td>
								<td>${data.login_count}</td>
								<td>
									<c:if test="${data.leave == 'Y' }">탈퇴</c:if>
								</td>
								<td>${data.title}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="12" style="height: 200px">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>

			<!-- page nav -->
			<div class="Pageing">
				<a href="javascript:goPage(1)"><img src="/resources/admin/img/icon_first.png" alt="첫페이지로" /></a> 
				<a href="javascript:prevPage()"><img src="/resources/admin/img/btn_icon_prev.gif" /></a>
				<span>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach var="i" begin="${list.startPageNum}" end="${list.endPageNum}" step="1">
								<c:if test="${!(i > list.totalPage) && !(i == list.endPageNum)}">
									<c:if test="${i > list.startPageNum}"><span class='dotted'>.</span></c:if>
									<c:choose>
						    			<c:when test="${i == list.page}">
											<a href='javascript:goPage(${i})'><strong style='color:#dd0709;'>${i}</strong></a>
										</c:when>
							    		<c:otherwise>
							    			<a href='javascript:goPage(${i})'>${i}</a>
							    		</c:otherwise>
						    		</c:choose>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>1</c:otherwise>
					</c:choose>
				</span>
				<a href="javascript:nextPage()"><img src="/resources/admin/img/btn_icon_next.gif" /></a> 
				<a href="javascript:goPage(${list.totalPage })"><img src="/resources/admin/img/icon_end.png" alt="마지막페이지로" /></a>
			</div>
			
			<div class="bt03" style="text-align:left;">
	 			<div id="btn_mail_check" class="black">선택메일</div>
	 			<div id="btn_mail_all" class="black">전체메일</div>
	 		</div>

 		</div>
 		
 		
    </div>
    

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>
</body>
</html>
