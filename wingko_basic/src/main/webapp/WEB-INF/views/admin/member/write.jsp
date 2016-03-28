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
<title>윙코스토리 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			if (confirm("내용을 수정 하시겠습니까?")) {
				$("form").submit();				
			}
		});

		$("#cancel").click(function(){
			history.back(-1);
		});
	});
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">회원정보</div>
		<div class="con">
			<form method="post">
			<form:input path="member.user_no" type="hidden"/>
			<form:input path="member.page" type="hidden"/>
<!-- 	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<div id="submit" class="blue_big">수 정</div>
	 		</div> -->
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<th>수정</th>
					<td>
						등급 
						<form:select path="member.level">
							<form:option value="1">운영자</form:option>
							<form:option value="9">일반회원</form:option>
						</form:select>
						탈퇴 
						<form:select path="member.leave">
							<form:option value="Y">탈퇴상태로</form:option>
							<form:option value="N">가입상태로</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${member.user_id}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${member.user_password}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.user_name}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${member.user_nickname}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.email}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:if test="${member.sex == 'M' }">남자</c:if>
						<c:if test="${member.sex == 'F' }">여자</c:if>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${member.phone }</td>
				</tr>
				<tr>
					<th>로그인</th>
					<td>
						로그인 ${member.login_count} 회, 마지막 로그인 ${member.last_login} 
					</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${member.edit_date }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${member.reg_date }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>성: ${member.province}, 도시: ${member.city}, 지역: ${member.area}</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>${member.address}</td>
				</tr>
				<tr>
					<th>가입경로</th>
					<td>${member.title}</td>
				</tr>
			</table>
			</form>
	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<div id="submit" class="blue_big">수 정</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


</body>
</html>
