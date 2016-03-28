<%--
  - 작성자  meeroojin
  - 작성일자 2013. 8. 19.
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
<link rel="stylesheet" type="text/css" href="/resources/admin/inc/css/wingko.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-1.9.2.custom.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui-timepicker-addon.min.css" />
<style type="text/css">
#PopContent{
	margin:10px 10px 10px 10px; min-width:300px; min-height:250px; width:expression(document.body.clientWidth < 300? "300px":"auto"); 
	background:#fff; border:1px solid #cccccc; border-radius:6px; webkit-border-radius:6px;
}
.subCon {padding:0px 10px;}
table.info{margin:0px 0px 10px 0px; }

</style>

<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/resources/js/jquery-ui-timepicker-addon.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn_edit").show();
		$("#btn_cancel").hide();
		$("#btn_save").hide();
		
		$("#pay_state_text").show();
		$("#pay_state").hide();

		
		$("#btn_edit").click(function(){
			$("#btn_edit").hide();
			$("#btn_cancel").show();
			$("#btn_save").show();
			
			$("#pay_state_text").hide();
			$("#pay_state").show();
		});
		
		$("#btn_cancel").click(function(){
			$("#btn_edit").show();
			$("#btn_cancel").hide();
			$("#btn_save").hide();
			
			$("#pay_state_text").show();
			$("#pay_state").hide();
		});
		
		$("#btn_save").click(function(){
			if(!confirm("저장 하시겠습니까?")) return ;
			
			var pid = $("input[name=pid]").val();
			var pay_state = $("#pay_state").val();
			
			var param = {
				pid : pid
				, pay_state : pay_state 
			};

			$.post("pay_info_proc.do", param, function(data, status){
				if(status == "success"){
					document.location.reload();
				}else{
					alert("fail");
				}
			}, "json");
		});
		
		$("#btn_refund").click(function(){
			if(!confirm("환불 하시겠습니까?")) return ;
			
			var pid = $("input[name=pid]").val();
			var pay_state = "${refund_complete}";
			
			var param = {
				pid : pid
				, pay_state : pay_state 
			};

			$.post("pay_info_proc.do", param, function(data, status){
				if(status == "success"){
					if(data.success == true ){
						alert("success");
						document.location.reload();
					}else{
						alert("fail");
					}
				}else{
					alert("error");
				}
			}, "json");
		});
		
	});
</script>
</head>
<body style="background:#fff">
<div id="Wrapper">
	
	<div id="PopContent"><!--Content-->
    	
		<div class="tit">상품정보</div>
        <div class="subCon">
			<table class="view" style="margin-top:0px;">
				<colgroup>
					<col width="45%" />
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="" />
				</colgroup>
				<tr height="35">
					<th>상품명</th>
					<th>수량</th>
					<th>사용일</th>
					<th>가격</th>
					<th>취소</th>
				</tr>
			<c:forEach items="${payitem_list}" var="data" varStatus="status" >
				<tr height="35">
					<td>
						<c:if test="${data.item_location != '' }">[${data.item_location }]</c:if>
						<c:if test="${data.item_store != '' }">[${data.item_store }]</c:if>
						<c:if test="${data.item_name != '' }">${data.item_name }</c:if>
					</td>
					<td>${data.menu_cnt }</td>
					<td>${data.used_date }</td>
					<td><fmt:formatNumber value="${data.pay_price_cn}" /> 元<br/><fmt:formatNumber value="${data.pay_price_ko}" /> &#8361;</td>
					<td>
					<c:choose>
						<c:when test='${ data.cancel_yn == flag_y }'>취소</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</table>
        </div>
        
        
        <div class="tit">결제정보
    		<!--<div style="float:right;">
    			<div id="btn_cancel" class="black">취소</div>
				<div id="btn_save" class="black" >저장</div>
				<div id="btn_edit" class="black">수정</div>
			</div> --> 
    	</div>
        <div class="subCon">
        	<form name="frm_info" method="post" action="pay_info_proc.do" >
        		<input type="hidden" name="pid" value="${paymain.pid }" />
			<table class="info">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<th>주문번호</th>
					<td>${paymain.pid}</td>
					<th>결제방법</th>
					<td><c:forEach items="${select_method }" var="type" ><c:if test="${type.value == paymain.pay_method}" >${type.title}</c:if></c:forEach></td>
				</tr>
				<tr>
					<th>주문자ID</th>
					<td>${paymain.user_id}</td>
					<th>이름</th>
					<td>${paymain.user_name}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${paymain.user_email}</td>
					<th>전화번호</th>
					<td>${paymain.user_phone}</td>
				</tr>
				
				<tr>
					<th>결제타입</th>
					<td><c:forEach items="${select_type }" var="type" ><c:if test="${type.value == paymain.pay_type}" >${type.title}</c:if></c:forEach></td>
					<th>결제상태</th>
					<td>
						<span id="pay_state_text"><c:forEach items="${select_state }" var="type" ><c:if test="${type.value == paymain.pay_state}" >${type.title}</c:if></c:forEach></span>
						<form:select path="paymain.pay_state">
						<form:options items="${select_state}" itemLabel="title" itemValue="value" />
						</form:select>
					</td>
				</tr>
				<tr>
					<th>상품금액</th>
					<td>CNY <fmt:formatNumber value="${paymain.pay_price_cn}" /><br/>KRW <fmt:formatNumber value="${paymain.pay_price_ko}" /></td>
					<th>결제금액</th>
					<td>CNY <fmt:formatNumber value="${paymain.sale_price_cn}" /><br/>KRW <fmt:formatNumber value="${paymain.sale_price_ko}" /></td>
				</tr>
				
				<tr>
					<th>주문일</th>
					<td>${fn:substring(paymain.reg_date, 0, 16 ) }</td>
					<th>결제일</th>
					<td>${fn:substring(paymain.pay_date, 0, 16 ) }</td>
				</tr>				
				<tr>
					<th>취소일</th>
					<td>${fn:substring(paymain.cancel_date, 0, 16 ) }</td>
					<th>취소사유</th>
					<td>${paymain.cancel_msg}</td>
				</tr>
				<tr>
					<th>환불일</th>
					<td>
					<c:choose>
						<c:when test="${paymain.refund_date == null }"><div id="btn_refund" class="black">환불</div></c:when>
						<c:otherwise>${fn:substring(paymain.refund_date, 0, 16 ) }</c:otherwise>
					</c:choose>
					</td>
					<th></th>
					<td></td>
				</tr>
			</table>
			</form>
        </div>
        
	<c:if test="${payrefund != null }">
        <div class="tit">환불정보</div>
        <div class="subCon">
			<table class="info">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<th>은행명</th>
					<td>${payrefund.bank_name} / ${payrefund.bank_owner}</td>
					<th>계좌번호</th>
					<td>${payrefund.bank_number}</td>
				</tr>
			</table>
        </div>
	</c:if>
	
	<c:if test="${paycard != null }">
        <div class="tit">카드승인 정보
        	<div style="float:right;">
    			<div id="btn_cancel" class="black">카드 취소</div>
			</div>
        </div>
        <div class="subCon">
			<table class="info">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<th>TID</th>
					<td>${paycard.tid}</td>
					<th>승인일시</th>
					<td>${paycard.app_date} ${paycard.app_time}</td>
				</tr>
				<tr>
					<th>카드번호</th>
					<td>${paycard.card_num}</td>
					<th>승인번호</th>
					<td>${paycard.app_num}</td>
				</tr>
				<tr>
					<th>카드사 코드</th>
					<td>${paycard.card_code}</td>
					<th>발급사 코드</th>
					<td>${paycard.card_bankcode}</td>
				</tr>
			</table>
        </div>
	</c:if>
        
		
    </div>

</div>
 
</body>
</html>
