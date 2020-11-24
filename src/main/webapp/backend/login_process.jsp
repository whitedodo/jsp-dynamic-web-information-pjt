<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: login_process.jsp
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

	boolean status = true;
	
	String email = "";
	String passwd = "";
	
	String stuEmail = "admin@localhost.com";
	String stuPasswd = "123456";
	
	String auth = "";
	
%>
<%
	// 이메일 입력 확인
	if ( request.getParameter("email") != null ){
		email = request.getParameter("email");
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
	// 비밀번호 입력 확인
	if ( request.getParameter("passwd") != null ){
		passwd = request.getParameter("passwd");
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
	// 로그인 프로세스 구현
%>
<%
	if( email.equals(stuEmail) == false) {
		status = false;
	}

	if( passwd.equals(stuPasswd) == false){
		status = false;
	}
	
	if (status == true){
		
		session.setAttribute("email", email);
		session.setMaxInactiveInterval( 60* 5 );
	
%>

<script>
	var url = '<%=contextPath %>/backend/admin.jsp';
	location.href = url;
</script>

<%
	}else{
%>


<script>
	var msg = '계정 정보를 확인해주세요.';
	alert(msg);
	history.back();
</script>

<%
	}
%>

