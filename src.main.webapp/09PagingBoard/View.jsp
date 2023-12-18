<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 요청 파라미터에서 게시물 번호 가져오기
String num = request.getParameter("num");

// BoardDAO 객체 생성 및 해당 게시물 조회수 업데이트
BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);

// 해당 게시물 상세 정보 조회
BoardDTO dto = dao.selectView(num);
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;       // 이름(name)이 "writeFrm"인 폼 선택
        form.method = "post";               // 전송 방식 
        form.action = "DeleteProcess.jsp";  // 전송 경로
        form.submit();                      // 폼값 전송
    }
}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 상세 보기(View)</h2>
	<form name="writeFrm">
		<!-- 게시물 번호를 숨겨진 필드로 전송 -->
		<input type="hidden" name="num" value="<%=num%>" />
		<table border="1" width="90%">
			<!-- 게시물 정보 표시 -->
			<tr>
				<td>번호</td>
				<td><%=dto.getNum()%></td>
				<td>작성자</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostdate()%></td>
				<td>조회수</td>
				<td><%=dto.getVisitcount()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>")%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%
					// 현재 사용자가 작성자일 경우 수정 및 삭제 버튼 표시
					if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
						수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
					<% } %>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
