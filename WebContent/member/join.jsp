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
<link href="${conPath }/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<form action="${conPath }/join.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>회원가입</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mid" required="required" autofocus="autofocus" autocomplete="off">
						<div id="midConfirmResult" class="left"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" required="required"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="mpwChk" required="required">
						<div id="mpwChkResult" class="left"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" required="required"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="mtel">
				</tr>
				<tr>
					<th>메일</th>
					<td>
						<input type="text" name="memail" autocomplete="off">
						<div id="memailConfirmResult" class="left"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="mgender" value="m"> 남자
						<input type="radio" name="mgender" value="f"> 여자
					</td>
				</tr>
				<tr>
					<th>생년월일</th><td><input type="text" name="mbirth" id="datepicker" autocomplete="off"></td>
				</tr>
				<tr>
					<th>주소</th><td><input type="text" name="maddress"></td>
				</tr>
				<tr>
					<td colspan="2">
						<p>
							<input type="submit" value="회원가입" class="btn">
							<input type="button" value="로그인" class="btn" onclick="location='${conPath}/loginView.do'">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>