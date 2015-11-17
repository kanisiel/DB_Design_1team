<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html id="home" lang="ko">
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
    <script>
    function addText(t){
    	$('#viewDiv').html("<h1>"+t+"</h1>");
    }
    //$('#approveRequest').attr('onClick','').click(addText());
    </script>
  </head>
<body>
	<div class="container">
		<div class="row">
	        <c:set var="userInfo" value="${ userInfo }" scope="request"></c:set>
			<c:import url="template/header.jsp" />
			<div class="col-md-8 md-offset-2">
				<div class="row">
					<div id="viewDiv" class="col-md-12"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>