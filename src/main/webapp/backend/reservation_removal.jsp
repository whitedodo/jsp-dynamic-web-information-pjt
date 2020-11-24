<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: reservation_removal.jsp
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
	String id = "";
	String auth = "";
	ReservationDAO resDAO = new ReservationDAOImpl();
	ReservationDTO resDTO = new ReservationDTO();
	
	// 예약 코드 영역
	if ( request.getParameter("id") != null ){
		id = request.getParameter("id");
	}else{
	
%>
	<script>
		alert('잘못된 접근입니다.');
		history.back();
	</script>
<%
		return;
	}
	
	// 보안 절차(인증절차 등)
%>
<%
	resDTO.setId(Integer.valueOf(id));
	resDTO.setState("대기");
	
	// 업데이트 하기
	int retReservation = resDAO.updateReservation(resDTO);
	
	// 성공적인 업데이트 수행(반응) == (성공: 1, 실패: 0)
	if ( retReservation == 1 ){
	
%>

	<script>
		var url = '<%=contextPath %>/backend/admin.jsp';
		alert('성공적으로 반영되었습니다.');
		location.href = url;
	</script>
	
<%
	}
	
%>
