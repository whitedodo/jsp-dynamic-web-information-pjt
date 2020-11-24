<%
/*
 *  프로젝트 주제: Dynamic Web Project
 * 	작성자: Dodo (rabbit.white at daum dot net)
 *  작성일자: 2020-10-22
 *  파일명: index.jsp
 *  비고: 
 *  1. 신규 생성, 도도, 2020-10-22
 * 
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>방문 신청</title>
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
			<img src="<%= contextPath %>/images/B11102112/visitor-1.jpg" alt="소개" />
		</td>
	</tr>
</table>

<form method="POST" action="<%= contextPath %>/views/reservation/reservationForm.jsp">
<table class="common_tbl">
	<tr>
		<td>
			<input type="radio" class="personal" name="proposal" value="personal"> 개인
		</td>
	</tr>
	<tr>
		<td>
			<input type="radio" class="education" name="proposal" value="education"> 교육
		</td>
	</tr>
</table>
<table class="common_foot_tbl">
	<tr>
		<td>
			<input type="submit" class="btn_submit" value="제출" />
		</td>
	</tr>
</table>
</form>

</body>
</html>