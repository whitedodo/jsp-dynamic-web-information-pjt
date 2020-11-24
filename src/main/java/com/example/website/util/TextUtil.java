/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: TextUtil.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.util;

public class TextUtil {
	
	public static String txtPrivacyName(String txt) {
		
		String result = txt;
		String convTxt = result.substring(0, 1);
		convTxt += "*" + result.substring(convTxt.length() + 1, result.length());
		
		return convTxt;
	}
	
	public static String txtPrivacyPhone(String txt) {
		String result = txt;
		String convTxt = result.substring(result.length() - 4, result.length());
		
		return convTxt;
	}
	
}
