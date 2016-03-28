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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>

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
<script>
	$(document).ready(function(){
		var result = "${result}";
		if (result.length > 0) {
			if (result == "1") {
				alert('담당 부서로 전달 되었습니다.\r확인 후 연락드리겠습니다.');
				location.href="/company/question.do";
			} else {
				alert('에러');
				location.href="/company/question.do";
			}
		}


		$("input[name='file']").change(function(){
			var file = this.files[0],
				maxSize = 1024 * 1024 * 20,
				size = file.size,
				name = file.name;
			// console.dir(file);
			//alert("size ::: " + size);
			//alert("name ::: " + name);
			/* if ( name.indexOf("jpg") > -1 || name.indexOf("JPG") > -1 
					|| name.indexOf("jpeg") > -1 || name.indexOf("JPEG") > -1 ) {
				// OK
			} else {
				// NOT OK
				alert('jpg, jpeg 파일만 업로드 가능합니다.');
				$(this).val('');
				return;
			} */

			if (size > maxSize) {
				alert('20M 이하 이미지만 업로드 가능합니다.');
				$(this).val('');
				return;
			}
		});

	});
	
	
	function frm_submit() {
		$("#frm").submit();
	}

</script>
</head>

<body>
<div id="Wrapper">


	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />
	
	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li><a href="main.do"><li>회사소개</li></a><li class="end">문의하기</li>
        </ul>
        <div class="sub_tit"><img src="/resources/img/title/tit_question.png" alt="문의하기" /></div><!--title-->

		<form id="frm" name="frm" enctype="multipart/form-data" method="post">
		<table class="question_write">
        	<caption>문의하기</caption>
            <colgroup>
            	<col width="25%" />
                <col width="75%" />
            </colgroup>
            <tr>
            	<th>문의주제 <span>*</span></th>
                <td>
                	<form:select path="company.question_category">
                		<form:option value="1">일반문의</form:option>
                		<form:option value="2">광고문의</form:option>
                		<form:option value="3">콘텐츠구입문의</form:option>
                		<form:option value="4">제휴제안</form:option>
                	</form:select>
                </td>
            </tr>
            <tr>
            	<th>회사명 <span>*</span></th>
                <td><form:input path="company.company" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>담당자명 <span>*</span></th>
                <td><form:input path="company.name" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>회사 홈페이지 URL</th>
                <td><form:input path="company.url" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>E-Mail <span>*</span></th>
                <td><form:input path="company.email" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>연락처 <span>*</span></th>
                <td><form:input path="company.phone" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>제목 <span>*</span></th>
                <td><form:input path="company.title" cssClass="txt" /></td>
            </tr>
            <tr>
            	<th>내용 <span>*</span></th>
                <td>콘텐츠·기사내용에 관한 문의의 경우, 해당 콘텐츠에 대해 자세히 기입해 주십시오.<br/><br/>
                	<form:textarea path="company.content" cssClass="txtarea2"/>
                </td>
            </tr>
            <tr>
            	<th>첨부</th>
                <td>
                	<form:input path="company.file" type="file" cssClass="bt_st" cssStyle="width:80%;"/>
                	<!-- <input type="button" value="파일첨부" class="bt_st" /> <input type="text" class="txt" style="width:80%;" /> --><br/><br/>20Mbyte 초과하면 첨부되지 않습니다.
				</td>
            </tr>
        </table>
        <br/>
        <h4>보내주신 내용에 대해 담당 부서로 전달 후 연락드리겠습니다.</h4>
        <div class="bt_center" style="margin-top:30px;"><a href="#" onclick="frm_submit();"><img src="/resources/img/button/btn_send.png" alt="보내기(打发)" /></a></div>
        </form>
   </div>
    
    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />

</body>
</html>
