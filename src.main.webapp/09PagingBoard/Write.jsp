<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
// 폼 유효성 검사 함수 정의
function validateForm(form){
    // 제목이 비어있으면 알림 후 포커스
    if (form.title.value == ""){
        alert("제목을 입력해주세요.");
        form.title.focus();
        return false;
    }
    // 내용이 비어있으면 알림 후 포커스
    if (form.content.value == ""){
        alert("내용을 입력해주세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>
    <!-- 로그인 여부 확인을 위한 include 파일 포함 -->
    <jsp:include page="../Common/Link.jsp" />
    <h2>회원제 게시판 - 글쓰기(Write)</h2>
    <!-- 글 작성 폼 -->
    <form name="writeFrm" method="post" action="WriteProcess.jsp" onsubmit="return validateForm(this);">
        <table border="1" width="90%">
            <!-- 제목 입력란 -->
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" style="width: 90%;" /></td>
            </tr>
            <!-- 내용 입력란 -->
            <tr>
                <td>내용</td>
                <td><textarea name="content" style="width: 90%; height: 100px;"></textarea></td>
            </tr>
            <!-- 버튼 영역 -->
            <tr>
                <td colspan="2" align="center">
                    <!-- 작성 완료, 다시 입력, 목록 보기 버튼 -->
                    <button type="submit">작성 완료</button>
                    <button type="reset">다시 입력</button>
                    <button type="button" onclick="location.href='List.jsp';">목록 보기</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
