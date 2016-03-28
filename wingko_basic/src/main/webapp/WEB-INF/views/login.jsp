<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<title>Home</title>
</head>
<body>


	<div>
		<form:form modelAttribute="login">
			<fieldset>
			<p>
				<form:errors path="" />
			</p>
			<p>
				<form:input path="user_id" size="12" maxlength="12"/>
				<form:errors path="user_id" />
			</p>
			<p>
				<form:input path="user_password" size="12" maxlength="12"/>
				<form:errors path="user_password" />
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
			</fieldset>
		</form:form>
	</div>



</body>
</html>
