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
	<form action="${appRoot }/login/account" method="post">
		아이디: <input type="text" name="userId" id="input1"><button type="button" id="btn1">확인</button><br>
		비밀번호: <input type="text" name="userPw" id="input2" placeholder="영문자, 숫자를 사용하여  8~14글자 사이로 만들어주세요"><button type="button" id="btn2">확인</button><br>
		이름: <input type="text" name="userName"><br>
		<button type="submit" disabled="disabled" id = "btn3">가입</button>
	</form>
</div>

</body>
<script type="text/javascript" src="${appRoot }/resources/js/account.js"></script>

<!-- 
<script type="text/javascript">
	let check1 = false;
	let check2 = false;
	
	let url1 = "${appRoot}/login/checkId";
	$("#btn1").click(function(){
		let userId = $("#input1").val();
		console.log($("#input1").text());
		$.post(url1, {userId: userId}, function(data){
			if(data == 'ok'){
				alert("사용 가능합니다.");
				check1 = true;
			}else{
				alert("이미 존재하는 아이디입니다.");
				$("input1").val("");
			}
		})
		
	});
	
	let url2 = "${appRoot}/login/checkPw";
	$("#btn2").click(function(){
		let userPw = $("#input2").val();
		console.log($("#input2").text());
		$.post(url2, {userPw: userPw}, function(data){
			if(data == 'ok'){
				alert("사용 가능합니다.");
				check2 = true;
			}else{
				alert("비밀번호 패턴을 확인해주세요.");
				$("#input2").val("");
			}
		})
		
	});
	
	if(check1 == true && check2 == true){
		$("#btn3").removeAttr("disabled");
	}
</script>
 -->

</html>