/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: func_notice_alert.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
function goSearchNotice() {

	var startdate = document.getElementsByName("n_startdate")[0].value;
	var enddate = document.getElementsByName("n_enddate")[0].value;
	
	// 시작일자	
	if(checkDateIsEmpty(startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 종료일자	
	if(checkDateIsEmpty(enddate) == false){
		alert('종료일자를 확인하세요');
		return false;
	}
	
	// 시작일자	
	if(checkBirthdate(startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 종료일자	
	if(checkBirthdate(enddate) == false){
		alert('종료일자를 확인하세요');
		return false;
	}
	
}

function checkDateIsEmpty(date){
	
	if (date.length > 1){
		return true;
	}
	else{
		return false;
	}
	
}

function checkBirthdate(birthdate){
	
	var format = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	
	if(format.test(birthdate)){
		return true;
	}else{
	  	return false;
	}
	
}