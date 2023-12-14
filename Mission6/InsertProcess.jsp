<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import='common.JDBConnect' %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 등록 프로세스</title>
</head>
<body>
<%
// 데이터베이스 연결을 위해 JDBConnect 클래스 사용
JDBConnect jdbc = new JDBConnect();

// 사용자로부터 전달받은 정보 추출
String id = request.getParameter("user_id");
String pass = request.getParameter("user_pw");
String name = request.getParameter("user_name");

// SQL 쿼리 작성
String sql = "INSERT INTO member(id, pass, name) VALUES (?, ?, ?)";
try {
    // 데이터베이스 연결 및 SQL 실행
    Connection con = jdbc.con;
    PreparedStatement psmt = con.prepareStatement(sql);

    psmt.setString(1, id);
    psmt.setString(2, pass);
    psmt.setString(3, name);

    int inResult = psmt.executeUpdate();
    out.println(inResult + "행이 입력되었습니다.");

    // 자원 해제
    psmt.close();
    jdbc.close();
    //성공 시 다음 페이지로 리다이렉트
    response.sendRedirect("InsertSuccess.jsp");
    
} catch (Exception e) {
    // 예외 처리 
    e.printStackTrace();
    out.println("입력 실패");
    //실패 시 다음 페이지로 리다이렉트
    response.sendRedirect("InsertFail.jsp");
}
%>
</body>
</html>
