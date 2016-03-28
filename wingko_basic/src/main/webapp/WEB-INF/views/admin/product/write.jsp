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
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/wingko.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			if (confirm("내용을 입력/수정 하시겠습니까?")) {
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				$("form").submit();				
			}
		});

		$("#cancel").click(function(){
			history.back(-1);
		});

		$("#delete").click(function(){
			if (confirm(m.confirm.deletes)) {
				location.href='delete.do?product_no=${product.product_no}';
			} else {
				return;
			}
		});

		//$("#fileupload").hide();
	});
</script>
</head>
<div id="Wrapper">

	<!-- Left Menu(s) -->
	<c:import url="../leftmenu.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->

    <div id="Content"><!--Content-->
    	<div class="tit">지역관리</div>
		<div class="con">
			<form method="post" <c:if test="${product.product_no > 0 }">action="/admin/product/update.do"</c:if>>
			<c:if test="${product.product_no > 0 }">
				<form:input path="product.product_no" type="hidden"/>
			</c:if>
			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
				</colgroup>
				<tr>
					<th>상호명</th>
					<td colspan="5"><form:input path="product.title" cssClass="txt01" cssStyle="width:90%;"/> (31/100)</td>
				</tr>
				<tr>
					<th>카테고리 분류</th>
					<td colspan="5">
						지역 
						<form:select path="product.location_id" cssStyle="margin-right:150px;">
							<form:option value="">지역선택</form:option>
							<form:options items="${locationData}" itemLabel="title" itemValue="value" />
						</form:select>
						카테고리 
						<form:select path="product.category_id" cssStyle="margin-right:150px;">
							<form:option value="">카테고리선택</form:option>
							<form:options items="${categoryData}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th rowspan="2">이미지등록</th>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image_thumb" class="input_file" /><form:input path="product.image_thumb" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image" class="input_file" /><form:input path="product.image" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image1" class="input_file" /><form:input path="product.image1" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image2" class="input_file" /><form:input path="product.image2" type="hidden" /></span></a>
						</div>
					</td>
					<td class="pic">
						<div style="width: 100%; height: 100%; position: relative;">
							<a href="#"><span class="span_file" ><input type="file" name="file_image3" class="input_file" /><form:input path="product.image3" type="hidden" /></span></a>
						</div>
					</td>
				</tr>
				<tr>
					<td class="pic_t">리스트이미지(필수)</td>
					<td class="pic_t">고정이미지(필수)</td>
					<td class="pic_t">추가이미지1</td>
					<td class="pic_t">추가이미지2</td>
					<td class="pic_t">추가이미지3</td>
				</tr>
				<tr>
					<th>주소입력</th>
					<td colspan="5"><div class="black">우편번호</div> <form:input path="product.address1" cssClass="txt01" cssStyle="width:200px;" /> <form:input path="product.address2" cssClass="txt01" cssStyle="width:200px;" /> </td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="5"><form:input path="product.tel" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="5"><form:input path="product.email" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td colspan="5"><form:input path="product.office_hour" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>휴일</th>
					<td colspan="5"><form:input path="product.holiday" cssClass="txt01" cssStyle="width:200px;"/></td>
				</tr>
				<tr>
					<th>가능외국어서비스</th>
					<td colspan="5">
						<span><input id="language_service1" name="language_service" type="checkbox" value="중국어" <c:if test="${fn:indexOf(product.language_service, '중국어') >= 0 }">checked</c:if>/><label for="language_service1"> 중국어 &nbsp;&nbsp;</label></span>
						<span><input id="language_service2" name="language_service" type="checkbox" value="영어" <c:if test="${fn:indexOf(product.language_service, '영어') >= 0 }">checked</c:if>/><label for="language_service2"> 영어 &nbsp;&nbsp;</label></span>
						<span><input id="language_service3" name="language_service" type="checkbox" value="일어" <c:if test="${fn:indexOf(product.language_service, '일어') >= 0 }">checked</c:if>/><label for="language_service3"> 일어 &nbsp;&nbsp;</label></span>
						<span><label for="language_service4"> 기타외국어입력 &nbsp;&nbsp;</label><input id="language_service4" name="language_service" type="text" value="${language_service_etc }" class="txt01"/></span>
					</td>
				</tr>
				<tr>
					<th>지불방법</th>
					<td colspan="5">
						<span><input id="payment1" name="payment" type="checkbox" value="위안화" <c:if test="${fn:indexOf(product.payment, '위안화') >= 0 }">checked</c:if> /><label for="payment1"> 위안화 &nbsp;&nbsp;</label></span>
						<span><input id="payment2" name="payment" type="checkbox" value="달러"  <c:if test="${fn:indexOf(product.payment, '달러') >= 0 }">checked</c:if> /><label for="payment2"> 달러 &nbsp;&nbsp;</label></span>
						<span><label for="payment3"> 기타 &nbsp;&nbsp;</label><input id="payment3" name="payment" type="text" value="${payment_etc }" class="txt01"/></span>
					</td>
				</tr>
				<tr>
					<th rowspan="3">교통안내</th>
					<td colspan="5" class="noline2">지하철 <form:input path="product.traffic_subway" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<td colspan="5" class="noline2">버스 &nbsp;&nbsp; <form:input path="product.traffic_bus" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<td colspan="5">기타 &nbsp;&nbsp; <form:input path="product.traffic" cssClass="txt01" cssStyle="width:600px;"/></td>
				</tr>
				<tr>
					<th>추가정보</th>
					<td colspan="5"><form:input path="product.etc" cssClass="txt01" cssStyle="width:90%;"/></td>
				</tr>
				<tr>
					<th>쿠폰</th>
					<td colspan="5"><div class="black">등록</div> 
					<form:input path="product.coupon_image" type="file" cssClass="txt01" cssStyle="width:400px;" />
					</td>
				</tr>
				<tr>
					<th>위치</th>
					<td colspan="5">위도 <form:input path="product.x" cssClass="txt01" cssStyle="width:200px;" /> 경도 <form:input path="product.y" cssClass="txt01" cssStyle="width:200px;" /> </td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="5" class="edit"><form:textarea path="product.content" cols="100" rows="20"/></td>
				</tr>
				<c:if test="${product.product_no > 0 }">
					<tr>
						<th>노출</th>
						<td colspan="5">
							<form:select path="product.use_flag" cssClass="txt01">
								<form:option value="Y">공개</form:option>
								<form:option value="N">비공개</form:option>
							</form:select>
						</td>
					</tr>
				</c:if>
			</table>
			</form>

	 		<div class="bt03">
				<div id="cancel" class="glay_big" style="float:left;">취소</div>
	 			<c:if test="${product.product_no > 0 }">
	 				<div id="delete" class="blue_big">삭 제</div>
	 			</c:if>
	 			<!-- <div id="view" class="bold_big">미리보기</div> -->
	 			<div id="submit" class="blue_big">입 력</div>
	 		</div>
		</div>
    </div>

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>




<script src="/resources/js/vendor/jquery.ui.widget.js"></script>
<script src="/resources/js/jquery.iframe-transport.js"></script>
<script src="/resources/js/jquery.fileupload.js"></script>
<script>
$(function () {
    $('input:file').fileupload({
        dataType: 'json',
        url: '/admin/product/imageupload.do',
        done: function (e, data) {
        	var that = $(this);
        	var name = $($(that).parent().children()[1]);
        	var result = $.parseJSON(data.jqXHR.responseText);

        	$.each(result, function(key, val){
        		$(that).parent().css("background", "url(" + val.file + ") 0 0 no-repeat");
        		$(name).val(val.fileName);
        	});
        }
    });
});
</script>


<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>



</body>
</html>
