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
</head>
<body>
	<c:if test="${empty member }"> <!-- 로그인 후에만 글쓰기 가능 -->
		<script>
			location.href='${conPath}/loginView.do?next=boardWriteView.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<form action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>글쓰기</caption>
				<tr>
					<td>제목</td><td><input type="text" name="ftitle" 	required="required"></td>
				</tr>
				<tr>
					<td>본문</td><td><textarea name="fcontent" rows="5"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td><td><input type="file" name="ffilName"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기" class="btn">
						<input type="reset" value="취소" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/boardList.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>