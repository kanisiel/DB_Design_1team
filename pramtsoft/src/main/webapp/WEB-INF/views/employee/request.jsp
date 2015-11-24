<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
	<style type="text/css">
	.scrollable{
		overflow-y: scroll;
		height: 200px;
		width: 100%;
		position: absolute;
	}
	.heightedPanel{
		min-height: 300;
        max-height: 500;
        overflow-y: scroll;
	}
	.heighted{
		min-height: 200;
        max-height: 300;
        overflow-y: scroll;
	}
    </style>
	<script>
	//datepicker 설정 
	$(function() {
		$( "#startDate,#endDate" ).datepicker({

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
	function company_win() { // 상태표시바 있는 팝업
		window.open("${pageContext.request.contextPath}/approvalController/campanyList", "", "width=500, height=500");
	}
	function setCompany(idx, name){
		$('#orderers').val(name);
		$('#orderer').val(idx);		
	}
	function check_date(){
		var form = document.getElementById("request");
		var start = form.elements["startDate"].value;
		var end = form.elements["endDate"].value;     
		var startArray = start.split("-");       
		var endArray = end.split("-"); 
		var startObj = new Date(startArray[0], Number(startArray[1])-1, startArray[2]);
		var endObj = new Date(endArray[0], Number(endArray[1])-1, endArray[2]);  
		var betweenDay = (endObj.getTime() - startObj.getTime())/1000/60/60/24;
		if(betweenDay < 0){
			$('#endDateWarn').html("프로젝트 기간이 잘못 입력 되었습니다!");
			$('#startDate,#endDate').parent().removeClass("has-error").removeClass("has-warning").removeClass("has-success").addClass("has-error");
			$('#startIcon,#endIcon').removeClass("glyphicon-remove").removeClass("glyphicon-ok").addClass("glyphicon-remove");
			$('#startDateStatus,#endDateStatus').html("(error)");
			return false;
		} else {
			$('#endDateWarn').html("");
			$('#startDate,#endDate').parent().removeClass("has-success").removeClass("has-warning").removeClass("has-error").addClass("has-success");
			$('#startIcon,#endIcon').removeClass("glyphicon-ok").removeClass("glyphicon-remove").addClass("glyphicon-ok");
			$('#startDateStatus,#endDateStatus').html("(success)");
			return true;
		}
		return true;
	}
	function show_form(name){
		$('#project, #employee, #approve').removeClass("active");
		$('#projectInfo, #employeeInfo, #approveInfo').addClass("hidden");
		$('#'+name).addClass("active");
		$('#'+name+"Info").removeClass("hidden");
	}
	function selectUser(id, from, to){
		var name = $("#"+id+"name").text();
		var append = "";
		if(id.match("exe")){
			append = "님을 승인권자로 선택하시겠습니까?";
		} else {
			append = "님을 프로젝트에 투입하시겠습니까?";
		}
		if(confirm(name+append)){
			if(id.match("exe")){
				$("#"+from).append($("#"+to).children());
				$("#holder").attr("value",$("#"+id+"uid").text());
			} else if(id.match("emp")){
				$("#"+id+"option").attr("selected","selected");
				changeSelect("puts");
			}
			$("#"+to).append($("#"+id));
			$("#"+id).attr("onclick","cancelUser('"+id+"','"+from+"','"+to+"')");
		}
	}
	function cancelUser(id, from, to){
		var name = $("#"+id+"name").text();
		var append = "";
		if(id.match("exe")){
			append = "님을 승인권자에서 취소하시겠습니까?";
		} else {
			append = "님을 프로젝트에서 제외하시겠습니까?";
		}
		if(confirm(name+append)){
			if(id.match("exe")){
				$("#"+from).append($("#"+to).children());
				$("#holder").attr("value","");
			} else if(id.match("emp")){
				$("#"+id+"option").removeAttr("selected");
				changeSelect("puts");
			}
			$("#"+from).append($("#"+id));
			$("#"+id).attr("onclick","selectUser('"+id+"','"+from+"','"+to+"')");
		}
	}
	function check_null(){
		var form = document.getElementById("request");
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
	function check_form(){
		if(check_null() == false){
			return false;
		} else if(check_date() == false){
			alert("프로젝트 기간이 잘못 입력 되었습니다!");
			form.elements["startDate"].focus();
			return false;
		} else if(document.getElementById("holder").value==""){
			alert("승인권자를 선택해 주세요!");
			document.getElementById("holder").focus();
			return false;
		} else {
			document.getElementById("request").submit();
		}
	}
	$( ".sortable" ).sortable({
	  items       : 'div:not(.unsortable)',
	  placeholder : 'sortable-placeholder'
	});
	$( ".sortable" ).disableSelection();
	</script>
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
		<div class="panel-body heightedPanel">
			<form class="form-horizontal" id="request" method="POST" action="${pageContext.request.contextPath}/approvalController/request.do">
				<div id = "navbar" class="col-md-12">
					<ul class="nav nav-pills">
						<li role="presentation" id="project" class="active"><a onclick="show_form('project');">프로젝트정보</a></li>
						<li role="presentation" id="approve"><a  onclick="show_form('approve');">결제정보</a></li>
					</ul>
				</div>
				<div id ="projectInfo" class="col-md-12">
					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<label for="projectName">프로젝트명</label>
								<input type="text" class="form-control" id="projectName" name="projectName" placeholder="프로젝트명을 입력하세요">
							</div>
						</div>
						<div class="col-md-4">
							<span id = "projectWarn"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="form-group has-feedback">
								<label for="startDate">프로젝트 시작일</label>
								<input type="text" class="form-control" id="startDate" name="startDate" placeholder="프로젝트 시작일을 입력하세요" onchange="check_date();">
								<span id="startIcon" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="startDateStatus" class="sr-only">(success)</span>
							</div>
						</div>
						<div class="col-md-4">
							<span id = "startDateWarn"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="form-group has-feedback">
								<label for="endDate">프로젝트 종료일</label>
								<input type="text" class="form-control" id="endDate" name="endDate" placeholder="프로젝트 종료일을 입력하세요" onblur="check_date();" onchange="check_date();">
								<span id="endIcon" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="endDateStatus" class="sr-only">(success)</span>
							</div>
						</div>
						<div class="col-md-4">
							<span id = "endDateWarn"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="form-group has-feedback">
								<label for="reqmanning">필요인원</label>
								<input type="text" class="form-control" id="reqmanning" name="reqmanning" placeholder="필요인원을 입력하세요">
							</div>
						</div>
						<div class="col-md-4">
							<span id = "endDateWarn"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="form-group has-feedback">
								<label for="orderer">발주처</label>
								<input type="text" class="form-control" id="orderers" name="orderers" onclick="company_win();">
								<input type="text" class="form-control hidden" id="orderer" name="orderer">
							</div>
						</div>
						<div class="col-md-4">
							<span id = "endDateWarn"></span>
						</div>
					</div>
				</div>
				<div id ="approveInfo" class="col-md-12 hidden">
					<div class="col-md-6">
						<div id="exeListHead" class="col-md-12">
							<h3>임원진 목록</h3>
						</div>
						<div id="exeList" class="col-md-12 heighted">
							<c:forEach var="executive" items="${ sessionScope.exeList }" varStatus="status">
								<div id="exe${status.count}" class="col-md-12" onclick="selectUser(this.id,'exeList','approval'); ">
									<table class="table table-striped">
										<tr>
											<td><span id="exe${status.count}name"><c:out value="${ executive.getName() }"/></span></td>
											<td><span id="exe${status.count}uid"><c:out value="${ executive.getUidx() }"/></span></td>
										<tr>
									</table>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-6">
						<div id="approvalHead" class="col-md-12">
							<h3>승인권자</h3>
						</div>
						<div id="approval" class="col-md-12">
						</div>
					</div>
					<input type="text" id="holder" name="holder" class="hidden" value=""/>
				</div>
				<div id = "footer" class="col-md-12">
					<p id="buttonrow" class="text-center">
						<button id="requestSubmit" type="button" class="btn btn-success" onclick="check_form();">결제요청</button>
						<button id="cancel" type="button" class="btn btn-warning" onclick="">취소</button>
					</p>
				</div>
			</form>
		</div>
		</div>
	</div>