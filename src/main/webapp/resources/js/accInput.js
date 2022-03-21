	let id = $("#id");
	let pw = $("#pw");
	let name = $("#name");
	let btn = $("#btn3");
	
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
		else if($(name).val() == ""){
			$(name).next('label').addClass('warning');
			setTimeout(function(){
				$("label").removeClass("warning");
			}, 1500);
		}
	});