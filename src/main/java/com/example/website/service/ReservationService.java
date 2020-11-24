/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: ReservationService.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.service;

import java.util.List;

import com.example.website.dto.ReservationDTO;

public interface ReservationService {

	public List<ReservationDTO> selectReservation(ReservationDTO usrVO);
	public List<ReservationDTO> selectRngReservation(ReservationDTO start, ReservationDTO end);
	
	public void insertReservation(ReservationDTO usrVO);
	
	public int updateReservation(ReservationDTO usrVO);
	public int removeReservation(ReservationDTO usrVO);
}
