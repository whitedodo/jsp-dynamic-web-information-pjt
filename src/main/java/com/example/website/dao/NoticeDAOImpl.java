/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: NoticeDAOImpl.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.example.website.db.SqlMapSessionFactory;
import com.example.website.dto.NoticeDTO;

public class NoticeDAOImpl implements NoticeDAO {

    private PreparedStatement pstmt;  
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성
    
    SqlMapSessionFactory smsf = new SqlMapSessionFactory();
    Connection conn = smsf.connect();
    
	@Override
	public List<NoticeDTO> selectNotice() {

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		String SQL = "SELECT * from TABLET_NOTICE WHERE ROWNUM < 30 order by id desc";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
                       
            while(rs.next()) {
            	NoticeDTO vo = new NoticeDTO();
            	vo.setId(rs.getInt("id"));
            	vo.setDept(rs.getString("dept"));
            	vo.setMemo(rs.getString("memo"));
            	vo.setIp(rs.getString("ip"));
            	vo.setRegidate(rs.getTimestamp("regidate"));
            	
            	list.add(vo);
            }
            
        }
        catch(Exception e) {
            e.printStackTrace();
        }finally {
        	smsf.close(conn, pstmt, rs);
        }
		
		return list;
	}

	@Override
	public int insertNotice(NoticeDTO usrVO) {
		
		String SQL= "INSERT INTO TABLET_NOTICE (dept, memo, ip, regidate) " +
				"VALUES(?, ?, ?, ?)";
	
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        conn.setAutoCommit(false);
	        
	        pstmt.setString(1, usrVO.getDept());
	        pstmt.setString(2, usrVO.getMemo());
	        pstmt.setString(3, usrVO.getIp());
	        pstmt.setTimestamp(4, usrVO.getRegidate());
	        
	        rs = pstmt.executeQuery();
	
	        conn.commit();
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        
	        try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				return 0;
			}
	        
	        return 0;
	        
	    }finally {
	    	smsf.close(conn, pstmt, rs);
	    }
		
	    return 1;
	}

	@Override
	public int removeNotice(NoticeDTO usrVO) {

		String SQL= "DELETE FROM TABLET_NOTICE WHERE ID = ?";
	
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        conn.setAutoCommit(false);
	        
	        pstmt.setInt(1, usrVO.getId());
	        rs = pstmt.executeQuery();
	
	        conn.commit();
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        
	        try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				return 0;
			}
	        
	        return 0;
	        
	    }finally {
	    	smsf.close(conn, pstmt, rs);
	    }
		
	    return 1;
	}

	@Override
	public List<NoticeDTO> selectRngNotice(NoticeDTO start, NoticeDTO end) {

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		String convDate = "";
		
		String SQL = "SELECT * from TABLET_NOTICE " + 
					 " WHERE regidate BETWEEN TO_DATE(?, 'yyyy-mm-dd hh24:mi:ss') " + 
					 " AND TO_DATE(?, 'yyyy-mm-dd hh24:mi:ss')" + 
					 " order by id desc";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            // System.out.println(SQL + start.getRegidate() + "/" + end.getRegidate());
            convDate = format.format(start.getRegidate());
            System.out.println("1" + SQL + convDate);
            pstmt.setString(1, convDate);
            convDate = format.format(end.getRegidate());
            System.out.println("2" + SQL + convDate);
            pstmt.setString(2, convDate);
            
            rs = pstmt.executeQuery();
                       
            while(rs.next()) {
            	NoticeDTO vo = new NoticeDTO();
            	vo.setId(rs.getInt("id"));
            	vo.setDept(rs.getString("dept"));
            	vo.setMemo(rs.getString("memo"));
            	vo.setIp(rs.getString("ip"));
            	vo.setRegidate(rs.getTimestamp("regidate"));
            	
            	list.add(vo);
            }
            
        }
        catch(Exception e) {
            e.printStackTrace();
        }finally {
        	smsf.close(conn, pstmt, rs);
        }
		
		return list;
		
	}	
	
}
