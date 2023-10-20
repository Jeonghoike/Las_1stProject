<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{padding: 0; margin: 0;}
	#header{background-color: #fff; }
	header{display: block;}
	#gnb{
		position: relative;
		z-index: 1001;
		background:  : beige;
	}
	.sitemenu{
		position: relative;
		z-index: 1001;
		max-width: 1200px;
		min-height: 134;
		margin: 0 auto;
	}
	.snb{
		position: absolute;
		top 53px;
		right: 0;
	}
	.sitemenu > ul > li{
		float: left;
	}
	.sitemenu > ul > li a{
		display: block;
		font-size: 1.125em;
		padding: 0 12px;
	}
</style>
</head>
<body>
<header>
	<div id="gnb">
		<div class="sitemenu">
			<div class="snb">
				<ul>
					<li class="login"><a href="">고객센터</a></li>
					<li class="join"><a href="">회원가입</a></li>
					<li><a href="">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>	
<hr>	
</body>
</html>