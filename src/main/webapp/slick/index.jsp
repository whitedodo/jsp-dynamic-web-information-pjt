<%
/*
 * 	생성일자(Created date): 2020-10-24
 * 	저자(Author): Dodo (rabbit.white at daum dot net)
 *  주제명(Subject): Dynamic Display Project
 *  파일명(Filename): slick/index.jsp
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
  	<title>홈페이지 - 안내 서비스(2):::Slick Playground</title>
  	<meta charset="UTF-8">
	<!-- 검색엔진 차단 -->
	<meta name="robots" content="noindex,nofollow" />
	<style type="text/css">
		@import url(<%= contextPath %>/earlyaccess/nanumgothic.css);
	</style>
  	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/slick/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/slick/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/myhome/style_page.css" />
  	<style type="text/css">
    
    	html, body {
    	  	margin: 0;
	      	padding: 0;
    	}

    	* {
      		box-sizing: border-box;
    	}	

	    .slider {
	        width: 50%;
	        margin: 100px auto;
	    }
	
	    .slick-slide {
	      margin: 0px 20px;
	    }
	
	    .slick-slide img {
	      width: 100%;
	    }
	
	    .slick-prev:before,
	    .slick-next:before {
	      color: black;
	    }
	
	
	    .slick-slide {
	      transition: all ease-in-out .3s;
	      opacity: .2;
	    }
	    
	    .slick-active {
	      opacity: .5;
	    }
	
	    .slick-current {
	      opacity: 1;
	    }
  	</style>
	<script type="text/javascript" src="<%=contextPath %>/js/func_util.js"></script>
</head>
<body onload="showClock()">
	<div class="common_clock">
    	<div id="divClock"></div>
    </div>
    
	<!-- 메인 -->

	<!-- 슬라이더 -->
  	<section class="variable slider">
    	<div>
		     <a href="about:blank">
				<img src="<%= contextPath %>/images/S2341234/button_1.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_1_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_1.jpg';" alt="소개" title="소개" />
			 </a>
    	</div>
   		<div>
			<a href="<%= contextPath %>/views/reservation/index.jsp">
				<img src="<%= contextPath %>/images/S2341234/button_2.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_2_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_2.jpg';" alt="방문신청" title="방문신청" />
			</a>
    	</div>
    	<div>
			<a href="<%= contextPath %>/views/notice/alert.jsp">
				<img src="<%= contextPath %>/images/S2341234/button_3.jpg" onmouseover="this.src='<%= contextPath %>/images/S2341234/button_3_over.jpg';" 
					onmouseout="this.src='<%= contextPath %>/images/S2341234/button_3.jpg';" alt="소식" title="소식" />
			</a>
    	</div>
</section>

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

  	<script src="<%= contextPath %>/js/jquery-2.2.0.min.js" type="text/javascript"></script>
  	<script src="<%= contextPath %>/slick/slick/slick.js" type="text/javascript" charset="utf-8"></script>
  	<script type="text/javascript">
    
  	$(document).on('ready', function() {
    	
		$(".vertical-center-4").slick({
        	dots: true,
        	vertical: true,
        	centerMode: true,
        	slidesToShow: 4,
        	slidesToScroll: 2
      	});
      
      	$(".vertical-center-3").slick({
        	dots: true,
        	vertical: true,
        	centerMode: true,
        	slidesToShow: 3,
        	slidesToScroll: 3
      	});
      
      	$(".vertical-center-2").slick({
	        dots: true,
        	vertical: true,
        	centerMode: true,
        	slidesToShow: 2,
        	slidesToScroll: 2
      	});
      
      	$(".vertical-center").slick({
        	dots: true,
        	vertical: true,
        	centerMode: true,
      	});
      
      	$(".vertical").slick({
        	dots: true,
        	vertical: true,
        	slidesToShow: 3,
        	slidesToScroll: 3
      	});
      
      	$(".regular").slick({
        	dots: true,
        	infinite: true,
        	slidesToShow: 3,
      	  	slidesToScroll: 3
	    });
      
      	$(".center").slick({
        	dots: true,
        	infinite: true,
        	centerMode: true,
        	slidesToShow: 5,
        	slidesToScroll: 3
      	});
      
      	$(".variable").slick({
        	dots: true,
        	infinite: true,
        	variableWidth: true,
	        infinite: true , 		/* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */
        	slidesToShow: 1, 		/* 화면에 보여질 이미지 갯수*/
       		slidesToScroll: 1,  	/*  스크롤시 이동할 이미지 갯수 */
	        autoplay: true, 		/* 자동으로 다음이미지 보여주기 */
	        arrows: true, 			/* 화살표  */
        	dots:true, 				/*  아래점  */
        	autoplaySpeed:700,	/* 다음이미지로 넘어갈 시간 */
        	speed:700 , 			/* 다음이미지로 넘겨질때 걸리는 시간 */
      	});
      
      	$(".lazy").slick({
        	lazyLoad: 'ondemand', // ondemand progressive anticipated
        	infinite: true
      	});
    });
</script>

</body>
</html>
