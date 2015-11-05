<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력 - 수강인원 목록</title>
<script>
	function moveto(form){
		form.action = "createCourse";
		form.submit();
	}
</script>
</head>
<body>
<div align="center">
<h1>과목 리스트</h1>

<h2>${userInfo.getUserName()}씨, 반갑습니다.</h2>
<c:choose>
<c:when test="${sugangInfo != null }">
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px">학번</td>
			<td align=center width = "150px">이름</td>
			<td align=center width = "70px">학점</td>
			<td align=center width = "70px">부여</td>
			<td align=center width = "70px">저장</td>
		</tr>
	</table>
	<c:forEach items="${sugangInfo.getList() }" var="sugang" varStatus="idx">
	<form action="setGrade.do" method=POST>
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top:-1px">
		<tr>
			<td align=center width = "70px"><input name="UIDX" type="text" style="border-width:0px; text-align:center;" size="8" value="${sugang.getUserInfo().getUIdx() }" readonly></td>
			<td align=center width = "150px"><input name="NAME" type="text" style="border-width:0px; text-align:center;" size="3" value="${sugang.getUserInfo().getUserName() }" readonly></td>
			<td align=center width = "70px"><input name="SCORED" type="text" style="border-width:0px; text-align:center;" size="4" value="${sugang.getGrade_en() }" readonly></td>
			<td align=center width = "70px"><select name="SCORE">
				<c:forEach items="${gradeInfo.getList() }" var="grade" varStatus="gidx">
				<c:choose>
					<c:when test="${grade.getIdx() != 10 }">
						<option value="${grade.getIdx() }"><c:out value="${grade.getLetter() }"></c:out></option>
					</c:when>
					<c:when test="${grade.getIdx() == 10 }">
						<option value="${grade.getIdx() }" selected><c:out value="${grade.getLetter() }"></c:out></option>
					</c:when>
				</c:choose>
				</c:forEach>
			</select></td>
			<td align=center width = "70px"><input name="IDX" type="hidden" value="${sugang.getIdx() }"><input type="submit" value="저장"></td>
		</tr>
		</table>
		</form>
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