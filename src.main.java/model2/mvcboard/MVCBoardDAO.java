package model2.mvcboard;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
public MVCBoardDAO() {
	super();
}

public int selectCount(Map<String, Object> map) {
	int totalCount = 0;
	
	String query = "SELECT COUNT(*) FROM mvcboard";
	Statement stmt = null;
    ResultSet rs = null;
    
	if (map.get("searchWord") != null) {
		query += " WHERE " + map.get("searchField") + " "
			+ " LIKE '%" + map.get("searchWord") + "%'";
	}
	try {
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();
		totalCount = rs.getInt(1);
	} catch (Exception e) {
		System.out.println("게시물 카운트 중 예외 발생");
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

public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
	List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
	PreparedStatement psmt = null;
    ResultSet rs = null;
	String query = " "
			+ "SELECT * FROM mvcboard ";
	if (map.get("searchWord") != null) {
		query += " WHERE " + map.get("searchField")
				+ " LIKE '%" + map.get("searchWord") + "%' ";
	}
	query += " ORDER BY idx DESC LIMIT ?, ?";
		
	try {
		psmt  = con.prepareStatement(query);
		psmt.setInt(1, (Integer)map.get("start"));
		psmt.setInt(2, (Integer)map.get("pageSize"));
		rs = psmt.executeQuery();
		
		while (rs.next()) {
			MVCBoardDTO dto = new MVCBoardDTO();
			
			dto.setIdx(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setPostdate(rs.getDate(5));
			dto.setOfile(rs.getString(6));
			dto.setSfile(rs.getString(7));
			dto.setDowncount(rs.getInt(8));
			dto.setPass(rs.getString(9));
			dto.setVisitcount(rs.getInt(10));
			board.add(dto);
		}
	} catch (Exception e) {
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
	return board;
	}

public int insertWrite(MVCBoardDTO dto) {
	int result = 0;
    PreparedStatement psmt = null;

    try {
        // 새 레코드 삽입하기 위한 쿼리 준비하고 실행하기
        String query = "INSERT INTO mvcboard ( "
        		 	+ " name, title, content, ofile, sfile, pass) "
        		 	+ " VALUES (?, ?, ?, ?, ?, ?)";
        psmt = con.prepareStatement(query);
        psmt.setString(1, dto.getName());
        psmt.setString(2, dto.getTitle());
        psmt.setString(3, dto.getContent());
        psmt.setString(4, dto.getOfile());
        psmt.setString(5, dto.getSfile());
        psmt.setString(6, dto.getPass());
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
}
