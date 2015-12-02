<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
<style media="screen">
.panel-body {
	text-align: center;
}

#skill-head {
	font-size: 2em;
}

.eval-nav {
	border-right: 1px solid rgba(0, 0, 0, 0.2);
	height: 600px;
	overflow: hidden;
}

.eval-content {
	height: 600px;
}

h1 {
	text-align: center;
}
</style>
<script type="text/javascript">
    function show_form(name){
      $('#prog, #end, #all').removeClass("active");
  		$('#progInfo, #endInfo, #allInfo').addClass("hidden");
  		$('#'+name).addClass("active");
  		$('#'+name+"Info").removeClass("hidden");
    }
    $('.tree-toggle').click(function () {
    	$(this).parent().children('ul.tree').toggle(200);
    });
    $(function(){
    $('.tree-toggle').parent().children('ul.tree').toggle(200);
    })
    $(document).ready(function () {
        $('label.tree-toggle').click(function () {
            $(this).parent().children('ul.tree').toggle(300);
        });
    });
  </script>
<div class="col-md-8 col-md-offset-2">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="col-md-3 eval-nav">
				<div class="page-header">
					<h1>
						<small>평가</small>
					</h1>
				</div>
				<div class="row">
					<div class="span3">
						<div class="well">
							<div>
								<ul class="nav nav-list">
								<c:if test="${ sessionScope.pmList != null }">
									<li><label class="tree-toggle nav-header">PM평가</label>
										<ul class="nav nav-list tree">
											<li><label class="tree-toggle nav-header">직원1</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
															<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												<li><label class="tree-toggle nav-header">직원2</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
														<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												
										</ul></li>
									</c:if>
									<li><label class="tree-toggle nav-header">동료평가</label>
										<ul class="nav nav-list tree">
											<li><label class="tree-toggle nav-header">직원1</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
															<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												<li><label class="tree-toggle nav-header">직원2</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
														<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												
										</ul></li>
										<li><label class="tree-toggle nav-header">고객평가</label>
										<ul class="nav nav-list tree">
											<li><label class="tree-toggle nav-header">직원1</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
															<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												<li><label class="tree-toggle nav-header">직원2</label>
												<ul class="nav nav-list tree">
													<li><label class="tree-toggle nav-header">프로젝트1</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
															</ul></li>
														<li><label class="tree-toggle nav-header">프로젝트2</label>
														<ul class="nav nav-list tree">
															<li><a href="#">업무수행평가</a></li>
															<li><a href="#">커뮤니케이션평가</a></li>
														</ul></li>
														
												</ul></li>
												
										</ul></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 eval-content">
				<div class="row">
					<div class="page-header">
						<h1>
							<small>점수</small>
						</h1>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<form>
							    <input id="input-21f" value="0" type="number" min=0 max=10 step=0.1 data-size="sm" >
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>

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
