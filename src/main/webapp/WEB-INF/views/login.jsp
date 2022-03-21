<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>


<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

body::before {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.7);
}

.login-form {
	position: relative;
	z-index: 2;
}

.login-form h1 {
	font-size: 32px;
	color: #fff;
	text-align: center;
	margin-bottom: 30px;
}

.input-area {
	width: 400px;
	position: relative;
	margin-top: 20px;
}

.input-area:first-child {
	margin-top: 0;
}

.input-area input {
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid #999;
	font-size: 18px;
	color: #fff;
	outline: none;
}

.input-area label {
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: top 0.5s ease;
}

.input-area label.warning{
	color: red !important;
	animation: warning 0.3s ease;
	animation-iteration-count: 3;
}

@keyframes warning{
	0%{transform: translateX(-8px);}
	25%{transform: translateX(8px);}
	50%{transform: translateX(-8px);}
	75%{transform: translateX(8px);}
}

.input-area input:focus+label, .input-area input:valid+label {
	top: -2px;
	font-size: 13px;
	color: #166cea;
}

.btn-area{
	margin-top: 30px;
}

.btn-area button{
	width:100%;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.caption{
	margin-top:20px;
	text-align: center;
	
}

.caption a{
	font-size: 15px;
	text-decoration: none;
	color: #999;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<section class="login-form">
		<h1>로그인</h1>
		<form action="${appRoot }/login" method="post">
			<div class="input-area">
				<input type="text" name="username" autocomplete="off" required id="id"></input>
				<label for="id">아이디</label>
			</div>
			<div class="input-area">
				<input type="password" name="password" autocomplete="off" required id="pw"></input>
				<label for="pw">비밀번호</label>
			</div>
			<div class="btn-area">
				<button type="submit" id="btn">확인</button>
			</div>
			<div class="caption">
				<a href="${appRoot}/login/account">회원가입</a>
			</div>
		</form>
	</section>

</body>

<script type="text/javascript">
	let id = $("#id");
	let pw = $("#pw");
	let btn = $("#btn");
	
	$(btn).on("click", function(){
		
		if($(id).val() == ""){
			
			$(id).next('label').addClass('warning');
			setTimeout(function(){
				$("label").removeClass("warning");
			}, 1500);
		}
		else if($(pw).val() == ""){
			
			$(pw).next('label').addClass('warning');
			setTimeout(function(){
				$("label").removeClass("warning");
			}, 1500);
		}
	});
</script>
</html>