<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserInfo" %>
<%@ page session="true" %>
<fmt:setLocale value="ko" scope="session"/>
<html id="home" lang="ko">
	<head>
	    <meta charset=utf-8 />
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>프람트소프트 관리시스템</title>
	    <!-- 합쳐지고 최소화된 최신 CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	    <!-- 부가적인 테마 -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<!-- nanoScroller -->
		<script src="template/jquery.nanoscroller.min.js"></script>
		<link rel="stylesheet" href="template/nanoscroller.css">
    	<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    	<script src="js/star-rating.js" type="text/javascript"></script>
		<script>
			$(".nano").nanoScroller();
			$(".nano").nanoScroller({ iOSNativeScrolling: true });
			$(".nano").nanoScroller({ flashDelay: 1000 });
		</script>
	</head>
	<body>
	<div class="container nano">
		<div class="row nano-content">
			<c:set var="userInfo" value="${ userInfo }" scope="session"/>
			<%@include file="/WEB-INF/views/template/header.jsp" %>
			<c:if test="${ url != null }">
				<c:import url="${ url }">
				</c:import>
			</c:if>
		</div>
	</div>
	</body>
</html>