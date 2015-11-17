<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
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
            	<c:forEach var="user" items="${ sessionScope.userList }" varStatus="status">
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
							<c:choose>
							<c:when test="${ floored + steps } != ${ page }">
					<li><a href="${pageContext.request.contextPath}/executiveController/memberList?p=${ floored + steps }"><c:out value="${ floored + steps }"></c:out></a></li>
							</c:when>
							<c:otherwise>
					<li><a><c:out value="${ floored + steps }"></c:out></a></li>
							</c:otherwise>
							</c:choose>
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
