<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
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
	height: 30vh;
	margin-bottom: 50px;
}



.date{
	position: relative;
	
	width: 100%
	
}

.movie-time-table{
	position: relative;
	
	height: 30px;
}

.div-box{
	border: none;
	border-bottom: 1px solid #999;
	border-top: 1px solid #999;
	padding: 10px 10px 10px;
}

.movie-time{
	border: none;
}

.movie-info{
	font-size: 28px;
	color: #000000;
}

.movie-hall{
	padding: 10px 10px 10px;
}

.info-hall{
	font-size: 20px;
	padding-bottom: 5px;
}

.myBtn{
	background: #fff;
	color: #166cea;
	height: 50px;
	width: 60px;
}

.modal_content{
	position: relative;
	border: none;
	
}







.box {
	list-style-type: none;
	float: left;
	outline: 1px dotted red;
}

.sect-time {
	
	width: 100%;
}



.myModal {
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

.modal_border{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	
	width: 50%;
	height: 50%;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.modal-movie-name{
	font-weight: bold;
	font-size: 50px;
}

.close{
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
}

.close:hover, .close:focus{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.mname{
	margin-top: 20px;
	margin-bottom: 20px;
}

.seat-img{
	width: 50%;
	height: 50%;
	margin-top: 50px;
	margin-bottom: 50px;
}

.content1{
	margin-bottom: 20px;
	margin-left: -10px;
}

.seat-button{
	width:50%;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}


</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

	<div hidden class="today-year">${year }</div>
	<div hidden class="today-month">${month }</div>
	<div hidden class="today-day">${day }</div>
	
	<div class="content">
		<section class="date">
			<div class="date-nav">
				<div class="sect-date">
					<nav aria-label="Page navigation example">
		  				<ul class="pagination">
		  					<c:forEach var="dateVO" items="${dateArr }">
		  						<li class="page-item">
									<a class="page-link" href="${appRoot }/main/movieTime/${dateVO.month}/${dateVO.day}" id="date" data-month="${dateVO.month }" data-day="${dateVO.day}">
										<span>${dateVO.month}월</span>
										<strong>${dateVO.day }일</strong>
									</a>
								</li>
		  					</c:forEach>
		  				</ul>
					</nav>
				</div>	
			</div>
		</section>
		
		<section class="movie-time-table">
			<div class="movie-time">
				<div class="sect-time">
					<div class="div-menu">
						<c:forEach var="tvo" items="${tvoArr }">
							<div class="div-box">
								<div class="movie-time">
									<div class="movie-info">
										${tvo.movieName }
									</div>
									<c:forEach var="i" items="${tvo.hallNumbers }" varStatus="status1">
										<div class="movie-hall">
											<div class="info-hall">
											> ${i }관
											</div>
											<div hidden>
												${i }
											</div>
											<c:forEach var="j" items="${tvo.movieStartTimes[status1.index] }" varStatus="status2">
												<span class="info-time">
													<c:forEach var="k" items="${j }">
														<button class="myBtn">
															${k }
														</button>
														<div class="movie-end-time" hidden value="${tvo.movieEndTimes[status1.index][status2.index] }">
															${tvo.movieEndTimes[status1.index][status2.index] }
														</div>
													</c:forEach>
												</span>
											</c:forEach>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		
		</section>
	</div>
	<!-- modal -->
	
	<div id="myModal" class="myModal">
		<div class="modal_border">
			<span class="close">&times;</span>
			<div class="modal_content">
				<h2 class="mname"></h2>
				<h6 class="content1"></h6>
				<div class="content2"></div>
				<img alt="" src="" class="seat-img">
				
				<form method="get" action="${appRoot }/main/ticketing">
					<input hidden class="modal-movie-name" type="text" name="movieName"></input>
					<input hidden type="text" class="movie-month" name="month"></input>
					<input hidden type="text" class="movie-day" name="day"></input>
					<input hidden type="text" class="movie-start-time" name="movieStartTime"></input>
					<input hidden type="text" class="movie-end-time" name="movieEndTime"></input>
					<input hidden type="text" class="movie-hallNumber" name="hallNumber"></input>
					<button class="seat-button" type="submit">
						좌석 선택
					</button>
				</form>
			</div>
		</div>
	</div>
	
	



<script type="text/javascript">
	let modal = document.querySelector(".myModal");
	let modal2 = document.querySelector(".modal-bg");
	
	let btnOpen = document.querySelectorAll(".myBtn");
	let close = document.querySelector(".close");
	let content1 = document.querySelector(".content1");
	let content2 = document.querySelector(".content2");
	let modal_movie_name = document.querySelector(".modal-movie-name");
	
	let year = document.querySelector(".today-year").innerHTML;
	let month = document.querySelector(".today-month").innerHTML;
	let day = document.querySelector(".today-day").innerHTML;
	
	let inputMonth = document.querySelector(".movie-month");
	let inputDay = document.querySelector(".movie-day");
	
	let clickFunction = function(){
		modal.style.display = "block";
		let endTime = this.nextElementSibling.innerText.trim();
		//date
		content2.innerHTML =   year + "년 " + month + "월 " + day + "일 " + " / " + this.innerText + "~" + endTime;
		//console.log(endTime);
		
		//movie name
		let movieName = this.parentNode.parentNode.parentNode.childNodes;
		let movieName2;
		for(let i=0; i<movieName.length; i++){
			//console.log(i + "." + movieName[i].className);
			if(movieName[i].className == "movie-info"){
				movieName2 = movieName[i].innerText;
			}
		}
		//console.log("movie_name " +movieName2);
		modal_movie_name.value = movieName2;
		document.querySelector(".mname").innerText = movieName2;
		
		
		
		
		//input
		let test = this.parentNode.parentNode.children[1].innerText.trim();
		//console.log("test " + test);
		
		let test2 = $(this).parent().prev().prev().text().trim();
		//console.log("test2 " + test2);
		
		inputMonth.value = month;
		inputDay.value = day;
		document.querySelector(".movie-start-time").value = this.innerHTML.trim();
		document.querySelector(".movie-hallNumber").value = this.parentNode.parentNode.children[1].innerText.trim();
		document.querySelector(".movie-end-time").value = endTime;
		
		//seat img
		let hn = document.querySelector(".movie-hallNumber").value;
		content1.innerHTML = hn + "관";
		if(hn == 3 || hn == 7){
			document.querySelector(".seat-img").setAttribute("src", "${appRoot}/resources/img/46seat.png");
		}else if(hn == 2 || hn == 4 || hn == 6){
			document.querySelector(".seat-img").setAttribute("src", "${appRoot}/resources/img/50seat.png");
		}else{
			document.querySelector(".seat-img").setAttribute("src", "${appRoot}/resources/img/60seat.png");
		}
		
		
		console.log("month " + inputMonth.value);
		console.log("day " + inputDay.value);
		console.log("start time " + document.querySelector(".movie-start-time").value);
		console.log("end time " + document.querySelector(".movie-end-time").value);
		console.log("hall number " + document.querySelector(".movie-hallNumber").value);
		console.log("movie name " + modal_movie_name.value);
		
		if( document.querySelector(".movie-end-time").value == " " ||  document.querySelector(".movie-end-time").value == null ){
			document.querySelector(".btn-primary").setAttribute("disabled", "disabled");
		}
	};
	for(let i=0; i<btnOpen.length; i++){
		btnOpen[i].addEventListener("click", clickFunction);
		
	}
	
	
	
	
	
	close.addEventListener("click", function(){
		modal.style.display = "none";
	})
</script>
</body>
</html>