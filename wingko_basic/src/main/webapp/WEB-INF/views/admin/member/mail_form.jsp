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
<style type="text/css">
#PopContent{
	margin:10px 10px 10px 10px; min-width:300px; min-height:200px; width:expression(document.body.clientWidth < 300? "300px":"auto"); 
	background:#fff; border:1px solid #cccccc; border-radius:6px; webkit-border-radius:6px;
}

</style>
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function(){

		CKEDITOR.replace('mail_body', {
			filebrowserUploadUrl: '/admin/store/imageupload_editor.do'
		});
		
		
		var isSend = false;
		$("#btn_send_mail").click(function(){
			
			if(!confirm("발송 하시겠습니까?")) return;
			
			if(isSend == true){
				alert("전송 중입니다.")
				return;
			}
			
			isSend = true;
			
			var param = {
				mail_type : $("input[name=mail_type]").val()
				, to_addr : $("input[name=to_addr]").val()
				, from_addr : $("input[name=from_addr]").val()
				, mail_title : $("input[name=mail_title]").val()
				, mail_body : CKEDITOR.instances.mail_body.getData()
			};
			
			$.post("mail_send_proc.do", param, function(data, status){
				if(status == "success"){
					if(data.success == true ){
						alert("success");
						var dialog = $(".dialog", parent.document);
						if(dialog.size() > 0){
							dialog.dialog('open');
						}else{
							document.location.reload();
						}
					}else{
						alert("fail");
					}
				}else{
					alert("error");
				}
				
				isSend = false;
			}, "json");
		});
		
	});
	
</script>
</head>
<body style="background:#fff">
<div id="Wrapper">

	<div id="PopContent"><!--Content-->
		<form name="frm_mail" method="post" action="mail_send_proc.do" >
		<input type="hidden" name="mail_type" value="${mail_type }" />
		<table class="info">
			<colgroup>
				<col width="17%" />
				<col width="" />
			</colgroup>
			<tr>
				<th>보내는 사람</th>
				<td><input type="text" name="from_addr" value="${from_addr }" class="txt01" style="width:70%;" /></td>
			</tr>
			<tr style="display:none;;">
				<th>받는사람</th>
				<td><input type="text" name="to_addr" value="${to_addr }" class="txt01" style="width:70%;" readonly/></td>
			</tr>
			<tr>
				<th>메일제목</th>
				<td><input type="text" name="mail_title" value="" class="txt01" style="width:70%;" /></td>
			</tr>
			<tr>
				<th>메일내용</th>
				<td><textarea name="mail_body" rows="30" cols="100"></textarea></td>
			</tr>
		</table>
		</form>
		
		<div class="bt03" style="text-align:center;">
 			<div id="btn_send_mail" class="black">메일 보내기</div>
 		</div>

	</div>
	

</div>
</body>
</html>
