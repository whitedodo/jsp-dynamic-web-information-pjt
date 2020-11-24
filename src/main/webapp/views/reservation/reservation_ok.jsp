<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: reservation_ok.jsp
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

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new java.util.Date());
	
	String agree = "";
	String proposal = "";
	String birthdate = "";
	String name = "";
	String hpno = "";
	String promise = "";
	
	boolean state = true;
	
	ReservationDAO resDAO = new ReservationDAOImpl();
	ReservationDTO resDTO = new ReservationDTO();
	
	Validation validUtil = new Validation();
	
	if ( request.getParameter("agree") != null ){
		agree = request.getParameter("agree") ;
	}else{
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}

	if ( request.getParameter("proposal") != null ){
		proposal = request.getParameter("proposal") ;
	}
	
	if ( state == true &&
			request.getParameter("proposal") == null ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( state == false &&
			request.getParameter("proposal") == null ){}
	
	if ( request.getParameter("birthdate") != null ){
		birthdate = request.getParameter("birthdate") ;
	}
	
	if ( state == true &&
			request.getParameter("birthdate") == null ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( request.getParameter("name") != null ){
		name = request.getParameter("name") ;
	}
	
	if ( state == true &&
			request.getParameter("name") == null ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( request.getParameter("hpno") != null ){
		hpno = request.getParameter("hpno") ;
	}

	if ( request.getParameter("promise") != null ){
		promise = request.getParameter("promise") ;
	}
	
	if ( state == true &&
			request.getParameter("promise") == null ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	
	if ( state == true &&
			request.getParameter("hpno") == null ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( agree.indexOf("Y") > -1 ){ } else{
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
		
	if ( validUtil.validationHp(hpno) == true ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}

	System.out.println( validUtil.validationDate(birthdate) );
	
	if ( validUtil.validationDate(birthdate) == false ){
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( name.length() > 1 ){}else{
		try{ response.sendRedirect("reservationForm.jsp"); } 
		catch(Exception e){ state = false; }
	}
	
	if ( state == true ){
	
		resDTO.setIp(HttpUtil.getRemoteAddr(request));
		resDTO.setName(name);
		resDTO.setPhone(hpno);
		resDTO.setProposal(proposal);
		resDTO.setState("대기");
		resDTO.setRegidate(java.sql.Date.valueOf(today));
		resDTO.setPromise(java.sql.Date.valueOf(promise));
		
		resDAO.insertReservation(resDTO);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>방문 신청 - 완료</title>
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_page.css" />

<script type="text/javascript" src="<%=contextPath %>/js/func_util.js"></script>
</head>
<body onload="showClock()">
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
			<img src="<%= contextPath %>/images/B11102112/visitor-2.jpg" alt="소개" />
		</td>
	</tr>
	<tr>
		<td>
			<!-- 예비영역 -->
		</td>
	</tr>
</table>

</body>
</html>