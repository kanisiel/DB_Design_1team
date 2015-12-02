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
			.scrollable{
				overflow-y: scroll;
				height: 200px;
				width: 100%;
				position: absolute;
			}
			.heightedPanel{
				min-height: 380;
		        max-height: 500;
		        overflow-y: scroll;
			}
			.heighted{
				min-height: 200;
		        max-height: 300;
		        overflow-y: scroll;
			}
			table { 
				margin: 0;
				padding: 0 
			}
    	</style>
		<script>
		//arguments: reference to select list, callback function (optional)
		function getSelectedOptions(sel, fn) {
			var opts = [];
			// loop through options in select list
			$("#"+sel+" > option").each(function() {
				opt = this;
				// check if selected
				if ( this.selected ) {
					// add to array of option elements to return from this function
					opts.push(this);
				         
					// invoke optional callback function if provided
					if (fn) {
						fn(this);
					}
				}
			});
			 
			// return array containing references to selected option elements
			return opts;
		}
		
		//example callback function (selected options passed one by one)
		function callback(opt) {
			// can access properties of opt, such as...
			//alert( opt.value )
			//alert( opt.text )
			//alert( opt.form )
			
			// display in textarea for this example
			var innerHTML = $('#putEmp').html();
			innerHTML += opt.value + ', ';
			$('#putEmp').html(innerHTML);
		}
		//anonymous function onchange for select list with id demoSel
		function changeSelect(id) {
			// get reference to display textarea
			$('#putEmp').html("");
			 
			// callback fn handles selected options
			getSelectedOptions(id, callback);
			 
			// remove ', ' at end of string
			var str = $('#putEmp').html().slice(0, -2);
			$('#putEmp').html(str);
		}
		function selectUser(id, from, to){
			var name = $("#"+id+"name").text();
			var	append = "님을 프로젝트에 투입하시겠습니까?";
			
			if(confirm(name+append)){
				if(id.match("exe")){
					$("#"+from).append($("#"+to).children());
					$("#holder").attr("value",$("#"+id+"uid").text());
				} else if(id.match("emp")){
					$("#"+id+"option").attr("selected","selected");
					changeSelect("puts");
				}
				$("#"+to).append($("#"+id));
				$("#"+id).attr("onclick","cancelUser('"+id+"','"+from+"','"+to+"')");
			}
		}
		function cancelUser(id, from, to){
			var name = $("#"+id+"name").text();
			var append = "님을 프로젝트에서 제외하시겠습니까?";
			
			if(confirm(name+append)){
				if(id.match("exe")){
					$("#"+from).append($("#"+to).children());
					$("#holder").attr("value","");
				} else if(id.match("emp")){
					$("#"+id+"option").removeAttr("selected");
					changeSelect("puts");
				}
				$("#"+from).append($("#"+id));
				$("#"+id).attr("onclick","selectUser('"+id+"','"+from+"','"+to+"')");
			}
		}
		</script>
	</head>
	<body>
	<div class="container">
		<div class="row">
			<div id = "employeeInfo" class="col-xs-12">
				<div class="col-xs-6">
					<div class="panel panel-default">
						<div class="panel-head">
							<div id="empListHead" class="col-xs-12">
								<h3>직원 목록</h3>
							</div>
						</div>
						<div class="panel-body" style="padding:0; margin:0;">
							<div id="empList" class="col-xs-12 heighted" style="padding:0; margin:0">
								<c:forEach var="employee" items="${ sessionScope.freeList }" varStatus="status">
									<div id="emp${status.count}" class="col-xs-12" onclick="selectUser(this.id,'empList','putList'); " style="margin:0;">
										<table class="table table-striped">
											<tr>
												<td><span id="emp${status.count}name"><c:out value="${ employee.getName() }"/></span></td>
												<td><span id="emp${status.count}uid"><c:out value="${ employee.getUidx() }"/></span></td>
											<tr>
										</table>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="panel panel-default heightedPanel">
						<div class="panel-head">
							<div id="putHead" class="col-xs-12">
								<h3>투입 직원</h3>
							</div>
						</div>
						<div class="panel-body" style="padding:0; margin:0;">
							<div id="putList" class="col-xs-12" style="padding:0; margin:0;">
								
							</div>
						</div>
					</div>
				</div>
				<!-- inputs for Send data -->
		        <div class="form-group hidden">
					<select id="puts" name="puts" multiple class="form-control" onchange="changeSelect(this.id)">
						<c:forEach var="employee" items="${ sessionScope.empList }" varStatus="status">
							<option id="emp${ status.count }option" value="${ employee.getUidx() }"><c:out value="${ employee.getUidx() }"/></option>
						</c:forEach>
					</select>
				</div>
		        <div class="form-group hidden">
		        	<textarea class="form-control" id="putEmp" name="putEmp" rows="5"></textarea>
		        </div>
			</div>
		</div>
	</div>
</body>
</html>