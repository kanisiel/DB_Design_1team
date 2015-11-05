<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="form.css" type="text/css" rel="stylesheet"> -->
<style type="text/css">
	.inputTable { border-width:1px; border-style:solid; border-color:RoyalBlue }
	.titleTD { border-spacing:0px; padding:5px; background-color:LightSkyBlue; border-width:1px; border-style:solid; border-color:RoyalBlue }
	.inputTD { border-spacing:0px; padding:5px; background-color:#FFFFFF; border-width:1px; border-style:solid; border-color:RoyalBlue }
</style>
<title>과목개설 - 과목정보 입력</title>
<script type="text/javascript">
	function create(form){
		form.action = "${pageContext.request.contextPath}/adminController/createSubject.do";
		form.submit();
	}
	function cancel(){
		document.location.href="${pageContext.request.contextPath}/adminController/subjectList";
	}
</script>
</head>
<body>
<div align="center">
<h1>과목 생성</h1>
<c:if test="${!empty error }">
	<script type="text/javascript">
		function showalert(){
			<c:set var="code" value="${error.get('errorCode') }"/>
			<c:set var="sub" value="${error.get('errorSub') }"/>
			alert(code+"<br>"+sub);
		}
		showalert();
	</script>
</c:if>
	<form method="post">
		<table cellspacing=0 cellpadding=0 class="inputTable">
			<tr>
				<td class="titleTD">과목번호</td><td class="inputTD"><input name="SID" id="SID" type="text"/></td>
			</tr>
			<tr>
				<td class="titleTD">과목명</td><td class="inputTD"><input name="NAME" id="NAME" type="text"/></td>
			</tr>
			<tr>
				<td class="titleTD">학점</td><td class="inputTD"><select name="UNIT" id="UNIT">
					<option value=0 selected>0</option>
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
				</select></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><button onclick="create(this.form)">생성</button></td>
				<td><button onclick="cancel()">취소</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>