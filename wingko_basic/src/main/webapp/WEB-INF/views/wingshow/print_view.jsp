<%--
  - 작성자   meeroojin
  - 작성일자 2013. 8. 26.
  - 내용
  -
  -
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/pop.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script>

function cssLink(){
	var head = $("head");
	
	$("link", opener.document).each(function(index){
		var link = $(this);
		if(link.attr("type") == "text/css"){
			head.append('<link rel="stylesheet" type="text/css" href="' +link.attr("href")+ '" />');
		}
	}) ;
}

$(document).ready(function(){
	var print_content = $("#print_content");
	//cssLink();
	
	$("[print_view]", opener.document).each(function(index){
		var _this = $(this);
		
		var html = _this.wrap("<div>").parent().html();
		_this.unwrap();
		
		//a태그링크제거
		html = html.replace(/(<a[^>]+href[\s\t]*=)[\s\t]*[^\s\t>]*/ig, "$1\"#none\"");
		//모든 이벤트제거(onclick, onkeydown, onsubmit 등등
		html = html.replace(/(<[^>]+)[\s\t]+on[^=]+=[\s\t\"\']*[^\s\t>]+/gi, "$1");
		//모든 폼태그 서브밋 불가설정</span><br />
		html = html.replace(/(<form[^>]+)(>)/ig, "$1 onsubmit=\"return false;\"$2");
		
		print_content.append(html ); 
	});
	
	window.print();
	
});
</script>
</head>
<body style="background:url('')">
<div id="print_content">
	
</div>
</body>
</html>
