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
<div class="container">
	<div class="row">
        <div class="col-md-10 col-md-offset-1">
			<p class="text-center"><font style="font-size:34px"><Strong>프람트소프트 관리 시스템</Strong></font></p>
		</div>
		<div class="col-md-10 col-md-offset-1">
			<p class="text-right"><strong>${userInfo.getUserName()}</strong>씨, 반갑습니다.<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath}/loginController/logout" role="button">로그아웃</a></p>
		</div>
	</div>
</div>
</body>
</html>