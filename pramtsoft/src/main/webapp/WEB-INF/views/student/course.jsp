<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청 - 강좌 목록</title>
</head>
<body>
<div align="center">
<h1>학사관리 시스템</h1>

<h2>${userInfo.getUserName()}씨, 반갑습니다.</h2>
<c:choose>
<c:when test="${courseInfo != null }">
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px">강좌번호</td>
			<td align=center width = "70px">과목번호</td>
			<td align=center width = "150px">과목명</td>
			<td align=center width = "50px">학점</td>
			<td align=center width = "70px">담당교수</td>
			<td align=center width = "50px">정원</td>
			<td align=center width = "50px">신청</td>
		</tr>
	</table>
	<c:forEach items="${courseInfo.getList() }" var="course" varStatus="idx">
	<form action="register.do" method=POST>
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px"><input name="CID" type="text" style="border-width:0px; text-align:center;" size="4" value="${course.getCid() }" readonly></td>
			<td align=center width = "70px"><input name="SID" type="text" style="border-width:0px; text-align:center;" size="3" value="${course.getSid() }" readonly></td>
			<td align=center width = "150px"><input name="NAME" type="text" style="border-width:0px; text-align:center;" value="${course.getName() }" readonly></td>
			<td align=center width = "50px"><input name="UNIT" type="text" style="border-width:0px; text-align:center;" size="1" value="${course.getUnit() }" readonly></td>
			<td align=center width = "70px"><input name="INSTRUCTOR" type="text" style="border-width:0px; text-align:center;" size="8" value="${course.getInst_name() }" readonly></td>
			<td align=center width = "50px"><input name="MAX" type="text" style="border-width:0px; text-align:center;" size="3" value="${course.getMax() }" readonly></td>
			<td align=center width = "50px"><button onclick="moveto(this.form);">신청</button></td>
		</tr>
		</table>
	</form>
	</c:forEach>
</c:when>
<c:when test="${courseInfo == null }">
	<table>
		<tr>
			<td>${ isEmpty }
			</td>
		</tr>
	</table>
</c:when>
</c:choose>
<table>
	<tr>
		<td>
		<a href=${pageContext.request.contextPath}/logged>뒤로</a>
		</td>
		<td>
		<a href=${pageContext.request.contextPath}/loginController/logout>로그아웃</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>