/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: func_member.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
function goReservation() {

	var agree = document.getElementsByName("agree");
	var phone = document.getElementsByName("hpno")[0].value;
	var name = document.getElementsByName("name")[0].value;
	var birthdate = document.getElementsByName("birthdate")[0].value;
	var promise = document.getElementsByName("promise")[0].value;
	
	// 약관 동의
	if(checkAgree(agree) == false){
		alert('약관 동의를 선택하세요.');
		return false;
	}else{
		agree = checkAgree(agree);
	}
	
	if (agree.indexOf("N") > -1){
		alert('약관 동의를 하지 않으면 진행하실 수 없습니다.');
		return false;
	}
	
	// 생년 월일	
	if(checkBirthdate(birthdate) == false){
		alert('생년 월일을 확인하세요');
		return false;
	}
	
	// 이름 확인
	if( checkName(name) == false ){
		alert('이름을 확인하세요.');
		return false;
	}
	
	// 휴대전화 확인
	if( checkPhoneNumber(phone) == false){
		alert('전화번호를 확인하세요.');
		return false;
	}
	
	// 예약일자	
	if(checkDateIsEmpty(promise) == false){
		alert('희망예약일자를 확인하세요');
		return false;
	}
	
	// 시작일자	
	if(checkBirthdate(promise) == false){
		alert('희망예약일자를 확인하세요');
		return false;
	}
	
}

function checkAgree(chk_agree){
	
	var sel_type = null;
	
	for(var i=0; i< chk_agree.length; i++){

		if(chk_agree[i].checked == true){ 
			sel_type = chk_agree[i].value;
		}
		
	}

	if(sel_type == null){
		return false;
	}
	
	return sel_type;

}

function checkName(name){
	
	if (name.length > 1){
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

function checkDateIsEmpty(date){
	
	if (date.length > 1){
		return true;
	}
	else{
		return false;
	}
	
}

function checkPhoneNumber(phone){

	// 휴대폰번호를 입력시 올바른 휴대폰 번호인지 체크 
  	if(phone.value != "") {
  		
		var rgEx = /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g; 
		var chkFlg = rgEx.test(phone);  

		if(!chkFlg){
	    	return false;
	   	}else{
	   		return true;
	   	}
 	}
	
}