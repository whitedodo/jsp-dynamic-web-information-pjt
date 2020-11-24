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
%>
	<script type="text/javascript">
		var url = '<%=contextPath %>/backend/admin.jsp';
		location.href = url;
	</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<title>관리자 페이지 - 로그인</title>
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_login.css" />

<script type="text/javascript" src="<%=contextPath %>/js/func_util.js"></script>
</head>
<body onload="showClock()">
	<div class="common_clock">
    	<div id="divClock"></div>
    </div>

<!-- 메인 -->
<div style="text-align:center">
	<img src="<%= contextPath %>/images/B11102112/title_admin_login.jpg" alt="로고" />
</div>
<hr size="2" />
<div style="text-align:center">
	<a href="<%= contextPath %>/index.jsp">
		<img src="<%= contextPath %>/images/S2341234/home.jpg" alt="홈" />
	</a>
</div>
<!-- 본문 -->
<form action="login_process.jsp" method="POST">
<table class="admin_tbl">
	<tr>
		<td colspan="2">
			<img src="<%= contextPath %>/images/B11102112/admin-login.jpg" alt="소개" />
		</td>
	</tr>
	<tr>
		<td style="width:10%;">
			이메일
		</td>
		<td>
			<input class="input_txt" type="text" name="email" />
		</td>
	</tr>
	<tr>
		<td>
			비밀번호
		</td>
		<td>
			<input class="input_txt" type="password" name="passwd" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="btn_submit" type="submit" name="submit" value="로그인" />
		</td>
	</tr>
</table>
</form>

<br/><br/>
<!-- 슬라이더 모드 안내 문구 -->
<!-- 하단 -->
<table class="foot_tbl">
	<tr>
		<td style="width:20%;">
			<img src="<%= contextPath %>/images/B11102112/static-information-guide.jpg" onmouseover="this.src='<%= contextPath %>/images/B11102112/static-information-guide.jpg';" 
				onmouseout="this.src='<%= contextPath %>/images/B11102112/static-information-guide.jpg';" alt="메뉴" title="자동전환 안내" />
		</td>
		<td style="width:20%;">
			<a href="<%= contextPath %>/">
			<img src="<%= contextPath %>/images/B11102112/manual-mode-static.jpg" onmouseover="this.src='<%= contextPath %>/images/B11102112/manual-mode-static.jpg';" 
				onmouseout="this.src='<%= contextPath %>/images/B11102112/manual-mode-static.jpg';" alt="메뉴" title="정적 모드" />
			</a>
		</td>
		<td>
			<a href="<%= contextPath %>/backend">
			<img src="<%= contextPath %>/images/B11102112/manual-mode-admin.jpg" onmouseover="this.src='<%= contextPath %>/images/B11102112/manual-mode-admin.jpg';" 
				onmouseout="this.src='<%= contextPath %>/images/B11102112/manual-mode-admin.jpg';" alt="메뉴" title="관리자 페이지" />
			</a>
		</td>
	</tr>
 </table>


</body>
</html>