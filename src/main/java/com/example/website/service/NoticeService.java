/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: NoticeService.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.service;

import java.util.List;

import com.example.website.dto.NoticeDTO;

public interface NoticeService {

	public List<NoticeDTO> selectNotice();
	public List<NoticeDTO> selectRngNotice(NoticeDTO start, NoticeDTO end);
	
	public int insertNotice(NoticeDTO usrVO);
	public int removeNotice(NoticeDTO usrVO);
}
