<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
</head>
<body>
	<c:choose>
		<c:when test="${seq!=null}">
			<script>
				alert("로그인 정보가 필요한 페이지 입니다.");
				location.href="${pageContext.request.contextPath}/member/login?noMemPath=${noMemPath}&seq=${seq}";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("로그인 정보가 필요한 페이지 입니다.");
				location.href="${pageContext.request.contextPath}/member/login?noMemPath=${noMemPath}";
			</script>
		</c:otherwise>
	</c:choose>
	
</body>
</html>