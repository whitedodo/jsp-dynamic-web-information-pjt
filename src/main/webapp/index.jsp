<%
/*
 * 	생성일자(Created date): 2020-10-24
 * 	저자(Author): Dodo (rabbit.white at daum dot net)
 *  주제명(Subject): Dynamic Display Project
 *  파일명(Filename): index.jsp
 *  설명(Description):
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
<title>홈페이지 - 안내 서비스</title>
<style type="text/css">
	@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
</style>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style.css" />

<script type="text/javascript">
	setTimeout(function() {
		location.href = '<%= contextPath %>/slick';
	}, 100*500);	// 지연시간(300 = 3초)
</script>

<script type="text/javascript" src="<%=contextPath %>/js/func_util.js"></script>
</head>

<!-- 시간 -->
<body onload="showClock()">
	<div class="common_clock">
    	<div id="divClock"></div>
    </div>
    
<!-- 메인 -->
<div style="text-align:center">
	<img src="<%= contextPath %>/images/S2341234/O21424.jpg" alt="로고" />
</div>
<br/>

<!-- 본문 -->
<table class="home_tbl">
	<tr>
		<td>
			<a href="<%= contextPath %>/views/company/introduce.jsp">
				<img src="<%= contextPath %>/images/S2341234/button_1.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_1_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_1.jpg';" alt="메뉴" title="소개"/>
			</a>
		</td>
		<td>
			<a href="<%= contextPath %>/views/reservation/index.jsp">
				<img src="<%= contextPath %>/images/S2341234/button_2.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_2_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_2.jpg';" alt="메뉴" title="방문 신청"/>
			</a>
		</td>
		
		<td>
			<a href="<%= contextPath %>/views/notice/alert.jsp">
				<img src="<%= contextPath %>/images/S2341234/button_3.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_3_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_3.jpg';" alt="메뉴" title="소식" />
			</a>
		</td>
		
	</tr>
</table>
<br/>
<!-- 슬라이더 모드 안내 문구 -->
<!-- 하단 -->
<table class="home_tbl">
	<tr>
		<td style="width:20%;">
	<img src="<%= contextPath %>/images/B11102112/slider-information-guide.jpg" onmouseover="this.src='<%= contextPath %>/images/B11102112/slider-information-guide.jpg';" 
		onmouseout="this.src='<%= contextPath %>/images/B11102112/slider-information-guide.jpg';" alt="메뉴" title="자동전환 안내" />
		</td>
		<td style="width:20%;">
			<a href="<%= contextPath %>/slick">
			<img src="<%= contextPath %>/images/B11102112/manual-mode.jpg" onmouseover="this.src='<%= contextPath %>/images/B11102112/manual-mode.jpg';" 
				onmouseout="this.src='<%= contextPath %>/images/B11102112/manual-mode.jpg';" alt="메뉴" title="수동 모드" />
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