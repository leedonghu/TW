	let url1 = "/TW/login/checkId";
	$("#btn1").click(function(){
		let userId = $("#input1").val();
		$.post(url1, {userId: userId}, function(data){
			if(data == 'ok'){
				alert("사용 가능합니다.");
			}else{
				alert("이미 존재하는 아이디입니다.");
				$("#input1").val("");
			}
		})
		
	});
	
	let url2 = "/TW/login/checkPw";
	$("#btn2").click(function(){
		check2 = false;
		let userPw = $("#input2").val();
		$.post(url2, {userPw: userPw}, function(data){
			if(data == 'ok'){
				alert("사용 가능합니다.");
			}else{
				alert("비밀번호 패턴을 확인해주세요.");
				$("#input2").val("");
			}
		})
		
	});
	
	
	
	