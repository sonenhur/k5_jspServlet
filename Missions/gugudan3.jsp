<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String sel = request.getParameter("sel");
session.setAttribute("selected", sel);
if ("type1".equals(sel)) {
	response.sendRedirect("gugudan1.jsp?dan=2");
}
else if ("type2".equals(sel)) {
	response.sendRedirect("gugudan2.jsp?col=3");
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Mission 3</title>
</head>
<body>
<form action="" method="post">
    <label>
        <input type="radio" name="sel" value="type1" checked> Type 1 (gugudan1.jsp?dan=2)
    </label>
    <br>
    <label>
        <input type="radio" name="sel" value="type2"> Type 2 (gugudan2.jsp?col=3)
    </label>
    <br>
    <label>
    	<!-- dan, col을 지정하는 선택지 박스 만들기 (필요하면 dan, col 용어 통일) -->
    </label>
    <input type="submit" value="Submit">
</form>
</body>
</html>
