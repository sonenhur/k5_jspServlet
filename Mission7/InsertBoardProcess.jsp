<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import='common.JDBConnect'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 등록 처리</title>
</head>
<body>
    <%
    // JDBConnect 객체 생성 및 초기화
    JDBConnect jdbc = new JDBConnect();

    // 사용자로부터 전달받은 정보 추출
    String title = request.getParameter("board_title");
    String content = request.getParameter("board_content");
    String id = request.getParameter("user_id");

    // SQL 쿼리 작성
    String sql = "INSERT INTO board (title, content, user_id) VALUES (?, ?, ?)";

    // 데이터베이스 연결을 위해 JDBConnect 클래스 사용
    Connection con = jdbc.con;

    try (PreparedStatement psmt = con.prepareStatement(sql)) {
        // SQL 쿼리에 값을 설정
        psmt.setString(1, title);
        psmt.setString(2, content);
        psmt.setString(3, id);

        // SQL 실행 및 결과 처리
        int inResult = psmt.executeUpdate();
        out.println(inResult + " 작성되었습니다.");
        response.sendRedirect("InsertBoardSuccess.jsp");

    } catch (Exception e) {
        // 예외 처리 및 실패 시 다음 페이지로 리다이렉트
        out.println("작성 실패: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("InsertBoardFail.jsp");
    } finally {
        // JDBConnect 객체 닫기
        jdbc.close();
    }
    %>
</body>
</html>
