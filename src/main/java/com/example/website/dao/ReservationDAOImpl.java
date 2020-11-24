/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: ReservationDAOImpl.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.website.db.SqlMapSessionFactory;
import com.example.website.dto.ReservationDTO;

public class ReservationDAOImpl implements ReservationDAO {

    private PreparedStatement pstmt;  
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성
    
    SqlMapSessionFactory smsf = new SqlMapSessionFactory();
    Connection conn = smsf.connect();
    
	@Override
	public List<ReservationDTO> selectReservation(ReservationDTO usrVO) {
		
		List<ReservationDTO> list = new ArrayList<ReservationDTO>();
		
		String SQL= "SELECT * from TABLET_RESERVATION where promise = ? " + 
					"order by id desc";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setDate(1, usrVO.getPromise());
            
            rs = pstmt.executeQuery();
            
                       
            while(rs.next()) {
            	
            	ReservationDTO vo = new ReservationDTO();
            	vo.setId(rs.getInt("id"));
            	vo.setName(rs.getString("name"));
            	vo.setProposal(rs.getString("proposal"));
            	vo.setPhone(rs.getString("phone"));
            	vo.setIp(rs.getString("ip"));
            	vo.setState(rs.getString("state"));
            	vo.setRegidate(rs.getDate("regidate"));
            	vo.setPromise(rs.getDate("promise"));
            	
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
	public void insertReservation(ReservationDTO usrVO) {
		
		String SQL= "INSERT INTO TABLET_RESERVATION (proposal, name, phone, ip, state, regidate, promise ) " +
					"VALUES(?, ?, ?, ?, ?, ?, ?)";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            conn.setAutoCommit(false);
            
            pstmt.setString(1, usrVO.getProposal());
            pstmt.setString(2, usrVO.getName());
            pstmt.setString(3, usrVO.getPhone());
            pstmt.setString(4, usrVO.getIp());
            pstmt.setString(5, usrVO.getState());
            pstmt.setDate(6, usrVO.getRegidate());
            pstmt.setDate(7, usrVO.getPromise());
            
            rs = pstmt.executeQuery();

            conn.commit();
        }
        catch(Exception e) {
            e.printStackTrace();
            
            try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
            
        }finally {
        	smsf.close(conn, pstmt, rs);
        }
		
	}

	@Override
	public int updateReservation(ReservationDTO usrVO) {
		
		String SQL= "UPDATE TABLET_RESERVATION SET state = ? " +
					"WHERE ID = ?";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            conn.setAutoCommit(false);
            
            pstmt.setString(1, usrVO.getState());
            pstmt.setInt(2, usrVO.getId());
            
            rs = pstmt.executeQuery();
            conn.commit();

        }
        catch(Exception e) {
            e.printStackTrace();
            
            try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
            
            return 0;
            
        }finally {
        	smsf.close(conn, pstmt, rs);
        }
        
    	return 1;
		
	}

	@Override
	public int removeReservation(ReservationDTO usrVO) {

		String SQL= "DELETE FROM TABLET_RESERVATION " +
					"WHERE ID = ?";
		
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
			}
            
            return 0;
            
        }finally {
        	smsf.close(conn, pstmt, rs);
        }
        
    	return 1;
		
	}

	@Override
	public List<ReservationDTO> selectRngReservation(ReservationDTO start, ReservationDTO end) {


		List<ReservationDTO> list = new ArrayList<ReservationDTO>();
		
		String SQL= "SELECT * from TABLET_RESERVATION " +
				"where regidate BETWEEN TO_DATE(?) " + 
				" AND TO_DATE(?)" + 
				" order by id desc";
		
        try {
            pstmt = conn.prepareStatement(SQL);
            
            pstmt.setDate(1, start.getRegidate());
            pstmt.setDate(2, end.getRegidate());
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
            	
            	ReservationDTO vo = new ReservationDTO();
            	vo.setId(rs.getInt("id"));
            	vo.setName(rs.getString("name"));
            	vo.setProposal(rs.getString("proposal"));
            	vo.setPhone(rs.getString("phone"));
            	vo.setIp(rs.getString("ip"));
            	vo.setState(rs.getString("state"));
            	vo.setRegidate(rs.getDate("regidate"));
            	vo.setPromise(rs.getDate("promise"));
            	
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