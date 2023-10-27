<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/common.css" rel="stylesheet">
</head>
<body>
	<footer>
		<div id="footer_conts">
			<p>(주)좋은시스템 202</p> 
			<p>서울특별시 어떤구 어떤로 9 좋은빌딩 1-4F | <b><a href="${conPath }/adminLoginView.do">관리자 모드</a></b></p>
			<p>Copyright© 2022 tj . All rights reserved.</p>
		</div>
	</footer>
</body>
</html>