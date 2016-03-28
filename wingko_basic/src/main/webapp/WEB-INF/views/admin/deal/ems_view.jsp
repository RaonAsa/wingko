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
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){

		$("#btn_main").click(function(){
			document.location.href = "main.do";
		});
		
		$("#btn_add").click(function(){
			
			var tr_cnt = $("table.view tr").size();
			if(tr_cnt > 3){
				alert("더 이상 등록 할 수 없습니다.");
				return false;
			}
			
			
			var form = $("form[name=frm_info]");
			$("input[name=ems_id]").val(0);
			$("input[name=item_cnt]").val("");
			$("input[name=gram]").val("");
			$("input[name=price_ko]").val("");
			$("input[name=price_cn]").val("");
			
			form.show();
			
			$("#btn_save").html("등 록");
		});
		
		$("div[name=btn_edit]").click(function(){
			var table_tr = $(this).closest("tr");
			
			var ems_id = $("td[name=ems_id]", table_tr).text();
			var item_cnt = $("td[name=item_cnt]", table_tr).text();
			var gram = $("td[name=gram]", table_tr).text();
			var price_ko = $("td[name=price_ko]", table_tr).text();
			var price_cn = $("td[name=price_cn]", table_tr).text();
			
			var form = $("form[name=frm_info]");
			$("input[name=ems_id]").val(ems_id);
			$("input[name=item_cnt]").val(item_cnt);
			$("input[name=gram]").val(gram);
			$("input[name=price_ko]").val(price_ko);
			$("input[name=price_cn]").val(price_cn);
			
			form.show();
			
			$("#btn_save").html("수 정");
		});
		
		$("#btn_save").click(function(){
			if (!confirm("저장 하시겠습니까?")) return;
			
			var form = $("form[name=frm_info]");
			
			if(! /^\d{1,}$/.test( $("input[name=item_cnt]").val() ) ){
				alert("숫자만 입력 가능합니다. ");
				$("input[name=item_cnt]").focus(); 
				return false;
			}
			
			if(! /^\d{1,}$/.test( $("input[name=gram]").val() ) ){
				alert("숫자만 입력 가능합니다. ");
				$("input[name=gram]").focus(); 
				return false;
			}
			
			if(! /^\d{1,}$/.test( $("input[name=price_ko]").val() ) ){
				alert("숫자만 입력 가능합니다. ");
				$("input[name=price_ko]").focus(); 
				return false;
			}
			
			if(! /^\d{1,}$/.test( $("input[name=price_cn]").val() ) ){
				alert("숫자만 입력 가능합니다. ");
				$("input[name=price_cn]").focus(); 
				return false;
			}
			
			form.attr("action", "ems_reg.do");
			form.submit();
		});
		
		$("#btn_cancel").click(function(){
			var form = $("form[name=frm_info]");
			form.hide();
		});

		$("#btn_delete").click(function(){
			if (!confirm('삭제하시겠습니까?')) return;
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
    	<div class="tit">이달의 딜 / EMS 가격표</div>
    	
    	<div class="con">
			<div class="bt03" style="margin-top:20px;">
	 			<div id="btn_add" class="blue_big"  style="float:left;" >추 가</div>
	 			<div id="btn_main" class="blue_big">Main</div>
	 		</div>
	 		
	 		<form name="frm_info" method="post" style="display:none;">
 			<input type="hidden" name="ems_id" value="0" />
	 		<table class="info" style="width:600px;">
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>상품수량</th>
					<td><input type="text" name="item_cnt" value="" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>중량구분</th>
					<td><input type="text" name="gram" value="" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>가격(ko)</th>
					<td><input type="text" name="price_ko" value="" class="txt01" style="width:70%;" /></td>
				</tr>
				<tr>
					<th>가격(cn)</th>
					<td><input type="text" name="price_cn" value="" class="txt01" style="width:70%;" />
					
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="bt03" style="margin:0px;">
							<!-- <div id="btn_delete" class="black" style="float:left;">삭 제</div> -->
							<div id="btn_cancel" class="black">취 소</div>
							<div id="btn_save" class="black">저 장</div>
						</div>
					</td>
				</tr>
			</table>
			</form>
				
				
			<table class="view">
				<colgroup>
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="" />
				</colgroup>
				<tr>
					<th>No.</th>
					<th>상품수량</th>
					<th>중량구분</th>
					<th>EMS 가격(ko)</th>
					<th>EMS 가격(cn)</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="data" varStatus="status">
				<tr height="40">
					<td name="ems_id" >${data.ems_id}</td>
					<td name="item_cnt" >${data.item_cnt}</td>
					<td name="gram" >${data.gram}</td>
					<td name="price_ko">${data.price_ko}</td>
					<td name="price_cn">${data.price_cn}</td>
					<td><div name="btn_edit" class="black">수정</div></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(list) == 0 }">
				<tr>
					<td colspan="9" style="height: 200px">데이터가 없습니다.</td>
				</tr>
			</c:if>
			</table>

 		</div>
    </div>
    
    

	<!-- Left Menu(s) -->
	<c:import url="../foot.jsp" charEncoding="UTF-8" />
	<!-- Left Menu(e) -->
</div>



</body>
</html>
