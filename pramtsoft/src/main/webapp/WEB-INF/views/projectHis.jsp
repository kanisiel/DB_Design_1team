<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
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
	</script>
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			<div class="panel-body heighted">
				<div class="row">
					<div class="col-md-3">
						<div class="row">
				        	<h1><small>프로젝트</small></h1>
				     	</div>
						<div class="row">
							<ul class="nav nav-tabs">
					        	<li role="presentation" id="prog" class="active"><a href="#" onclick="show_form('prog')">진행중</a></li>
					        	<li role="presentation" id="end"><a href="#" onclick="show_form('end')">종료</a></li>
					        	<li role="presentation" id="all"><a href="#" onclick="show_form('all')">전체</a></li>
					     	</ul>
					      	<ul id="progInfo" class="nav nav-pills nav-stacked">
						        <c:forEach var="project" items="${ sessionScope.progressList.getProList() }" varStatus="status">
						        	 <li><a href="javascript:;"><c:out value="${ project.getName() }"/></a></li>
						        </c:forEach>
					      	</ul>
					     	<ul id="endInfo" class="nav nav-pills nav-stacked hidden">
						      	<c:forEach var="project" items="${ sessionScope.endList.getProList() }" varStatus="status">
						        	 <li><a href="javascript:;"><c:out value="${ project.getName() }"/></a></li>
						        </c:forEach>
					      	</ul>
					      	<ul id="allInfo" class="nav nav-pills nav-stacked hidden">
						      	<c:forEach var="project" items="${ sessionScope.allList.getProList() }" varStatus="status">
						        	 <li><a href="${pageContext.request.contextPath}/executiveController/project?pid=${ project.getPid() }"><c:out value="${ project.getName() }"/></a></li>
						        </c:forEach>
					      	</ul>
						</div>
				    </div>
				    <div class="col-md-9" style="padding:5px;">
				    <c:choose>
						<c:when test="${ sessionScope.projectInfo == null }">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
							       		<div class="jumbotron heightedChild">
											<h2>프로젝트를 선택하세요!</h2>
											<p><small>프로젝트를 선택하시면 상세 정보를 볼 수 있습니다.</small></p>
										</div>
						      		</div>
						      	</div>
					      	</div>
				      	</c:when>
				      	<c:otherwise>
				      		<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
							        	<h1><small>프로젝트 정보</small></h1>
							      	</div>
							      	<div class="row">
							        	<div class="col-md-3">
							        		<p>프로젝트 코드</p>
							        	</div>
							        	<div class="col-md-3">
							        		<p><c:out value="${ sessionScope.projectInfo.getPid() }"/></p>
							        	</div>
							        	<div class="col-md-2">
							        		<p>상태</p>
							        	</div>
							        	<div class="col-md-4">
							        		<p><c:out value="${ sessionScope.projectInfo.getMeaning() }"/></p>
							        	</div>
							      	</div>
							      	<div class="row">
							        	<div class="col-md-3">
							        		<p>프로젝트명</p>
							        	</div>
							        	<div class="col-md-3">
							        		<p><c:out value="${ sessionScope.projectInfo.getName() }"/></p>
							        	</div>
							        	<div class="col-md-2">
							        		<p>시작일</p>
							        	</div>
							        	<div class="col-md-4">
							        		<p><fmt:parseDate value="${ fn:substring(sessionScope.projectInfo.getStartDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
												<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/></p>
							        	</div>
							      	</div>
							      	<div class="row">
							        	<div class="col-md-3">
							        		<p>필요인원</p>
							        	</div>
							        	<div class="col-md-3">
							        		<p><c:out value="${ sessionScope.projectInfo.getRequireMan() }"/></p>
							        	</div>
							        	<div class="col-md-2">
							        		<p>종료일</p>
							        	</div>
							        	<div class="col-md-4">
							        		<p><fmt:parseDate value="${ fn:substring(sessionScope.projectInfo.getEndDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
												<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/></p>
							        	</div>
							      	</div>
							      	<div class="row">
							        	<div class="col-md-3">
							        		<p>프로젝트 매니저</p>
							        	</div>
							        	<div class="col-md-3">
							        		<p><c:out value="${ sessionScope.projectInfo.getManagerName() }"/></p>
							        	</div>
							        	<div class="col-md-2">
							        		<p>발주처</p>
							        	</div>
							        	<div class="col-md-4">
							        		<p><c:out value="${ sessionScope.projectInfo.getOrdererName() }"/></p>
							        	</div>
							      	</div>
						      	</div>
					      	</div>
				      		<div class="panel panel-default">
								<div class="panel-body">
							      	<div class="row">
							        	<h1><small>참여자 정보</small></h1>
							      	</div>
							      	<div class="row">
							        	프로젝트 정보
						      		</div>
						      	</div>
							</div>
				      	</c:otherwise>
				      </c:choose>	
					</div>
				</div>
			</div>
		</div>
	</div>