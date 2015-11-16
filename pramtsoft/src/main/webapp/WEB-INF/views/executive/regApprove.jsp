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
									<button id="approveRequest" type="button" class="btn btn-success" onClick="javascript:addText('프로젝트');">프로젝트</button>
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
		<div class="col-md-8 col-md-offset-2">
		<form  id=register method="POST" action="${pageContext.request.contextPath}/executiveController/approveRegRequest.do">						
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
			                <h1 class="panel-title">가입신청명단</h1>
			            </div>
			            <div class="row sortable">
							<div id="forList" class="col-md-12">
							 	<c:forEach var="user" items="${ userList.getReqList() }" varStatus="status">
							 		<div id="user${status.count}" class="col-md-12">
							 			<div class="btn-group" role="group">
											<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
												<c:out value="${user.getName() }"/>
											</button>
										</div>
										<div class="collapse" id="collapseExample">
											<div class="col-md-8 hidden">
												<div class="radio">
												  <label>
												    <input type="radio" name="appUidx" id="appUidx" value="${ user.getUidx() }">
												  </label>
												</div>
											</div>		
											<div class="panel panel-default">
												<table class="table table-condensed">
													<tr>
														<td>사번</td>
														<td><p><c:out value="${ user.getUidx() }"/></p></td>
													</tr>
													<tr>
														<td>아이디</td>
														<td><p><c:out value="${ user.getId() }"/></p></td>
													</tr>
													<tr>
														<td>성명</td>
														<td><p><c:out value="${ user.getName() }"/></p></td>
													</tr>
													<tr>
														<td>구분</td>
														<td><p><c:choose><c:when test="${ user.getLevels() == 'EMPLOYEE' }">직원</c:when><c:otherwise>임원진</c:otherwise></c:choose></p></td>
													</tr>
													<tr>
														<td>생년월일</td>
														<td><p>
															
															<fmt:parseDate value="${ fn:substring(user.getBirthDate(),0,10) }" pattern="yyyy-mm-dd" var="birthdate" />
															<fmt:formatDate value="${ birthdate }" pattern="yyyy년 mm월 dd일"/>
														</p></td>
													</tr>
													<tr>
														<td>입사일자</td>
														<td><p>
															<fmt:parseDate value="${ fn:substring(user.getEntryDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
															<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/>
														</p></td>
													</tr>
												</table>
												<div class="panel-footer">
													<p id="buttonrow" class="text-center">
														<button id="approve${status.count}" type="button" class="btn btn-success" onclick="appUser('${user.getUidx()}');">승인</button>
														<button id="delete${status.count}" type="button" class="btn btn-warning" onclick="delUser('${user.getUidx()}');">삭제</button>
													</p>
												</div>
											</div>
										</div>
				                    </div>
							 	</c:forEach>
							 </div>
						</div>
					</div>
				</div>
				<div class="col-md-12 hidden">
					<input id="actions" name="actions" type="radio" value="approve"/>
					<input id="actions" name="actions" type="radio" value="delete"/>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
