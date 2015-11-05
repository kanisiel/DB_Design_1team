<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
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
<h1>프람트 소프트</h1>

<P>  현재시간은 ${serverTime} 입니다. </P>

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
