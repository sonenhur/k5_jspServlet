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
	JDBConnect jdbc = new JDBConnect();

	String title = request.getParameter("board_title");
	String content = request.getParameter("board_content");
	String id = request.getParameter("user_id");

	String sql = "INSERT INTO board (title, content, user_id) VALUES (?, ?, ?)";

	Connection con = jdbc.con;

	try (PreparedStatement psmt = con.prepareStatement(sql)) {
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, id);

		int inResult = psmt.executeUpdate();

		out.println(inResult + " 작성되었습니다.");
		response.sendRedirect("InsertBoardSuccess.jsp");

	} catch (Exception e) {
		out.println("작성 실패: " + e.getMessage());
		e.printStackTrace();
		response.sendRedirect("InsertBoardFail.jsp");
	}
	%>
</body>
</html>
