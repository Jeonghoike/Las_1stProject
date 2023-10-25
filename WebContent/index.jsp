<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#btn").click(function(){
				alert("메인 페이지로 이동하겠습니다.");
				location.href="main.do";
			})
		})
	</script>
</head>
<body>
	<button type="button" id="btn">
		메인 페이지 이동
	</button>
</body>
</html>