<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
	<div class="col-md-8 col-md-offset-2">
	<form class="form">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">결재 문서 목록</h3>
					</div>
					<div id="body">
						<table id="list" class="table table-hover">
							<thead>
								<tr class="table-heading">
									<th><p class="text-center"><Strong>문서번호</Strong></p></th>
									<th><p class="text-center"><Strong>문서명<br>(프로젝트명)</Strong></p></th>
									<th><p class="text-center"><Strong>기안자</Strong></p></th>
									<th><p class="text-center"><Strong>승인권자</Strong></p></th>
									<th><p class="text-center"><Strong>상태</Strong></p></th>
									<th><p class="text-center"><Strong>보기</Strong></p></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="document" items="${ sessionScope.docList.getDocList() }" varStatus="status">
									<c:set var="project" value="${ document.getProject() }"/>
									<tr>
										<td><p class="text-center"><c:out value="${ document.getDid() }"/></p></td>
										<td><p class="text-center"><c:out value="${ project.getName() }"/></p></td>
										<td><p class="text-center"><c:out value="${ document.getDrafterName() }"/></p></td>
										<td><p class="text-center"><c:out value="${ document.getSuperiorName() }"/></p></td>
										<td><p id="status${ status.count }" class="text-center"><c:out value="${ document.getMeaningKor() }"/></p><input type="text" id="doc${status.count}" class="hidden" value="${ document.getStatus() }"/></td>
										<td><p class="text-center">
											<c:choose>
												<c:when test="${ userInfo.getLevels() == 'EMPLOYEE' }">
													<input type="button" id="btn${ status.count }" value="보기"/>
												</c:when>
												<c:when test="${ userInfo.getLevels() == 'EXECUTIVE' }">
													<input type="button" id="btn${ status.count }" value="보기" onclick="alert('/approvalController/showDocument?did=')"/>
												</c:when>
											</c:choose>
										</p></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>		
				</div>
			</div>
		</div>
	</form>
	</div>
	<script>
	var color;
	var l = $('tbody').children().length * 1;
	var idx;
	var length = parseInt(l);
	for(var i = 1;i<=length;i++){
		idx = i.toString();
		switch($('#doc'+idx).val()){
		case 'RN':
			color = "text-info";
			break;
		case 'A':
			color = "text-success";
			break;
		case 'TD':
			color = "text-danger";
			break;
		default:
			color = "";
			break;
		}
		$('#status'+idx).addClass(color);
		idx='';
	}
	</script>