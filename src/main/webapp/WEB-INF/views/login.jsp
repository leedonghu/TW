<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>


<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>


<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form action="${appRoot }/login" method="post">
		아이디: <input type="text" name="username"></input><br>
		비밀번호: <input type="text" name="password"></input><br>
		<button type="submit" class="btn btn-primary">확인</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='${appRoot}/login/account'">회원가입</button>
	</form>
</div>
</body>
</html>