<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import='common.JDBConnect' %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 등록 폼</title>
</head>
<body>
    <h2>게시물 등록</h2>
    <%
    // 사용자가 로그인한 상태인지 확인
    if (session.getAttribute("isLogIn") != null && (boolean)session.getAttribute("isLogIn")) {
    %>
    <form action="InsertBoardProcess.jsp" method="post" name="InsertBoardForm">
        제목: <input type="text" name="board_title" /><br />
        내용: <input type="text" name="board_content"><br />
        아이디: <input type="text" name="user_id"><br />
        <input type="submit" value="등록" /> 
    </form>
    <%
    } else {
        response.sendRedirect("LoginForm.jsp");
    }
    %>
    
</body>
</html>
