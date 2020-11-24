/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: ReservationUtil.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.util;

public class ReservationUtil {

	public static String convProposal(String proposal) {
		
		String result = "";
		
		if ( proposal.indexOf("personal") > -1)
			result = "예제1";
		else if ( proposal.indexOf("education") > -1)
			result = "예제2";
		else {
			result = "";
		}
		
		return result;
	}
	
}
