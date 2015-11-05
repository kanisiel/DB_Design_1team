<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청</title>
</head>
<body>
<div align="center">
<h1>학사관리 시스템</h1>

<h2>${userInfo.getUserName()}씨, 반갑습니다.</h2>
<c:choose>
	<c:when test="${userInfo.getUserType()==1 }">
		<a href="${pageContext.request.contextPath}/sugangController/register">수강신청</a>
		<a href="${pageContext.request.contextPath}/sugangController/grade">성적조회</a>
	</c:when>
	<c:when test="${userInfo.getUserType()==2 }">
		<a href="${pageContext.request.contextPath}/profController/subjectList">강좌개설</a>
		<a href="${pageContext.request.contextPath}/profController/courseList">성적입력</a>
	</c:when>
	<c:when test="${userInfo.getUserType()==3 }">
		<a href="${pageContext.request.contextPath}/adminController/subjectList">과목리스트</a>
	</c:when>
</c:choose>
<a href="${pageContext.request.contextPath}/loginController/logout">로그아웃</a>
</div>
</body>
</html>