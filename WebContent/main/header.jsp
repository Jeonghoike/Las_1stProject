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
<link href="${conPath }/css/reset/reset.css" rel="stylesheet">
<link href="${conPath }/css/header.css" rel="stylesheet">
</head>
<body>
<header>
	<c:if test="${empty member and empty admin}">
	<div class="logo" onclick="location.href='${conPath}/main.do'">
		<img src="../img/logo.png" alt="도서관로고">
	</div>
	<div class="gnb">
		<ul>
			<li><a href="${conPath }/joinView.do">회원가입</a></li>
			<li><a href="${conPath }/loginView.do">로그인</a></li>
		</ul>
	</div>
	<div class="lnb">
		<ul>
			<li><a href="">도서보기</a></li>
			<li><a href="${conPath }/boardList.do">커뮤니티</a></li>			
			<li><a href="">마이페이지</a></li>			
			<li><a href="">공지사항</a></li>			
		</ul>
	</div>
	</c:if>
	<c:if test="${not empty member and empty admin}">
	<div class="logo" onclick="location.href='${conPath}/boardList.do'">
		LOGO
	</div>
	<div class="gnb">
		<ul>
			<li><a href="${conPath }/logout.do">로그아웃</a></li>
			<li><a href="${conPath }/modifyView.do">정보수정</a></li>
			<li><a>${member.mname }님</a></li>
		</ul>
	</div>	
	<div class="lnb">
		<ul>
			<li><a href="">도서보기</a></li>
			<li><a href="${conPath }/boardList.do">커뮤니티</a></li>			
			<li><a href="">마이페이지</a></li>			
			<li><a href="">공지사항</a></li>			
		</ul>
	</div>
	</c:if>
	<c:if test="${empty member and not empty admin }">
	<div class="gnb">
		<ul>
			<li><a href="${conPath }/logout.do">관리자 로그아웃</a></li>
			<li><a href="${conPath }/modifyView.do">정보수정</a></li>
		</ul>
	</div>
	<div class="lnb">
		<ul>
			<li><a href="">도서보기</a></li>
			<li><a href="${conPath }/boardList.do">커뮤니티</a></li>			
			<li><a href="">마이페이지</a></li>			
			<li><a href="">공지사항</a></li>			
		</ul>
	</div>	
	</c:if>
</header>
<hr>	
</body>
</html>