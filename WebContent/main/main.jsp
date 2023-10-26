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
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
	
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<form action="" method="post" id="searchform">
			<p class="searchform">도서 검색</p>
			<input type="text" name="searchtext" title="검색어 입력" id="searchtext">
			<input type="submit" value="검색" title="검색" class="btn">
		</form>
		<p>도서 검색</p>
	</div>
		<ul>
			<li></li>
			<li><a href="">공지사항</a></li>
		</ul>
	<div>
		<ul>
			<li></li>
		</ul>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>