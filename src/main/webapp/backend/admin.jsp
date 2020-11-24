<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: admin.jsp
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	boolean status = true;
	session = request.getSession(false);
	
	if ( session == null ){
		status = false;
	}
	
	if (status == true && 
		session.getAttribute("email") == null){
		
		status = false;
	}
	
	if (status == false )
	{
%>
	<script type="text/javascript">
		var url = '<%=contextPath %>/backend/';
		var msg = '로그인 후 사용해주세요.';
		
		alert(msg);
		location.href = url;
	</script>
<%
		return;
	}
%>
<%

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new java.util.Date());
	
	String n_startdate = today + " 00:00:00.0";
	String n_enddate = today + " 23:59:59.9";
	String conv_date = "";
	
	String r_startdate = today;
	String r_enddate = today;

	NoticeService noticeService = new NoticeServiceImpl();
	ReservationService resService = new ReservationServiceImpl();
	
	NoticeDTO n_startDTO = new NoticeDTO();
	NoticeDTO n_endDTO = new NoticeDTO();
	ReservationDTO r_startDTO = new ReservationDTO();
	ReservationDTO r_endDTO = new ReservationDTO();
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

	if ( request.getParameter("r_startdate") != null ){
		r_startdate = request.getParameter("r_startdate");
	}

	if ( request.getParameter("r_enddate") != null){
		r_enddate = request.getParameter("r_enddate");
	}
	
	n_startDTO.setRegidate(java.sql.Timestamp.valueOf( n_startdate ) );
	n_endDTO.setRegidate(java.sql.Timestamp.valueOf( n_enddate ) );	
	r_endDTO.setRegidate(java.sql.Date.valueOf(r_enddate));
	r_startDTO.setRegidate(java.sql.Date.valueOf(r_startdate));
%>
<%
	List<NoticeDTO> noticelst = noticeService.selectRngNotice(n_startDTO, n_endDTO);
	List<ReservationDTO> reslst = resService.selectRngReservation(r_startDTO, r_endDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>관리자 모드</title>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_page.css" />
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/ckeditor/style.css" />
<link rel="stylesheet" href="<%= contextPath %>/js/jquery-ui-1.12.1/jquery-ui.css">
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_admin.css" />
<script type="text/javascript" src="<%=contextPath %>/js/func_admin_alert.js"></script>
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
      showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
      showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
      changeYear: true, //콤보박스에서 년 선택 가능
      changeMonth: true, //콤보박스에서 월 선택 가능        
	  firstDay: 0,
	  isRTL: false,
	  showMonthAfterYear: true,
	  yearSuffix: ''};
	 $.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$( ".datepicker" ).datepicker( {
		dateFormat:"yy-mm-dd"
	});
}

function getResApproval(id){
	
	var msg = confirm('승인처리를 하시겠습니까?');
	
	if ( msg == true ){
		var url = '<%= contextPath %>/backend/reservation_approval.jsp?id=' + id; 
		location.href = url;		
	}
	
}

function getResRemoval(id){
	
	var msg = confirm('대기처리를 하시겠습니까?');
	
	if ( msg == true ){
		var url = '<%= contextPath %>/backend/reservation_removal.jsp?id=' + id; 
		location.href = url;		
	}
	
}

function getNoticeRemoval(id){
	
	var msg = confirm('공지사항을 삭제하시겠습니까?');
	
	if ( msg == true ){
		var url = '<%= contextPath %>/backend/notice_removal_ok.jsp?id=' + id; 
		location.href = url;		
	}
	
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
	<img src="<%= contextPath %>/images/B11102112/title_admin.jpg" alt="로고" />
</div>
<hr size="2" />
<div style="text-align:center">
	<a href="<%= contextPath %>/index.jsp">
		<img src="<%= contextPath %>/images/S2341234/home.jpg" alt="홈" />
	</a>
	<br/>
	<a href="<%= contextPath %>/backend/logout.jsp">로그아웃</a>
</div>

<div style="text-align:center">
<h2>예약신청 일정에 대한 조회입니다.</h2>
</div>

<!-- 상세 조회(예약 영역) -->
<form method="POST" action="admin.jsp" onSubmit="return goSearchAdmin_Res()">
<input type="hidden" name="n_startdate" value="<%= n_startdate %>" />
<input type="hidden" name="n_enddate" value="<%= n_enddate %>" />
<table class="detail_search_reservation_tbl">
	<tr>
		<td style="width:15%;">
			시작일자
		</td>
		<td style="width:15%;">
			<input type="text" readonly name="r_startdate" 
					class="datepicker" style="font-size:20px;width:150px" />
		</td>
		<td style="width:15%;">
			종료일자
		</td>
		<td style="width:15%;">
			<input type="text" readonly name="r_enddate" 
					class="datepicker" style="font-size:20px;width:150px" />
		</td>
		<td>
			<input type="submit" class="input_search_button" value="검색" />
		</td>
	</tr>
</table>
</form>

<br/><br/>
<!-- 본문 -->
<table class="notice_alert_dev_tbl">
	<thead>
		<tr>
			<td style="width:8%;">
				번호
			</td>
			<td style="width:10%">
				예약신청일자
			</td>
			<td style="width:10%">
				목적
			</td>
			<td style="width:10%">
				예약자명
			</td>
			<td style="width:10%">
				휴대번호
			</td>
			<td style="width:10%;">
				상태
			</td>
			<td style="width:15%;">
				희망일자
			</td>
			<td style="width:15%;border-right:none;">
				비고
			</td>
		</tr>
	</thead>
	<tbody>
		<%
			for (ReservationDTO resdto : reslst ){
		%>
		<tr>
			<td style="width:10%;">
				<input type="hidden" name="res_<%= resdto.getId() %>"
					 value="<%= resdto.getId() %>" />
				<%= resdto.getId() %>
			</td>
			<td style="width:15%;">
			 	<fmt:formatDate value="<%= resdto.getRegidate() %>" pattern="yyyy-MM-dd" />
			</td>
			<td style="width:10%">
				<%= ReservationUtil.convProposal( resdto.getProposal() ) %>
			</td>
			<td style="width:10%">
				<%= resdto.getName() %>
			</td>
			<td style="width:20%">
				<%= resdto.getPhone() %>
			</td>
			<td style="width:10%;">
				<%= resdto.getState() %>
			</td>
			<td style="width:15%;">
				<%= resdto.getPromise() %>
			</td>
			<td style="border-right:none;">
				<a href="javascript:getResApproval('<%= resdto.getId() %>')">허가</a>
				<a href="javascript:getResRemoval('<%= resdto.getId() %>')">거부</a>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

<br/><br/>
<!-- 본문 -->
<table class="home_tbl">
	<tr>
		<td>
			<img src="<%= contextPath %>/images/B11102112/alert-2.jpg" alt="대외-전달사항" />
		</td>
	</tr>
</table>

<form action="notice_write_ok.jsp" method="POST">
<!-- 전달사항 -->
<table class="board_write_dev_tbl">
	<thead>
		<tr>
			<td style="width:20%;">
				구분
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="width:40%;">
				<select name="dept" class="input_option">
				    <option value="일반">일반</option>
				    <option value="공통">공통</option>
				</select>
			</td>
			<!-- <td style="border-right:none;">
				</td>
			-->
		</tr>
		<tr>
			<td style="border-right:none;">
				<textarea name="memo" class="memo"></textarea>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-right:none;">
				<input type="submit" class="input_button" name="btn_submit" value="등록" />
			</td>
		</tr>
	</tbody>
</table>
</form>
<br/><br/>
<div style="text-align:center">
<h2>공지사항에 대한 일정 조회입니다.</h2>
</div>
<!-- 상세 조회(일반 공지사항 영역) -->
<form method="POST" action="admin.jsp" onSubmit="return goSearchAdmin_Notice()">
<input type="hidden" name="r_startdate" value="<%= r_startdate %>" />
<input type="hidden" name="r_enddate" value="<%= r_enddate %>" />
<table class="detail_search_reservation_tbl">
	<tr>
		<td style="width:15%;">
			시작일자
		</td>
		<td style="width:15%;">
			<input type="text" readonly name="n_startdate" 
					class="datepicker" style="font-size:20px;width:150px" />
		</td>
		<td style="width:15%;">
			종료일자
		</td>
		<td style="width:15%;">
			<input type="text" readonly name="n_enddate" 
					class="datepicker" style="font-size:20px;width:150px" />
		</td>
		<td>
			<input type="submit" class="input_search_button" value="검색" />
		</td>
	</tr>
</table>
</form>
<br/><br/>
<!-- 전달사항 출력 -->
<table class="board_alert_dev_tbl">
	<thead>
		<tr>
			<td style="width:10%;">
				번호
			</td>
			<td style="width:15%;">
				구분
			</td>
			<td style="width:20%;">
				등록일자
			</td>
			<td style="border-right:none;">
				비고
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
			<td>
				<fmt:formatDate value="<%= noticedto.getRegidate() %>" pattern="yyyy-MM-dd HH:mm:ss" />
			</td>
			<td style="border-right:none;">
				<a href="javascript:getNoticeRemoval('<%= noticedto.getId() %>')">삭제</a>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-right:none;">
				<%= noticedto.getMemo() %>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

<!--  -->
<script src="<%= contextPath %>/js/ckeditor5/build/ckeditor.js"></script>
	<script>
		ClassicEditor
			.create( document.querySelector( '.memo' ), {
				
				toolbar: {
					items: [
						'heading',
						'|',
						'bold',
						'italic',
						'link',
						'bulletedList',
						'numberedList',
						'|',
						'indent',
						'outdent',
						'|',
						'blockQuote',
						'insertTable',
						'mediaEmbed',
						'undo',
						'redo'
					]
				},
				language: 'ko',
				image: {
					toolbar: [
						'imageTextAlternative'
					]
				},
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells'
					]
				},
			} )
			.then( editor => {
				window.editor = editor;
			} )
			.catch( error => {
				
			} );
	</script>

</body>
</html>