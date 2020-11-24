/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: NoticeServiceImpl.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.service;

import java.util.List;

import com.example.website.dao.NoticeDAO;
import com.example.website.dao.NoticeDAOImpl;
import com.example.website.dto.NoticeDTO;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO = new NoticeDAOImpl();
	
	@Override
	public List<NoticeDTO> selectNotice() {

		return noticeDAO.selectNotice();
	}
	
	@Override
	public List<NoticeDTO> selectRngNotice(NoticeDTO start, NoticeDTO end){
		return noticeDAO.selectRngNotice(start, end);
	}

	@Override
	public int insertNotice(NoticeDTO usrVO) {
		return noticeDAO.insertNotice(usrVO);
	}

	@Override
	public int removeNotice(NoticeDTO usrVO) {
		return noticeDAO.removeNotice(usrVO);
	}


}
