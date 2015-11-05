<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<div align="center">
	<h2>로그인 화면</h2>
	<form:form modelAttribute="CMember" method="POST" action="login.html" >
		<spring:hasBindErrors name="CMember">
			<font color="red"><c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}"/>
			</c:forEach></font>
		</spring:hasBindErrors>
	<table id="login_table">
		<tr>
			<td>ID</td>
			<td><form:input path="ID"/><font color=red><form:errors path="ID" /></font></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><form:input path="password"/><font color=red><form:errors path="password" /></font></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="로그인"></td>
			<td align="center"><input type="reset" value="리셋"></td>
		</tr>
	</table>
	</form:form>
</div>
</body>
</html>