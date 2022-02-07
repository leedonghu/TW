console.log("test")
	let check1 = false;
	let check2 = false;
	
	let url1 = "/TW/login/checkId";
	$("#btn1").click(function(){
		let userId = $("#input1").val();
		console.log($("#input1").text());
		$.post(url1, {userId: userId}, function(data){
			if(data == 'ok'){
				alert("사용 가능합니다.");
				check1 = true;
			}else{
				alert("이미 존재하는 아이디입니다.");
				$("#input1").val("");
			}
		})
		console.log(check1);
	});
	
	let url2 = "/TW/login/checkPw";
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
		console.log(check2);
	});
	
	if(check1 == true && check2 == true){
		$("#btn3").removeAttr("disabled");
	}