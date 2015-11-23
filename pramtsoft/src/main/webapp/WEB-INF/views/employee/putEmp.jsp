<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
	<style type="text/css">
	.scrollable{
		overflow-y: scroll;
		height: 200px;
		width: 100%;
		position: absolute;
	}
	.heightedPanel{
		min-height: 300;
        max-height: 500;
        overflow-y: scroll;
	}
	.heighted{
		min-height: 200;
        max-height: 300;
        overflow-y: scroll;
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
	</script>
	<div class="col-md-8 col-md-offset-2">
				<div id = "employeeInfo" class="col-md-12 hidden">
					<div class="col-md-6">
						<div id="empListHead" class="col-md-12">
							<h3>직원 목록</h3>
						</div>
						<div id="empList" class="col-md-12 heighted">
							<c:forEach var="employee" items="${ sessionScope.empList }" varStatus="status">
								<div id="emp${status.count}" class="col-md-12" onclick="selectUser(this.id,'empList','putList'); ">
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
					<div class="col-md-6">
						<div id="putHead" class="col-md-12">
							<h3>투입 직원</h3>
						</div>
						<div id="putList" class="col-md-12">
							
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