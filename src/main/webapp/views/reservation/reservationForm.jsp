<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: reservationForm.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	String proposal = null;
	
	if ( request.getParameter("proposal") != null ){
		proposal = request.getParameter("proposal");
	}else{
		response.sendRedirect("index.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>방문 신청 - 작성</title>
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_page.css" />
<link rel="stylesheet" href="<%= contextPath %>/js/jquery-ui-1.12.1/jquery-ui.css">
<script type="text/javascript" src="<%=contextPath %>/js/func_member.js"></script>
<script type="text/javascript" src="<%=contextPath %>/js/func_util.js"></script>
<script>

function onPage(){
	showClock();
	
	// 한국어 버전
	$.datepicker.regional['ko'] = {
	  closeText: '닫기',
	  prevText: '이전',
	  nextText: '다음',
	  currentText: '오늘',
	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  weekHeader: 'Wk',
	  dateFormat: 'yy-mm-dd',
	  firstDay: 0,
	  isRTL: false,
	  showMonthAfterYear: true,
	  yearSuffix: ''};
	 $.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$( ".datepicker" ).datepicker( {
		dateFormat:"yy-mm-dd"
	});
}

</script>
<script src="<%=contextPath %>/js/jquery-1.10.2.js"></script>
<script src="<%=contextPath %>/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
</head>
<body onload="onPage()">
	<div class="common_clock">
    	<div id="divClock"></div>
    </div>
<!-- 메인 -->
<div style="text-align:center">
	<img src="<%= contextPath %>/images/B11102112/title_visitor.jpg" alt="로고" />
</div>
<hr size="2" />
<div style="text-align:center">
	<a href="<%= contextPath %>/index.jsp">
		<img src="<%= contextPath %>/images/S2341234/home.jpg" alt="홈" />
	</a>
</div>
<!-- 본문 -->
<table class="home_tbl">
	<tr>
		<td>
			<img src="<%= contextPath %>/images/B11102112/visitor-1.jpg" alt="소개" />
		</td>
	</tr>
</table>

<form method="POST" action="<%= contextPath %>/views/reservation/reservation_ok.jsp" onSubmit="return goReservation()">
<input type="hidden" name="proposal" value="<%= proposal %>" />

<table class="common_res_tbl">

	<tr>
		<td valign="top">&nbsp;</td>
	</tr>
	
	<tr>
		<td valign="top">
			<table>
	
			<tr>
			     <div class="common_agree_font">
				     □ 이용약관 동의 
			     </div>
			</tr>
	
			 <!-- 개인정보 취급 방침 -->
				<tr>
					<td colspan="2" valign="top">
						<table class="common_res_agree_tbl">
							<tr>
								<td bgcolor="#FFFFFF">
									<div align="center">
										<iframe name="agree_frm" class="common_res_agree_iframe" src="../useagree.jsp"></iframe>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
						<table style="text-align:center;margin:auto;">
							<tr>
								<td>
									<input id="agree" class="common_agree_ok" name="agree" type="radio" value="Y" >이용 약관에 동의함
								</td>
							</tr>
							<tr>
								<td>
									<input id="agree" class="common_agree_ok" name="agree" type="radio" value="N" >이용 약관에 동의하지 않음
								</td>
							</tr>
						</table>
						<br>
					</td>
				</tr>
	
			   <tr>
			  	<td colspan="2" valign="top">
			     <font style="FONT-FAMILY: 맑은 고딕; FONT-SIZE: 20pt; FONT-WEIGHT: bold">
			     <span style="COLOR: #000000"> 개인정보 수집·이용 동의서 (예약용)   </span></font>
			    </td>
			   </tr>
			   <tr>
			  	<td colspan="2" valign="top">
			  	  &nbsp;
			  	 </td>
			   </tr>
	
				<!-- 개인정보보호  -->
				<tr> 
					<td>
			  		 <p>{Hello}<br />
				
					  <p><font class="common_agree_font">
					        <span style="COLOR: #000000">
					        □ 개인정보 수집&middot;이용 동의(필수)
					        </span>
					      </font>
					   </p> 
			         
						<table class="basic_list">
							 
							<tr>
							<th>항목</th>
							<th>목적</th>
							<th style="width:10%"><br />기간</th>
							</tr>
							<tr>
								<td>성명, 생년월일, 휴대전화번호</td>
								<td> - Hello <br>
								</td>
								<td> </td>
							</tr>
						</table>
					</td>
				</tr>	
				<!-- 개인정보보호  -->
				</table>
		 	</td>
	 	</tr>
	 	<tr>
	 	<td>
	 	
		<table class="common_agree_detail"> 
			<tr>   
				<td width="100">
				  <div id= 'to_aa' style='display:inline'>
	  				    <div align="center">
	  				     생년월일<br/>
	  				     (예)<br/>
	  				     (1900-11-01)
				  		</div>
				  </div>
				</td>
				<td width="132">
					<input name="birthdate" type="text" class="textbox" size="10" maxlength="10">
				</td>
			</tr>


			<tr>
				<td width="100">
					<div align="center">이  름 </div>
				</td>
				<td width="132">
					<input name="name" type="text" class="textbox" size="20" maxlength="20">
				</td>
			</tr>

			<tr>
				 <td width="100">
				 	<div align="center">휴대전화</div></td>
				<td>
					<input name="hpno" type="text" class="textbox" size="20" maxlength="16">
				</td>
			</tr>
			
			<tr>
				 <td width="100">
				 	<div align="center">희망예약일자</div></td>
				<td>
					<input type="text" readonly name="promise" 
					class="datepicker" style="font-size:20px; height:50px; width:400px;" />
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<input type="submit" class="btn_submit" value="제출" />
				</td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
</form>

</body>
</html>