/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: func_util.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
function showClock()
{
    var currentDate = new Date();
    var divClock = document.getElementById("divClock");
    
    var apm = currentDate.getHours();
    
    if(apm < 12)
    {
        apm = "오전";
    }
    else
    {
        apm = "오후";
    }
    var msg = "현재:" + currentDate.getFullYear() + "년 " +
    	(currentDate.getMonth() + 1) + "월 " + currentDate.getDate() + "일";
    
    msg += " " + apm + " " +(currentDate.getHours())+"시";
    msg += " ";
    msg += currentDate.getMinutes() + "분";
    msg += " ";
    msg += currentDate.getSeconds() + "초";
    
    divClock.innerHTML = "(" + msg + ")";
    
    setTimeout(showClock,1000);
}