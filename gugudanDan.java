package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudandan")
public class gugudanDan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("gugudanDan");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html> <head> <title>구구단 출력</title> </head> <body>");

		String danParam = req.getParameter("dan");
		int dan;
		try {
			dan = Integer.parseInt(danParam);
		} catch (Exception e) {
			dan = 3;
		}

		out.println("<table border='1'>");

			// HTML 테이블 서식
			// <tr>: 테이블 가로행
			// <th>: 테이블 헤드(주로 1행에서 열제목)
			// <td>: 테이블 데이터(열이 늘어남)
			// <tr> 사이에 <th /> or <td /> 넣고 </tr>
		for (int k = 1; k <= 9; k = k + dan) {
			out.println("<tr>"); // 테이블 행

			for (int i = k; i < k + dan && i <= 9; i++) {
				// 각 행 내에 셀 생성
				out.println("<td>"); // 테이블 셀
				out.println("<h2>" + i + "단입니다</h2>");
				out.println("<ul>");

				for (int j = 1; j <= 9; j++) {
					int result = i * j;
					out.println("<li>" + i + " * " + j + " = " + result + "</li>");
					// 구구단 코드
				}
				out.println("</ul>"); // ul태그의 끝
				out.println("</td>"); // 테이블 셀의 끝
				// 안쪽 루프의 각 반복이 끝날 때
			}
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body></html>");
		out.close();
	}
}