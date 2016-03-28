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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			if (confirm("내용을 입력/수정 하시겠습니까?")) {
				$("form").submit();				
			}
		});

		$("#cancel").click(function(){
			history.back(-1);
		});

		$("#delete").click(function(){
			if (confirm('삭제하시겠습니까?')) {
				location.href='delete.do?store_no=${store.store_no}';
			} else {
				return;
			}
		});

		//$("#fileupload").hide();
	});
</script>
</head>
<body>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">지역관리</div>
		<div class="con">
			<form method="post" <c:if test="${store.store_no > 0 }">action="/admin/store/update.do"</c:if> enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}"/>
			<c:if test="${store.store_no > 0 }">
				<form:input path="store.store_no" type="hidden"/>
			</c:if>
			<input type="hidden" name="org_location_no" value="${org_location_no }" />
			<input type="hidden" name="org_category_no" value="${org_category_no }" />
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
				</colgroup>
				<c:if test="${store.store_no > 0 }">
					<tr>
						<th>노출</th>
						<td colspan="5">
							<form:select path="store.use_flag" cssClass="txt01">
								<form:option value="Y">공개</form:option>
								<form:option value="N">비공개</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>상호명</th>
					<td colspan="5"><form:input path="store.title" cssClass="txt01" cssStyle="width:70%;"/> <!-- (31/100) --></td>
				</tr>
				<tr>
					<th>한줄설명</th>
					<td colspan="5"><form:input path="store.description" cssClass="txt01" cssStyle="width:70%;"/></td>
				</tr>
				<tr>
					<th rowspan="2">카테고리 분류</th>
					<td>지역</td>
					<td colspan="4">
						<form:select path="store.location_no" cssStyle="margin-right:150px;">
							<form:option value="">지역선택</form:option>
							<form:options items="${locationData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td colspan="4"> 
						<form:select path="store.category_no" cssStyle="margin-right:150px;">
							<form:option value="">카테고리선택</form:option>
							<form:options items="${categoryData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
<%-- 				<tr>
					<th rowspan="2">이미지등록</th>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image_thumb" class="input_file" /><form:input path="store.image_thumb" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image" class="input_file" /><form:input path="store.image" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image1" class="input_file" /><form:input path="store.image1" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image2" class="input_file" /><form:input path="store.image2" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image3" class="input_file" /><form:input path="store.image3" type="hidden" /></span></a>
						</div>
					</td>
				</tr>
				<tr>
					<td class="pic_t">리스트썸네일(필수)</td>
					<td class="pic_t">고정이미지(필수)</td>
					<td class="pic_t">추가이미지1</td>
					<td class="pic_t">추가이미지2</td>
					<td class="pic_t">추가이미지3</td>
				</tr> --%>
				<tr>
					<th>리스트썸네일(필수)(150x95)</th>
					<td colspan="5">
						<form:input path="store.image_thumb" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image_thumb != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image_thumb}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>고정이미지(필수)(760x340)</th>
					<td colspan="5">
						<form:input path="store.image" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>추가이미지1(760x340)</th>
					<td colspan="5">
						<form:input path="store.image1" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image1 != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image1}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>추가이미지2(760x340)</th>
					<td colspan="5">
						<form:input path="store.image2" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image2 != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image2}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>추가이미지3(760x340)</th>
					<td colspan="5">
						<form:input path="store.image3" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image3 != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image3}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>지도 이미지(필수)(80x80)</th>
					<td colspan="5">
						<form:input path="store.image_map" type="file" cssClass="txt01" cssStyle="width:30%;"/>
						<c:if test="${store.image_map != ''}">현재 이미지 <img class="img50" src="/upload/store/${store.image_map}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>주소입력</th>
					<td colspan="5"><form:input path="store.address" cssClass="txt01" cssStyle="width:70%;" /> </td>
				</tr>
				<tr>
					<th>전화번호1</th>
					<td colspan="5"><form:input path="store.tel" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>전화번호2</th>
					<td colspan="5"><form:input path="store.tel2" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="5"><form:input path="store.email" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td colspan="5"><form:input path="store.office_hour" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>휴일</th>
					<td colspan="5"><form:input path="store.holiday" cssClass="txt01" cssStyle="width:50%;"/></td>
				</tr>
				<tr>
					<th>가능외국어서비스</th>
					<td colspan="5">
						<span><input id="language_service1" name="language_service" type="checkbox" value="중국어" <c:if test="${fn:indexOf(store.language_service, '중국어') >= 0 }">checked</c:if>/><label for="language_service1"> 중국어 &nbsp;&nbsp;</label></span>
						<span><input id="language_service2" name="language_service" type="checkbox" value="영어" <c:if test="${fn:indexOf(store.language_service, '영어') >= 0 }">checked</c:if>/><label for="language_service2"> 영어 &nbsp;&nbsp;</label></span>
						<span><input id="language_service3" name="language_service" type="checkbox" value="일어" <c:if test="${fn:indexOf(store.language_service, '일어') >= 0 }">checked</c:if>/><label for="language_service3"> 일어 &nbsp;&nbsp;</label></span>
						<span><label for="language_service4"> 기타&nbsp;&nbsp;</label><input id="language_service4" name="language_service_etc" type="text" value="${language_service_etc }" class="txt01" style="width:40%;"/></span>
					</td>
				</tr>
				<tr>
					<th>지불방법</th>
					<td colspan="5">
						<span><input id="payment1" name="payment" type="checkbox" value="위안화" <c:if test="${fn:indexOf(store.payment, '위안화') >= 0 }">checked</c:if> /><label for="payment1"> 위안화 &nbsp;&nbsp;</label></span>
						<span><input id="payment2" name="payment" type="checkbox" value="달러"  <c:if test="${fn:indexOf(store.payment, '달러') >= 0 }">checked</c:if> /><label for="payment2"> 달러 &nbsp;&nbsp;</label></span>
						<span><label for="payment3"> 기타&nbsp;&nbsp;</label><input id="payment3" name="payment_etc" type="text" value="${payment_etc }" class="txt01" style="width:40%;"/></span>
					</td>
				</tr>
				<tr>
					<th rowspan="3">교통안내</th>
					<td colspan="5" class="noline2">지하철 <form:input path="store.traffic_subway" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<td colspan="5" class="noline2">버스 &nbsp;&nbsp; <form:input path="store.traffic_bus" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<td colspan="5" >택시 &nbsp;&nbsp; <form:input path="store.traffic" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<th>추가정보</th>
					<td colspan="5"><form:input path="store.etc" cssClass="txt01" cssStyle="width:90%;"/></td>
				</tr>
<%-- 				<tr>
					<th>쿠폰</th>
					<td colspan="5"><!-- <div class="black">등록</div> -->
						<div style="width: 100%; height: 100%; position: relative;">
							<span class="span_coupon_file" ><input type="file" name="coupon_image" class="input_coupon_file" /><form:input path="store.coupon_image" type="hidden" /></span>
						</div> 
					<form:input path="store.coupon_image" type="file" cssClass="txt01" cssStyle="width:400px;" />
					</td>
				</tr> --%>
				<tr>
					<th>위치</th>
					<td colspan="5">위도 <form:input path="store.x" cssClass="txt01" cssStyle="width:200px;" /> 경도 <form:input path="store.y" cssClass="txt01" cssStyle="width:200px;" /> </td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="5" class="edit">※ 이미지 가로 762 이하로 올리세요.<br /><form:textarea path="store.content" cols="100" rows="20"/></td>
				</tr>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<%-- <c:if test="${store.store_no > 0 }">
	 				<div id="delete" class="blue_big">삭 제</div>
	 			</c:if> --%>
	 			<!-- <div id="view" class="bold_big">미리보기</div> -->
	 			<div id="submit" class="blue_big">입 력</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>


<script>
	CKEDITOR.replace('content', {
		filebrowserUploadUrl: '/admin/store/imageupload_editor.do'
	});
</script>


</body>
</html>
