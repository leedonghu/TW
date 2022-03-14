<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.box {
	list-style-type: none;
	float: left;
	outline: 1px dotted red;
}

.sect-time {
	border: 1px solid black;
	width: 100%;
}

.div-box {
	border: 1px solid black;
}

.modal {
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

.modal-movie-name{
	font-weight: bold;
	font-size: 50px;
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
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div hidden class="today-year">${year }</div>
	<div hidden class="today-month">${month }</div>
	<div hidden class="today-day">${day }</div>
	<div class="row">
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
	<br>
	<div class="row">
	<div class="sect-time">
		<div class="div-menu">
			<c:forEach var="tvo" items="${tvoArr }">
				<div class="div-box">
					<div class="movie-time">
						<div class="movie-info">
							${tvo.movieName }
						</div>
						<c:forEach var="i" items="${tvo.hallNumber }" varStatus="status1">
							<div class="movie-hall">
								<div class="info-hall">
								${i }관
								</div>
								<c:forEach var="j" items="${tvo.movieStartTime[status1.index] }" varStatus="status2">
									<span class="info-time">
										<c:forEach var="k" items="${j }">
											<button class="myBtn">
												${k }
											</button>
											<div class="movie-end-time" hidden value="${tvo.movieEndTime[status1.index][status2.index] }">
												${tvo.movieEndTime[status1.index][status2.index] }
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
	
	<!-- modal -->
	<button class="myBtn">open modal</button>
	<div id="myModal" class="modal">
		<div class="modal-border">
			<span class="close">&times;</span>
			<div class="modal-content">
				<p class="modal-movie-name"></p>
				<span class="content1">modal test</span>
				<span class="content2">modal test</span>
				<button class="btn-primary">예매하기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	let modal = document.querySelector(".modal");
	let btnOpen = document.querySelectorAll(".myBtn");
	let close = document.querySelector(".close");
	let content1 = document.querySelector(".content1");
	let content2 = document.querySelector(".content2");
	let modal_movie_name = document.querySelector(".modal-movie-name");
	
	let year = document.querySelector(".today-year").innerHTML;
	let month = document.querySelector(".today-month").innerHTML;
	let day = document.querySelector(".today-day").innerHTML;
	
	let clickFunction = function(){
		modal.style.display = "block";
		let endTime = this.nextElementSibling.innerHTML;
		content1.innerHTML = this.innerHTML + "~" + endTime;
		console.log(endTime);
		
		let movieName = this.parentNode.parentNode.previousElementSibling.innerHTML;
		console.log(movieName);
		
		modal_movie_name.innerHTML = movieName;
		
		content2.innerHTML = year + "년 " + month + "월 " + day + "일 "
		
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