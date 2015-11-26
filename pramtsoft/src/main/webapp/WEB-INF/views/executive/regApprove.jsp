<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
		$( ".sortable" ).sortable({
		  items       : 'div:not(.unsortable)',
		  placeholder : 'sortable-placeholder'
		});
		$( ".sortable" ).disableSelection();
		var depMap = ${ sessionScope.depMap };
		var secMap = ${ sessionScope.secMap };
</script>		
<fmt:setLocale value="ko" scope="session"/>
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
								 	<c:forEach var="user" items="${ sessionScope.userList.getReqList() }" varStatus="status">
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
															<td>부서</td>
															<td><p><c:out value="${ sessionScope.depMap.get( user.getDepartment() ) }"/></p></td>
														</tr>
														<tr>
															<td>과</td>
															<td><p><c:out value="${ sessionScope.secMap.get( user.getSection() ) }"/></p></td>
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

