<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
<style media="screen">

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
.tree, .tree ul {
    margin:0;
    padding:0;
    list-style:none
}
.tree ul {
    margin-left:1em;
    position:relative
}
.tree ul ul {
    margin-left:.5em
}
.tree ul:before {
    content:"";
    display:block;
    width:0;
    position:absolute;
    top:0;
    bottom:0;
    left:0;
    border-left:1px solid
}
.tree li {
    margin:0;
    padding:0 1em;
    line-height:2em;
    color:#369;
    font-weight:700;
    position:relative
}
.tree ul li:before {
    content:"";
    display:block;
    width:10px;
    height:0;
    border-top:1px solid;
    margin-top:-1px;
    position:absolute;
    top:1em;
    left:0
}
.tree ul li:last-child:before {
    background:#fff;
    height:auto;
    top:1em;
    bottom:0
}
.indicator {
    margin-right:5px;
}
.tree li a {
    text-decoration: none;
    color:#369;
}
.tree li button, .tree li button:active, .tree li button:focus {
    text-decoration: none;
    color:#369;
    border:none;
    background:transparent;
    margin:0px 0px 0px 0px;
    padding:0px 0px 0px 0px;
    outline: 0;
}
</style>
<script type="text/javascript">
    function show_form(name){
      $('#pm, #colleague, #customer').removeClass("active");
  		$('#pmInfo, #colleagueInfo, #customerInfo').addClass("hidden");
  		$('#'+name).addClass("active");
  		$('#'+name+"Info").removeClass("hidden");
    }
    $.fn.extend({
        treed: function (o) {
          
          var openedClass = 'glyphicon-minus-sign';
          var closedClass = 'glyphicon-plus-sign';
          
          if (typeof o != 'undefined'){
            if (typeof o.openedClass != 'undefined'){
            openedClass = o.openedClass;
            }
            if (typeof o.closedClass != 'undefined'){
            closedClass = o.closedClass;
            }
          };
          
            //initialize each of the top levels
            var tree = $(this);
            tree.addClass("tree");
            tree.find('li').has("ul").each(function () {
                var branch = $(this); //li with children ul
                branch.prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
                branch.addClass('branch');
                branch.on('click', function (e) {
                    if (this == e.target) {
                        var icon = $(this).children('i:first');
                        icon.toggleClass(openedClass + " " + closedClass);
                        $(this).children().children().toggle();
                    }
                })
                branch.children().children().toggle();
            });
            //fire event from the dynamically added icon
          tree.find('.branch .indicator').each(function(){
            $(this).on('click', function () {
                $(this).closest('li').click();
            });
          });
            //fire event to open branch if the li contains an anchor instead of text
            tree.find('.branch>a').each(function () {
                $(this).on('click', function (e) {
                    $(this).closest('li').click();
                    e.preventDefault();
                });
            });
            //fire event to open branch if the li contains a button instead of text
            tree.find('.branch>button').each(function () {
                $(this).on('click', function (e) {
                    $(this).closest('li').click();
                    e.preventDefault();
                });
            });
        }
    });
    function check_null(){
		var form = document.getElementById("rateForm");
		var list = form.elements;
		for(i = 0; i<list.length-2; i++){
			if(list[i].value =='' || list[i].value == null){
				alert("모든 정보를 입력 해 주세요!");
				document.getElementById(list[i].id).focus();
				return false;
			}
		}
		return true;
	}
    function check_form(){
		if(document.getElementById("description").value == null || document.getElementById("description").value == '' ){
			alert("평가 내용을 입력해 주세요!");
			return false;
		} else if(document.getElementById("rating").value<=0){
			alert("평점을 선택해 주세요!");
			return false;
		} else {
			document.getElementById("rateForm").submit();
		}
	}
  </script>
  <c:if test="${ sessionScope.type != null }">
  <script>
  show_form(type);
  </script>
  </c:if>
<div class="col-md-8 col-md-offset-2">
	<div class="panel panel-default">
		<div class="panel-body" style="padding: 0; margin: 0">
			<div class="col-md-3" style="padding: 0; margin: 0">
				<div class="page-header">
					<h1>
						<small>평가</small>
					</h1>
				</div>
				<ul class="nav nav-tabs">
					<li role="presentation" id="pm" class="active"><a href="#"
						onclick="show_form('pm')">PM</a></li>
					<li role="presentation" id="colleague"><a href="#"
						onclick="show_form('colleague')">동료</a></li>
					<li role="presentation" id="customer"><a href="#"
						onclick="show_form('customer')">고객</a></li>
				</ul>
				<ul id="pmInfo" class="nav nav-list tree">
				<c:forEach var="ep" items="${ sessionScope.epLists }" varStatus="status1">
					<li><c:out value="${ ep.getpName() }"/>
						<ul>
						<c:forEach var="user" items="${ ep.geteList() }" varStatus="status">
							<li><c:out value="${ user.getUname() }"/>
								<ul>
									<li><a href="${pageContext.request.contextPath}/employeeController/rating?pid=${ ep.getPid() }&uid=${ user.getUidx() }&type1=pm&type2=BPE">업무수행평가</a></li>
									<li><a href="${pageContext.request.contextPath}/employeeController/rating?pid=${ ep.getPid() }&uid=${ user.getUidx() }&type1=pm&type2=CSE">커뮤니케이션평가</a></li>
								</ul>
							</li>
						</c:forEach>
						</ul>
					</li>
				</c:forEach>
				</ul>
				<ul id="colleagueInfo" class="nav nav-list tree hidden">
					<li><label class="tree-toggle nav-header">프로젝트1</label>
						<ul class="nav nav-list tree">
							<li><label class="tree-toggle nav-header">직원1</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
							<li><label class="tree-toggle nav-header">직원2</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
		
						</ul></li>
					<li><label class="tree-toggle nav-header">프로젝트2</label>
						<ul class="nav nav-list tree">
							<li><label class="tree-toggle nav-header">직원1</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
							<li><label class="tree-toggle nav-header">직원2</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
		
						</ul></li>
		
				</ul>
				<ul id="customerInfo" class="nav nav-list tree hidden">
					<li><label class="tree-toggle nav-header">프로젝트1</label>
						<ul class="nav nav-list tree">
							<li><label class="tree-toggle nav-header">직원1</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
							<li><label class="tree-toggle nav-header">직원2</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
		
						</ul></li>
					<li><label class="tree-toggle nav-header">프로젝트2</label>
						<ul class="nav nav-list tree">
							<li><label class="tree-toggle nav-header">직원1</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
							<li><label class="tree-toggle nav-header">직원2</label>
								<ul class="nav nav-list tree">
									<li><a href="#">업무수행평가</a></li>
									<li><a href="#">커뮤니케이션평가</a></li>
								</ul></li>
		
						</ul></li>
		
				</ul>
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
							<c:choose>
								<c:when test="${ sessionScope.evaluationInfo != null }">
									<form id="rateForm" method="POST" action="${pageContext.request.contextPath}/employeeController/rating.do">
										<div class="row">
											<div class="col-md-12">
												<h3><c:out value="${ sessionScope.type2Name }"/></h3>
											</div>
										</div>
										<div class="row">
								        	<div class="col-md-3">
								        		<p><strong>프로젝트명</strong></p>
								        	</div>
								        	<div class="col-md-3">
								        		<p><c:out value="${ sessionScope.evaluationInfo.getpName() }"/></p>
								        	</div>
								        	<div class="col-md-2">
								        		<p><strong>대상 직원</strong></p>
								        	</div>
								        	<div class="col-md-4">
								        		<p><c:out value="${ sessionScope.evaluationInfo.getuName() }"/></p>
								        	</div>
								      	</div>
								      	<div class="row">
											<div class="form-group">
												<label for="rating">평점</label>
										   		<input id="rating" name="rating" value="0" type="number" min=0 max=10 step=0.1 data-size="sm" >
										   	</div>	
										</div>
										<div class="row">
											<div class="form-group">
												<label for="description">평가 내용</label>
												<textarea class="form-control" id="description" name="description" rows="10" placeholder="평가 내용을 입력하세요"></textarea>
										   	</div>	
										</div>
										<div class="row">
											<p id="buttonrow" class="text-center">
												<button type="button" class="btn btn-success" onclick="javascript:check_form();">입력</button>
												<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/employeeController/rating'">취소</button>
											</p>
										</div>
								        <div class="form-group hidden">
								        	<input type="text" id="pid" name="pid" value="${ sessionScope.evaluationInfo.getPid() }"/>
								        	<input type="text" id="uid" name="uid" value="${ sessionScope.evaluationInfo.getUidx() }"/>
								        	<input type="text" id="type1" name="type1" value="${ sessionScope.evaluationInfo.getType1() }"/>
								        	<input type="text" id="type2" name="type2" value="${ sessionScope.evaluationInfo.getType2() }"/>
								        </div>
									</form>
								</c:when>
								<c:otherwise>
									<div class="row">
							       		<div class="jumbotron heightedChild">
											<h2>좌측에서 선택해 주세요!</h2>
											<p><small>선택하시면 평가 하실 수 있습니다.</small></p>
										</div>
						      		</div>
								</c:otherwise>
							</c:choose>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:if test="${ sessionScope.evaluationInfo.getRating() != null }">
	<script>
		$('#rating').val("${sessionScope.evaluationInfo.getRating()}");
	</script>
</c:if>
<c:if test="${ sessionScope.evaluationInfo.getDescription() != null }">
	<script>
		$('#description').val("${sessionScope.evaluationInfo.getDescription()}");
	</script>
</c:if>
</body>
</html>

	<script>
			    jQuery(document).ready(function () {
			        $("#rating").rating({
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

			    $('#tree1').treed({openedClass:'glyphicon-chevron-right', closedClass:'glyphicon-chevron-down'});
			    $('#pmInfo').treed({openedClass:'glyphicon-chevron-right', closedClass:'glyphicon-chevron-down'});
			    
			</script>
