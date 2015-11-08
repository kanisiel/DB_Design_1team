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
<div class="container">
	<div class="row">
        <div class="col-md-10 col-md-offset-1">
			<p class="text-center"><font style="font-size:34px"><Strong>프람트소프트 관리 시스템</Strong></font></p>
		</div>
		<div class="col-md-10 col-md-offset-1">
			<p class="text-center"><font style="font-size:13px;color:#FF3333;">${userInfo.getSubscribe_kor()}</font><p class="text-center">
		</div>
		<div class="col-md-10 col-md-offset-1">
			<form action="loginController/login.do" method="post">
				<div class="form-group">
					<label for="userID">아이디</label>
					<input type="text" class="form-control" name="userID" placeholder="아이디를 입력하세요">
				</div>
				<div class="form-group">
					<label for="userPassword">패스워드</label>
					<input type="password" class="form-control" name="userPassword" placeholder="패스워드를 입력하세요">
				</div>
				<div class="btn-group btn-group-justified" role="group" aria-label="CLR">
  					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary" onclick="register(document.form)">계정 생성</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-success" onclick="login(document.form)">로그인</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-warning" onclick="reset(document.form)">리셋</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
