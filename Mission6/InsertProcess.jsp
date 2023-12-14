<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import='common.JDBConnect' %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Process</title>
</head>
<body>
<%
JDBConnect jdbc = new JDBConnect();

String id = request.getParameter("user_id");
String pass = request.getParameter("user_pw");
String name = request.getParameter("user_name");

String sql = "INSERT INTO member(id, pass, name) VALUES (?, ?, ?)";
try {
    Connection con = jdbc.con;
    PreparedStatement psmt = con.prepareStatement(sql);

    psmt.setString(1, id);
    psmt.setString(2, pass);
    psmt.setString(3, name);

    int inResult = psmt.executeUpdate();
    out.println(inResult + "행이 입력되었습니다.");

    psmt.close();
    jdbc.close();

    response.sendRedirect("InsertSuccess.jsp");
} catch (Exception e) {
    e.printStackTrace();
    out.println("입력 실패");
    response.sendRedirect("InsertFail.jsp");
}
%>
</body>
</html>
