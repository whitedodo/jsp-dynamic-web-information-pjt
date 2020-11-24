/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: ReservationServiceImpl.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.service;

import java.util.List;

import com.example.website.dao.ReservationDAO;
import com.example.website.dao.ReservationDAOImpl;
import com.example.website.dto.ReservationDTO;

public class ReservationServiceImpl implements ReservationService {

	private ReservationDAO resDAO = new ReservationDAOImpl(); 
	
	@Override
	public List<ReservationDTO> selectReservation(ReservationDTO usrVO) {
		
		return resDAO.selectReservation(usrVO);
	}

	@Override
	public List<ReservationDTO> selectRngReservation(ReservationDTO start, ReservationDTO end) {
		
		return resDAO.selectRngReservation(start, end);
	}

	@Override
	public void insertReservation(ReservationDTO usrVO) {
		
		resDAO.insertReservation(usrVO);

	}

	@Override
	public int updateReservation(ReservationDTO usrVO) {

		return resDAO.updateReservation(usrVO);
	}

	@Override
	public int removeReservation(ReservationDTO usrVO) {

		return resDAO.removeReservation(usrVO);
	}

}
