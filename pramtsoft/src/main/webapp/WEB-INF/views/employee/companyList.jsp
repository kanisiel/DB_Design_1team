<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.Company" %>
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
		<style type="text/css">
			.scrollable{
				overflow-y: scroll;
				height: 400px;
				width: 100%;
				position: absolute;
			}
			.heightedPanel{
				min-height: 30;
		        max-height: 300;
		        overflow-y: scroll;
			}
			.heighted{
				min-height: 200;
		        max-height: 300;
		        overflow-y: scroll;
			}
		</style>
	</head>
	<body>
	<div class="container">
	<form id="selcectCompany" method="POST" action="${pageContext.request.contextPath}/approvalController/addCompany.do">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-2">
						<p class="text-center"><strong>약칭</strong></p>
					</div>
					<div class="col-xs-4">
						<p class="text-center"><strong>영문 사명</strong></p>
					</div>
					<div class="col-xs-4">
						<p class="text-center"><strong>기타언어 사명</strong></p>
					</div>
					<div class="col-xs-2">
						<p class="text-center"><strong>선택</strong></p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 heightedPanel">
						<c:forEach var="company" items="${ companyList }" varStatus="status">
							<div class="row">
								<div class="col-xs-2">
									<p class="text-center"><c:out value="${ company.getcIdx() }"/></p>
									<input class="form-control hidden" type="text" id="company${ status.count }idx" value="${ company.getcIdx() }">
								</div>
								<div class="col-xs-4">
									<p id="company${ status.count }name" class="text-center"><c:out value="${ company.getNameEn() }"/></p>
								</div>
								<div class="col-xs-4">
									<p id="company${ status.count }name2" class="text-center"><c:out value="${ company.getNameOther() }"/></p>
								</div>
								<div class="col-xs-2">
									<input id="company${ status.count }" type="button" value="선택" onclick="window.opener.setCompany('${ company.getcIdx() }','${ company.getNameOther() }'); window.close()">
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-2">
						<input class="form-control" type="text" id="addCidx" name="addCidx" placeholder="추가할 기업의 약칭을 입력해 주세요">
					</div>
					<div class="col-xs-4">
						<input class="form-control" type="text" id="addNameEn" name="addNameEn" placeholder="추가할 기업의 영문 사명을 입력해 주세요">
					</div>
					<div class="col-xs-4">
						<input class="form-control" type="text" id="addNameOther" name="addNameOther" placeholder="추가할 기업의 기타언어 사명을 입력해 주세요">
					</div>
					<div class="col-xs-2">
						<input type="submit" value="추가">
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
	</body>
</html>