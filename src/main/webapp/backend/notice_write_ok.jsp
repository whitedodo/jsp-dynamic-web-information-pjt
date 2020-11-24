<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: notice_write_ok.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
%>
<%@page import="com.example.website.dao.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.website.dto.*" %>
<%@page import="com.example.website.util.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	boolean status = true;
	session = request.getSession(false);
	
	if ( session == null ){
		status = false;
	}
	
	if (status == true && 
		session.getAttribute("email") == null){
		
		status = false;
	}
	
	if (status == false){
	
%>
	<script>
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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	String id = "";
	String dept = "";
	String regidate = "";
	String memo = "";
	
	String auth = "";
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = sdf.format(new java.util.Date());

	NoticeDAO noticeDAO = new NoticeDAOImpl();
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setRegidate(java.sql.Timestamp.valueOf(today));
	noticeDTO.setIp(HttpUtil.getRemoteAddr(request));
%>
<%
	// 부서 영역
	if ( request.getParameter("dept") != null ){
		dept = request.getParameter("dept");
	}else{
%>
	<script>
		alert('잘못된 접근입니다.');
		history.back();
	</script>
<%
		return;
	}
%>
<%
	// 메모 영역
	if ( request.getParameter("memo") != null ){
		memo = request.getParameter("memo");
	}else{
%>
	<script>
		alert('잘못된 접근입니다.');
		history.back();
	</script>
<%

		return;
	}
%>

<%
	// 보안 절차(인증절차 등)
%>
<%
	noticeDTO.setDept(dept);
	noticeDTO.setMemo(memo);
	
	// 업데이트 하기
	int retReservation = noticeDAO.insertNotice(noticeDTO);

	// 성공적인 업데이트 수행(반응) == (성공: 1, 실패: 0)
	if ( retReservation == 1 ){
	
%>

	<script>
		var url = '<%=contextPath %>/backend/admin.jsp';
		var msg = '성공적으로 반영되었습니다.';
		
		alert(msg);
		location.href = url;
	</script>
	
<%
	}
	
%>
