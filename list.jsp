<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
<%
    String category = request.getParameter("cat");
%>
	</head>
	<body>
<%
try{
	switch(category){
		case "1":
			out.println("<h1>프로젝트</h1>");
			break;
		case "2":
			out.println("<h1>직원</h1>");
			break;
		case "3":
			out.println("<h1>발주처</h1>");
			break;
		default:
			out.println("<h1>프로젝트</h1>");
			break;
	}
} catch(Exception e){
}finally{
} 
%>
	</body>
</html>