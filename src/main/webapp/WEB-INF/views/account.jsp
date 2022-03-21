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
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
	
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
	
	.acc-form{
		position: relative;
	}
	
	.acc-form h1{
		font-size: 32px;
		color: #0000ff;
		left: 10px;
		font-weight: 900;
		margin-bottom: 30px;
	}
	
	.input-area{
		position: relative;
		width: 400px;
		margin-top: 20px;
	}
	
	.input-area input{
		width: 80%;
		padding: 18px 10px 10px;
		background-color: transparent;
		border: none;
		border-bottom: 1px solid #999;
		font-size: 18px;
		color: #000000;
		outline: none;
	}
	
	.input-area label{
		position: absolute;
		top: 15px;
		left: 10px;
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
	
	.input-area button{
		withd: 20%;
		height: 50px;
		background: #166cea;
		color: #fff;
		font-size: 20px;
		border: none;
		border-radius: 20px;
		cursor: pointer;
	}
	
	.btn-area{
		margin-top:30px;
		
	}
	
	.btn-area button{
		width:80%;
		height: 50px;
		background: #166cea;
		color: #fff;
		font-size: 20px;
		border: none;
		border-radius: 25px;
		cursor: pointer;
	}
	
</style>

<title>Insert title here</title>
</head>
<body>
	<section class="acc-form">
		<h1>회원가입</h1>
		<form action="${appRoot }/login/account" method="post" id="form1">
			<div class="input-area">
				<input type="text" name="userId" id="id" autocomplete="off" required>
				<label for="id">아이디</label>
				<button type="button" id="btn1">확인</button>
			</div>
			<div class="input-area">
				<input type="text" name="userPw" id="pw" autocomplete="off" required>
				<label for="pw">비밀번호</label>
				<button type="button" id="btn2">확인</button>
			</div>
			
			<div class="input-area">
				<input type="text" name="userName" id="name" autocomplete="off" required>
				<label for="name">이름</label>
				
			</div>
			<div  class="btn-area">
				<button type="submit" id = "btn3">가입</button>
			</div>
		</form>
	</section>


</body>
<!-- 
 -->
<script type="text/javascript" src="${appRoot }/resources/js/account.js"></script>
<script type="text/javascript" src="${appRoot }/resources/js/accInput.js"></script>

</html>