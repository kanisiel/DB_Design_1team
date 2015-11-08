<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<html id="home" lang="en">
  <head>
    <meta charset=utf-8 />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appraise Example</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function login(form){
			form.action = "loginController/login.do";
			form.submit();
		}
		
		function register(form){
			form.action = "loginController/registerAccount";
			form.submit();
		}
		function register(form){
			form.reset();
		}
		function hitEnter(e){
			if(e.keyCode==13){
				login(document.form);
			}
		}
	</script>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/form.css"/>'>
</head>
<body onKeypress="hitEnter(event)">
<div align="center">
<h1>프람트소프트 관리 시스템</h1>

	<form action="loginController/login.do" method="post">
		<table>
			<tr height="40px">
				<td class="titleTD">유저 아이디</td>
				<td><input type="text" name="userID" ></td>
			</tr>
			<tr height="40px">
				<td>패스워드</td>
				<td><input type="password" name="userPassword"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<font style="font-size:13px;color:#FF3333;">${userInfo.getSubscribe_kor()}</font>
				</td>
			</tr>
		</table>
		<table>
			<tr height="40px">
				<td><button onclick="register(document.form)">계정 생성</button></td>
				<td><button onclick="login(document.form)">로그인</button></td>
				<td><button onclick="reset(document.form)">리셋</button></td>
		</table>
	</form>
</div>
</body>
</html>
