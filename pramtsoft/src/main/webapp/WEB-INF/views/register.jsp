<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html id="home" lang="en">
  <head>
    <meta charset=utf-8 />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>프람트소프트 관리시스템</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
	//datepicker 설정 
	$(function() {
		$( "#birthDate,#entryDate" ).datepicker({

			  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.

			  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.

			  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.

			  nextText: '다음 달', // next 아이콘의 툴팁.

			  prevText: '이전 달', // prev 아이콘의 툴팁.

			  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.

			  stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 

			  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.

			  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 

			  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널

			  closeText: '닫기',  // 닫기 버튼 패널

			  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.

			  showAnim: "slide", //애니메이션을 적용한다.

			  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 

			  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.

			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.

			 });
	});
	</script>
	<title>회원가입</title>
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
	</head>
	<body onKeypress="checking();">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1><Strong>프람트소프트 관리 시스템 <small>회원가입</small></Strong></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<form  id=register method="POST" action="${pageContext.request.contextPath}/loginController/createAccount.do">
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label for="userId">아이디</label>
									<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요">
								</div>
							</div>							
							<div class="col-md-4">
								<p id="idWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group has-feedback">
									<label for="userPassword">비밀번호</label>
									<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" onblur="javascript:password_chk(this);" onkeyup="javascript:password_chk(this);" aria-describedby="userPasswordStatus">
									<span id="glyphicon1" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="userPasswordStatus" class="sr-only">(success)</span>
								</div>
							</div>							
							<div class="col-md-4">
								<p id="userPasswordWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group has-feedback">
									<label for="PASSWORD">비밀번호확인</label>
									<input type="password" class="form-control" id="PASSWORD" name="PASSWORD" placeholder="비밀번호를 다시 입력하세요" onblur="javascript:password_chk(this);" onkeyup="javascript:password_chk(this);" aria-describedby="PasswordStatus">
									<span id="glyphicon2" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="PasswordStatus" class="sr-only">(success)</span>
								</div>
							</div>							
							<div class="col-md-4">
								<p id="PASSWORDWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="userName">성명</label>
									<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요">
								</div>
							</div>							
							<div class="col-md-4">
								<p id="nmWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="birthDate">생년월일</label>
									<input type="text" id="birthDate" class="form-control" name="birthDate" placeholder="생일을 선택하세요">
								</div>
							</div>							
							<div class="col-md-4">
								<p id="bdWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="serialNum">주민등록번호 뒷자리</label>
									<input type="password" class="form-control" id="serialNum" name="serialNum" placeholder="번호를 입력하세요">
								</div>
							</div>							
							<div class="col-md-4">
								<p id="snWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="schooling">학력</label>
									<textarea class="form-control" id="schooling" name="schooling" rows="5" placeholder="학력을 입력하세요"></textarea>
								</div>
							</div>							
							<div class="col-md-4">
								<p id="scWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="levels">구분</label>
									<select class="form-control" id="levels" name="levels">
										<option value=-1 selected>구분을 선택하세요</option>
										<option value=6>일반직원</option>
										<option value=1>임원진</option>
									</select>
								</div>
							</div>							
							<div class="col-md-4">
								<p id="lvWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="department">부서</label>
									<select id="department" class="form-control" name="department" onchange="allow_sec()">
										<option>부서를 선택하세요</option>
										<c:forEach var="department" items="${ depList.getDepList() }" varStatus="status">
											<option value="${ department.getDidx() }"><c:out value="${ department.getNameOther() }"/></option>
										</c:forEach>
									</select>
								</div>	
							</div>							
							<div class="col-md-4">
								<p id="deWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="section">과</label>
									<select id="section" class="form-control" name="section" onchange="sync()" disabled>
										<option value="">과를 선택하세요</option>
										<c:forEach var="section" items="${ secList.getSecList() }" varStatus="status">
											<option value="${ section.getSidx() }"><c:out value="${ section.getNameOther() }"/></option>
										</c:forEach>
									</select>
									<select id="secDep" class="form-control hidden" name="secDep">
										<option value="">과를 선택하세요</option>
										<c:forEach var="sec" items="${ secList.getSecList() }" varStatus="status">
											<option value="${ sec.getDepartment() }"><c:out value="${ sec.getSidx() }"/></option>
										</c:forEach>
									</select>
									<script>
									function sync(){
										$('#secDep option').each(function () {
											if($(this).text() == $('#section').val()){
												$(this).attr("selected","selected");
												document.getElementById("secDep").value = $(this).val();
											}
										});
									}
									function allow_sec(){
										var val;
										$('#section').val("");
										$('#section option').each(function () {
											$(this).addClass("hidden");
										});
										$('#section').removeAttr("disabled");
										$('#secDep option').each(function () {
											if($(this).val() == $('#department').val()){
												val = $(this).text();
												$("#section>option[value="+$(this).text()+"]").removeClass("hidden");
											}
										});
									}
									</script>
								</div>	
							</div>							
							<div class="col-md-4">
								<p id="seWarning" class="text-danger"></p>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="entryDate">입사일자</label>
									<input type="text" id="entryDate" class="form-control" name="entryDate" placeholder="입사일을 선택하세요">
								</div>	
							</div>							
							<div class="col-md-4">
								<p id="edWarning" class="text-danger"></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 col-md-offset-2">
								<div class="btn-group btn-group-justified" role="group" aria-label="CLR">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-success" onclick="javascript:check_form();">가입신청</button>
									</div>
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/loginController/logout'">취소</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>