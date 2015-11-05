<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌개설 - 강좌정보입력</title>
<script>
	function onSubmit(){
		alert(Document.getElementById("sid").disabled);
		var name = Document.getElementById("name");
		var unit = Document.getElementById("unit");
		sid.disabled = false;
		name.disabled = false;
		unit.disabled = false;
	}
</script>
</head>
<body>
<div align="center">
<h1>학사관리 시스템</h1>

<form id="course" action="createCourse.do" method=POST onSubmit="onSubmit()">
<table>
	<tr>
		<td style="width:80px;">과목번호</td>
		<td>
			<input name="sid" type="text" value="${subject.getSid() }" readonly>
		</td>
		<td>과목명</td>
		<td>
			<input name="name" type="text" value="${subject.getName() }" readonly>
		</td>
		<td>학점</td>
		<td>
			<input name="unit" type="text" value="${subject.getUnit() }" readonly>
		</td>
	</tr>
	<tr>
		<td style="width:80px;">강좌번호</td>
		<td>
			<input name="cid" type="text" >
		</td>
		<td style="width:80px;">연도</td>
		<td>
			<input name="year" type="text" >
		</td>
		<td>정원</td>
		<td>
			<input name="max" type="text" >
		</td>
	</tr>
	<tr>
		<td style="width:80px;">학년</td>
		<td>
			<input name="grade" type="text" >
		</td>
		<td style="width:80px;">대학</td>
		<td>
			<input name="col" type="text" value="${college.getName() }" readonly>
		</td>
		<td>학과</td>
		<td>
			<input name="dt" type="text" value="${dept.getName() }" readonly>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td><input type="submit" value="개설"/></td>
		<td><input type="reset" value="리셋"/></td>
	</tr>
</table>
</form>
<a href=${pageContext.request.contextPath}/loginController/logout>로그아웃</a>
</div>
</body>
</html>