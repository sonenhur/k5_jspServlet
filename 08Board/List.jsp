<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// BoardDAO 객체 생성 및 필요한 매개변수 설정
BoardDAO dao = new BoardDAO(application);
Map<String, Object> param = new HashMap<String, Object>();

// 검색 조건과 검색어를 파라미터에서 가져와 설정
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

// 총 게시물 수 조회
int totalCount = dao.selectCount(param);

// 게시물 목록 조회
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>

<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>목록 보기(List)</h2>
	<!-- 검색폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
<%
// 게시물이 없는 경우 메시지 출력
if (boardLists.isEmpty()){
	%>
	<tr>
	<td colspan="5" align="center">
	등록된 게시물이 없습니다
	</td>
	</tr>
	<%
	}
	else {
		int virtualNum=0;
		// 게시물 목록 출력
		for(BoardDTO dto : boardLists)
		{
			virtualNum = totalCount--;
		
	%>
	
	<tr align="center">
	<td><%= virtualNum %></td>
	<td align="left">
	<!-- 게시물 제목에 링크 걸기 -->
	<a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %>
	</a>
</td>
<td align="center"><%= dto.getUser_id() %></td>
<td align="center"><%= dto.getVisitcount() %></td>
<td align="center"><%= dto.getPostdate() %></td>
</tr>
<%
}
}
%>
</table>
<!-- 목록 하단의 [글쓰기] 버튼 -->
<table border="1" width="90%">
<tr align="right">
<td><button type="button" onclick="location.href='Write.jsp';"> 글쓰기 </button></td>
</tr>
</table>
</body>
</html>
