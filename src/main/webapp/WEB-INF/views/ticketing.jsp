<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style type="text/css">

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
		width: 100%;
	}
	
	body::before {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.2);
}
	
	.theater{
		display: flex;
		z-index: 2;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		width: 100%;
		
	}
	
	.screen{
		margin-bottom: 50px;
	}
	
	.seat{
		display: flex;
		flex-direction: column;
		text-align: center;
		
		
	}
	
	.seat-container{
		width: 100%;
		margin-left: -15px;
	}
	
	.line-name{
		margin-left: -5px;
		width: 50px;
	}
	
	#myModal {
		display: none;
		position: fixed;
		z-index: 3;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);
	}

	.modal_border{
		background-color: #fefefe;
		margin: 15% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 50%;
		height: 50%;
		text-align: center;
	}
	
	.close{
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover, .close:focus{
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	.line{
		display: flex;
		
	}
	
	
	.seat-line{
		display: flex;
		margin-left: 20px;
	}
	
	
	
</style>
</head>
<body>
	<div class="theater">
		<div class="screen">
			<img alt="" src="${appRoot }/resources/img/screen.png">
		</div>
		<div class="seat">
			<c:forEach var="i" begin="0" end="${lineSize }" items="${seatName }" varStatus="status">
				<div class="seat-container">
					<div id="line${i }" class="line">
						<div class="line-name">
							<div>${i } 열</div>
						</div>
						<div class="seat-line">
							<c:choose>
								<c:when test="${lastSeat eq 0 }">
									<c:forEach begin="1" end="12" var= "j">
										<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
									</c:forEach>
								</c:when>
								<c:when test="${lastSeat ne 0}">
									<c:choose>
										<c:when test="${status.index ne lineSize }">
											<c:forEach begin="1" end="12" var= "j">
												<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
											</c:forEach>
										</c:when>
										<c:when test="${status.index eq lineSize }">
											<c:forEach begin="1" end="${lastSeat }" var= "j">
												<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
											</c:forEach>
										</c:when>
									</c:choose>
								</c:when>
							</c:choose>
						</div>
					</div>		
				</div>
			</c:forEach>
	</div>
		
	</div>
	<div id="myModal">
		<div class="modal_border">
			<span class="close">&times;</span>
			<div class="modal_content">
				<h2 class="movie-name-c"></h2>
				<h6 class="movie-time-c"></h6>
				<div class="movie-hallNumber-c"></div>
				<div class="seat-number-c"></div>
				<form action="${appRoot }/main/reservation" method="get">
					
					<input hidden class="movie-name" type="text" name="movieName" value=""></input>
					<input hidden class="movie-time" type="text"></input>
					<input hidden class="movie-hallNumber" type="text" name="hallNumber" value=""></input>
					<input hidden class="seat-number-p" type="text" value=""></input>
					<input  hidden class="movie-start-time" type="text" name="movieStartTime" value=""></input>
					<input  hidden class="movie-end-time" type="text" name="movieEndTime" value=""></input>
					<input  hidden class="seat-number" type="text" name="seatNumber" value=""></input>
					<input hidden class="movie-month" type="text" name="month" value="">
					<input hidden class="movie-day" type="text" name="day" value="">
					<input hidden class="user-id" type="text" name="userId" value="">
					<button class="btn-primary" type="submit">예매하기</button>
				</form>
				
			</div>
		</div>
	</div>


<script type="text/javascript">
	let seatSize = ${lineSize} * 12;
	let lastSeat = ${lastSeat};
	let seat = document.querySelectorAll(".seat");
	let modal = document.querySelector("#myModal");
	//console.log(seatSize);
	//console.log(lastSeat);
	
	//tvo
	let movie_name = "${tvo.movieName}";
	let movie_start_time = "${tvo.movieStartTime}";
	let movie_end_time = "${tvo.movieEndTime}";
	let movie_hall_number = "${tvo.hallNumber}";
	let movie_month = "${tvo.month}";
	let movie_day = "${tvo.day}";
	let user_id = "${pinfo.username}";
	
	let clickFunction = function(){
		console.log(this.getAttribute("id"));
		console.log(this);
		modal.style.display = "block";
		
		document.querySelector(".movie-name-c").innerText = movie_name;
		document.querySelector(".movie-time-c").innerText = movie_start_time + " ~ " + movie_end_time;
		document.querySelector(".movie-hallNumber-c").innerText = movie_hall_number;
		document.querySelector(".seat-number-c").innerText = this.getAttribute("id") + "좌석";
		
		document.querySelector(".movie-name").value = movie_name;
		document.querySelector(".movie-time").value = movie_start_time + " ~ " + movie_end_time;
		document.querySelector(".movie-hallNumber").value = movie_hall_number;
		document.querySelector(".seat-number-p").value = this.getAttribute("id") + "좌석";
		document.querySelector(".seat-number").value = this.getAttribute("id");
		document.querySelector(".movie-start-time").value = movie_start_time;
		document.querySelector(".movie-end-time").value = movie_end_time;
		document.querySelector(".movie-month").value = movie_month;
		document.querySelector(".movie-day").value = movie_day;
		document.querySelector(".user-id").value = user_id;
	}
	
	for(let i=0; i<seatSize+lastSeat; i++){
		seat[i].addEventListener("click",clickFunction);
	}
	
	document.querySelector(".close").addEventListener("click", function(){
		modal.style.display = "none";
	})
	
	let lastLine = document.querySelector(".seat").lastElementChild.firstElementChild.lastElementChild;
	if(seatSize + lastSeat == 46){
		
		lastLine.style.cssText = "margin-left : 40px;";
	} else if(seatSize + lastSeat == 50){
		lastLine.style.cssText = "margin-left : 123px;";
		
	}
	//console.log(lastLine);
	
</script>
</body>
</html>