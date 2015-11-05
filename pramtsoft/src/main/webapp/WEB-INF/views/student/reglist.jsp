<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회 - 강좌 목록</title>
</head>
<body>
<div align="center">
<h1>과목 리스트</h1>

<h2>${userInfo.getUserName()}씨, 반갑습니다.</h2>
<c:choose>
<c:when test="${sugangInfo != null }">
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px">강좌번호</td>
			<td align=center width = "70px">과목번호</td>
			<td align=center width = "150px">과목명</td>
			<td align=center width = "50px">학점</td>
		</tr>
	</table>
	<c:forEach items="${sugangInfo.getList() }" var="sugang" varStatus="idx">
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px"><input name="CID" type="text" style="border-width:0px; text-align:center;" size="4" value="${sugang.getCid() }" readonly></td>
			<td align=center width = "70px"><input name="SID" type="text" style="border-width:0px; text-align:center;" size="3" value="${sugang.getCourse().getSid() }" readonly></td>
			<td align=center width = "150px"><input name="NAME" type="text" style="border-width:0px; text-align:center;" value="${sugang.getCourse().getName() }" readonly></td>
			<td align=center width = "50px"><input name="Grade" type="text" style="border-width:0px; text-align:center;" size="4" value="${sugang.getGrade_en() }" readonly></td>
		</tr>
		</table>
	</c:forEach>
</c:when>
<c:when test="${SugangInfo == null }">
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