<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="form.css"> -->
<title>회원가입</title>
<style type="text/css">
	.inputTable { border-width:1px; border-style:solid; border-color:RoyalBlue }
	.titleTD { border-spacing:0px; padding:5px; background-color:LightSkyBlue; border-width:1px; border-style:solid; border-color:RoyalBlue }
	.inputTD { border-spacing:0px; padding:5px; background-color:#FFFFFF; border-width:1px; border-style:solid; border-color:RoyalBlue }
</style>
<script type="text/javascript">
	function check_null(){
		var form = document.getElementById("register");
		var list = form.elements;
		for(i = 0; i<list.length-2; i++){
			if(list[i].value =='' || list[i].value == null){
				alert("모든 정보를 입력 해 주세요!");
				document.getElementById(list[i].id).focus();
				return false;
			}
		}
		return true;
	}
	function check_password(){
		var form = document.getElementById("register");
		if(form.elements["USERPASSWORD"].value != form.elements["PASSWORD"].value){
			alert("비밀번호가 일치하지 않습니다!");
			form.elements["PASSWORD"].focus();
			return false;
		}
		return true;
	}
	function check_form(){
		if(check_null() == false){
			return false;
		} else if(check_password() == false){
			return false;
		}else {
			document.getElementById("COLLEGE").disabled = false;		
			return true;
		}
	}
	function setDisable(col){
		var list = document.getElementById("DEPT").children;
		
		for(i = 0; i < list.length; i++){
			if(i>0){
				if(list[i].label == col.value){
					list[i].disabled =false;
				} else {
					list[i].disabled = true;
				}
			}
		}
	}
	function colSelect(dept){
		var col = document.getElementById("COLLEGE");
		var list = document.getElementById("COLLEGE").children;		
		var optgroups = dept.children;
		var child;
		var colname;
		for(i=0; i<optgroups.length ; i++){
			child = optgroups[i].children;
			for(j=0; j<child.length; j++){
				if(dept.value==child[j].value){
					colname=optgroups[i].label;
				}
			}
		}
		for(i = 0; i < list.length; i++){
			if(list[i].text == colname){
				list[i].selected=true;
				col.disabled = true;
				col.value = list[i].value;
			} else {
				list[i].selected=false;
			}
		}
		
	}
		
</script>
</head>
<body>
<div align=center>
	<form id=register method="POST" action="${pageContext.request.contextPath}/loginController/createAccount.do" onsubmit="javascript:check_form();">
		<table cellspacing=0 cellpadding=0 class="inputTable">
			<tr>
				<td class="titleTD">아이디</td><td class="inputTD"><input name="USERID" id="USERID" type="text" value="${ loginInfo.getUserId() }"/></td>
				<td class="titleTD">패스워드</td><td class="inputTD"><input name="USERPASSWORD" id="USERPASSWORD" type="password" value="${ loginInfo.getUserPassword() }"/></td>
			</tr>
			<tr>
				<td class="titleTD">학번</td><td class="inputTD"><input name="UIDX" id="UIDX" type="text"/></td>
				<td class="titleTD">패스워드확인</td><td class="inputTD"><input name="PASSWORD" id="PASSWORD" type="password"/></td>
			</tr>
			<tr>
				<td class="titleTD">소속대학</td><td class="inputTD">
					<select name="COLLEGE" id="COLLEGE" onchange="setDisable(this)" >
							<option value="">학과를 선택하세요</option>

						<c:forEach items="${ colleges.getList() }" var="college">
							<option value='${ college.getIdx() }'><c:out value="${ college.getName() }"></c:out></option>
						</c:forEach>
					</select>
				</td>
				<td class="titleTD">소속학과</td><td class="inputTD">
					<select name="DEPT" id="DEPT" onchange="colSelect(this)">
							<option value="">선택</option>
							<c:set var="i" value="0"></c:set>
						<c:forEach items="${ departments.getList() }" var="department">
						<c:choose>
							<c:when test="${ department.getCollege() != i }">
								<c:choose>
									<c:when test="${ i == 0 }">
										<optgroup label="${colleges.getList().get(department.getCollege()-1).getName() }">
									</c:when>
									<c:otherwise>
										</optgroup>
										<optgroup label="${colleges.getList().get(department.getCollege()-1).getName() }">
									</c:otherwise>
								</c:choose>
							<c:set var="i" value="${ department.getCollege() }"></c:set>
							</c:when>
						</c:choose>
							<option value='${ department.getIdx() }'><c:out value="${ department.getName() }"></c:out></option>
						</c:forEach>
							</optgroup>
					</select>
				</td>
			</tr>
			<tr>
				<td class="titleTD">이름</td><td class="inputTD"><input name="USERNAME" id="USERNAME" type="text"/></td>
				<td class="titleTD">학적</td><td class="inputTD"><input type="radio" name="USERTYPE" id="USERTYPE" VALUE="1">학생 &nbsp; <input type="radio" name="USERTYPE" id="USERTYPE" value="2">교수</td>
			</tr>
		</table>
		<table cellspacing=0 cellpadding=0 >
			<tr height="15px">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"/></td>
				<td><button onclick="location.href='${pageContext.request.contextPath}/loginController/logout'">취소</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>