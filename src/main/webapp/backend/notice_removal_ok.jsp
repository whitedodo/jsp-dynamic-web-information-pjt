<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: notice_removal_ok.jsp
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
	if (status == true )
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		String id = "";
		String auth = "";
		
		NoticeDAO noticeDAO = new NoticeDAOImpl();
		NoticeDTO noticeDTO = new NoticeDTO();
%>
<%
		// 아이디 존재 여부
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
%>

<%
	// 회원 작동 구현해보기
%>
<%
	noticeDTO.setId(Integer.valueOf( id ));
	
	// 업데이트 하기
	int retReservation = noticeDAO.removeNotice(noticeDTO);

	// 성공적인 업데이트 수행(반응) == (성공: 1, 실패: 0)
	if ( retReservation == 1 ){
	
%>

	<script>
		var url = '<%=contextPath %>/backend/admin.jsp';
		var msg = '성공적으로 삭제되었습니다.';
		
		alert(msg);
		location.href = url;
	</script>
	
<%
		}
	}
%>
