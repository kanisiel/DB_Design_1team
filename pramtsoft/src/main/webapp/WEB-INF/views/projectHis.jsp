<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pms.model.UserList" %>
  <style media="screen">
    .panel-body { text-align: center;}
    #skill-head { font-size: 2em;}
    .col-md-3 { border-right: 1px solid rgba(0, 0, 0, 0.2); height: 600px; overflow:scroll;}
    .col-md-9 { height: 600px; overflow:scroll;}
    h1 {text-align: center;}
  </style>
  <script type="text/javascript">
    function show_form(name){
      $('#prog, #end, #all').removeClass("active");
  		$('#progInfo, #endInfo, #allInfo').addClass("hidden");
  		$('#'+name).addClass("active");
  		$('#'+name+"Info").removeClass("hidden");
    }
  </script>
  <div class="container">
    <div class="col-md-3">
      <div class="page-header">
        <h1><small>프로젝트</small></h1>
      </div>
      <ul class="nav nav-tabs">
        <li role="presentation" id="prog" class="active"><a href="#" onclick="show_form('prog')">진행중</a></li>
        <li role="presentation" id="end"><a href="#" onclick="show_form('end')">종료</a></li>
        <li role="presentation" id="all"><a href="#" onclick="show_form('all')">전체</a></li>
      </ul>
      <ul id="progInfo" class="nav nav-pills nav-stacked">
        <li><a href="#">요리</a></li>
        <li><a href="#">바느질</a></li>
        <li><a href="#">조경</a></li>
      </ul>
      <ul id="endInfo" class="nav nav-pills nav-stacked hidden">
        <li><a href="#">페인트칠</a></li>
        <li><a href="#">게임</a></li>
        <li><a href="#">청소</a></li>
      </ul>
      <ul id="allInfo" class="nav nav-pills nav-stacked hidden">
        <li><a href="#">요리</a></li>
        <li><a href="#">바느질</a></li>
        <li><a href="#">조경</a></li>
        <li><a href="#">페인트칠</a></li>
        <li><a href="#">게임</a></li>
        <li><a href="#">청소</a></li>
      </ul>
    </div>
    <div class="col-md-9">
      <div class="page-header">
        <h1><small>이력</small></h1>
      </div>
      <div class="container">
        프로젝트 정보
      </div>
    </div>
  </div>
</body>
</html>