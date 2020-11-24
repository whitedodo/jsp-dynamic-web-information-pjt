<%
/*
 * 	생성일자(Created date): 2020-10-24
 * 	저자(Author): Dodo (rabbit.white at daum dot net)
 *  주제명(Subject): Dynamic Display Project
 *  파일명(Filename): useagree.jsp
 *  설명(Description):
 * 
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<title>개인정보보호약관(템플릿)</title>
<meta charset="UTF-8">
<!-- 검색엔진 차단 -->
<meta name="robots" content="noindex,nofollow" />
<style type="text/css">
<!--
body {
	font-size:15px;
	color:#86837A;
	}
table {
	font-size:15px;
	color:#86837A;
	
	}
.title {
	font-size:15px;
	font-weight: bold;
	letter-spacing:-1px;
	}
	
.bigtitle {
	font-size:15px;
	font-weight: bold;
	letter-spacing:-1px;	 
	
}
.contents {
	line-height: 140%;
	font-size:15px;
}	
</style>
</head>
<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_agree.css" />

<body>
<table class="useagree_tbl">
  <tr> 
    <td valign="top">
    	Hello World - 페이지 입력 가능함
    </td>
  </tr>
   
</table>
</body>
</html>
