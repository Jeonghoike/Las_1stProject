<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	wrap{margin: 0;padding: 0;}
	div #content_form{
		width:60%;
		height:50%;
		margin: 20px;
		position: absolute;
		background-image: url(../img/library.jpg);
		opacity: 0.7;
		position: absolute;
        overflow: hidden;
	}
	#searchtext{
		padding: 10px 20px;
	  	border-radius: 10px;
	  	background-color: #FFEEBC;
	  	text-align: center;
	  	position: absolute;
	 	top: 50%;
	  	left: 50%;
	  	transform: translate(-50%, -50%);
	  	float: left;
	}
	
</style>
</head>
<body>
	<div id="wrap">	
		<jsp:include page="../main/header.jsp"/>
		<div id="content_form">
			<form action="notice.do" method="post" id="searchform">
				<input type="text" name="searchtext" title="검색어 입력" id="searchtext">
				<input type="submit" value="검색" title="검색" class="btn">
			</form>
			<ul>
				<li></li>
				<li><a href="">공지사항</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li></li>
			</ul>
		</div>
		<jsp:include page="../main/footer.jsp"/>
	</div>
</body>
</html>