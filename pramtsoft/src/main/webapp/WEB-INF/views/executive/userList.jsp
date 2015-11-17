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
</head>
<body>
	<div class="container">
		<div class="row">
	        <c:set var="userInfo" value="${ userInfo }" scope="request"></c:set>
			<c:import url="../template/header.jsp" />
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
		                <h1 class="panel-title">회원목록</h1>
		            </div>
		            <table class="table">
		            	<tr>
		            		<td>사번</td>
		            		<td>이름</td>
		            		<td>아이디</td>
		            		<td>생년월일</td>
		            		<td>구분</td>
		            		<td>입사일자</td>
		            	</tr>
		            	<c:forEach var="user" items="${ userList.getReqList() }" varStatus="status">
		            	<tr>
		            		<td><p><c:out value="${ user.getUidx() }"/></p></td>
		            		<td><p><c:out value="${ user.getName() }"/></p></td>
		            		<td><p><c:out value="${ user.getId() }"/></p></td>
		            		<td>
		            			<p>
			            			<fmt:parseDate value="${ fn:substring(user.getBirthDate(),0,10) }" pattern="yyyy-mm-dd" var="birthdate" />
									<fmt:formatDate value="${ birthdate }" pattern="yyyy년 mm월 dd일"/>
								</p>
							</td>
		            		<td>
		            			<p>
			            			<c:choose>
			            				<c:when test="${ user.getLevels() == 'EMPLOYEE' }">직원</c:when>
			            				<c:otherwise>임원진</c:otherwise>
			            			</c:choose>
		            			</p>
		            		</td>
		            		<td>
		            			<p>
		            				<fmt:parseDate value="${ fn:substring(user.getEntryDate(),0,10) }" pattern="yyyy-mm-dd" var="entrydate" />
									<fmt:formatDate value="${ entrydate }" pattern="yyyy년 mm월 dd일"/>
		            			</p>
		            		</td>
		            	</tr>
		            	</c:forEach>
		            </table>
				</div>
				<div class="text-center">
					<nav>
						<ul class="pagination">
							<li>
							<c:choose>
								<c:when test="${ page > 5 }">
								<c:set var="floored" scope="session" value="${ (page/5) - ((page/5)%1) }"/>
								<a href="${pageContext.request.contextPath}/executiveController/memberList?p=${ (page - 5) }" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
								</c:when>
								<c:otherwise>
									<c:set var="floored" scope="session" value="1"/>
									<span aria-hidden="true">&laquo;</span>
								</c:otherwise>
							</c:choose>
							</li>
							<c:forEach begin="0" end="4" var="steps">
								<c:if test="${ (floored + steps) <= max }">
							<li><a href="${pageContext.request.contextPath}/executiveController/memberList?p=${ floored + steps }"><c:out value="${ floored + steps }"></c:out></a></li>
								</c:if>
							</c:forEach>
							<li>
							<c:choose>
								<c:when test="${ (max - page) > 4 }">
								<a href="${pageContext.request.contextPath}/executiveController/memberList?p=${ (page + 5) }" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
								</c:when>
								<c:otherwise>
									<span aria-hidden="true">&raquo;</span>
								</c:otherwise>
							</c:choose>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>