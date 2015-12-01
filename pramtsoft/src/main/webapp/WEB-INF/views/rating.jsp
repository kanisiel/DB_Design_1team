<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<form>
				    <input id="input-21f" value="0" type="number" min=0 max=10 step=0.1 data-size="sm" >
				</form>
			</div>
		</div>
	</div>
	
	
	<script>
			    jQuery(document).ready(function () {
			        $("#input-21f").rating({
			            starCaptions: function(val) {
			                if (val != 10) {
			                    return val;
			                } else {
			                    return 'max';
			                }
			            },
			            starCaptionClasses: function(val) {
			                if (val < 2) {
			                    return 'label label-danger';
			                } else if (val >= 2 && val < 4) {
			                    return 'label label-warning';
			                } else if (val >= 4 && val < 6) {
			                    return 'label label-info';
			                } else if (val >= 6 && val < 8) {
			                    return 'label label-primary';
			                } else {
			                    return 'label label-success';
			                }
			            },
			            hoverOnClear: false
			        });
			    });
			</script>
