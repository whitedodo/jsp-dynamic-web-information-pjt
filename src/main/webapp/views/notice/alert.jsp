<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: alert.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
%>
<%@page import="com.example.website.dao.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.website.dto.*" %>
<%@page import="com.example.website.util.*" %>
<%@page import="com.example.website.service.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new java.util.Date());

	String n_startdate = today + " 00:00:00.0";
	String n_enddate = today + " 23:59:59.9";
	String conv_date = "";

	NoticeService noticeService = new NoticeServiceImpl();
	ReservationService resService = new ReservationServiceImpl();
	
	ReservationDTO rsvDTO = new ReservationDTO();

	NoticeDTO n_startDTO = new NoticeDTO();
	NoticeDTO n_endDTO = new NoticeDTO();

%>
<%
	if ( request.getParameter("n_startdate") != null ){
		n_startdate = request.getParameter("n_startdate");
		
		if ( n_startdate.length() == 10)
			n_startdate = n_startdate + " 00:00:00.0";
	}

	if ( request.getParameter("n_enddate") != null ){
		n_enddate = request.getParameter("n_enddate");
		
		if ( n_enddate.length() == 10)
			n_enddate = n_enddate + " 23:59:59.9";
	}

	rsvDTO.setPromise(java.sql.Date.valueOf(today));

	n_startDTO.setRegidate(java.sql.Timestamp.valueOf( n_startdate ) );
	n_endDTO.setRegidate(java.sql.Timestamp.valueOf( n_enddate ) );	
	
	List<ReservationDTO> reslst = resService.selectReservation(rsvDTO);
	List<NoticeDTO> noticelst = noticeService.selectRngNotice(n_startDTO, n_endDTO);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>Notice(소식)</title>
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" href="<%= contextPath %>/js/jquery-ui-1.12.1/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_page.css" />
<script type="text/javascript" src="<%=contextPath %>/js/func_notice_alert.js"></script>
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
	<img src="<%= contextPath %>/images/B11102112/title_notice.jpg" alt="로고" />
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
			<img src="<%= contextPath %>/images/B11102112/alert-1.jpg" alt="예약자명단" />
		</td>
	</tr>
</table>

<table class="notice_alert_tbl">
	<thead>
		<tr>
			<td style="width:10%;">
				번호
			</td>
			<td style="width:25%">
				예약신청일자
			</td>
			<td style="width:25%">
				예약자명<br/>
				가운데(*)처리함
			</td>
			<td style="width:20%">
				휴대번호<br/>
				뒷자리<br/>
				(4자리)
			</td>
			<td style="width:20%;border-right:none;">
				비고
			</td>
		</tr>
	</thead>
	<tbody>
		<%
			for (ReservationDTO resdto : reslst ){
		%>
		<tr>
			<td>
				<%= resdto.getId() %>
			</td>
			<td>
				<%= resdto.getRegidate() %>
			</td>
			<td>
				<%= TextUtil.txtPrivacyName(resdto.getName()) %>
			</td>
			<td>
				<%= TextUtil.txtPrivacyPhone(resdto.getPhone()) %>
			</td>
			<td style="border-right:none;">
				<%= resdto.getState() %>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

<!-- 본문 -->
<table class="home_tbl">
	<tr>
		<td>
			<img src="<%= contextPath %>/images/B11102112/alert-2.jpg" alt="대외-전달사항" />
		</td>
	</tr>
</table>
<br/>
<br/>

<!-- 상세 조회 -->
<form method="POST" action="alert.jsp" onSubmit="return goSearchNotice()">
<table class="detail_search_notice_tbl">
	<tr>
		<td>시작일자</td>
		<td>
			<input type="text" readonly name="n_startdate" 
					class="datepicker" style="font-size:20px;" />
		</td>
		<td>종료일자</td>
		<td>
			<input type="text" readonly name="n_enddate" 
					class="datepicker" style="font-size:20px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" class="input_button" value="검색" />
		</td>
	</tr>
</table>
</form>

<!-- 전달사항 -->
<table class="board_alert_tbl">
	<thead>
		<tr>
			<td style="width:20%;">
				번호
			</td>
			<td style="width:20%;">
				부서
			</td>
			<td style="border-right:none;">
				등록일자
			</td>
		</tr>
	</thead>
	<tbody>
	
		<%
			for (NoticeDTO noticedto : noticelst ){
		%>
		<!-- 반복 영역 -->
		<tr>
			<td style="width:20%;">
				<%= noticedto.getId() %>
			</td>
			<td style="width:40%;">
				<%= noticedto.getDept() %>
			</td>
			<td style="border-right:none;">
				<%= noticedto.getRegidate() %>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="border-right:none;">
				<%= noticedto.getMemo() %>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

</body>
</html>