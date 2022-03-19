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
	<div>${tvo.movieName }</div>
	<div>${tvo.movieStartTime } ~ ${tvo.movieEndTime }</div>
	<div>예매가 완료되었습니다</div>
	<button class="btn-primary" onclick="location.href='${appRoot}/main/home'">확인</button>
</div>
</body>
</html>