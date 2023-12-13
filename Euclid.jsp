<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!
// 최대공약수(GCD)를 계산하는 함수
int gcd(int num1, int num2) {
    if (num2 == 0)
        return num1;
    else
        return gcd(num2, num1 % num2);
}
%>

<%
// 초기값 설정
int num1 = 12;
int num2 = 18;
int gcdResult = 6;
int lcmResult = 36;

// 클라이언트로부터 입력값을 받아오기
String num1Str = request.getParameter("num1");
String num2Str = request.getParameter("num2");

// 입력값이 null이 아니면 parseInt해서 변수에 저장하고 최대공약수 및 최소공배수 계산
if (num1Str != null && num2Str != null){
    num1 = Integer.parseInt(num1Str);
    num2 = Integer.parseInt(num2Str);
    gcdResult = gcd(num1, num2);
    lcmResult = (num1 * num2) / gcdResult;
}
%>

<!-- HTML 코드 시작 -->
<html>
<head>
    <meta charset="UTF-8">
    <title>Mission 4</title>
</head>
<body>
    <form>
        <label>숫자1 입력: <input type="text" name="num1" value="<%= num1 %>"></label>
        <br>
        <label>숫자2 입력: <input type="text" name="num2" value="<%= num2 %>"></label>
        <br>
        <label>최대공약수: <input type="text" name="gcd" value="<%= gcdResult %>" readonly></label>
        <br>
        <label>최소공배수: <input type="text" name="lcm" value="<%= lcmResult %>" readonly></label>
        <br>
        <input type="submit" value="실행">
    </form>
</body>
</html>