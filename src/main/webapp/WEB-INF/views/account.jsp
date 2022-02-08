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
	<form action="${appRoot }/login/account" method="post" id="form1">
		아이디: <input type="text" name="userId" id="input1"><button type="button" id="btn1">확인</button><br>
		비밀번호: <input type="text" name="userPw" id="input2" placeholder="영문자, 숫자를 사용하여  8~14글자 사이로 만들어주세요"><button type="button" id="btn2">확인</button><br>
		이름: <input type="text" name="userName" id="input3"><br>
		<button type="submit" disabled="disabled" id = "btn3">가입</button>
	</form>
</div>

</body>
<!-- 
 -->
<script type="text/javascript" src="${appRoot }/resources/js/account.js"></script>


</html>