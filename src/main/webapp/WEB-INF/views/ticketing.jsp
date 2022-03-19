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
	.seat-container{
		text-align: center;
	}
	
	#modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);
	}

	.modal-border{
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
</style>
</head>
<body>
<div class="container">
	success
	<i class="fa-solid fa-1"></i>
	<i class="fa-solid fa-couch fa-rotate-90"></i>
	<c:forEach var="i" begin="0" end="${lineSize }" items="${seatName }" varStatus="status">
		<div class="seat-container">
			<div class="line${i }">
				<span>line ${i }</span>
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
	</c:forEach>
	
	<div id="modal">
		<div class="modal-border">
			<span class="close">&times;</span>
			<div class="modal-content">
				<form action="${appRoot }/main/reservation" method="get">
					<input class="movie-name" type="text" name="movieName" value=""></input>
					<input class="movie-time" type="text"></input>
					<input  hidden class="movie-start-time" type="text" name="movieStartTime" value=""></input>
					<input  hidden class="movie-end-time" type="text" name="movieEndTime" value=""></input>
					<input class="movie-hallNumber" type="text" name="hallNumber" value=""></input>
					<input class="seat-number-p" type="text" value=""></input>
					<input  hidden class="seat-number" type="text" name="seatNumber" value=""></input>
					<input hidden class="movie-month" type="text" name="month" value="">
					<input hidden class="movie-day" type="text" name="day" value="">
					<input hidden class="user-id" type="text" name="userId" value="">
					<button class="btn-primary" type="submit">예매하기</button>
				</form>
				
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	let seatSize = ${lineSize} * 12;
	let lastSeat = ${lastSeat};
	let seat = document.querySelectorAll(".seat");
	console.log(seatSize);
	console.log(lastSeat);
	
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
		modal.style.display = "block";
		
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
	
</script>
</body>
</html>