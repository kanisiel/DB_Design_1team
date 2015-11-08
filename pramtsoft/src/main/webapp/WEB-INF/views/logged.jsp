<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html id="home" lang="en">
  <head>
    <meta charset=utf-8 />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>프람트소프트 관리 시스템</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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