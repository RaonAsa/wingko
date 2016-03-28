<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 15.
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
<title>Wingko</title>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/wingko.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-carousel.min.css" />

<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/bootstrap-carousel.min.js"></script>

<script>
		
</script>

</head>

<body>

<%
Cookie[] cookies = request.getCookies();
for (int i = 0; i < cookies.length; i++) {

	out.print(cookies[i].getName()); 
	out.print(cookies[i].getValue());
}
%>
</body>
</html>
