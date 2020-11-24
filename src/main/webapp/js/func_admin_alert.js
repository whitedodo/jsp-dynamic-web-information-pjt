/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: func_admin_alert.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */

function goSearchAdmin_Res() {

	var r_startdate = document.getElementsByName("r_startdate")[0].value;
	var r_enddate = document.getElementsByName("r_enddate")[0].value;
	
	// 예약 - 시작일자	
	if(checkDateIsEmpty(r_startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 예약 - 종료일자	
	if(checkDateIsEmpty(r_enddate) == false){
		alert('종료일자를 확인하세요');
		return false;
	}
	
	// 예약 - 시작일자	
	if(checkBirthdate(r_startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 예약 - 종료일자	
	if(checkBirthdate(r_enddate) == false){
		alert('종료일자를 확인하세요');
		return false;
	}
	
}

function goSearchAdmin_Notice() {

	var n_startdate = document.getElementsByName("n_startdate")[1].value;
	var n_enddate = document.getElementsByName("n_enddate")[1].value;
	
	// 소식 - 시작일자	
	if(checkDateIsEmpty(n_startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 소식 - 종료일자	
	if(checkDateIsEmpty(n_enddate) == false){
		alert('종료일자를 확인하세요');
		return false;
	}
	
	// 소식 - 시작일자	
	if(checkBirthdate(n_startdate) == false){
		alert('시작일자를 확인하세요');
		return false;
	}
	
	// 소식 - 종료일자	
	if(checkBirthdate(n_enddate) == false){
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