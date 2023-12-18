<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="utils.BoardPage" %>
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

/*** 페이지 처리 start ***/
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수

//현재 페이지 확인
int pageNum = 1;  // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
 pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

//목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize; // + 1;  // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
param.put("start", start);
param.put("end", end);
param.put("pagesize",pageSize);
/*** 페이지 처리 end ***/

// 게시물 목록 조회
List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();
%>

<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>
		목록 보기(List) - 현재 페이지 :
		<%= pageNum %>
		(전체 :
		<%= totalPage %>)
	</h2>
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
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
		<%
		}
			else {
				int virtualNum = 0;
				int countNum = 0;
				// 게시물 목록 출력
				for (BoardDTO dto : boardLists) {
			// virtualNumber = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
			virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
		%>
		<tr align="center">
			<td><%= virtualNum %></td>
			<td align="left">
				<!-- 게시물 제목에 링크 걸기 --> <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %>
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
			<!--페이징 처리-->
			<td><%= BoardPage.pagingStr(totalCount, pageSize,
                       blockPage, pageNum, request.getRequestURI()) %></td>
			<!--글쓰기 버튼-->
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기
				</button></td>
		</tr>
	</table>
</body>
</html>
