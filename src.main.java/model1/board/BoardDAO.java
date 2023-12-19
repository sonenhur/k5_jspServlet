package model1.board;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

// JDBConnect를 확장하는 BoardDAO 클래스 정의
public class BoardDAO extends JDBConnect {

    // ServletContext 매개변수로 받는 생성자 정의 및 상위 클래스 생성자 호출
    public BoardDAO(ServletContext application) {
        super(application);
    }

    // 검색 기준에 따라 'board' 테이블 레코드 수 가져오기
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM board";
        Statement stmt = null;
        ResultSet rs = null;

        // 검색어가 있는 경우, 쿼리 수정
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            // 쿼리 실행하고 총 수 가져오기
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("레코드 총 수 검색 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (stmt != null)
                    stmt.close();
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return totalCount;
    }

    // 검색 기준에 따라 BoardDTO 객체 목록 가져오기
    public List<BoardDTO> selectList(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();
        String query = "SELECT * FROM board";
        Statement stmt = null;
        ResultSet rs = null;

        // 검색 기준에 따라 쿼리 수정
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC ";

        try {
            // 쿼리 실행하고 목록 BoardDTO 객체로 채우기
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();

                // BoardDTO 객체의 속성 결과 집합에서 설정
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);
            }
        } catch (Exception e) {
            System.out.println("레코드 목록 검색 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (stmt != null)
                    stmt.close();
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return bbs;
    }

    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수
        PreparedStatement psmt = null;
        ResultSet rs = null;

     // 쿼리문 템플릿
//        String query = "SELECT * FROM ( "
//                     + "    SELECT Tb.*, (@rownum := @rownum + 1) AS rNum "
//                     + "    FROM ( "
//                     + "        SELECT * FROM board ";
//
//        // 검색 조건 추가
//        if (map.get("searchWord") != null) {
//            query += " WHERE " + map.get("searchField")
//                   + " LIKE '%" + map.get("searchWord") + "%' ";
//        }
//
//        query += "      ORDER BY num DESC "
//               + "    ) Tb, (SELECT @rownum := 0) AS dummy "
//               + ") AS result "
//               + "WHERE rNum BETWEEN ? AND ?";
     // 쿼리문 템플릿
        String query = "SELECT * FROM board ";
//      검색 조건 추가
      if (map.get("searchWord") != null) {
          query += " WHERE " + map.get("searchField")
                 + " LIKE '%" + map.get("searchWord") + "%' ";
      }
      
        		query += " ORDER BY num DESC LIMIT ?, ?";

        try {
            // 쿼리문 완성 
            psmt = con.prepareStatement(query);
            psmt.setInt(1, (Integer)map.get("start"));
//            psmt.setString(2, map.get("end").toString());
            psmt.setInt(2, (Integer)map.get("pagesize"));
            // 쿼리문 실행 
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 목록 반환
        return bbs;
    }

    // 'board' 테이블에 새 레코드 삽입하기
    public int insertWrite(BoardDTO dto) {
        int result = 0;
        PreparedStatement psmt = null;

        try {
            // 새 레코드 삽입하기 위한 쿼리 준비하고 실행하기
            String query = "INSERT INTO board (title, content, id, visitcount) VALUES (?, ?, ?, 0)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());

            result = psmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("새 레코드 입력 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    // 특정 게시물의 세부 정보 가져오기
    public BoardDTO selectView(String num) {
        BoardDTO dto = new BoardDTO();
        PreparedStatement psmt = null;
        ResultSet rs = null;

        // 'member'와 'board' 테이블 조인하여 특정 게시물 세부 정보 검색하는 쿼리 준비하기
        String query = "SELECT B.*, M.name FROM member M INNER JOIN board B ON M.id = B.id WHERE num=?";

        try {
            // 쿼리 실행하고 결과 BoardDTO 객체로 채우기
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setName(rs.getString("name"));
            }
        } catch (Exception e) {
            System.out.println("특정 게시물 세부 정보 검색 중 예외 발생");
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dto;
    }

    // 특정 게시물 조회수 업데이트하기
    public void updateVisitCount(String num) {
        PreparedStatement psmt = null;

        // 조회수 업데이트하는 쿼리 준비하고 실행하기
        String query = "UPDATE board SET visitcount=visitcount+1 WHERE num=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    // 지정한 게시물 수정하기
    public int updateEdit(BoardDTO dto) { 
        int result = 0;
        PreparedStatement psmt = null;
        
        try {
            // 쿼리문 템플릿 
            String query = "UPDATE board SET "
                         + " title=?, content=? "
                         + " WHERE num=?";
            
            // 쿼리문 완성
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            
            // 쿼리문 실행 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result; // 결과 반환 
    }
    
    // 지정한 게시물 삭제하기
    public int deletePost(BoardDTO dto) { 
        int result = 0;
        PreparedStatement psmt = null;

        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM board WHERE num=?"; 

            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }finally {
            // 리소스 닫기
            try {
                if (psmt != null)
                    psmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result; // 결과 반환 
    }
}
