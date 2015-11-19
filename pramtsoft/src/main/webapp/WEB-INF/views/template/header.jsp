<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserInfo" %>
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
	
	
	<%-- <c:set value="${sessionScope.userInfo}" var="userInfo" /> --%>			
	<div class="col-md-8 col-md-offset-2">
		<p class="text-center" onclick="location.href='${pageContext.request.contextPath}/'"><font style="font-size:34px"><Strong>프람트소프트 관리 시스템</Strong></font></p>
	</div>
	<div class="col-md-8 col-md-offset-2">
		<p class="text-right"><strong>${sessionScope.userInfo.getName()}</strong>씨, 반갑습니다.<a class="btn btn-default btn-xs" href="${pageContext.request.contextPath}/loginController/logout" role="button">로그아웃</a></p>
	</div>
	<div class="col-md-8 col-md-offset-2">
		<p class="text-center"><font style="font-size:13px;color:#FF3333;">${errorCode}</font><p class="text-center">
	</div>
	<div class="col-md-8 col-md-offset-2">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<c:choose>
					<c:when test="${userInfo.getLevels() =='EXECUTIVE' }">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/executiveController/approveRegRequest';">가입승인</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" onClick="javascript:addText('결재시스템');">결재시스템</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-info" onClick="location.href='${pageContext.request.contextPath}/executiveController/memberList';">직원</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-success" onClick="javascript:addText('프로젝트');">프로젝트</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-warning" onClick="location.href='${pageContext.request.contextPath}/loginController/mypage';">마이페이지</button>
						</div>
					</c:when>
					<c:when test="${userInfo.getLevels() == 'EMPLOYEE' }">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-info" onClick="javascript:addText('프로젝트');">프로젝트</button>
						</div>
						<div class="btn-group dropdown">
							<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							결재시스템 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${pageContext.request.contextPath}/approvalController/request">결제요청</a></li>
								<li><a href="#">결재목록</a></li>
								<li class="divider"></li>
								<li><a href="#">결재이력</a></li>
							</ul>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-warning" onClick="location.href='${pageContext.request.contextPath}/loginController/mypage';">마이페이지</button>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="col-md-8 col-md-offset-2">
		
	</div><!-- 
	<div class="btn-group">
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" role="menu">
	    <li><a href="#">Action</a></li>
	    <li><a href="#">Another action</a></li>
	    <li><a href="#">Something else here</a></li>
	    <li class="divider"></li>
	    <li><a href="#">Separated link</a></li>
	  </ul>
	</div> -->
