/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: Validation.java
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
package com.example.website.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

	/** 입력 date가 yyyy-MM-dd 형태로 들어옴 */
	public  boolean  validationDate(String checkDate){

	   try{
		   SimpleDateFormat  dateFormat = new  SimpleDateFormat("yyyy-MM-dd");

	       dateFormat.setLenient(false);
	       dateFormat.parse(checkDate);
	       
	       return  true;

       }catch (ParseException e){
    	   return  false;
       }

	}
	
	public boolean validationHp(String phone) {
		// String pattern = "^[0-9]*$"; //숫자만
        // String val = "123456789"; //대상문자열
    
		Pattern tel = Pattern.compile("(\\d{3})-(\\d{3,4})-(\\d{4})");
		Matcher m = tel.matcher(phone);
		
		System.out.println(tel + "/" + phone);
		
		if ( !m.matches() ) {
			return true;
		}else {
			return false;
		}
		
	}
	
}
