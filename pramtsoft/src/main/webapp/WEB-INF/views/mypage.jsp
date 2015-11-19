<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserInfo" %>
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
	//password필드에 입력된 두개의 값을 비교하여 true/false리턴
	function check_password(){
		var form = document.getElementById("register");
		if(form.elements["userPassword"].value != form.elements["PASSWORD"].value){
			$('#pw2Warning').html("비밀번호가 다르게 입력되었습니다!");
			$('#userPassword,#Password').parent().removeClass("has-error").removeClass("has-warning").removeClass("has-success").addClass("has-error");
			$('#glyphicon1,#glyphicon2').removeClass("glyphicon-remove").removeClass("glyphicon-ok").addClass("glyphicon-remove");
			$('#userPasswordStatus,#PasswordStatus').html("(error)");
			return false;
		}
		return true;
	}
	// password를 정규식으로 검사하여 6~16자 사이인지 체크한다. 
	// 체크 결과가 false일 경우, bootstrap의 css를 이용하여
	// 사용자에게 경고하고, true일 경우에도 마찬가지 방법으로
	// 사용자에게 안내한다. 
	//
	function password_chk(input){
		var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,}$/;
		var pw = input.value;
		if (!check.test(pw)){
			$('#'+input.id+'Warning').html("비밀번호는 문자, 숫자, 특수문자의 조합으로 입력해주세요.");
			$('#'+input.id).parent().removeClass("has-error").removeClass("has-warning").removeClass("has-success").addClass("has-error");
			$('#'+input.id).parent().children().eq(3).removeClass("glyphicon-remove").removeClass("glyphicon-ok").addClass("glyphicon-remove");
			$('#'+input.id).parent().children().eq(4).html("(error)");
			return false;
		}     
		if (pw.length < 6 || pw.length > 16) {
			$('#'+input.id+'Warning').html("비밀번호는 6 ~ 16 자리로 입력해주세요.");
			$('#'+input.id).parent().removeClass("has-error").removeClass("has-warning").removeClass("has-success").addClass("has-error");
			$('#'+input.id).parent().children().eq(3).removeClass("glyphicon-remove").removeClass("glyphicon-ok").addClass("glyphicon-remove");
			$('#'+input.id).parent().children().eq(4).html("(error)");
			return false;
		}
		$('#userPasswordWarning, #PASSWORDWarning').html("");
		$('#userPassword,#Password').parent().removeClass("has-success").removeClass("has-warning").removeClass("has-error").addClass("has-success");
		$('#glyphicon1,#glyphicon2').removeClass("glyphicon-ok").removeClass("glyphicon-remove").addClass("glyphicon-ok");
		$('#userPasswordStatus,#PasswordStatus').html("(success)");
		return true;
	}
	function check_form(){
		if(check_null() == false){
			return false;
		} else if(check_password() == false){
			alert("비밀번호가 일치하지 않습니다!");
			form.elements["PASSWORD"].focus();
			return false;
		} else if(document.getElementById("levels").value<0){
			alert("구분을 선택해 주세요!");
			document.getElementById("levels").focus();
			return false;
		} else {
			document.getElementById("register").submit();
		}
	}
	function checking(){
		if(document.getElementById("userPassword").val != '' && document.getElementByID("Password").val != ''){
			password_chk(document.getElementById("userPassword"));
			password_chk(document.getElementByID("Password"));
		}
	}
	</script>
	<div class="col-md-8 col-md-offset-2">
		<form class="form-horizontal" id="request" method="POST" action="${pageContext.request.contextPath}/loginController/myPage.do">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="userId">아이디</label>
							<input type="text" class="form-control" id="userId" name="userId" value="${ sessionScope.userInfo.getId() }" disabled>
						</div>
					</div>
					<div class="col-md-4">
						<span id = "userIdWarn"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group has-feedback">
							<label for="userPassword">비밀번호</label>
							<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" onblur="javascript:password_chk(this);" onkeyup="javascript:password_chk(this);" aria-describedby="userPasswordStatus">
							<span id="glyphicon1" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
							<span id="userPasswordStatus" class="sr-only">(success)</span>
						</div>
					</div>
					<div class="col-md-4">
						<span id="userPasswordWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group has-feedback">
							<label for="PASSWORD">비밀번호확인</label>
							<input type="password" class="form-control" id="PASSWORD" name="PASSWORD" placeholder="비밀번호를 다시 입력하세요" onblur="javascript:password_chk(this);" onkeyup="javascript:password_chk(this);" aria-describedby="PasswordStatus">
							<span id="glyphicon2" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
							<span id="PasswordStatus" class="sr-only">(success)</span>
						</div>
					</div>
					<div class="col-md-4">
						<span id="PASSWORDWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="userName">성명</label>
							<input type="text" class="form-control" id="userName" name="userName" value="${ sessionScope.userInfo.getName() }">
						</div>
					</div>
					<div class="col-md-4">
						<span id="nmWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="birthDate">생년월일</label>
							<input type="text" id="birthDate" class="form-control" name="birthDate" value="${ fn:substring(sessionScope.userInfo.getBirthDate(),0,10) }">
						</div>
					</div>
					<div class="col-md-4">
						<span id="bdWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="serialNum">주민등록번호 뒷자리</label>
							<input type="password" class="form-control" id="serialNum" name="serialNum" placeholder="번호를 입력하세요">
						</div>
					</div>
					<div class="col-md-4">
						<span id="snWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="schooling">학력</label>
							<textarea class="form-control" id="schooling" name="schooling" rows="5"><c:out value="${ sessionScope.userInfo.getName() }"/></textarea>
						</div>
					</div>
					<div class="col-md-4">
						<span id="scWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="levels">구분</label>
							<select class="form-control" id="levels" name="levels" disabled>
								<option value="" selected>구분을 선택하세요</option>
								<option value="EMPLOYEE">일반직원</option>
								<option value="EXECUTIVE">임원진</option>
							</select>
							<script>
							document.getElementById('levels').value = ${ sessionScope.userInfo.getLevels() };
							</script>
						</div>
					</div>
					<div class="col-md-4">
						<span id="lvWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="entryDate">입사일자</label>
							<input type="text" id="entryDate" class="form-control" name="entryDate" value="${ fn:substring(sessionScope.userInfo.getEntryDate(),0,10) }" disabled>
						</div>
					</div>
					<div class="col-md-4">
						<span id="edWarning" class="text-danger"></span>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="row">
					<p id="buttonrow" class="text-center">
						<button type="button" class="btn btn-success" onclick="javascript:check_form();">가입신청</button>
						<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/loginController/logout'">취소</button>
					</p>
				</div>
			</div>
		</form>
	</div>