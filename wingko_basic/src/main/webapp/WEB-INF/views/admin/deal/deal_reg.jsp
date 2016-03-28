<%--
  - 작성자  meeroojin
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
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){
		
		$("#start_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm"});
		$("#end_date").datetimepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", timeFormat: "HH:mm"});

		
		$("#btn_reg").click(function(){
			if (!confirm("등록 하시겠습니까?")) return;
			$("#frm_reg").submit();
		});

		$("#btn_cancel").click(function(){
			history.back(-1);
		});

		$("#btn_delete").click(function(){
			if (!confirm('삭제하시겠습니까?')) return;
			
			$("#frm_reg").attr("action", "dealmain_del.do");
			$("#frm_reg").attr("enctype", "");
			$("#frm_reg").submit();
			
		});
		
		$("#btn_item_add").click(function(){
			var table_item = $("#table_item");

			var html = '<tr>' +
			'	<td><input type="text" name="item_name" value=""  class="txt01" style="width:90%;" /></td>' +
			'	<td><input type="text" name="price_ko" value=""  class="txt01" style="width:90%;" /></td>' +
			'	<td><input type="text" name="price_cn" value=""  class="txt01" style="width:90%;" /></td>' +
			'	<td><input type="hidden" name="item_id" value="0" /> <div name="btn_item_delete" class="black">삭제</div></td>' +
			'</tr>';
			
			table_item.append(html);
		});
		
		$("#table_item").on("click", "div[name=btn_item_delete]", function(){
			var table_tr = $(this).closest("tr");
			
			var item_id = $("input[name=item_id]", table_tr).val();
			item_id = Number(item_id);
			if( Number(item_id) > 0){
				$("#frm_reg").append('<input type="hidden" name="del_item_id" value="' +item_id+ '" />');
			}
			
			table_tr.remove();
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
    	<div class="tit">이달의 딜 상품등록</div>
		<div class="con">
			<form id="frm_reg" method="post" action="dealmain_reg.do" enctype="multipart/form-data">
			<c:if test="${dealmain.deal_id != null and dealmain.deal_id > 0 }">
				<input type="hidden" name="deal_id" value="${dealmain.deal_id }" />
				<input type="hidden" name="page" value="${dealmain.page }" />
			</c:if>

			<table class="info">
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="title" value="${dealmain.title }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>판매기간</th>
					<td><input type="text" id="start_date" name="start_date" value="${fn:substring(dealmain.start_date, 0, 16) }" class="txt01" style="width:160px;" /> ~ 
					<input type="text" id="end_date" name="end_date" value="${fn:substring(dealmain.end_date, 0, 16) }" class="txt01" style="width:160px;" />
					</td>
				</tr>
				<tr>
					<th>Main 이미지(필수)<br/>(762x345)</th>
					<td>
						<input type="file" name="image" value="${dealmain.image }" class="txt01" style="width:30%;" />
						<c:if test="${dealmain.image != null and dealmain.image != ''}">현재 이미지 <img class="img50" src="/upload/deal/${dealmain.image}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>썸네일 이미지</th>
					<td>
						<input type="file" name="image_thumb" value="${dealmain.image_thumb }" class="txt01" style="width:30%;" />
						<c:if test="${dealmain.image_thumb != null and dealmain.image_thumb != ''}">현재 이미지 <img class="img50" src="/upload/deal/${dealmain.image_thumb}" /></c:if>
					</td>
				</tr>
				<tr>
					<th>원산지/제조사</th>
					<td><input type="text" name="info_origin" value="${dealmain.info_origin }" class="txt01"  style="width:70%;" /></td>
				</tr>
				<tr>
					<th>배송방법</th>
					<td><input type="text" name="info_transfer" value="${dealmain.info_transfer }" class="txt01"  style="width:70%;" /></td>
				</tr>
				<tr>
					<th>문의</th>
					<td><input type="text" name="info_faq" value="${dealmain.info_faq }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>추가정보</th>
					<td><input type="text" name="summary" value="${dealmain.summary }" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>할인율</th>
					<td><input type="text" name="discount" value="${dealmain.discount }" class="txt01" style="width:100px;" /></td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><input type="text" name="cost_sale" value="${dealmain.cost_sale }" class="txt01" style="width:100px;" /></td>
				</tr>
				<tr>
					<th>할인가</th>
					<td><input type="text" name="cost_discount" value="${dealmain.cost_discount }" class="txt01" style="width:100px;" /></td>
				</tr>
				<tr>
					<th>상품등록</th>
					<td>
						<table class="view" id="table_item" style="margin:0px;">
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="" />
							</colgroup>
							<tr>
								<th>상품명</th>
								<th>가격(ko)</th>
								<th>가격(cn)</th>
								<th>비고 <div id="btn_item_add" class="black">추가</div></th>
							</tr>
						<c:forEach items="${list_item }" var="data" varStatus="status">
							<tr>
								<td><input type="text" name="item_name" value="${data.item_name }"  class="txt01" style="width:90%;" /></td>
								<td><input type="text" name="price_ko" value="${data.price_ko }"  class="txt01" style="width:90%;" /></td>
								<td><input type="text" name="price_cn" value="${data.price_cn }"  class="txt01" style="width:90%;" /></td>
								<td><input type="hidden" name="item_id" value="${data.item_id }" /> <div name="btn_item_delete" class="black">삭제</div></td>
							</tr>
						</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>제한수량</th>
					<td><input type="text" name="limit_count" value="${dealmain.limit_count }" class="txt01" style="width:100;" /> (제한없음 : 0) </td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td class="edit">※ 이미지 가로 762 이하로 올리세요.<br /><textarea name="content" rows="20" cols="100">${dealmain.content}</textarea></td>
				</tr>
			<c:if test="${dealmain.used_sort >= 0 }">
				<tr>
					<th>노출</th>
					<td colspan="5">
						<form:select path="dealmain.used_sort" cssClass="txt01">
							<form:option value="0">비공개</form:option>
							<form:option value="1">공개</form:option>
						</form:select>
					</td>
				</tr>
			</c:if>
			</table>
			</form>

	 		<div class="bt03">
				<div id="btn_cancel" class="glay_big" style="float:left;">취 소</div>
	 			<c:if test="${dealmain.deal_id > 0 }">
	 				<div id="btn_delete" class="blue_big">삭 제</div>
	 			</c:if>
	 			<div id="btn_reg" class="blue_big">등 록</div>
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
