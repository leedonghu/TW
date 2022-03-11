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

.modal-content{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	height: 50%;
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
						<c:forEach var="i" items="${tvo.hallNumber }" varStatus="status">
							<div class="movie-hall">
								<div class="info-hall">
								${i }관
								</div>
								<c:forEach var="j" items="${tvo.movieTime[status.index] }">
									<span class="info-time">
										<c:forEach var="k" items="${j }">
											<button class="myBtn">
												${k }
											</button>
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
		<div class="modal-content">
			<span class="close">&times;</span>
			<p class="content">modal test</p>
		</div>
	</div>
</div>

<script type="text/javascript">
	let modal = document.querySelector(".modal");
	let btnOpen = document.querySelectorAll(".myBtn");
	let close = document.querySelector(".close");
	let content = document.querySelector(".content");
	
	
	let clickFunction = function(){
		modal.style.display = "block";
		content.innerHTML = this.innerHTML;
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