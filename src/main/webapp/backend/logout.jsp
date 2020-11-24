<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: logout.jsp
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
	
	if (status == true )
	{
		session.invalidate();
%>
	<script>
		var url = '<%=contextPath %>/backend/';
		var msg = 'Good Bye!';
		
		alert(msg);
		location.href = url;
	</script>
<%
		return;
	}
%>