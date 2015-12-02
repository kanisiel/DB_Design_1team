<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.Company" %>
<%@ page import="kr.co.pms.model.UserList" %>
<%@ page session="true" %>
<fmt:setLocale value="ko" scope="session"/>
<html id="home" lang="ko">
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
		<style>
		.heighted { 
			min-height : 450;
			max-height : 500;
			overflow-y : scroll;
		}
		.heightedChild { 
			margin : 2px;
			min-height : 380;
			max-height : 420;
			overflow-y : scroll;
		}
		</style>
		<script type="text/javascript">
		    function show_form(name){
		      $('#prog, #end, #all').removeClass("active");
		  		$('#progInfo, #endInfo, #allInfo').addClass("hidden");
		  		$('#'+name).addClass("active");
		  		$('#'+name+"Info").removeClass("hidden");
		    }
		    function submit_form(type){
		    	$('#atype').val(type);
		    	if(type=='approve'){
		    		$('#approvalDetail').submit();
		    	} else if(type == 'turndown'){
		    		var description = prompt("반려 이유를 적어주세요", "");
		    		$('#description').val(description);
		    		$('#approvalDetail').submit();
		    	}
		    }
		</script>
		<c:if test="${ status == 'Success' }">
			<script>
				window.opener.location.reload();
				window.close();
			</script>
		</c:if>
	</head>
	<body>
		<div class="container">
			<form id="approvalDetail" method="POST" action="${pageContext.request.contextPath}/approvalController/approve.do">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body heighted">
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
								        	<h1><small>프로젝트 정보</small></h1>
								      	</div>
								      	<div class="row">
								        	<div class="col-xs-3">
								        		<p>프로젝트 코드</p>
								        	</div>
								        	<div class="col-xs-3">
								        		<p><c:out value="${ sessionScope.projectInfo.getPid() }"/></p>
								        	</div>
								        	<div class="col-xs-2">
								        		<p>상태</p>
								        	</div>
								        	<div class="col-xs-4">
								        		<p><c:out value="${ sessionScope.projectInfo.getMeaning() }"/></p>
								        	</div>
								      	</div>
								      	<div class="row">
								        	<div class="col-xs-3">
								        		<p>프로젝트명</p>
								        	</div>
								        	<div class="col-xs-3">
								        		<p><c:out value="${ sessionScope.projectInfo.getName() }"/></p>
								        	</div>
								        	<div class="col-xs-2">
								        		<p>시작일</p>
								        	</div>
								        	<div class="col-xs-4">
								        		<p><fmt:parseDate value="${ fn:substring(sessionScope.projectInfo.getStartDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
													<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/></p>
								        	</div>
								      	</div>
								      	<div class="row">
								        	<div class="col-xs-3">
								        		<p>필요인원</p>
								        	</div>
								        	<div class="col-xs-3">
								        		<p><c:out value="${ sessionScope.projectInfo.getRequireMan() }"/></p>
								        	</div>
								        	<div class="col-xs-2">
								        		<p>종료일</p>
								        	</div>
								        	<div class="col-xs-4">
								        		<p><fmt:parseDate value="${ fn:substring(sessionScope.projectInfo.getEndDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
													<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/></p>
								        	</div>
								      	</div>
								      	<div class="row">
								        	<div class="col-xs-3">
								        		<p>프로젝트 매니저</p>
								        	</div>
								        	<div class="col-xs-3">
								        		<p><c:out value="${ sessionScope.projectInfo.getManagerName() }"/></p>
								        	</div>
								        	<div class="col-xs-2">
								        		<p>발주처</p>
								        	</div>
								        	<div class="col-xs-4">
								        		<p><c:out value="${ sessionScope.projectInfo.getOrdererName() }"/></p>
								        	</div>
								      	</div>
							      	</div>
								</div>
							</div>
							<c:if test="${ userInfo.getLevels() == 'EXECUTIVE' }">
								<div class="row">
									<p id="buttonrow" class="text-center">
										<button type="button" class="btn btn-success" onclick="javascript:submit_form('approve');">승인</button>
										<button type="button" class="btn btn-warning" onclick="javascript:submit_form('turndown')">반려</button>
									</p>
								</div>
							</c:if>
							<div class="row hidden">
								<input type="text" id="description" name="description" value=""/>
								<input type="text" id="atype" name="atype" value=""/>
								<input type="text" id="did" name="did" value="${ sessionScope.did }"/>
								<input type="text" id="pid" name="pid" value="${ sessionScope.projectInfo.getPid() }"/>
								<input type="text" id="manager" name="manager" value="${ sessionScope.projectInfo.getManager() }"/>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>