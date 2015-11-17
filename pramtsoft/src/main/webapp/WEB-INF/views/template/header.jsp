<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<script type="text/javascript">
		$( ".sortable" ).sortable({
		  items       : 'div:not(.unsortable)',
		  placeholder : 'sortable-placeholder'
		});
		$( ".sortable" ).disableSelection();

		function appUser(id){
			$("input[name=appUidx][value="+id+"]").attr("checked", true);
			$("input[name=actions][value=approve]").attr("checked", true);
			$('#register').submit();
		}
		
		function delUser(id){
			$("input[name=appUidx][value="+id+"]").attr("checked", true);
			$("input[name=actions][value=delete]").attr("checked", true);
			$('#register').submit();
		}
		
	</script>
	<script>
		.center{
		    display : table-cell;
		    vertical-align : middle;
		}
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<c:set value="${requestScope.userInfo}" var="userInfo" />			
			<div class="col-md-8 col-md-offset-2">
				<p class="text-center"><font style="font-size:34px"><Strong>프람트소프트 관리 시스템</Strong></font></p>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<p class="text-right"><strong>${userInfo.getName()}</strong>씨, 반갑습니다.<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath}/loginController/logout" role="button">로그아웃</a></p>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<p class="text-center"><font style="font-size:13px;color:#FF3333;">${errorCode}</font><p class="text-center">
			</div>
			<div class="col-md-8 col-md-offset-2">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="btn-group btn-group-justified" role="group" aria-label="CLR">
							<c:choose>
								<c:when test="${userInfo.getLevels() =='EXECUTIVE' }">
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/executiveController/approveRegRequest';">가입승인</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-danger" onClick="javascript:addText('결재시스템');">결재시스템</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-info" onClick="location.href='${pageContext.request.contextPath}/executiveController/memberList';">직원</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-success" onClick="javascript:addText('프로젝트');">프로젝트</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-warning" onClick="javascript:addText('마이페이지');">마이페이지</button>
									</div>
								</c:when>
								<c:when test="${userInfo.getLevels() == 'EMPLOYEE' }">
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-info" onClick="javascript:addText('프로젝트');">프로젝트</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-success" onClick="location.href='${pageContext.request.contextPath}/approvalController/request';">결제요청</button>
									</div>
									<div class="btn-group" role="group">
										<button id="approveRequest" type="button" class="btn btn-warning" onClick="javascript:addText('마이페이지');">마이페이지</button>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-md-offset-2">
				
			</div>
		</div>
	</div>
</body>
</html>